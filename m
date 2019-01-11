From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 11 Jan 2019 16:02:55 +0100
Subject: [Buildroot] [PATCH 1/1] php-amqp: bump to version 1.9.4
Message-ID: <20190111150255.996-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/php-amqp/0001-fix-for-7.3-323.patch | 43 -----------------------------
 package/php-amqp/php-amqp.hash              |  2 +-
 package/php-amqp/php-amqp.mk                |  2 +-
 3 files changed, 2 insertions(+), 45 deletions(-)
 delete mode 100644 package/php-amqp/0001-fix-for-7.3-323.patch

diff --git a/package/php-amqp/0001-fix-for-7.3-323.patch b/package/php-amqp/0001-fix-for-7.3-323.patch
deleted file mode 100644
index ad03e3bca0..0000000000
--- a/package/php-amqp/0001-fix-for-7.3-323.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 1205d3287df0a9ec762a6594b4fa018ed9637d21 Mon Sep 17 00:00:00 2001
-From: Remi Collet <remi@famillecollet.com>
-Date: Thu, 21 Jun 2018 11:16:32 +0200
-Subject: [PATCH] fix for 7.3 (#323)
-
-[Frank: backport from upstream commit 1205d3287df0a9ec762a6594b4fa018ed9637d21]
-Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
-
----
- amqp_channel.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/amqp_channel.c b/amqp_channel.c
-index f3dba5d..032526e 100644
---- a/amqp_channel.c
-+++ b/amqp_channel.c
-@@ -101,7 +101,11 @@ static void php_amqp_destroy_fci(zend_fcall_info *fci) {
-     if (fci->size > 0) {
-         zval_ptr_dtor(&fci->function_name);
-         if (fci->object != NULL) {
-+#if PHP_VERSION_ID >= 70300
-+            GC_DELREF(fci->object);
-+#else
-             GC_REFCOUNT(fci->object)--;
-+#endif
-         }
-         fci->size = 0;
-     }
-@@ -112,7 +116,11 @@ static void php_amqp_duplicate_fci(zend_fcall_info *source) {
-
-         zval_add_ref(&source->function_name);
-         if (source->object != NULL) {
-+#if PHP_VERSION_ID >= 70300
-+            GC_ADDREF(source->object);
-+#else
-             GC_REFCOUNT(source->object)++;
-+#endif
-         }
-     }
- }
---
-2.17.1
-
diff --git a/package/php-amqp/php-amqp.hash b/package/php-amqp/php-amqp.hash
index 10b16f1b48..c061efabb9 100644
--- a/package/php-amqp/php-amqp.hash
+++ b/package/php-amqp/php-amqp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 c79e52db33bf907dad7da8f350dbdf2937b0679a3dc44fb2a941efb6d4808da9  amqp-1.9.3.tgz
+sha256 b66b8b8264749cb7a69ae4d09665dad1559b6c4f01430206c8e4187bcd8c782d  amqp-1.9.4.tgz
 sha256 ecd004e9ae3fcf54896b562d5e8008e36041f2620076effd58e5f4187299cee8  LICENSE
diff --git a/package/php-amqp/php-amqp.mk b/package/php-amqp/php-amqp.mk
index e9de4825a9..c808ecdbd6 100644
--- a/package/php-amqp/php-amqp.mk
+++ b/package/php-amqp/php-amqp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_AMQP_VERSION = 1.9.3
+PHP_AMQP_VERSION = 1.9.4
 PHP_AMQP_SOURCE = amqp-$(PHP_AMQP_VERSION).tgz
 PHP_AMQP_SITE = https://pecl.php.net/get
 PHP_AMQP_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
-- 
2.14.1
