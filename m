From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 25 Jun 2013 09:47:28 +0200
Subject: [Buildroot] [git commit] curl: add security patch for CVE-2013-2174
Message-ID: <20130626132358.CEADE9B1C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6772d5f2f5c2c819149e1bfd9f339ad9afabbeb8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libcurl/libcurl-03-CVE-2013-2174.patch |   38 ++++++++++++++++++++++++
 1 files changed, 38 insertions(+), 0 deletions(-)

diff --git a/package/libcurl/libcurl-03-CVE-2013-2174.patch b/package/libcurl/libcurl-03-CVE-2013-2174.patch
new file mode 100644
index 0000000..673431f
--- /dev/null
+++ b/package/libcurl/libcurl-03-CVE-2013-2174.patch
@@ -0,0 +1,38 @@
+From 6032f0ff672f09babf69d9d42bcde6eb9eeb5bea Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sun, 19 May 2013 23:24:29 +0200
+Subject: [PATCH] Curl_urldecode: no peeking beyond end of input buffer
+
+Security problem: CVE-2013-2174
+
+If a program would give a string like "%" to curl_easy_unescape(), it
+would still consider the % as start of an encoded character. The
+function then not only read beyond the buffer but it would also deduct
+the *unsigned* counter variable for how many more bytes there's left to
+read in the buffer by two, making the counter wrap. Continuing this, the
+function would go on reading beyond the buffer and soon writing beyond
+the allocated target buffer...
+
+Bug: http://curl.haxx.se/docs/adv_20130622.html
+Reported-by: Timo Sirainen
+---
+ lib/escape.c |    5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/lib/escape.c b/lib/escape.c
+index 6a26cf8..aa7db2c 100644
+--- a/lib/escape.c
++++ b/lib/escape.c
+@@ -159,7 +159,8 @@ CURLcode Curl_urldecode(struct SessionHandle *data,
+ 
+   while(--alloc > 0) {
+     in = *string;
+-    if(('%' == in) && ISXDIGIT(string[1]) && ISXDIGIT(string[2])) {
++    if(('%' == in) && (alloc > 2) &&
++       ISXDIGIT(string[1]) && ISXDIGIT(string[2])) {
+       /* this is two hexadecimal digits following a '%' */
+       char hexstr[3];
+       char *ptr;
+-- 
+1.7.10.4
+
