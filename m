From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Sun, 22 Nov 2009 21:51:46 +0100
Subject: [Buildroot] [git commit master] target/jffs2: add support for nand
	flash with 512B page / 16 kB erasesize
Message-ID: <20091122210625.AFE87777EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=07019b2c13ab85e8bc18128ef2772d090f2d18d5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #663

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    8 ++++----
 target/jffs2/Config.in |    7 +++++++
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index ab1df38..421629f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -18,9 +18,8 @@
 	ncurses, netkittelnet, netsnmp, ntfs-3g, openntp, openssl, php,
 	python, quagga, radvd, rsync, samba, sawman, sdl, shared-mime-info,
 	spawn-fcgi, speech-tools, sqlite, squashfs, synergy, syslinux,
-	tcpdump, u-boot, util-linux, valgrind, vsftpd, wipe
-
-	wpa-supplicant, xdata_xcursor-themes, zlib
+	tcpdump, u-boot, util-linux, valgrind, vsftpd, wipe, wpa-supplicant,
+	xdata_xcursor-themes, zlib
 
 	Removed package: mdnsresponder, mpatrol, gcc 3.4.6 + 4.0.4
 
@@ -38,10 +37,11 @@
 	#609: libmicrohttpd: New package
 	#615: python: Don't delete .py files unless asked
 	#617: netkit/inetd requires RPC and fails to build if RPC is disabled
-	#619: netkittelnet requires netkitbase to install, but there's no dependency
+	#619: netkittelnet requires netkitbase to install, but there's no ...
 	#653: [SECURITY] Update php package to version 5.2.11
 	#655: Update sqlite package to version 3.6.18
 	#657: Bug in imagemagick-clean target
+	#663: Add option for NAND flash with 512B Page and 16 kB erasesize ...
 	#665: [PATCH] Samba package
 	#667: [PATCH] e2fsprogs
 	#683: SDL-dfb does not select directfb
diff --git a/target/jffs2/Config.in b/target/jffs2/Config.in
index 16fdcc5..108dfde 100644
--- a/target/jffs2/Config.in
+++ b/target/jffs2/Config.in
@@ -19,6 +19,10 @@ config BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528
 	bool "AT45 dataflash with 528 byte pagesize"
 	select BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER
 
+config BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_512_16K
+	bool "NAND flash with 512B Page and 16 kB erasesize"
+	select BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER
+
 config BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K
 	bool "NAND flash with 2kB Page and 128 kB erasesize"
 	select BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER
@@ -52,6 +56,7 @@ config BR2_TARGET_ROOTFS_JFFS2_PAGESIZE
 	hex
 	default 0x420 if BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056
 	default 0x210 if BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528
+	default 0x200 if BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_512_16K
 	default 0x800 if BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K
 	default 0x1000 if BR2_TARGET_ROOTFS_JFFS2_FLASH_128
 	default 0x1000 if BR2_TARGET_ROOTFS_JFFS2_FLASH_64
@@ -61,6 +66,7 @@ config BR2_TARGET_ROOTFS_JFFS2_EBSIZE
 	hex
 	default 0x2100 if BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056
 	default 0x1080 if BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528
+	default 0x4000 if BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_512_16K
 	default 0x20000 if BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K
 	default 0x20000 if BR2_TARGET_ROOTFS_JFFS2_FLASH_128
 	default 0x10000 if BR2_TARGET_ROOTFS_JFFS2_FLASH_64
@@ -70,6 +76,7 @@ config BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER
 	bool "Do not use Cleanmarker"
 	default y if BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056
 	default y if BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528
+	default y if BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_512_16K
 	default y if BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K
 	help
 	  Do not use cleanmarkers if using NAND flash or Dataflash where
-- 
1.6.3.3
