From: Michael Roth <mroth@nessie.de>
Date: Thu, 24 Sep 2009 16:13:32 +0200
Subject: [Buildroot] [PATCH] qt: Remove config option for embedded platform
Message-ID: <1253801612-29809-1-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The platform for QT relates to the real platform we are compiling for
in a fixed manner, so remove the config option to not disturb users
and calculate the QT-platform in the Makefile.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 package/qt/Config.in                              |   21 ------------
 package/qt/qt.mk                                  |   36 ++++++++++++++++++---
 target/device/Atmel/atstk100x/atstk100x_defconfig |    1 -
 target/device/valka/v100sc2_defconfig             |    1 -
 4 files changed, 31 insertions(+), 28 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index b7fe0f9..3725492 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -242,27 +242,6 @@ config BR2_PACKAGE_QT_SYSTEMFREETYPE
 	  See http://www.freetype.org/
 endchoice
 
-config BR2_PACKAGE_QT_EMB_PLATFORM
-	string "The embedded platform we are making Qt for"
-	default "arm"	if BR2_arm
-	default "arm"	if BR2_armeb
-	default "avr32"	if BR2_avr32
-	default "x86"	if BR2_i386
-	default "x86_64"	if BR2_x86_64
-	default "mips"	if BR2_mips
-	default "mips"	if BR2_mipsel
-	default "ppc"	if BR2_powerpc
-# Not that I really believe these will work..
-	default "generic"	if BR2_alpha
-	default "generic"	if BR2_chris
-	default "generic"	if BR2_m68k
-	default "generic"	if BR2_nios2
-	default "generic"	if BR2_sh
-	default "generic"	if BR2_sh64
-	default "generic"	if BR2_sparc
-	help
-	  The target platform.
-
 source "package/qt/Config.sql.in"
 if BR2_PACKAGE_QT_GUI_MODULE
 source "package/qt/Config.gfx.in"
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 01a3635..4b06cbe 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -24,6 +24,33 @@
 QT_VERSION:=4.5.2
 QT_CAT:=$(BZCAT)
 
+# Platform we compile for
+QT_EMB_PLATFORM:=generic
+ifeq ($(BR2_arm),y)
+QT_EMB_PLATFORM:=arm
+endif
+ifeq ($(BR2_armeb),y)
+QT_EMB_PLATFORM:=arm
+endif
+ifeq ($(BR2_avr32),y)
+QT_EMB_PLATFORM:=avr32
+endif
+ifeq ($(BR2_i386),y)
+QT_EMB_PLATFORM:=x86
+endif
+ifeq ($(BR2_x86_64),y)
+QT_EMB_PLATFORM:=x86_64
+endif
+ifeq ($(BR2_mips),y)
+QT_EMB_PLATFORM:=mips
+endif
+ifeq ($(BR2_mipsel),y)
+QT_EMB_PLATFORM:=mips
+endif
+ifeq ($(BR2_powerpc),y)
+QT_EMB_PLATFORM:=ppc
+endif
+
 BR2_PACKAGE_QT_COMMERCIAL_USERNAME:=$(call qstrip,$(BR2_PACKAGE_QT_COMMERCIAL_USERNAME))
 BR2_PACKAGE_QT_COMMERCIAL_PASSWORD:=$(call qstrip,$(BR2_PACKAGE_QT_COMMERCIAL_PASSWORD))
 
@@ -327,13 +354,12 @@ QT_CONFIGURE+= -no-stl
 endif
 
 QT_CONFIGURE:=$(call qstrip,$(QT_CONFIGURE))
-BR2_PACKAGE_QT_EMB_PLATFORM:=$(call qstrip,$(BR2_PACKAGE_QT_EMB_PLATFORM))
 
 # x86x86fix
 # Workaround Qt Embedded bug when crosscompiling for x86 under x86 with linux
 # host. It's unclear if this would happen on other hosts.
 ifneq ($(findstring pc-linux,$(BR2_GNU_BUILD_SUFFIX)),)
-ifeq ($(BR2_PACKAGE_QT_EMB_PLATFORM),x86)
+ifeq ($(QT_EMB_PLATFORM),x86)
 QT_CONFIGURE+= -platform linux-g++
 QT_CONFIGURE:=$(call qstrip,$(QT_CONFIGURE))
 endif
@@ -373,12 +399,12 @@ ifeq ($(BR2_PACKAGE_QT_SCRIPTTOOLS),y)
 QT_LIBS+= qt-scripttools
 endif
 
-QT_QMAKE_CONF:=$(QT_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QT_EMB_PLATFORM)-g++/qmake.conf
+QT_QMAKE_CONF:=$(QT_TARGET_DIR)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
 
 QT_QMAKE_AR:=$(TARGET_AR) cqs
 
 # Variable for other Qt applications to use
-QT_QMAKE:=$(STAGING_DIR)/usr/bin/qmake -spec qws/linux-$(BR2_PACKAGE_QT_EMB_PLATFORM)-g++
+QT_QMAKE:=$(STAGING_DIR)/usr/bin/qmake -spec qws/linux-$(QT_EMB_PLATFORM)-g++
 
 ################################################################################
 # QT_QMAKE_SET -- helper macro to set QMAKE_<variable> = <value> in
@@ -458,7 +484,7 @@ endif
 		./configure \
 		$(if $(VERBOSE),-verbose,-silent) \
 		-force-pkg-config \
-		-embedded $(BR2_PACKAGE_QT_EMB_PLATFORM) \
+		-embedded $(QT_EMB_PLATFORM) \
 		$(QT_QCONFIG_COMMAND) \
 		$(QT_CONFIGURE) \
 		-no-cups \
diff --git a/target/device/Atmel/atstk100x/atstk100x_defconfig b/target/device/Atmel/atstk100x/atstk100x_defconfig
index 89f392f..260c94b 100644
--- a/target/device/Atmel/atstk100x/atstk100x_defconfig
+++ b/target/device/Atmel/atstk100x/atstk100x_defconfig
@@ -728,7 +728,6 @@ BR2_PACKAGE_QT_QTZLIB=y
 BR2_PACKAGE_QT_NOFREETYPE=y
 # BR2_PACKAGE_QT_QTFREETYPE is not set
 # BR2_PACKAGE_QT_SYSTEMFREETYPE is not set
-BR2_PACKAGE_QT_EMB_PLATFORM="$(ARCH)"
 # BR2_PACKAGE_QT_SQL_MODULE is not set
 
 #
diff --git a/target/device/valka/v100sc2_defconfig b/target/device/valka/v100sc2_defconfig
index 81f5081..3315c9a 100644
--- a/target/device/valka/v100sc2_defconfig
+++ b/target/device/valka/v100sc2_defconfig
@@ -567,7 +567,6 @@ BR2_PACKAGE_QT_QTZLIB=y
 # BR2_PACKAGE_QT_NOFREETYPE is not set
 BR2_PACKAGE_QT_QTFREETYPE=y
 # BR2_PACKAGE_QT_SYSTEMFREETYPE is not set
-BR2_PACKAGE_QT_EMB_PLATFORM="avr32"
 # BR2_PACKAGE_QT_SQL_MODULE is not set
 
 #
-- 
1.6.3.3
