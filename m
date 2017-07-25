From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Jul 2017 00:08:33 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] collectd: fix build with
	gcc 7.x
Message-ID: <20170725222142.0DD9D7FBDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbce4d82ff8f4cfe8c6be473e5f854c3177021c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

This commit backports an upstream collectd patch that fixes a build
issue with gcc 7.x.

Fixes:

  http://autobuild.buildroot.net/results/2441e2a69d013a6376a90d375e15991e8cb816bd/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 9ac88f318a9cdc4cdc1bcfe6a190b46b650cb3cc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-libcollectdclient-increase-error-buffer.patch | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/package/collectd/0001-libcollectdclient-increase-error-buffer.patch b/package/collectd/0001-libcollectdclient-increase-error-buffer.patch
new file mode 100644
index 0000000..247d32b
--- /dev/null
+++ b/package/collectd/0001-libcollectdclient-increase-error-buffer.patch
@@ -0,0 +1,87 @@
+From e170f3559fcda6d37a012aba187a96b1f42e8f9d Mon Sep 17 00:00:00 2001
+From: Ruben Kerkhof <ruben@rubenkerkhof.com>
+Date: Sun, 2 Jul 2017 21:52:14 +0200
+Subject: [PATCH] libcollectdclient: increase error buffer
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+make[1]: Entering directory '/home/ruben/src/collectd'
+  CC       src/libcollectdclient/libcollectdclient_la-client.lo
+src/libcollectdclient/client.c: In function ??????lcc_getval??????:
+src/libcollectdclient/client.c:621:23: warning: ??????%s?????? directive output may be truncated writing up to 1023 bytes into a region of size 1010 [-Wformat-truncation=]
+     LCC_SET_ERRSTR(c, "Server error: %s", res.message);
+                       ^                   ~
+src/libcollectdclient/client.c:94:48: note: in definition of macro ??????LCC_SET_ERRSTR??????
+     snprintf((c)->errbuf, sizeof((c)->errbuf), __VA_ARGS__);                   \
+                                                ^~~~~~~~~~~
+src/libcollectdclient/client.c:94:5: note: ??????snprintf?????? output between 15 and 1038 bytes into a destination of size 1024
+     snprintf((c)->errbuf, sizeof((c)->errbuf), __VA_ARGS__);                   \
+     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+src/libcollectdclient/client.c:621:5: note: in expansion of macro ??????LCC_SET_ERRSTR??????
+     LCC_SET_ERRSTR(c, "Server error: %s", res.message);
+     ^~~~~~~~~~~~~~
+src/libcollectdclient/client.c: In function ??????lcc_putval??????:
+src/libcollectdclient/client.c:754:23: warning: ??????%s?????? directive output may be truncated writing up to 1023 bytes into a region of size 1010 [-Wformat-truncation=]
+     LCC_SET_ERRSTR(c, "Server error: %s", res.message);
+                       ^                   ~
+src/libcollectdclient/client.c:94:48: note: in definition of macro ??????LCC_SET_ERRSTR??????
+     snprintf((c)->errbuf, sizeof((c)->errbuf), __VA_ARGS__);                   \
+                                                ^~~~~~~~~~~
+src/libcollectdclient/client.c:94:5: note: ??????snprintf?????? output between 15 and 1038 bytes into a destination of size 1024
+     snprintf((c)->errbuf, sizeof((c)->errbuf), __VA_ARGS__);                   \
+     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+src/libcollectdclient/client.c:754:5: note: in expansion of macro ??????LCC_SET_ERRSTR??????
+     LCC_SET_ERRSTR(c, "Server error: %s", res.message);
+     ^~~~~~~~~~~~~~
+src/libcollectdclient/client.c: In function ??????lcc_flush??????:
+src/libcollectdclient/client.c:802:23: warning: ??????%s?????? directive output may be truncated writing up to 1023 bytes into a region of size 1010 [-Wformat-truncation=]
+     LCC_SET_ERRSTR(c, "Server error: %s", res.message);
+                       ^                   ~
+src/libcollectdclient/client.c:94:48: note: in definition of macro ??????LCC_SET_ERRSTR??????
+     snprintf((c)->errbuf, sizeof((c)->errbuf), __VA_ARGS__);                   \
+                                                ^~~~~~~~~~~
+src/libcollectdclient/client.c:94:5: note: ??????snprintf?????? output between 15 and 1038 bytes into a destination of size 1024
+     snprintf((c)->errbuf, sizeof((c)->errbuf), __VA_ARGS__);                   \
+     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+src/libcollectdclient/client.c:802:5: note: in expansion of macro ??????LCC_SET_ERRSTR??????
+     LCC_SET_ERRSTR(c, "Server error: %s", res.message);
+     ^~~~~~~~~~~~~~
+src/libcollectdclient/client.c: In function ??????lcc_listval??????:
+src/libcollectdclient/client.c:834:23: warning: ??????%s?????? directive output may be truncated writing up to 1023 bytes into a region of size 1010 [-Wformat-truncation=]
+     LCC_SET_ERRSTR(c, "Server error: %s", res.message);
+                       ^                   ~
+src/libcollectdclient/client.c:94:48: note: in definition of macro ??????LCC_SET_ERRSTR??????
+     snprintf((c)->errbuf, sizeof((c)->errbuf), __VA_ARGS__);                   \
+                                                ^~~~~~~~~~~
+src/libcollectdclient/client.c:94:5: note: ??????snprintf?????? output between 15 and 1038 bytes into a destination of size 1024
+     snprintf((c)->errbuf, sizeof((c)->errbuf), __VA_ARGS__);                   \
+     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+src/libcollectdclient/client.c:834:5: note: in expansion of macro ??????LCC_SET_ERRSTR??????
+     LCC_SET_ERRSTR(c, "Server error: %s", res.message);
+     ^~~~~~~~~~~~~~
+
+Fixes #2200
+
+[Upstream commit: https://git.octo.it/?p=collectd.git;a=commitdiff;h=e170f3559fcda6d37a012aba187a96b1f42e8f9d]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/libcollectdclient/client.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libcollectdclient/client.c b/src/libcollectdclient/client.c
+index 51a4ab2..3ae2e71 100644
+--- a/src/libcollectdclient/client.c
++++ b/src/libcollectdclient/client.c
+@@ -99,7 +99,7 @@
+  */
+ struct lcc_connection_s {
+   FILE *fh;
+-  char errbuf[1024];
++  char errbuf[2048];
+ };
+ 
+ struct lcc_response_s {
+-- 
+1.7.10.4
+
