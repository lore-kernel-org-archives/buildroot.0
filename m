From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 9 Oct 2009 14:58:32 +0200
Subject: [Buildroot] [git commit master] qt: remove commercial license option
Message-ID: <20091009130117.95C8877784@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=28eefec5bd12072a68035e9f900fe75a3644e946
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It looks like that nobody is using the commercial license option
because the code is broken (BR2_QT_COMMERCIAL_PASSWORD typo) and
dist.trolltech.com became silent long ago and nobody complained about.

So remove the broken and unused stuff.

Signed-off-by: Michael Roth <mroth@nessie.de>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/atstk100x_defconfig |    1 -
 configs/v100sc2_defconfig   |    2 --
 package/qt/Config.in        |   18 ------------------
 package/qt/qt.mk            |   20 ++++----------------
 4 files changed, 4 insertions(+), 37 deletions(-)

diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index 9207895..32de940 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -690,7 +690,6 @@ BR2_PACKAGE_QT=y
 # BR2_PACKAGE_QT_DEBUG is not set
 BR2_PACKAGE_QT_SHARED=y
 # BR2_PACKAGE_QT_STATIC is not set
-# BR2_PACKAGE_QT_LICENSE_TYPE_COMMERCIAL is not set
 # BR2_PACKAGE_QT_LICENSE_APPROVED is not set
 # BR2_PACKAGE_QT_QT3SUPPORT is not set
 BR2_PACKAGE_QT_GUI_MODULE=y
diff --git a/configs/v100sc2_defconfig b/configs/v100sc2_defconfig
index fcece77..799931b 100644
--- a/configs/v100sc2_defconfig
+++ b/configs/v100sc2_defconfig
@@ -546,8 +546,6 @@ BR2_PACKAGE_QT=y
 # BR2_PACKAGE_QT_DEBUG is not set
 BR2_PACKAGE_QT_SHARED=y
 # BR2_PACKAGE_QT_STATIC is not set
-BR2_PACKAGE_QT_LICENSE_TYPE_GPL=y
-# BR2_PACKAGE_QT_LICENSE_TYPE_COMMERCIAL is not set
 BR2_PACKAGE_QT_GPL_LICENSE_APPROVED=y
 # BR2_PACKAGE_QT_QT3SUPPORT is not set
 BR2_PACKAGE_QT_PIXEL_DEPTH_8=y
diff --git a/package/qt/Config.in b/package/qt/Config.in
index d25ebf9..044f65d 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -39,12 +39,8 @@ config BR2_PACKAGE_QT_STATIC
 
 endchoice
 
-config BR2_PACKAGE_QT_LICENSE_TYPE_COMMERCIAL
-	bool "Use commercial license"
-
 config BR2_PACKAGE_QT_LICENSE_APPROVED
 	bool "Approve free license"
-	depends on !BR2_PACKAGE_QT_LICENSE_TYPE_COMMERCIAL
 	help
 	  Select this if you approve one of the available free licenses for the
 	  Qt4 library.
@@ -54,20 +50,6 @@ config BR2_PACKAGE_QT_LICENSE_APPROVED
 	  LGPL v2.1: http://doc.trolltech.com/4.5/lgpl.html
 	  GPL  v3.0: http://doc.trolltech.com/4.5/gpl.html
 
-config BR2_PACKAGE_QT_COMMERCIAL_USERNAME
-	string "Qt 4 Commercial License Username"
-	depends on BR2_PACKAGE_QT_LICENSE_TYPE_COMMERCIAL
-	help
-	  Commercial users can download their source directly by
-	  providing a username.
-
-config BR2_PACKAGE_QT_COMMERCIAL_PASSWORD
-	string "Qt 4 Commercial License Password"
-	depends on BR2_PACKAGE_QT_LICENSE_TYPE_COMMERCIAL
-	help
-	  Commercial users can download their source directly by
-	  providing a password.
-
 config BR2_PACKAGE_QT_QT3SUPPORT
 	bool "Compatibility with Qt3"
 	help
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 0bbf644..3d58f1f 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -13,27 +13,15 @@
 ######################################################################
 
 QT_VERSION:=4.5.2
+QT_SOURCE:=qt-embedded-linux-opensource-src-$(QT_VERSION).tar.bz2
+QT_SITE:=http://get.qtsoftware.com/qt/source
 QT_CAT:=$(BZCAT)
-
-BR2_PACKAGE_QT_COMMERCIAL_USERNAME:=$(call qstrip,$(BR2_PACKAGE_QT_COMMERCIAL_USERNAME))
-BR2_PACKAGE_QT_COMMERCIAL_PASSWORD:=$(call qstrip,$(BR2_PACKAGE_QT_COMMERCIAL_PASSWORD))
+QT_TARGET_DIR:=$(BUILD_DIR)/qt-embedded-linux-opensource-src-$(QT_VERSION)
 
 QT_CONFIGURE:=#empty
 
-# What to download, free or commercial version.
-ifneq ($(BR2_PACKAGE_QT_COMMERCIAL_USERNAME),)
-QT_SITE:=http://$(BR2_PACKAGE_QT_COMMERCIAL_USERNAME):$(BR2_QT_COMMERCIAL_PASSWORD)@dist.trolltech.com/$(BR2_PACKAGE_QT_COMMERCIAL_USERNAME)
-QT_SOURCE:=qt-embedded-linux-commercial-src-$(QT_VERSION).tar.bz2
-QT_TARGET_DIR:=$(BUILD_DIR)/qt-embedded-linux-commercial-src-$(QT_VERSION)
-QT_CONFIGURE+= -commercial
-else # Good, good, we are free:
-QT_SITE=http://get.qtsoftware.com/qt/source
-QT_SOURCE:=qt-embedded-linux-opensource-src-$(QT_VERSION).tar.bz2
-QT_TARGET_DIR:=$(BUILD_DIR)/qt-embedded-linux-opensource-src-$(QT_VERSION)
-QT_CONFIGURE+= -opensource
 ifeq ($(BR2_PACKAGE_QT_LICENSE_APPROVED),y)
-QT_CONFIGURE+= -confirm-license
-endif
+QT_CONFIGURE += -opensource -confirm-license
 endif
 
 # If you want extra tweaking you can copy
-- 
1.6.3.3
