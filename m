From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  7 Sep 2018 22:40:22 +0200
Subject: [Buildroot] [PATCH 1/1] libminiupnpc: bump to version 2.1
Message-ID: <20180907204022.20328-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-miniupnpc-Fix-CVE-2017-8798.patch    | 59 -------------------
 package/libminiupnpc/libminiupnpc.hash        |  2 +-
 package/libminiupnpc/libminiupnpc.mk          |  2 +-
 3 files changed, 2 insertions(+), 61 deletions(-)
 delete mode 100644 package/libminiupnpc/0001-miniupnpc-Fix-CVE-2017-8798.patch

diff --git a/package/libminiupnpc/0001-miniupnpc-Fix-CVE-2017-8798.patch b/package/libminiupnpc/0001-miniupnpc-Fix-CVE-2017-8798.patch
deleted file mode 100644
index 25591fc4a4..0000000000
--- a/package/libminiupnpc/0001-miniupnpc-Fix-CVE-2017-8798.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From f0f1f4b22d6a98536377a1bb07e7c20e4703d229 Mon Sep 17 00:00:00 2001
-From: Thomas Bernard <miniupnp@free.fr>
-Date: Tue, 9 May 2017 12:00:47 +0200
-Subject: [PATCH] miniupnpc: Fix CVE-2017-8798
-
-Thanks to tin/Team OSTStrom
-
-[Peter: drop Changelog.txt modification, convert to -p1 format]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- miniupnpc/miniwget.c    | 12 +++++++-----
- 1 file changed, 9 insertions(+), 5 deletions(-)
-
-diff --git a/miniwget.c b/miniwget.c
-index 37cb47b7..1eda57c5 100644
---- a/miniwget.c
-+++ b/miniwget.c
-@@ -284,11 +284,12 @@ getHTTPResponse(int s, int * size, int * status_code)
- 							goto end_of_stream;
- 						}
- 					}
--					bytestocopy = ((int)chunksize < (n - i))?chunksize:(unsigned int)(n - i);
-+					/* it is guaranteed that (n >= i) */
-+					bytestocopy = (chunksize < (unsigned int)(n - i))?chunksize:(unsigned int)(n - i);
- 					if((content_buf_used + bytestocopy) > content_buf_len)
- 					{
- 						char * tmp;
--						if(content_length >= (int)(content_buf_used + bytestocopy)) {
-+						if((content_length >= 0) && ((unsigned int)content_length >= (content_buf_used + bytestocopy))) {
- 							content_buf_len = content_length;
- 						} else {
- 							content_buf_len = content_buf_used + bytestocopy;
-@@ -313,14 +314,15 @@ getHTTPResponse(int s, int * size, int * status_code)
- 			{
- 				/* not chunked */
- 				if(content_length > 0
--				   && (int)(content_buf_used + n) > content_length) {
-+				   && (content_buf_used + n) > (unsigned int)content_length) {
- 					/* skipping additional bytes */
- 					n = content_length - content_buf_used;
- 				}
- 				if(content_buf_used + n > content_buf_len)
- 				{
- 					char * tmp;
--					if(content_length >= (int)(content_buf_used + n)) {
-+					if(content_length >= 0
-+					   && (unsigned int)content_length >= (content_buf_used + n)) {
- 						content_buf_len = content_length;
- 					} else {
- 						content_buf_len = content_buf_used + n;
-@@ -340,7 +342,7 @@ getHTTPResponse(int s, int * size, int * status_code)
- 			}
- 		}
- 		/* use the Content-Length header value if available */
--		if(content_length > 0 && (int)content_buf_used >= content_length)
-+		if(content_length > 0 && content_buf_used >= (unsigned int)content_length)
- 		{
- #ifdef DEBUG
- 			printf("End of HTTP content\n");
diff --git a/package/libminiupnpc/libminiupnpc.hash b/package/libminiupnpc/libminiupnpc.hash
index c83b38aa60..b35e7f045d 100644
--- a/package/libminiupnpc/libminiupnpc.hash
+++ b/package/libminiupnpc/libminiupnpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 d434ceb8986efbe199c5ca53f90ed53eab290b1e6d0530b717eb6fa49d61f93b  miniupnpc-2.0.tar.gz
+sha256 e19fb5e01ea5a707e2a8cb96f537fbd9f3a913d53d804a3265e3aeab3d2064c6  miniupnpc-2.1.tar.gz
 sha256 4025f2214fa46ad40c156605b83d66e8faf45823e67eb3337af3869716e6d7dd  LICENSE
diff --git a/package/libminiupnpc/libminiupnpc.mk b/package/libminiupnpc/libminiupnpc.mk
index 66b08b4e8a..5a4c8fc693 100644
--- a/package/libminiupnpc/libminiupnpc.mk
+++ b/package/libminiupnpc/libminiupnpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMINIUPNPC_VERSION = 2.0
+LIBMINIUPNPC_VERSION = 2.1
 LIBMINIUPNPC_SOURCE = miniupnpc-$(LIBMINIUPNPC_VERSION).tar.gz
 LIBMINIUPNPC_SITE = http://miniupnp.free.fr/files
 LIBMINIUPNPC_INSTALL_STAGING = YES
-- 
2.17.1
