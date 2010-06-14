From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jun 2010 22:33:08 +0200
Subject: [Buildroot] [git commit master 1/1] linux: fix dependency on mkimage
Message-ID: <20100614203444.7E470804D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fa2a311b7756fc458ae55b5aa90ac865cef6c498
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After the rework of the U-Boot configuration/compilation process, we
need to slightly rework how target/linux/Makefile.in.advanced depends
on mkimage on the host to produce an uImage.

target/linux/Makefile.in doesn't need to be fixed as it just doesn't
handle this dependency for the moment.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/linux/Config.in.advanced   |    1 -
 target/linux/Makefile.in.advanced |   10 ++--------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/linux/Config.in.advanced b/target/linux/Config.in.advanced
index d6c8559..645ed2e 100644
--- a/target/linux/Config.in.advanced
+++ b/target/linux/Config.in.advanced
@@ -383,7 +383,6 @@ config BR2_LINUX_BIN_BZIMAGE
 config BR2_LINUX_BIN_UIMAGE
 	bool "uImage"
 	depends on BR2_PACKAGE_LINUX
-	select BR2_TARGET_UBOOT
 
 config BR2_LINUX_BIN_VMLINUX
 	bool "vmlinux"
diff --git a/target/linux/Makefile.in.advanced b/target/linux/Makefile.in.advanced
index 86d94ca..9cbbd2c 100644
--- a/target/linux/Makefile.in.advanced
+++ b/target/linux/Makefile.in.advanced
@@ -123,7 +123,6 @@ endif
 # -----------------------------------------------------------------------------
 # Has to be set by the target/device
 
-LINUX26_MKIMAGE_DIR:=
 LINUX26_MKIMAGE_DEP:=
 
 # --------------
@@ -137,8 +136,7 @@ endif
 # --------------
 # UIMAGE
 ifeq ($(LINUX26_FORMAT),uImage)
-LINUX26_MKIMAGE_DIR:=$(BUILD_DIR)/u-boot-tools
-LINUX26_MKIMAGE_DEP:=$(LINUX26_MKIMAGE_DIR)/mkimage
+LINUX26_MKIMAGE_DEP:=$(MKIMAGE)
 ifeq ($(LINUX26_BINLOC),)
 LINUX26_BINLOC:=arch/$(KERNEL_ARCH)/boot/$(LINUX26_FORMAT)
 endif
@@ -186,7 +184,7 @@ LINUX26_MAKE_FLAGS = HOSTCC="$(HOSTCC)" HOSTCFLAGS="$(HOSTCFLAGS)" \
 	CROSS_COMPILE=$(TARGET_CROSS) \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	LZMA="$(LZMA)" \
-	PATH=$(LINUX26_MKIMAGE_DIR):$(PATH)
+	PATH=$(PATH)
 
 # =============================================================================
 # ifneq ($(strip $(LINUX26_VERSION)),$(strip $(LINUX_HEADERS_VERSION)))
@@ -449,10 +447,6 @@ $(BUILD_DIR)/.linux-version: $(LINUX26_KERNEL)
 	echo $(LINUX26_VERSION_PROBED) > $(BUILD_DIR)/.linux-version
 	echo LINUX_MODULES=`$(LINUX26_VERSION_PROBED)`
 
-$(LINUX26_MKIMAGE_DIR)/mkimage:	$(U_BOOT_TOOLS)
-	mkdir -p $(LINUX26_MKIMAGE_DIR)
-	cp $(MKIMAGE) $(LINUX26_MKIMAGE_DIR)
-
 linux26: $(LINUX26_TARGETS)
 
 linux26-version: $(BUILD_DIR)/.linux-version
-- 
1.7.1
