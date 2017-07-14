From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 14 Jul 2017 12:14:18 +0200
Subject: [Buildroot] [PATCH] package/nginx: fix build
Message-ID: <20170714101418.4529-1-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch to nginx configuration system fixing misdetected unneeded PCRE
dependency.

This patch has been submitted upstream [1].

Fixes:
  http://autobuild.buildroot.net/results/bc7/bc7458b97a88785653845afd30fe9d5f3a69905b/build-end.log

[1] http://mailman.nginx.org/pipermail/nginx-devel/2017-July/010308.html

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 ...nf-fix-PCRE-condition-WRT-the-http-and-ht.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/nginx/0009-auto-lib-conf-fix-PCRE-condition-WRT-the-http-and-ht.patch

diff --git a/package/nginx/0009-auto-lib-conf-fix-PCRE-condition-WRT-the-http-and-ht.patch b/package/nginx/0009-auto-lib-conf-fix-PCRE-condition-WRT-the-http-and-ht.patch
new file mode 100644
index 0000000000..08456511dc
--- /dev/null
+++ b/package/nginx/0009-auto-lib-conf-fix-PCRE-condition-WRT-the-http-and-ht.patch
@@ -0,0 +1,33 @@
+From 9668f0d5ecd2382fd36b7ff6a3a29abd04f6533f Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Fri, 14 Jul 2017 11:50:08 +0200
+Subject: [PATCH] auto/lib/conf: fix PCRE condition WRT the http and
+ http_rewrite options
+
+http_rewrite module cannot be selected when http server is disabled, so
+fix the PCRE check condition to avoid irrelevant check failure.
+
+Fixes:
+  http://autobuild.buildroot.net/results/bc7/bc7458b97a88785653845afd30fe9d5f3a69905b/build-end.log
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ auto/lib/conf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/auto/lib/conf b/auto/lib/conf
+index 0b8545a3..2c7af104 100644
+--- a/auto/lib/conf
++++ b/auto/lib/conf
+@@ -7,7 +7,7 @@ if [ $USE_PCRE = YES -o $PCRE != NONE ]; then
+     . auto/lib/pcre/conf
+ 
+ else
+-    if [ $USE_PCRE = DISABLED -a $HTTP_REWRITE = YES ]; then
++    if [ $USE_PCRE = DISABLED -a $HTTP = YES -a $HTTP_REWRITE = YES ]; then
+ 
+ cat << END
+ 
+-- 
+2.13.2
+
-- 
2.13.2
