From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Sep 2017 14:19:55 +0200
Subject: [Buildroot] [PATCH] bluez5_utils: add upstream security fix for
	CVE-2017-1000250
Message-ID: <20170913121955.21236-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2017-1000250 - All versions of the SDP server in BlueZ 5.46 and
earlier are vulnerable to an information disclosure vulnerability which
allows remote attackers to obtain sensitive information from the bluetoothd
process memory.  This vulnerability lies in the processing of SDP search
attribute requests.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-of-bounds-heap-read-in-service_search_at.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/bluez5_utils/0002-sdp-Fix-Out-of-bounds-heap-read-in-service_search_at.patch

diff --git a/package/bluez5_utils/0002-sdp-Fix-Out-of-bounds-heap-read-in-service_search_at.patch b/package/bluez5_utils/0002-sdp-Fix-Out-of-bounds-heap-read-in-service_search_at.patch
new file mode 100644
index 0000000000..a73c372e68
--- /dev/null
+++ b/package/bluez5_utils/0002-sdp-Fix-Out-of-bounds-heap-read-in-service_search_at.patch
@@ -0,0 +1,29 @@
+From 9e009647b14e810e06626dde7f1bb9ea3c375d09 Mon Sep 17 00:00:00 2001
+From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
+Date: Wed, 13 Sep 2017 10:01:40 +0300
+Subject: [PATCH] sdp: Fix Out-of-bounds heap read in service_search_attr_req
+ function
+
+Check if there is enough data to continue otherwise return an error.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/sdpd-request.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/sdpd-request.c b/src/sdpd-request.c
+index 1eefdce1a..318d04467 100644
+--- a/src/sdpd-request.c
++++ b/src/sdpd-request.c
+@@ -917,7 +917,7 @@ static int service_search_attr_req(sdp_req_t *req, sdp_buf_t *buf)
+ 	} else {
+ 		/* continuation State exists -> get from cache */
+ 		sdp_buf_t *pCache = sdp_get_cached_rsp(cstate);
+-		if (pCache) {
++		if (pCache && cstate->cStateValue.maxBytesSent < pCache->data_size) {
+ 			uint16_t sent = MIN(max, pCache->data_size - cstate->cStateValue.maxBytesSent);
+ 			pResponse = pCache->data;
+ 			memcpy(buf->data, pResponse + cstate->cStateValue.maxBytesSent, sent);
+-- 
+2.11.0
+
-- 
2.11.0
