From: Allan W. Nielsen <a@awn.dk>
Date: Wed,  6 Apr 2011 12:04:17 +0200
Subject: [Buildroot] [PATCH 63/63] udev: upgraded to version 151
In-Reply-To: <1302084257-30775-1-git-send-email-a@awn.dk>
References: <1302084257-30775-1-git-send-email-a@awn.dk>
Message-ID: <1302084257-30775-64-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 - Changed udev.mk to use autotargets
 - removed the volume_id library

Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 package/udev/Config.in            |   21 ++----
 package/udev/S10udev              |   49 +++++++++----
 package/udev/libvolume_id.la.tmpl |   35 ---------
 package/udev/udev.mk              |  138 ++++++++++---------------------------
 4 files changed, 77 insertions(+), 166 deletions(-)
 delete mode 100644 package/udev/libvolume_id.la.tmpl

diff --git a/package/udev/Config.in b/package/udev/Config.in
index 6438d4f..c0349e7 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -5,37 +5,30 @@ config BR2_PACKAGE_UDEV
 
 	  ftp://ftp.kernel.org/pub/linux/utils/kernel/hotplug/
 
-config BR2_PACKAGE_UDEV_UTILS
-	bool "udev-utils"
-	depends on BR2_PACKAGE_UDEV
-	help
-	  Adds the udevmonitor, udevinfo, and udevtest binaries
-	  to your filesystem.
-
 menu "Extra udev tools"
 	depends on BR2_PACKAGE_UDEV
 
-config BR2_PACKAGE_UDEV_VOLUME_ID
-	bool "udev-libvolume_id"
+config BR2_PACKAGE_UDEV_USB_ID
+	bool "udev-scsi_id"
 	depends on BR2_PACKAGE_UDEV
 	help
-	  Build and install volume identification library.
+	  Build and install USB identification tool.
 
 config BR2_PACKAGE_UDEV_SCSI_ID
 	bool "udev-scsi_id"
-	depends on BR2_PACKAGE_UDEV_VOLUME_ID
+	depends on BR2_PACKAGE_UDEV
 	help
-	  Build and install SCSI disk identification library.
+	  Build and install SCSI disk identification tool.
 
 config BR2_PACKAGE_UDEV_PATH_ID
 	bool "udev-path_id"
-	depends on BR2_PACKAGE_UDEV_VOLUME_ID
+	depends on BR2_PACKAGE_UDEV
 	help
 	  Install udev's unique device path generation program path_id.
 
 config BR2_PACKAGE_UDEV_FIRMWARE_SH
 	bool "udev-firmware_sh"
-	depends on BR2_PACKAGE_UDEV_VOLUME_ID
+	depends on BR2_PACKAGE_UDEV
 	help
 	  Install udev's firmware loading script firmware.sh.
 endmenu
diff --git a/package/udev/S10udev b/package/udev/S10udev
index 6418f63..be5f9a2 100755
--- a/package/udev/S10udev
+++ b/package/udev/S10udev
@@ -1,8 +1,6 @@
 #!/bin/sh
 #
-# udev	This is a minimal non-LSB version of a UDEV startup script.  It
-#	was derived by stripping down the udev-058 LSB version for use
-#	with buildroot on embedded hardware using Linux 2.6.12+ kernels.
+# udev	This is a port of the Gentoo init script for udev.
 #
 #	You may need to customize this for your system's resource limits
 #	(including startup time!) and administration.  For example, if
@@ -23,10 +21,10 @@ case $(uname -r) in
 esac
 
 # Check for missing binaries
-UDEV_BIN=/sbin/udevd
+UDEV_BIN=/usr/sbin/udevd
 test -x $UDEV_BIN || exit 5
-UDEVSTART_BIN=/sbin/udevstart
-test -x $UDEVSTART_BIN || exit 5
+UDEV_ADM=/usr/sbin/udevadm
+test -x $UDEV_ADM || exit 5
 
 # Check for config file and read it
 UDEV_CONFIG=/etc/udev/udev.conf
@@ -36,16 +34,32 @@ test -r $UDEV_CONFIG || exit 6
 # Directory where sysfs is mounted
 SYSFS_DIR=/sys
 
+# default value for udev_root
+if [ -z "$udev_root" ]
+then
+    udev_root=/dev
+fi
+
+# default value for udev_settle_timeout
+if [ -z "$udev_settle_timeout" ]
+then
+    udev_settle_timeout=60
+fi
+
 case "$1" in
     start)
+        echo "1>>>>>>>>>>>>>>>>>"
+        ps |grep udev
+        echo "1<<<<<<<<<<<<<<<<<"
+
         # mount sysfs if it's not yet mounted
         if [ ! -d $SYSFS_DIR ]; then
 	    echo "${0}: SYSFS_DIR \"$SYSFS_DIR\" not found"
 	    exit 1
         fi
         grep -q "^sysfs $SYSFS_DIR" /proc/mounts ||
-	mount -t sysfs /sys /sys ||
-	exit 1
+	mount -t sysfs $SYSFS_DIR $SYSFS_DIR ||
+        (echo "Failed to mount $SYSFS_DIR" && exit 1)
 
         # mount $udev_root as ramfs if it's not yet mounted
         # we know 2.6 kernels always support ramfs
@@ -54,25 +68,30 @@ case "$1" in
 	    exit 1
         fi
         grep -q "^udev $udev_root" /proc/mounts ||
-	mount -t ramfs udev $udev_root ||
-	exit 1
+            mount -t ramfs udev $udev_root || (echo "Failed to mount $udev_root" && exit 1)
 
         mkdir $udev_root/pts $udev_root/shm
+	mount -t devpts $udev_root/pts $udev_root/pts || (echo "Failed to mount $udev_root/pts" && exit 1)
+
         mknod -m 0666 /dev/null c 1 3
         mknod -m 0666 /dev/zero c 1 5
         mknod -m 0600 /dev/console c 5 1
 
-        # populate /dev (normally)
+        # populate /dev
         echo -n "Populating $udev_root using udev: "
-        echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
+        echo "" >/proc/sys/kernel/hotplug
         $UDEV_BIN -d || (echo "FAIL" && exit 1)
-	$UDEVSTART_BIN || (echo "FAIL" && exit 1)
-	mount -t devpts /dev/pts /dev/pts || (echo "FAIL" && exit 1)
+	$UDEV_ADM control --property=STARTUP=1
+	$UDEV_ADM trigger --action="add"
+	$UDEV_ADM settle --timeout=$udev_settle_timeout
+	$UDEV_ADM control --property=do_not_run_plug_service=
+	$UDEV_ADM control --property=STARTUP=
+
         echo "done"
         ;;
     stop)
         # Stop execution of events
-        udevcontrol stop_exec_queue
+        $UDEV_ADM control --stop_exec_queue
         killall udevd
         ;;
     *)
diff --git a/package/udev/libvolume_id.la.tmpl b/package/udev/libvolume_id.la.tmpl
deleted file mode 100644
index 725628b..0000000
--- a/package/udev/libvolume_id.la.tmpl
+++ /dev/null
@@ -1,35 +0,0 @@
-# libvolume_id.la - a libtool library file
-# Generated by ltmain.sh - GNU libtool 1.5.22 (1.1220.2.365 2005/12/18 22:14:06)
-#
-# Please DO NOT delete this file!
-# It is necessary for linking the library.
-
-# The name that we can dlopen(3).
-dlname='libvolume_id.so.REPLACE_CURRENT'
-
-# Names of this library.
-library_names='libvolume_id.so.REPLACE_CURRENT.REPLACE_AGE.REPLACE_REVISION libvolume_id.so.REPLACE_CURRENT libvolume_id.so'
-
-# The name of the static archive.
-old_library='libvolume_id.a'
-
-# Libraries that this one depends upon.
-dependency_libs=' -lc'
-
-# Version information for libvolume_id.
-current=REPLACE_CURRENT
-age=REPLACE_AGE
-revision=REPLACE_REVISION
-
-# Is this an already installed library?
-installed=yes
-
-# Should we warn about portability when linking against -modules?
-shouldnotlink=no
-
-# Files to dlopen/dlpreopen
-dlopen=''
-dlpreopen=''
-
-# Directory that this library needs to be installed in:
-libdir='REPLACE_LIB_DIR'
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index 4b61ce4..f3bfb66 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -3,30 +3,24 @@
 # udev
 #
 #############################################################
-UDEV_VERSION:=114
-UDEV_VOLUME_ID_CURRENT:=0
-UDEV_VOLUME_ID_AGE:=79
-UDEV_VOLUME_ID_REVISION:=0
-UDEV_VOLUME_ID_VERSION:=$(UDEV_VOLUME_ID_CURRENT).$(UDEV_VOLUME_ID_AGE).$(UDEV_VOLUME_ID_REVISION)
+UDEV_VERSION:=151
+UDEV_LIB_VERSION=0.6.1
 UDEV_SOURCE:=udev-$(UDEV_VERSION).tar.bz2
 UDEV_SITE:=$(BR2_KERNEL_MIRROR)/linux/utils/kernel/hotplug/
-UDEV_INSTALL_STAGING=YES
+UDEV_AUTORECONF = NO
+UDEV_INSTALL_STAGING = YES
 
-# 094 had _GNU_SOURCE set
-BR2_UDEV_CFLAGS:= -D_GNU_SOURCE $(TARGET_CFLAGS)
-ifeq ($(BR2_LARGEFILE),)
-BR2_UDEV_CFLAGS+=-U_FILE_OFFSET_BITS
-endif
+UDEV_INITSCRIPT=S10udev
 
-# UDEV_ROOT is /dev so we can replace devfs, not /udev for experiments
-UDEV_ROOT:=/dev
+#needs at last libacl
+UDEV_CONF_OPT += --disable-extras
+UDEV_CONF_OPT += --disable-introspection
 
 UDEV_EXTRAS=
-ifeq ($(BR2_PACKAGE_UDEV_VOLUME_ID),y)
-UDEV_EXTRAS+=volume_id
-endif
 ifeq ($(BR2_PACKAGE_UDEV_SCSI_ID),y)
 UDEV_EXTRAS+=scsi_id
+endif
+ifeq ($(BR2_PACKAGE_UDEV_USB_ID),y)
 UDEV_EXTRAS+=usb_id
 endif
 ifeq ($(BR2_PACKAGE_UDEV_PATH_ID),y)
@@ -36,99 +30,39 @@ ifeq ($(BR2_PACKAGE_UDEV_FIRMWARE_SH),y)
 UDEV_EXTRAS+=firmware
 endif
 
-UDEV_BUILD_EXTRAS=$(addprefix extras/,$(UDEV_EXTRAS))
-
-#
-# Build
-#
-define UDEV_BUILD_CMDS
-	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) CC="$(TARGET_CC)" LD="$(TARGET_CC)"\
-		CFLAGS="$(BR2_UDEV_CFLAGS)" \
-		USE_LOG=false USE_SELINUX=false \
-		udevdir=$(UDEV_ROOT) EXTRAS="$(UDEV_BUILD_EXTRAS)" -C $(@D)
-endef
-
-#
-# Staging installation
-#
-ifeq ($(BR2_PACKAGE_UDEV_VOLUME_ID),y)
-define UDEV_VOLUME_ID_STAGING_INSTALL_CMDS
-	$(INSTALL) -m 0644 -D $(UDEV_DIR)/extras/volume_id/lib/libvolume_id.h $(STAGING_DIR)/usr/include/libvolume_id.h
-	$(INSTALL) -m 0755 -D $(UDEV_DIR)/extras/volume_id/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION) $(STAGING_DIR)/lib/libvolume_id.so.$(UDEV_VOLUME_ID_VERSION)
-	-ln -sf libvolume_id.so.$(UDEV_VOLUME_ID_VERSION) $(STAGING_DIR)/lib/libvolume_id.so.0
-	-ln -sf libvolume_id.so.$(UDEV_VOLUME_ID_VERSION) $(STAGING_DIR)/lib/libvolume_id.so
-	$(INSTALL) -m 0755 -D package/udev/libvolume_id.la.tmpl $(STAGING_DIR)/lib/libvolume_id.la
-	$(SED) 's/REPLACE_CURRENT/$(UDEV_VOLUME_ID_CURRENT)/g' $(STAGING_DIR)/lib/libvolume_id.la
-	$(SED) 's/REPLACE_AGE/$(UDEV_VOLUME_ID_AGE)/g' $(STAGING_DIR)/lib/libvolume_id.la
-	$(SED) 's/REPLACE_REVISION/$(UDEV_VOLUME_ID_REVISION)/g' $(STAGING_DIR)/lib/libvolume_id.la
-	$(SED) 's,REPLACE_LIB_DIR,$(STAGING_DIR)/usr/lib,g' $(STAGING_DIR)/lib/libvolume_id.la
-endef
-endif
-
-define UDEV_INSTALL_STAGING_CMDS
-$(UDEV_VOLUME_ID_STAGING_INSTALL_CMDS)
-endef
-
-#
-# Target installation
-#
-ifneq ($(BR2_PACKAGE_UDEV_UTILS),y)
-define UDEV_UTILS_REMOVAL
-	rm -f $(TARGET_DIR)/usr/sbin/udevmonitor
-	rm -f $(TARGET_DIR)/usr/bin/udevinfo
-	rm -f $(TARGET_DIR)/usr/bin/udevtest
-endef
-endif
-
 define UDEV_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/sys
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		DESTDIR=$(TARGET_DIR) \
-		CFLAGS="$(BR2_UDEV_CFLAGS)" \
-		LDFLAGS="-warn-common" \
-		USE_LOG=false USE_SELINUX=false \
-		udevdir=$(UDEV_ROOT) EXTRAS="$(UDEV_BUILD_EXTRAS)" -C $(@D) install
-	$(INSTALL) -m 0755 -D package/udev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
+	$(INSTALL) -m 0755 -D package/udev/$(UDEV_INITSCRIPT) $(TARGET_DIR)/etc/init.d/$(UDEV_INITSCRIPT)
+	$(INSTALL) -m 755 $(@D)/udev/udevd $(TARGET_DIR)/usr/sbin/udevd
+	$(INSTALL) -m 755 $(@D)/udev/udevadm $(TARGET_DIR)/usr/sbin/udevadm
+	$(INSTALL) -m 755 $(@D)/libudev/.libs/libudev.so.$(UDEV_LIB_VERSION) $(TARGET_DIR)/usr/lib/libudev.so.$(UDEV_LIB_VERSION)
+	-ln -sf libudev.so.$(UDEV_LIB_VERSION) $(TARGING_DIR)/usr/lib/libudev.so.0.6
+	-ln -sf libudev.so.$(UDEV_LIB_VERSION) $(TARGING_DIR)/usr/lib/libudev.so.0
+	-ln -sf libudev.so.$(UDEV_LIB_VERSION) $(TARGING_DIR)/usr/lib/libudev.so
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/etc/udev
+	$(INSTALL) -m 0644 $(@D)/udev.conf $(TARGET_DIR)/etc/udev/udev.conf
 	$(INSTALL) -m 0755 -d $(TARGET_DIR)/etc/udev/rules.d
-	$(INSTALL) -m 0644 $(@D)/etc/udev/frugalware/* $(TARGET_DIR)/etc/udev/rules.d
-	( grep udev_root $(TARGET_DIR)/etc/udev/udev.conf > /dev/null 2>&1 || echo 'udev_root=/dev' >> $(TARGET_DIR)/etc/udev/udev.conf )
-	install -m 0755 -D $(@D)/udevstart $(TARGET_DIR)/sbin/udevstart
-	for i in $(TARGET_DIR)/sbin/udev* $(TARGET_DIR)/usr/bin/udev* ; do \
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/libexec/rules.d
+	$(INSTALL) -m 0644 $(@D)/rules/rules.d/50-udev-default.rules $(TARGET_DIR)/usr/libexec/rules.d
+	$(INSTALL) -m 0644 $(@D)/rules/rules.d/95-udev-late.rules $(TARGET_DIR)/usr/libexec/rules.d
+
+	for i in $(TARGET_DIR)/usr/sbin/udev* $(TARGET_DIR)/usr/lib/libudev.so.$(UDEV_LIB_VERSION); do \
 		$(STRIPCMD) $(STRIP_STRIP_ALL) $$i ; \
 	done
-	for i in scsi_id usb_id vol_id ; do \
-		if test -e $(TARGET_DIR)/lib/udev/$$i ; then \
-			$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/lib/udev/$$i ; \
-		fi \
-	done
-	$(UDEV_UTILS_REMOVAL)
-endef
-
-#
-# Clean
-#
-define UDEV_CLEAN_CMDS
-	-$(MAKE) EXTRAS="$(UDEV_BUILD_EXTRAS)" -C $(@D) clean
-endef
 
-#
-# Staging uninstall
-#
-define UDEV_UNINSTALL_STAGING_CMDS
-	rm -f $(STAGING_DIR)/usr/include/libvolume_id.h
-	rm -f $(STAGING_DIR)/lib/libvolume_id.so*
-	rm -f $(STAGING_DIR)/lib/libvolume_id.la
+	for i in $(UDEV_EXTRAS) ; do \
+		$(INSTALL) -m 755 $(@D)/extras/$$i/$$i $(TARGET_DIR)/usr/bin/$$i \
+		$(STRIPCMD) $(STRIP_STRIP_ALL)  $(TARGET_DIR)/usr/bin/$$i; \
+	done
+	    
 endef
 
-#
-# Target uninstall
-#
 define UDEV_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/etc/init.d/S10udev $(TARGET_DIR)/sbin/udev*
-	rm -f $(TARGET_DIR)/usr/sbin/udevmonitor $(TARGET_DIR)/usr/bin/udev*
-	rm -fr $(TARGET_DIR)/sys
-	rm -f $(TARGET_DIR)/lib/libvolume_id.so.0*
-	rm -rf $(TARGET_DIR)/lib/udev
+	rm -f  $(TARGET_DIR)/etc/init.d/$(UDEV_INITSCRIPT)
+	rm -rf $(TARGET_DIR)/etc/udev
+	rm -rf $(TARGET_DIR)/usr/libexec/rules.d
+	rm -f  $(TARGET_DIR)/usr/sbin/udevd
+	rm -f  $(TARGET_DIR)/usr/sbin/udevadm
+	rm -f  $(TAGING_DIR)/usr/lib/libudev.so*
 endef
 
-$(eval $(call GENTARGETS,package,udev))
+$(eval $(call AUTOTARGETS,package,udev))
-- 
1.7.3.4
