From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 27 Jul 2017 12:37:06 +0200
Subject: [Buildroot] [PATCH] swupdate: bump to version 2017.07
Message-ID: <20170727103706.3580-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Remove patch applied upstream
* Update the default config file

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...1-suricata_hawkbit-depends-on-HAVE_JSON_C.patch | 39 ----------------------
 package/swupdate/swupdate.config                   | 29 ++++++++++------
 package/swupdate/swupdate.hash                     |  2 +-
 package/swupdate/swupdate.mk                       |  2 +-
 4 files changed, 20 insertions(+), 52 deletions(-)
 delete mode 100644 package/swupdate/0001-suricata_hawkbit-depends-on-HAVE_JSON_C.patch

diff --git a/package/swupdate/0001-suricata_hawkbit-depends-on-HAVE_JSON_C.patch b/package/swupdate/0001-suricata_hawkbit-depends-on-HAVE_JSON_C.patch
deleted file mode 100644
index e8cd790bd4..0000000000
--- a/package/swupdate/0001-suricata_hawkbit-depends-on-HAVE_JSON_C.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From ae647879efad6ba2bb0b95ed7e70dee82c05b82a Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Fri, 2 Jun 2017 07:40:08 +0300
-Subject: [PATCH] suricata_hawkbit: depends on HAVE_JSON_C
-
-Unconditionally selecting JSON when !HAVE_JSON_C leads to a warning:
-
-warning: (SURICATTA_HAWKBIT) selects JSON which has unmet direct dependencies (HAVE_JSON_C)
-
-and eventually a build failure:
-
-In file included from corelib/artifacts_versions.c:34:0:
-include/parselib.h:61:25: fatal error: json-c/json.h: No such file or directory
-
-Make SURICATTA_HAWKBIT depend on HAVE_JSON_C.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status:
-https://groups.google.com/forum/?hl=en#!topic/swupdate/WmwNN_Hni0c
-
- suricatta/Config.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/suricatta/Config.in b/suricatta/Config.in
-index 24bd5d1053f5..cfd96b83506a 100644
---- a/suricatta/Config.in
-+++ b/suricatta/Config.in
-@@ -54,6 +54,7 @@ choice
- config SURICATTA_HAWKBIT
- 	bool "hawkBit support"
- 	depends on HAVE_LIBCURL
-+	depends on HAVE_JSON_C
- 	select JSON
- 	select SURICATTA
- 	help
--- 
-2.11.0
-
diff --git a/package/swupdate/swupdate.config b/package/swupdate/swupdate.config
index 51869bb9d9..328e49fdf0 100644
--- a/package/swupdate/swupdate.config
+++ b/package/swupdate/swupdate.config
@@ -14,14 +14,11 @@ CONFIG_HAVE_DOT_CONFIG=y
 CONFIG_SCRIPTS=y
 # CONFIG_HW_COMPATIBILITY is not set
 CONFIG_SW_VERSIONS_FILE="/etc/sw-versions"
-# CONFIG_MTD is not set
-# CONFIG_LUA is not set
 # CONFIG_FEATURE_SYSLOG is not set
 
 #
 # Build Options
 #
-# CONFIG_STATIC is not set
 CONFIG_CROSS_COMPILE=""
 CONFIG_SYSROOT=""
 CONFIG_EXTRA_CFLAGS=""
@@ -34,9 +31,23 @@ CONFIG_EXTRA_LDLIBS=""
 # CONFIG_DEBUG is not set
 # CONFIG_WERROR is not set
 # CONFIG_NOCLEANUP is not set
-# CONFIG_DOWNLOAD is not set
-# CONFIG_SIGNED_IMAGES is not set
+
+#
+# Bootloader
+#
+# CONFIG_BOOTLOADER is not set
+CONFIG_BOOTLOADER_NONE=y
+# CONFIG_BOOTLOADER_GRUB is not set
+
+#
+# Suricatta
+#
 # CONFIG_SURICATTA is not set
+CONFIG_SURICATTA_SERVER_NONE=y
+
+#
+# Server
+#
 CONFIG_WEBSERVER=y
 
 #
@@ -48,19 +59,16 @@ CONFIG_MONGOOSE=y
 # Mongoose Feature
 #
 CONFIG_MONGOOSEIPV6=y
-# CONFIG_MONGOOSESSL is not set
 
 #
 # Archival Features
 #
-# CONFIG_GUNZIP is not set
 
 #
 # Parser Features
 #
 CONFIG_LIBCONFIG=y
-CONFIG_LIBCONFIGROOT=""
-# CONFIG_JSON is not set
+CONFIG_PARSERROOT=""
 # CONFIG_SETSWDESCRIPTION is not set
 
 #
@@ -68,5 +76,4 @@ CONFIG_LIBCONFIGROOT=""
 #
 CONFIG_RAW=y
 # CONFIG_SHELLSCRIPTHANDLER is not set
-# CONFIG_ARCHIVE is not set
-# CONFIG_UBOOT is not set
\ No newline at end of file
+# CONFIG_BOOTLOADERHANDLER is not set
diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 5bdd9bf320..7acc249b80 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  d5a4ff243bae865313b808aad57efa6400d41e83c49266a3a14a725d0c30d240  swupdate-2017.04.tar.gz
+sha256  898a98b0c5a6bd09a4138fa98bb9883357db1ec6fe4dd5e8f4bcb11d092b9bf3  swupdate-2017.07.tar.gz
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 560a2d4300..ee92adddf0 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2017.04
+SWUPDATE_VERSION = 2017.07
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0+, MIT, Public Domain
 SWUPDATE_LICENSE_FILES = COPYING
-- 
2.13.3
