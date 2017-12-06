From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed,  6 Dec 2017 12:19:26 +0100
Subject: [Buildroot] [PATCH v2] package/i2c-tools: bump to version 4.0
Message-ID: <1512559166-5399-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps i2c-tools to version 4.0 and adds a new command
named i2ctransfer.
It adds also an upstream commit not included in the release
that fixing a static compilation issue.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
Changes:

v1-v2: added upstream commit to fix static compilation issues

 ...efile-Add-flag-to-disable-dynamic-library.patch | 64 ++++++++++++++++++++++
 package/i2c-tools/i2c-tools.hash                   |  2 +-
 package/i2c-tools/i2c-tools.mk                     | 14 ++++-
 3 files changed, 76 insertions(+), 4 deletions(-)
 create mode 100644 package/i2c-tools/0001-Makefile-Add-flag-to-disable-dynamic-library.patch

diff --git a/package/i2c-tools/0001-Makefile-Add-flag-to-disable-dynamic-library.patch b/package/i2c-tools/0001-Makefile-Add-flag-to-disable-dynamic-library.patch
new file mode 100644
index 0000000..5a585b2
--- /dev/null
+++ b/package/i2c-tools/0001-Makefile-Add-flag-to-disable-dynamic-library.patch
@@ -0,0 +1,64 @@
+From 9906b2ecb6aec02d6348d6237b784135e6930d0b Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo@amarulasolutions.com>
+Date: Wed, 6 Dec 2017 10:12:07 +0100
+Subject: [PATCH 1/2] Makefile: Add flag to disable dynamic library
+
+In such cases where you need to disable entirely the dynamic
+library compilation, now you can use the BUILD_DYNAMIC_LIB=0
+flag.
+
+Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
+Signed-off-by: Jean Delvare <jdelvare@suse.de>
+---
+ Makefile      | 10 +++++++++-
+ lib/Module.mk |  6 +++++-
+ 2 files changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index c85317c..1bb5572 100644
+--- a/Makefile
++++ b/Makefile
+@@ -32,12 +32,20 @@ CFLAGS		?= -O2
+ CFLAGS		+= -Wall
+ SOCFLAGS	:= -fpic -D_REENTRANT $(CFLAGS)
+ 
+-USE_STATIC_LIB ?= 0
++BUILD_DYNAMIC_LIB ?= 1
+ BUILD_STATIC_LIB ?= 1
++USE_STATIC_LIB ?= 0
++
+ ifeq ($(USE_STATIC_LIB),1)
+ BUILD_STATIC_LIB := 1
+ endif
+ 
++ifeq ($(BUILD_DYNAMIC_LIB),0)
++ifeq ($(BUILD_STATIC_LIB),0)
++$(error BUILD_DYNAMIC_LIB and BUILD_STATIC_LIB cannot be disabled at the same time)
++endif
++endif
++
+ KERNELVERSION	:= $(shell uname -r)
+ 
+ .PHONY: all strip clean install uninstall
+diff --git a/lib/Module.mk b/lib/Module.mk
+index fd2c8c4..44fa938 100644
+--- a/lib/Module.mk
++++ b/lib/Module.mk
+@@ -27,9 +27,13 @@ LIB_SHSONAME	:= $(LIB_SHBASENAME).$(LIB_MAINVER)
+ LIB_SHLIBNAME	:= $(LIB_SHBASENAME).$(LIB_VER)
+ LIB_STLIBNAME	:= libi2c.a
+ 
+-LIB_TARGETS	:= $(LIB_SHLIBNAME)
+ LIB_LINKS	:= $(LIB_SHSONAME) $(LIB_SHBASENAME)
+ LIB_OBJECTS	:= smbus.o
++
++LIB_TARGETS	:=
++ifeq ($(BUILD_DYNAMIC_LIB),1)
++LIB_TARGETS	+= $(LIB_SHLIBNAME)
++endif
+ ifeq ($(BUILD_STATIC_LIB),1)
+ LIB_TARGETS	+= $(LIB_STLIBNAME)
+ LIB_OBJECTS	+= smbus.ao
+-- 
+2.7.4
+
diff --git a/package/i2c-tools/i2c-tools.hash b/package/i2c-tools/i2c-tools.hash
index 464219d..3475d20 100644
--- a/package/i2c-tools/i2c-tools.hash
+++ b/package/i2c-tools/i2c-tools.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 6d6079153cd49a62d4addacef4c092db1a46ba60b2807070a3fbe050262aef87  i2c-tools-3.1.2.tar.xz
+sha256 d900ca1c11c51ea20caa50b096f948008b8a7ad832311b23353e21baa7af28d6  i2c-tools-4.0.tar.xz
 
 # License file
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index 3bbaf38..66b1657 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-I2C_TOOLS_VERSION = 3.1.2
+I2C_TOOLS_VERSION = 4.0
 I2C_TOOLS_SOURCE = i2c-tools-$(I2C_TOOLS_VERSION).tar.xz
 I2C_TOOLS_SITE = https://www.kernel.org/pub/software/utils/i2c-tools
 I2C_TOOLS_LICENSE = GPL-2.0+, GPL-2.0 (py-smbus)
 I2C_TOOLS_LICENSE_FILES = COPYING
+I2C_TOOLS_MAKE_OPTS = EXTRA="eeprog"
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 I2C_TOOLS_DEPENDENCIES += python
@@ -22,6 +23,12 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 I2C_TOOLS_DEPENDENCIES += busybox
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+ifeq ($(BR2_SHARED_STATIC_LIBS),)
+I2C_TOOLS_MAKE_OPTS += BUILD_DYNAMIC_LIB=0 USE_STATIC_LIB=1
+endif
+endif
+
 # Build/install steps mirror the distutil python package type in the python package
 # infrastructure
 ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
@@ -47,15 +54,16 @@ endef
 endif # BR2_PACKAGE_PYTHON
 
 define I2C_TOOLS_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(I2C_TOOLS_MAKE_OPTS) -C $(@D)
 	$(I2C_TOOLS_BUILD_PYSMBUS)
 endef
 
 define I2C_TOOLS_INSTALL_TARGET_CMDS
-	for i in i2cdump i2cget i2cset i2cdetect; \
+	for i in i2cdump i2cget i2cset i2cdetect i2ctransfer; \
 	do \
 		$(INSTALL) -m 755 -D $(@D)/tools/$$i $(TARGET_DIR)/usr/sbin/$$i; \
 	done
+	$(INSTALL) -m 755 -D $(@D)/eeprog/eeprog $(TARGET_DIR)/usr/bin/eeprog;
 	$(I2C_TOOLS_INSTALL_PYSMBUS)
 endef
 
-- 
2.7.4
