From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 10 Sep 2014 08:51:36 -0300
Subject: [Buildroot] [PATCH] tn5250: fix openssl dir
Message-ID: <1410349896-27706-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If openssl devfiles are installed in the host the automatic lookup might
find that and cause issues.
So be explicit on the directory to avoid a search and patch the
directory logic since it's got a bug. Fixes:
http://autobuild.buildroot.net/results/5dd/5ddc8636d6555851f692c0c21f583df235340b19/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/tn5250/tn5250-01-ssldir.patch | 17 +++++++++++++++++
 package/tn5250/tn5250.mk              |  2 +-
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 package/tn5250/tn5250-01-ssldir.patch

diff --git a/package/tn5250/tn5250-01-ssldir.patch b/package/tn5250/tn5250-01-ssldir.patch
new file mode 100644
index 0000000..6fc78de
--- /dev/null
+++ b/package/tn5250/tn5250-01-ssldir.patch
@@ -0,0 +1,17 @@
+Value is assigned to $with_ssl_dir but used from $with_ssl which is wrong.
+Fix configure since it's a one-liner and avoid an autoreconf.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura tn5250-0.17.4.orig/configure tn5250-0.17.4/configure
+--- tn5250-0.17.4.orig/configure	2014-09-10 08:33:15.689519554 -0300
++++ tn5250-0.17.4/configure	2014-09-10 08:33:47.428613117 -0300
+@@ -23258,7 +23258,7 @@
+ if test "${with_ssl_dir+set}" = set; then
+   withval=$with_ssl_dir;
+     if test "$with_ssl_dir" != "no"; then
+-         checksslinclude "$with_ssl"
++         checksslinclude "$with_ssl_dir"
+     else
+         for topdir in /usr/local /usr /usr/pkg /usr/lib /var/ssl /opt; do
+             for subdir in $topdir $topdir/openssl $topdir/ssl; do
diff --git a/package/tn5250/tn5250.mk b/package/tn5250/tn5250.mk
index 2c4c2ad..33f7c0c 100644
--- a/package/tn5250/tn5250.mk
+++ b/package/tn5250/tn5250.mk
@@ -12,7 +12,7 @@ TN5250_LICENSE = LGPLv2.1+
 TN5250_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-	TN5250_CONF_OPT += --with-ssl
+	TN5250_CONF_OPT += --with-ssl-dir=$(STAGING_DIR)/usr
 	TN5250_DEPENDENCIES += openssl
 else
 	TN5250_CONF_OPT += --without-ssl
-- 
1.8.5.5
