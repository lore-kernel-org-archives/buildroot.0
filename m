From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 12 Jan 2017 22:47:44 +0200
Subject: [Buildroot] [PATCH] jasper: bump to version 2.0.10
Message-ID: <fb303a78ecb0aa757a78bc896b2c3627093528d3.1484254064.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use upstream provided tarball.

Upstream switched to cmake.

libjpeg dependency is now optional.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/jasper/Config.in   |  1 -
 package/jasper/jasper.hash |  2 +-
 package/jasper/jasper.mk   | 20 +++++++++++++-------
 3 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/package/jasper/Config.in b/package/jasper/Config.in
index 087b520f11ce..72969365701d 100644
--- a/package/jasper/Config.in
+++ b/package/jasper/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_JASPER
 	bool "jasper"
-	select BR2_PACKAGE_JPEG
 	help
 	  JPEG-2000 decoder
 
diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
index 64ddfa4841a9..6c3ab473cf91 100644
--- a/package/jasper/jasper.hash
+++ b/package/jasper/jasper.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 0099084dce9fa0a318b48a5ed2a12ac7cff3324f3fd4459833e6fe2ff583fb2c  jasper-version-1.900.31.tar.gz
+sha256 54d85428e35263642358a11c312d61cbc054170546fae780e11271df5d1502e8 jasper-2.0.10.tar.gz
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 32aa61829292..f4db8c492064 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -4,16 +4,22 @@
 #
 ################################################################################
 
-JASPER_VERSION = version-1.900.31
-JASPER_SITE = $(call github,mdadams,jasper,$(JASPER_VERSION))
+JASPER_VERSION = 2.0.10
+JASPER_SITE = http://www.ece.uvic.ca/~frodo/jasper/software
 JASPER_INSTALL_STAGING = YES
-JASPER_DEPENDENCIES = jpeg
 JASPER_LICENSE = JasPer License Version 2.0
 JASPER_LICENSE_FILES = LICENSE
+JASPER_SUPPORTS_IN_SOURCE_BUILD = NO
 
-# No configure script included. We need to generate it.
-JASPER_AUTORECONF = YES
+ifeq ($(BR2_STATIC_LIBS),y)
+JASPER_CONF_OPTS += -DJAS_ENABLE_SHARED=OFF
+endif
 
-JASPER_CONF_OPTS = --disable-strict
+ifeq ($(BR2_PACKAGE_JPEG),y)
+JASPER_CONF_OPTS += -DJAS_ENABLE_LIBJPEG=ON
+JASPER_DEPENDENCIES += jpeg
+else
+JASPER_CONF_OPTS += -DJAS_ENABLE_LIBJPEG=OFF
+endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.11.0
