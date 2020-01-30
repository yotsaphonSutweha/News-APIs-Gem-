require_relative './../newsapis.rb'
require "test/unit"

class NewsApisTest < Test::Unit::TestCase

    def test_newsapi_call
        assert_not_nil(NewsApisCall.callingNewsApi(nil))
    end

    def test_guardianapi_call
        assert_not_nil(NewsApisCall.callingGuardianApi(nil))
    end

    def test_newsapi_status_state
        response = NewsApisCall.callingNewsApi(nil)
        responseStatusCode = response
        assert_equal("ok", response["status"], "Test if the GET request is successful")
    end

    def test_guardianapi_status_state
        response = NewsApisCall.callingGuardianApi(nil)
        responseStatusCode = response
        assert_equal("ok", responseStatusCode["response"]["status"], "Test if the GET request is successful")
    end

    def test_combined_api_responses
        combinedResponse = NewsApisCall.getNews
        combineStatus = combinedResponse["combine"]
        assert_equal(true, combineStatus, "Test if the two JSON responses are combined into one JSON object")
    end

    def test_search
        searchValueForTest = "Sport"
        searchResponse = NewsApisCall.search(searchValueForTest)
        assert_not_nil(searchResponse)
    end
end