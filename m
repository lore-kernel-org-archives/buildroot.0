From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed,  7 Nov 2012 00:41:48 +0100
Subject: [Buildroot] [PATCH] cpio/initramfs: clarify their use in the help
	text
Message-ID: <1352245308-10348-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Recent mails on the list show that it is not very clear how to create
an initial RAM fs with buildroot.  So make this more explicit in the
cpio and initramfs help texts.  Hopefully this will reduce the /init
debugging we have to do.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Is this a documentation patch that should be picked up by Samuel, or
is it for Peter?

 fs/cpio/Config.in      |   11 ++++++++---
 fs/initramfs/Config.in |    2 +-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
index 374cfe0..0669a44 100644
--- a/fs/cpio/Config.in
+++ b/fs/cpio/Config.in
@@ -1,14 +1,19 @@
 config BR2_TARGET_ROOTFS_CPIO
-	bool "cpio the root filesystem"
+	bool "cpio the root filesystem (for use as an initial RAM filesystem)"
 	help
-	  Build a cpio archive of the root filesystem
+	  Build a cpio archive of the root filesystem.  This is typically
+	  used for an initial RAM filesystem that is passed to the kernel
+	  by the bootloader.
 
 choice
         prompt "Compression method"
         default BR2_TARGET_ROOTFS_CPIO_NONE
         depends on BR2_TARGET_ROOTFS_CPIO
         help
-          Select compressor for cpio filesystem of the root filesystem
+          Select compressor for cpio filesystem of the root filesystem.
+          If you use the cpio archive as an initial RAM filesystem, make
+          sure the kernel contains the decompression algorithm selected
+          here.
 
 config BR2_TARGET_ROOTFS_CPIO_NONE
         bool "no compression"
diff --git a/fs/initramfs/Config.in b/fs/initramfs/Config.in
index bbc2ab0..22066ee 100644
--- a/fs/initramfs/Config.in
+++ b/fs/initramfs/Config.in
@@ -1,5 +1,5 @@
 config BR2_TARGET_ROOTFS_INITRAMFS
-	bool "initramfs for initial ramdisk of linux kernel"
+	bool "initial RAM filesystem linked into linux kernel"
 	depends on BR2_LINUX_KERNEL
 	select BR2_TARGET_ROOTFS_CPIO
 	help
-- 
tg: (5a63922..) t/cpio-clarify-help (depends on: master)
