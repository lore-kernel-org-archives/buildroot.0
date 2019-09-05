From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu,  5 Sep 2019 12:01:09 +0200
Subject: [Buildroot] [PATCH] libpjsip: bump to 2.9
Message-ID: <20190905100109.16456-1-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updates:
 - remove patch now upstream
 - remove --disable-oss, not supported anymore
 - 2.9 supports gnutls, add optional dependency
 - bonus: switch to https for downloading

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 ...1-Fixed-possible-function-name-clash.patch | 26 -------------------
 package/libpjsip/libpjsip.hash                |  6 ++---
 package/libpjsip/libpjsip.mk                  |  8 +++---
 3 files changed, 8 insertions(+), 32 deletions(-)
 delete mode 100644 package/libpjsip/0001-Fixed-possible-function-name-clash.patch

diff --git a/package/libpjsip/0001-Fixed-possible-function-name-clash.patch b/package/libpjsip/0001-Fixed-possible-function-name-clash.patch
deleted file mode 100644
index 435b0eab548d..000000000000
--- a/package/libpjsip/0001-Fixed-possible-function-name-clash.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Re #2059 (misc): Fixed possible function name clash with md5 due to non-static function.
-
-Backported from: https://trac.pjsip.org/repos/changeset/5688
-Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
-
-Index: pjlib-util/src/pjlib-util/md5.c
-===================================================================
-diff --git a/pjproject/pjlib-util/src/pjlib-util/md5.c b/pjproject/pjlib-util/src/pjlib-util/md5.c
---- a/pjlib-util/src/pjlib-util/md5.c	(revision 5687)
-+++ b/pjlib-util/src/pjlib-util/md5.c	(revision 5688)
-@@ -29,13 +29,13 @@
- #ifndef HIGHFIRST
- #define byteReverse(buf, len)	/* Nothing */
- #else
--void byteReverse(unsigned char *buf, unsigned longs);
-+static void byteReverse(unsigned char *buf, unsigned longs);
- 
- #ifndef ASM_MD5
- /*
-  * Note: this code is harmless on little-endian machines.
-  */
--void byteReverse(unsigned char *buf, unsigned longs)
-+static void byteReverse(unsigned char *buf, unsigned longs)
- {
-     pj_uint32_t t;
-     do {
diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
index 36c2ea12893f..bcf46ea5fbf3 100644
--- a/package/libpjsip/libpjsip.hash
+++ b/package/libpjsip/libpjsip.hash
@@ -1,6 +1,6 @@
-# From http://www.pjsip.org/release/2.7.2/MD5SUM.TXT
-md5	fa3f0bc098c4bff48ddd92db1c016a7a  pjproject-2.7.2.tar.bz2
+# From https://www.pjsip.org/release/2.9/MD5SUM.TXT
+md5	66757078e7bd7cf316acb0425c2fdd6f  pjproject-2.9.tar.bz2
 
 # Locally computed
-sha256	9c2c828abab7626edf18e04b041ef274bfaa86f99adf2c25ff56f1509e813772	pjproject-2.7.2.tar.bz2
+sha256	d185ef7855c8ec07191dde92f54b65a7a4b7a6f7bf8c46f7af35ceeb1da2a636	pjproject-2.9.tar.bz2
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 22b922586c14..6432954428af 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBPJSIP_VERSION = 2.7.2
+LIBPJSIP_VERSION = 2.9
 LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.bz2
-LIBPJSIP_SITE = http://www.pjsip.org/release/$(LIBPJSIP_VERSION)
+LIBPJSIP_SITE = https://www.pjsip.org/release/$(LIBPJSIP_VERSION)
 LIBPJSIP_DEPENDENCIES = libsrtp
 LIBPJSIP_LICENSE = GPL-2.0+
 LIBPJSIP_LICENSE_FILES = COPYING
@@ -33,7 +33,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-ilbc-codec \
 	--disable-libwebrtc \
 	--disable-opus \
-	--disable-oss \
 	--disable-ext-sound \
 	--disable-g711-codec \
 	--disable-l16-codec \
@@ -66,6 +65,9 @@ endif
 ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 LIBPJSIP_DEPENDENCIES += libopenssl
 LIBPJSIP_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr
+else ifeq ($(BR2_PACKAGE_GNUTLS),y)
+LIBPJSIP_DEPENDENCIES += gnutls
+LIBPJSIP_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr
 else
 LIBPJSIP_CONF_OPTS += --disable-ssl
 endif
-- 
2.23.0
