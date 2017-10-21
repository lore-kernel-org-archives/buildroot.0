From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Oct 2017 19:20:33 +0200
Subject: [Buildroot] [PATCH] busybox: add upstream post-1.27.2 httpd fix
Message-ID: <20171021172033.974-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0005-httpd-fix-handling-of-range-requests.patch | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/busybox/0005-httpd-fix-handling-of-range-requests.patch

diff --git a/package/busybox/0005-httpd-fix-handling-of-range-requests.patch b/package/busybox/0005-httpd-fix-handling-of-range-requests.patch
new file mode 100644
index 0000000000..b3ca32d75c
--- /dev/null
+++ b/package/busybox/0005-httpd-fix-handling-of-range-requests.patch
@@ -0,0 +1,27 @@
+From 2b400d9b2b7309d6e479102fc3ce646e893058a5 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Mon, 18 Sep 2017 13:09:11 +0200
+Subject: [PATCH] httpd: fix handling of range requests
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ networking/httpd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/networking/httpd.c b/networking/httpd.c
+index e072f23c7..5e32fc936 100644
+--- a/networking/httpd.c
++++ b/networking/httpd.c
+@@ -2337,7 +2337,7 @@ static void handle_incoming_and_exit(const len_and_sockaddr *fromAddr)
+ 			if (STRNCASECMP(iobuf, "Range:") == 0) {
+ 				/* We know only bytes=NNN-[MMM] */
+ 				char *s = skip_whitespace(iobuf + sizeof("Range:")-1);
+-				if (is_prefixed_with(s, "bytes=") == 0) {
++				if (is_prefixed_with(s, "bytes=")) {
+ 					s += sizeof("bytes=")-1;
+ 					range_start = BB_STRTOOFF(s, &s, 10);
+ 					if (s[0] != '-' || range_start < 0) {
+-- 
+2.11.0
+
-- 
2.11.0
