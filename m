From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 31 Aug 2011 08:06:52 +0200
Subject: [Buildroot] [PATCH v2 1/2] syslinux: bump version to 4.04 and fix
	build error in 4.04
Message-ID: <1314770813-12307-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/syslinux/syslinux-3.85-makefile.patch |   17 -----------------
 boot/syslinux/syslinux.mk                  |   12 ++++++++++--
 2 files changed, 10 insertions(+), 19 deletions(-)
 delete mode 100644 boot/syslinux/syslinux-3.85-makefile.patch

diff --git a/boot/syslinux/syslinux-3.85-makefile.patch b/boot/syslinux/syslinux-3.85-makefile.patch
deleted file mode 100644
index ff85b8d..0000000
--- a/boot/syslinux/syslinux-3.85-makefile.patch
+++ /dev/null
@@ -1,17 +0,0 @@
----
- Makefile |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: syslinux-3.85/Makefile
-===================================================================
---- syslinux-3.85.orig/Makefile
-+++ syslinux-3.85/Makefile
-@@ -43,7 +43,7 @@
- 	mbr/mbr_c.bin mbr/altmbr_c.bin mbr/gptmbr_c.bin \
- 	mbr/mbr_f.bin mbr/altmbr_f.bin mbr/gptmbr_f.bin \
- 	core/pxelinux.0 core/isolinux.bin core/isolinux-debug.bin \
--	gpxe/gpxelinux.0 dos/syslinux.com win32/syslinux.exe \
-+	gpxe/gpxelinux.0 dos/syslinux.com \
- 	dosutil/*.com dosutil/*.sys \
- 	$(MODULES)
- 
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 686124f..118807a 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -4,15 +4,23 @@
 #
 #############################################################
 
-SYSLINUX_VERSION = 3.85
+SYSLINUX_VERSION = 4.04
 SYSLINUX_SOURCE  = syslinux-$(SYSLINUX_VERSION).tar.bz2
-SYSLINUX_SITE    = $(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux/3.xx/
+SYSLINUX_SITE    = $(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux/4.xx/
 
 SYSLINUX_INSTALL_TARGET = NO
 SYSLINUX_INSTALL_IMAGES = YES
 
 SYSLINUX_DEPENDENCIES = host-nasm
 
+# syslinux-4.04 comes with a bundled mk-lba-img executable which
+# may not work in our host environment.
+define SYSLINUX_RM_MK_LBA_IMG
+	$(RM) $(@D)/diag/geodsp/mk-lba-img
+endef
+
+SYSLINUX_POST_EXTRACT_HOOKS += SYSLINUX_RM_MK_LBA_IMG
+
 define SYSLINUX_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) CC="$(HOSTCC)" AR="$(HOSTAR)" -C $(@D)
 endef
-- 
1.7.5.4
