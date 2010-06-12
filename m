From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Jun 2010 16:22:04 +0200
Subject: [Buildroot] [PATCH 30/49] syslinux: bump version and fix build
In-Reply-To: <cover.1276352307.git.thomas.petazzoni@free-electrons.com>
References: <cover.1276352307.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e69ae0bce5dc988b3e15d2525eebcfa440fa5915.1276352309.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/syslinux/syslinux-3.82-makefile.patch |   11 ----------
 boot/syslinux/syslinux-3.85-makefile.patch |   17 +++++++++++++++
 boot/syslinux/syslinux.mk                  |   30 +++++++++++++++------------
 3 files changed, 34 insertions(+), 24 deletions(-)
 delete mode 100644 boot/syslinux/syslinux-3.82-makefile.patch
 create mode 100644 boot/syslinux/syslinux-3.85-makefile.patch

diff --git a/boot/syslinux/syslinux-3.82-makefile.patch b/boot/syslinux/syslinux-3.82-makefile.patch
deleted file mode 100644
index 9e98a78..0000000
--- a/boot/syslinux/syslinux-3.82-makefile.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- syslinux-3.82-org/Makefile	2009-09-17 13:11:23.000000000 +0200
-+++ syslinux-3.82/Makefile	2009-09-17 13:13:32.000000000 +0200
-@@ -42,7 +42,7 @@
- 	mbr/mbr_c.bin mbr/altmbr_c.bin mbr/gptmbr_c.bin \
- 	mbr/mbr_f.bin mbr/altmbr_f.bin mbr/gptmbr_f.bin \
- 	core/pxelinux.0 core/isolinux.bin core/isolinux-debug.bin \
--	gpxe/gpxelinux.0 dos/syslinux.com win32/syslinux.exe \
-+	gpxe/gpxelinux.0 dos/syslinux.com \
- 	$(MODULES)
- 
- # BSUBDIRs build the on-target binary components.
diff --git a/boot/syslinux/syslinux-3.85-makefile.patch b/boot/syslinux/syslinux-3.85-makefile.patch
new file mode 100644
index 0000000..ff85b8d
--- /dev/null
+++ b/boot/syslinux/syslinux-3.85-makefile.patch
@@ -0,0 +1,17 @@
+---
+ Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: syslinux-3.85/Makefile
+===================================================================
+--- syslinux-3.85.orig/Makefile
++++ syslinux-3.85/Makefile
+@@ -43,7 +43,7 @@
+ 	mbr/mbr_c.bin mbr/altmbr_c.bin mbr/gptmbr_c.bin \
+ 	mbr/mbr_f.bin mbr/altmbr_f.bin mbr/gptmbr_f.bin \
+ 	core/pxelinux.0 core/isolinux.bin core/isolinux-debug.bin \
+-	gpxe/gpxelinux.0 dos/syslinux.com win32/syslinux.exe \
++	gpxe/gpxelinux.0 dos/syslinux.com \
+ 	dosutil/*.com dosutil/*.sys \
+ 	$(MODULES)
+ 
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index df27b6d..46b41f2 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -22,34 +22,38 @@ ifeq ($(SYSLINUX_SUPPORTED_ARCH),y)
 #
 #############################################################
 
-SYSLINUX_VERSION:=3.82
+SYSLINUX_VERSION:=3.85
 SYSLINUX_DIR=$(BUILD_DIR)/syslinux-$(SYSLINUX_VERSION)
-SYSLINUX_DIR2=$(TOOLCHAIN_DIR)/syslinux-$(SYSLINUX_VERSION)
 SYSLINUX_SOURCE=syslinux-$(SYSLINUX_VERSION).tar.bz2
 SYSLINUX_CAT:=$(BZCAT)
-SYSLINUX_SITE=$(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux/
-SYSLINUX_BIN=$(SYSLINUX_DIR2)/mtools/syslinux
-
+SYSLINUX_SITE=$(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux/3.xx/
 
 $(DL_DIR)/$(SYSLINUX_SOURCE):
 	 $(call DOWNLOAD,$(SYSLINUX_SITE),$(SYSLINUX_SOURCE))
 
 syslinux-source: $(DL_DIR)/$(SYSLINUX_SOURCE)
 
-$(SYSLINUX_DIR)/Makefile: $(DL_DIR)/$(SYSLINUX_SOURCE) $(SYSLINUX_PATCH)
-	$(SYSLINUX_CAT) $(DL_DIR)/$(SYSLINUX_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(SYSLINUX_DIR) boot/syslinux/ \*.patch
+$(SYSLINUX_DIR)/.unpacked: $(DL_DIR)/$(SYSLINUX_SOURCE) $(SYSLINUX_PATCH)
+	mkdir -p $(@D)
+	$(SYSLINUX_CAT) $(DL_DIR)/$(SYSLINUX_SOURCE) | tar $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(@D) boot/syslinux/ \*.patch
 	touch -c $@
 
-$(SYSLINUX_DIR)/isolinux.bin $(SYSLINUX_DIR)/pxelinux.bin: $(SYSLINUX_DIR)/Makefile
-	$(MAKE) CC="$(HOSTCC)" AR="$(HOSTAR)" -C $(SYSLINUX_DIR)
+$(SYSLINUX_DIR)/.compiled: $(SYSLINUX_DIR)/.unpacked
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(HOSTCC)" AR="$(HOSTAR)" -C $(SYSLINUX_DIR)
 	touch -c $@
 
-syslinux: $(SYSLINUX_DIR)/isolinux.bin
-pxelinux: $(SYSLINUX_DIR)/pxelinux.bin
+$(BINARIES_DIR)/isolinux.bin: $(SYSLINUX_DIR)/.compiled
+	cp -a $(SYSLINUX_DIR)/core/isolinux.bin $@
+
+$(BINARIES_DIR)/pxelinux.bin: $(SYSLINUX_DIR)/.compiled
+	cp -a $(SYSLINUX_DIR)/core/pxelinux.bin $@
+
+syslinux: $(BINARIES_DIR)/isolinux.bin
+pxelinux: $(BINARIES_DIR)/pxelinux.bin
 
 pxelinux-clean syslinux-clean:
-	rm -f $(SYSLINUX_DIR)/isolinux.bin $(SYSLINUX_DIR)/pxelinux.bin
+	rm -f $(BINARIES_DIR)/isolinux.bin $(BINARIES_DIR)/pxelinux.bin
 	-$(MAKE) -C $(SYSLINUX_DIR) clean
 
 pxelinux-dirclean syslinux-dirclean:
-- 
1.7.0.4
