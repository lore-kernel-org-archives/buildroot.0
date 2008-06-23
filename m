From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 23 Jun 2008 04:53:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lm-sensors
Message-ID: <20080623115341.B0B573C5FA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-23 04:53:41 -0700 (Mon, 23 Jun 2008)
New Revision: 22476

Log:
lm-sensors: bump version and cleanup

- Bump version to 3.0.2 which no longer needs libsysfs
- Set MACHINE correctly, so it doesn't try to build isa stuff for non-i386
- Cleanup make invocation


Modified:
   trunk/buildroot/package/lm-sensors/Config.in
   trunk/buildroot/package/lm-sensors/lm-sensors.mk


Changeset:
Modified: trunk/buildroot/package/lm-sensors/Config.in
===================================================================
--- trunk/buildroot/package/lm-sensors/Config.in	2008-06-23 11:53:35 UTC (rev 22475)
+++ trunk/buildroot/package/lm-sensors/Config.in	2008-06-23 11:53:41 UTC (rev 22476)
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LM_SENSORS
 	bool "lm-sensors"
-	select BR2_PACKAGE_LIBSYSFS
 	default n
 	help
 	  Lm-sensors is a hardware health monitoring package for

Modified: trunk/buildroot/package/lm-sensors/lm-sensors.mk
===================================================================
--- trunk/buildroot/package/lm-sensors/lm-sensors.mk	2008-06-23 11:53:35 UTC (rev 22475)
+++ trunk/buildroot/package/lm-sensors/lm-sensors.mk	2008-06-23 11:53:41 UTC (rev 22476)
@@ -3,42 +3,25 @@
 # lm-sensors
 #
 #############################################################
-LM_SENSORS_VERSION:=2.10.6
-LM_SENSORS_SOURCE:=lm-sensors_$(LM_SENSORS_VERSION).orig.tar.gz
-LM_SENSORS_PATCH:=lm-sensors_$(LM_SENSORS_VERSION)-2.diff.gz
-LM_SENSORS_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/l/lm-sensors/
+LM_SENSORS_VERSION:=3.0.2
+LM_SENSORS_SOURCE:=lm_sensors-$(LM_SENSORS_VERSION).tar.bz2
+LM_SENSORS_SITE:=http://dl.lm-sensors.org/lm-sensors/releases
 LM_SENSORS_DIR:=$(BUILD_DIR)/lm_sensors-$(LM_SENSORS_VERSION)
-LM_SENSORS_CAT:=$(ZCAT)
+LM_SENSORS_CAT:=$(BZCAT)
 LM_SENSORS_BINARY:=prog/sensors/sensors
 LM_SENSORS_TARGET_BINARY:=usr/bin/sensors
 
 $(DL_DIR)/$(LM_SENSORS_SOURCE):
 	$(WGET) -P $(DL_DIR) $(LM_SENSORS_SITE)/$(LM_SENSORS_SOURCE)
 
-ifneq ($(LM_SENSORS_PATCH),)
-LM_SENSORS_PATCH_FILE:=$(DL_DIR)/$(LM_SENSORS_PATCH)
-$(DL_DIR)/$(LM_SENSORS_PATCH):
-	$(WGET) -P $(DL_DIR) $(LM_SENSORS_SITE)/$(LM_SENSORS_PATCH)
-endif
-
-$(LM_SENSORS_DIR)/.unpacked: $(DL_DIR)/$(LM_SENSORS_SOURCE) $(DL_DIR)/$(LM_SENSORS_PATCH)
+$(LM_SENSORS_DIR)/.unpacked: $(DL_DIR)/$(LM_SENSORS_SOURCE)
 	$(LM_SENSORS_CAT) $(DL_DIR)/$(LM_SENSORS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(LM_SENSORS_DIR) package/lm-sensors/ lm-sensors\*.patch
-ifneq ($(LM_SENSORS_PATCH),)
-	(cd $(LM_SENSORS_DIR) && \
-	 $(LM_SENSORS_CAT) $(LM_SENSORS_PATCH_FILE) | patch -p1)
-	if [ -d $(LM_SENSORS_DIR)/debian/patches ]; then \
-		toolchain/patch-kernel.sh $(LM_SENSORS_DIR) $(LM_SENSORS_DIR)/debian/patches \*.patch; \
-	fi
-endif
-	-$(SED) "s/-O[[:digit:]]//g" $(LM_SENSORS_DIR)/Makefile
 	touch $@
 
 $(LM_SENSORS_DIR)/$(LM_SENSORS_BINARY): $(LM_SENSORS_DIR)/.unpacked
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(LM_SENSORS_DIR) \
-		LINUX="$(LINUX_DIR)" KERNELVERSION=$(LINUX_HEADERS_VERSION) \
-		I2C_HEADERS=$(LINUX_DIR)/include \
-		DESTDIR=$(TARGET_DIR) user
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) MACHINE=$(KERNEL_ARCH)\
+		-C $(LM_SENSORS_DIR)
 
 $(TARGET_DIR)/$(LM_SENSORS_TARGET_BINARY): $(LM_SENSORS_DIR)/$(LM_SENSORS_BINARY)
 	if [ ! -f $(TARGET_DIR)/etc/sensors.conf ]; then \
@@ -57,7 +40,7 @@
 
 lm-sensors-unpacked: $(LM_SENSORS_DIR)/.unpacked
 
-lm-sensors: uclibc libsysfs $(TARGET_DIR)/$(LM_SENSORS_TARGET_BINARY)
+lm-sensors: uclibc $(TARGET_DIR)/$(LM_SENSORS_TARGET_BINARY)
 
 lm-sensors-clean:
 	-$(MAKE) -C $(LM_SENSORS_DIR) clean
