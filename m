From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Jun 2018 16:12:42 +0200
Subject: [Buildroot] [PATCH] uboot: don't override HOSTCC/HOSTLDFLAGS for
 kconfig
Message-ID: <20180624141242.16851-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So the host ncurses includes and library are used instead of a mix of both,
causing corrupted characters.  Similar to the linux fix in commit
6d3d09e23213e8 (linux: don't override HOSTCC for kconfig), except that we
pass the linker flags in HOSTLDFLAGS.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/uboot.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 03bd7ea743..6ef275e842 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -211,7 +211,15 @@ endif # BR2_TARGET_UBOOT_USE_DEFCONFIG
 
 UBOOT_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES))
 UBOOT_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
-UBOOT_KCONFIG_OPTS = $(UBOOT_MAKE_OPTS)
+
+# UBOOT_MAKE_OPTS overrides HOSTCC / HOSTLDFLAGS to allow the build to
+# find our host-openssl. However, this triggers a bug in the kconfig
+# build script that causes it to build with /usr/include/ncurses.h
+# (which is typically wchar) but link with
+# $(HOST_DIR)/lib/libncurses.so (which is not).  We don't actually
+# need any host-package for kconfig, so remove the HOSTCC/HOSTLDFLAGS
+# override again.
+UBOOT_KCONFIG_OPTS = $(UBOOT_MAKE_OPTS) HOSTCC="$(HOSTCC)" HOSTLDFLAGS=""
 define UBOOT_HELP_CMDS
 	@echo '  uboot-menuconfig       - Run U-Boot menuconfig'
 	@echo '  uboot-savedefconfig    - Run U-Boot savedefconfig'
-- 
2.11.0
