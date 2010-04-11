From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Apr 2010 21:10:35 +0200
Subject: [Buildroot] [git commit master] Remove BR2_PREFER_IMA
Message-ID: <20100411195032.11CD120B81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7a0263525fe723c2f4bb2d4e78eaf785137ebbdd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This option is barely used, no-one is maintaining it or extending
it. So let's remove it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                      |   11 -----------
 package/busybox/busybox.mk     |    8 --------
 package/busybox/initramfs.mk   |    8 --------
 package/microcom/microcom.mk   |    7 -------
 package/setserial/setserial.mk |    4 ----
 toolchain/gcc/Makefile.in      |    4 ----
 6 files changed, 0 insertions(+), 42 deletions(-)

diff --git a/Config.in b/Config.in
index 224a44a..b82a11b 100644
--- a/Config.in
+++ b/Config.in
@@ -136,17 +136,6 @@ config BR2_JLEVEL
 	help
 	  Number of jobs to run simultaneously
 
-config BR2_PREFER_IMA
-	bool "prefer IMA compiles"
-	help
-	  Where possible, compile package with Inter Module Analysis.
-	  This potentially uses alot of system resources on your compile
-	  host with the benefit of creating smaller binaries for the target.
-
-	  If unsure, say No.
-
-	  WARNING: This is highly experimental at the moment.
-
 config BR2_DEPRECATED
 	bool "Show packages that are deprecated or obsolete"
 	help
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index cc2097e..c93f33a 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -107,14 +107,6 @@ $(BUSYBOX_DIR)/busybox: $(BUSYBOX_DIR)/.config
 		CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
 		ARCH=$(KERNEL_ARCH) \
 		EXTRA_CFLAGS="$(BUSYBOX_CFLAGS)" -C $(BUSYBOX_DIR)
-ifeq ($(BR2_PREFER_IMA)$(BR2_PACKAGE_BUSYBOX_SNAPSHOT),yy)
-	rm -f $@
-	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
-		CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
-		ARCH=$(KERNEL_ARCH) STRIP="$(STRIPCMD)" \
-		EXTRA_CFLAGS="$(BUSYBOX_CFLAGS)" -C $(BUSYBOX_DIR) \
-		-f scripts/Makefile.IMA
-endif
 
 $(TARGET_DIR)/bin/busybox: $(BUSYBOX_DIR)/busybox
 ifeq ($(BR2_PACKAGE_BUSYBOX_FULLINSTALL),y)
diff --git a/package/busybox/initramfs.mk b/package/busybox/initramfs.mk
index 394f483..2f1e34c 100644
--- a/package/busybox/initramfs.mk
+++ b/package/busybox/initramfs.mk
@@ -86,14 +86,6 @@ $(BUSYBOX_INITRAMFS_DIR)/busybox: $(BUSYBOX_INITRAMFS_DIR)/.configured
 		ARCH=$(KERNEL_ARCH) \
 		EXTRA_CFLAGS="$(TARGET_CFLAGS)" -C $(BUSYBOX_INITRAMFS_DIR) \
 		busybox.links busybox
-ifeq ($(BR2_PREFER_IMA)$(BR2_PACKAGE_BUSYBOX_SNAPSHOT),yy)
-	rm -f $@
-	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
-		CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
-		ARCH=$(KERNEL_ARCH) STRIP="$(STRIPCMD)" \
-		EXTRA_CFLAGS="$(TARGET_CFLAGS)" -C $(BUSYBOX_INITRAMFS_DIR) \
-		-f scripts/Makefile.IMA
-endif
 
 $(BR2_INITRAMFS_DIR)/bin/busybox: $(BUSYBOX_INITRAMFS_DIR)/busybox
 	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
diff --git a/package/microcom/microcom.mk b/package/microcom/microcom.mk
index d171be9..f691723 100644
--- a/package/microcom/microcom.mk
+++ b/package/microcom/microcom.mk
@@ -46,14 +46,7 @@ $(MICROCOM_DIR)/.configured: $(MICROCOM_DIR)/.unpacked
 	touch $@
 
 $(MICROCOM_DIR)/microcom: $(MICROCOM_DIR)/.configured
-ifeq ($(BR2_PREFER_IMA),y)
-	(cd $(MICROCOM_DIR); \
-	 $(TARGET_CC) $(TARGET_CFLAGS) $(CFLAGS_COMBINE) \
-	 	$(CFLAGS_WHOLE_PROGRAM) -o $@ $(wildcard $(MICROCOM_DIR)/*.c); \
-	)
-else
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(MICROCOM_DIR)
-endif
 	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
 
 $(TARGET_DIR)/usr/bin/microcom: $(MICROCOM_DIR)/microcom
diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index a1d5ab7..9667637 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -36,10 +36,6 @@ endif
 	touch $(SETSERIAL_DIR)/gorhack.h
 	touch $@
 
-ifeq ($(BR2_PREFER_IMA),y)
-SETSERIAL_CFLAGS=$(CFLAGS_COMBINE) $(CFLAGS_WHOLE_PROGRAM)
-endif
-
 $(SETSERIAL_DIR)/.configured: $(SETSERIAL_DIR)/.unpacked
 	(cd $(SETSERIAL_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
diff --git a/toolchain/gcc/Makefile.in b/toolchain/gcc/Makefile.in
index c3e21cf..23b5c73 100644
--- a/toolchain/gcc/Makefile.in
+++ b/toolchain/gcc/Makefile.in
@@ -74,9 +74,5 @@ endif
 # and finally pull in config opts from the user
 EXTRA_TARGET_GCC_CONFIG_OPTIONS+=$(call qstrip,$(BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS))
 
-ifeq ($(BR2_PREFER_IMA),y)
-EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--enable-intermodule
-endif # BR2_PREFER_IMA=y
-
 TARGETS+=gcc_target
 endif
-- 
1.6.3.3
