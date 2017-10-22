From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Oct 2017 00:36:58 +0200
Subject: [Buildroot] [git commit branch/2017.08.x] busybox: add upstream
	post-1.27.2 httpd fix
Message-ID: <20171022224414.D3200802AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86a7d8cb0a78d4cb3aa4e37bbe5b68107d42f212
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ec58149009776f63767644f9a3409f420c271766)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0005-httpd-fix-handling-of-range-requests.patch | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/busybox/0005-httpd-fix-handling-of-range-requests.patch b/package/busybox/0005-httpd-fix-handling-of-range-requests.patch
new file mode 100644
index 0000000..b3ca32d
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
