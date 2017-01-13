From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Jan 2017 16:13:20 +0100
Subject: [Buildroot] [git commit] jasper: bump to version 2.0.10
Message-ID: <20170113152114.536FE7F87B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=015457a852dd733ea555dc8c145235915546fcc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use upstream provided tarball.

Upstream switched to cmake.

libjpeg dependency is now optional.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jasper/Config.in   |  1 -
 package/jasper/jasper.hash |  2 +-
 package/jasper/jasper.mk   | 20 +++++++++++++-------
 3 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/package/jasper/Config.in b/package/jasper/Config.in
index 087b520..7296936 100644
--- a/package/jasper/Config.in
+++ b/package/jasper/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_JASPER
 	bool "jasper"
-	select BR2_PACKAGE_JPEG
 	help
 	  JPEG-2000 decoder
 
diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
index 64ddfa4..6c3ab47 100644
--- a/package/jasper/jasper.hash
+++ b/package/jasper/jasper.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 0099084dce9fa0a318b48a5ed2a12ac7cff3324f3fd4459833e6fe2ff583fb2c  jasper-version-1.900.31.tar.gz
+sha256 54d85428e35263642358a11c312d61cbc054170546fae780e11271df5d1502e8 jasper-2.0.10.tar.gz
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 32aa618..f4db8c4 100644
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
