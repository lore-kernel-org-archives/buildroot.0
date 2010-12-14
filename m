From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Dec 2010 01:35:41 +0100
Subject: [Buildroot] [git commit master 1/1] hotplug: remove package
Message-ID: <20101214003643.5BA8E82927@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=92919160b8a06260463ba3e3a241e433bbe1d947
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package has been marked deprecated, is no longer developed
upstream, so let's get rid of it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                             |    2 +-
 package/Config.in                   |    1 -
 package/hotplug/Config.in           |    7 -----
 package/hotplug/diethotplug-0.5.tar |  Bin 40960 -> 0 bytes
 package/hotplug/hotplug.mk          |   45 -----------------------------------
 5 files changed, 1 insertions(+), 54 deletions(-)
 delete mode 100644 package/hotplug/Config.in
 delete mode 100644 package/hotplug/diethotplug-0.5.tar
 delete mode 100644 package/hotplug/hotplug.mk

diff --git a/CHANGES b/CHANGES
index c4cf18c..51ab28b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -12,7 +12,7 @@
 
 	New packages: dhrystone, fbgrab, lsuio, rsh-redone, whetstone
 
-	Removed packages: libfloat, microcom, ng-spice-rework
+	Removed packages: hotplug, libfloat, microcom, ng-spice-rework
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/Config.in b/package/Config.in
index 0f3eca4..b590867 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -170,7 +170,6 @@ source "package/gvfs/Config.in"
 source "package/hal/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/hdparm/Config.in"
-source "package/hotplug/Config.in"
 endif
 source "package/hwdata/Config.in"
 source "package/i2c-tools/Config.in"
diff --git a/package/hotplug/Config.in b/package/hotplug/Config.in
deleted file mode 100644
index 48f1d71..0000000
--- a/package/hotplug/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_HOTPLUG
-	bool "hotplug"
-	depends on BR2_DEPRECATED
-	help
-	  Plug in new devices and use them immediately.
-
-	  http://linux-hotplug.sourceforge.net/
diff --git a/package/hotplug/diethotplug-0.5.tar b/package/hotplug/diethotplug-0.5.tar
deleted file mode 100644
index 8088670..0000000
Binary files a/package/hotplug/diethotplug-0.5.tar and /dev/null differ
diff --git a/package/hotplug/hotplug.mk b/package/hotplug/hotplug.mk
deleted file mode 100644
index 0b354a8..0000000
--- a/package/hotplug/hotplug.mk
+++ /dev/null
@@ -1,45 +0,0 @@
-#############################################################
-#
-# hotplug support
-#
-#############################################################
-HOTPLUG_VERSION:=0.5
-HOTPLUG_SOURCE=package/hotplug/diethotplug-$(HOTPLUG_VERSION).tar
-HOTPLUG_SITE=$(BR2_KERNEL_MIRROR)/linux/utils/kernel/hotplug/
-HOTPLUG_DIR=$(BUILD_DIR)/diethotplug-$(HOTPLUG_VERSION)
-HOTPLUG_CAT=cat
-
-$(HOTPLUG_DIR): $(HOTPLUG_SOURCE)
-	$(HOTPLUG_CAT) $(HOTPLUG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(HOTPLUG_DIR) package/hotplug/ hotplug\*.patch
-
-$(HOTPLUG_DIR)/hotplug: $(HOTPLUG_DIR)
-	$(MAKE) CROSS=$(TARGET_CROSS) DEBUG=false KLIBC=false \
-	    KERNEL_INCLUDE_DIR=$(STAGING_DIR)/usr/include \
-	    TARGET_DIR=$(TARGET_DIR) -C $(HOTPLUG_DIR)
-	$(STRIPCMD) $(HOTPLUG_DIR)/hotplug
-	touch -c $(HOTPLUG_DIR)/hotplug
-
-$(TARGET_DIR)/sbin/hotplug: $(HOTPLUG_DIR)/hotplug
-	cp $(HOTPLUG_DIR)/hotplug $(TARGET_DIR)/sbin/hotplug
-	touch -c $(TARGET_DIR)/sbin/hotplug
-
-hotplug: $(TARGET_DIR)/sbin/hotplug
-
-hotplug-source: $(HOTPLUG_SOURCE)
-
-hotplug-clean:
-	rm -f $(TARGET_DIR)/sbin/hotplug
-	-$(MAKE) -C $(HOTPLUG_DIR) clean
-
-hotplug-dirclean:
-	rm -rf $(HOTPLUG_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_HOTPLUG),y)
-TARGETS+=hotplug
-endif
-- 
1.7.2.2
