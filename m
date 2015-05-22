From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 May 2015 11:36:00 +0200
Subject: [Buildroot] [git commit] fs/jffs2: Fix mkfs.jffs2 --pagesize
	parameter usage
Message-ID: <20150522093654.2C0C281E26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e3904a890de2a74c290675fdb90324a6ed83e633
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes #8186

Mkfs.jffs2 accepts a --pagesize parameter, which allows specifying the size
of the virtual memory page size of the target machine, where the image will
be used.  (This is the value of the PAGE_SIZE macro in Linux.) In most cases
the parameter doesn't need to be set as the default value of 4 kB is usually
correct.

The parameter was used incorrectly in Buildroot -- it was set to the page
size of flash memory chip -- this commit fixes this problem.  Now the
--pagesize parameter is not used at all (unless the user explicitly chooses
to use a custom value during configuration).  All existing defconfigs were
corrected to match the new configuration variable names.

[Peter: reword, add Config.in.legacy handling]
Signed-off-by: Micha?? Le??niewski <mlesniew@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                |   16 +++++++++++
 configs/mini2440_defconfig      |    2 +-
 configs/openblocks_a6_defconfig |    2 +-
 configs/sheevaplug_defconfig    |    2 +-
 fs/jffs2/Config.in              |   57 ++++++++++++++++++++-------------------
 fs/jffs2/jffs2.mk               |    5 +++-
 6 files changed, 52 insertions(+), 32 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 46247f2..44de941 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,22 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.05"
 
+config BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_512_16K
+	bool "jffs2 16kB erasesize NAND flash option renamed"
+	select BR2_LEGACY
+	select BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_16K
+	help
+	  The JFFS2 NAND flash options now longer include the page
+	  size.
+
+config BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K
+	bool "jffs2 128kB erasesize NAND flash option renamed"
+	select BR2_LEGACY
+	select BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_128K
+	help
+	  The JFFS2 NAND flash options now longer include the page
+	  size.
+
 config BR2_PACKAGE_MONO_20
 	bool "2.0/3.5 .Net Runtime"
 	select BR2_LEGACY
diff --git a/configs/mini2440_defconfig b/configs/mini2440_defconfig
index d7d9ab1..e8b55cd 100644
--- a/configs/mini2440_defconfig
+++ b/configs/mini2440_defconfig
@@ -8,7 +8,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttySAC0"
 
 # Filesystem
 BR2_TARGET_ROOTFS_JFFS2=y
-BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K=y
+BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_128K=y
 BR2_TARGET_ROOTFS_JFFS2_PAGESIZE=0x800
 BR2_TARGET_ROOTFS_JFFS2_EBSIZE=0x20000
 BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
diff --git a/configs/openblocks_a6_defconfig b/configs/openblocks_a6_defconfig
index d9994f2..5147785 100644
--- a/configs/openblocks_a6_defconfig
+++ b/configs/openblocks_a6_defconfig
@@ -9,7 +9,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 
 # filesystem
 BR2_TARGET_ROOTFS_JFFS2=y
-BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K=y
+BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_128K=y
 
 # Lock to 3.18 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
diff --git a/configs/sheevaplug_defconfig b/configs/sheevaplug_defconfig
index 5422f67..9e272ff 100644
--- a/configs/sheevaplug_defconfig
+++ b/configs/sheevaplug_defconfig
@@ -8,7 +8,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 
 # filesystem
 BR2_TARGET_ROOTFS_JFFS2=y
-BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K=y
+BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_128K=y
 
 # Lock down headers to avoid breaking with new defaults
 BR2_KERNEL_HEADERS_VERSION=y
diff --git a/fs/jffs2/Config.in b/fs/jffs2/Config.in
index e2a3ee9..1010216 100644
--- a/fs/jffs2/Config.in
+++ b/fs/jffs2/Config.in
@@ -17,32 +17,25 @@ config BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528
 	bool "AT45 dataflash with 528 byte pagesize"
 	select BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER
 
-config BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_512_16K
-	bool "NAND flash with 512B Page and 16 kB erasesize"
+config BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_16K
+	bool "NAND flash with 16 kB erasesize"
 	select BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER
 
-config BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K
-	bool "NAND flash with 2kB Page and 128 kB erasesize"
+config BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_128K
+	bool "NAND flash with 128 kB erasesize"
 	select BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER
 
 config BR2_TARGET_ROOTFS_JFFS2_FLASH_128
-	bool "Parallel flash with 4 kB pagesize and 128 kB erase size"
+	bool "Parallel flash with 128 kB erase size"
 
 config BR2_TARGET_ROOTFS_JFFS2_FLASH_64
-	bool "Parallel flash with 4 kB pagesize and 64 kB erase size"
+	bool "Parallel flash with 64 kB erase size"
 
 config BR2_TARGET_ROOTFS_JFFS2_CUSTOM
-	bool "Select custom page and erase size"
+	bool "Select custom erase size"
 
 endchoice
 
-config BR2_TARGET_ROOTFS_JFFS2_CUSTOM_PAGESIZE
-	hex "Page Size"
-	depends on BR2_TARGET_ROOTFS_JFFS2_CUSTOM
-	default 0x1000
-	help
-	  Set to pagesize of memory
-
 config BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE
 	hex "Erase block size"
 	depends on BR2_TARGET_ROOTFS_JFFS2_CUSTOM
@@ -50,22 +43,12 @@ config BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE
 	help
 	  Set to erase size of memory
 
-config BR2_TARGET_ROOTFS_JFFS2_PAGESIZE
-	hex
-	default 0x420 if BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056
-	default 0x210 if BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528
-	default 0x200 if BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_512_16K
-	default 0x800 if BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K
-	default 0x1000 if BR2_TARGET_ROOTFS_JFFS2_FLASH_128
-	default 0x1000 if BR2_TARGET_ROOTFS_JFFS2_FLASH_64
-	default BR2_TARGET_ROOTFS_JFFS2_CUSTOM_PAGESIZE if BR2_TARGET_ROOTFS_JFFS2_CUSTOM
-
 config BR2_TARGET_ROOTFS_JFFS2_EBSIZE
 	hex
 	default 0x2100 if BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056
 	default 0x1080 if BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528
-	default 0x4000 if BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_512_16K
-	default 0x20000 if BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K
+	default 0x4000 if BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_16K
+	default 0x20000 if BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_128K
 	default 0x20000 if BR2_TARGET_ROOTFS_JFFS2_FLASH_128
 	default 0x10000 if BR2_TARGET_ROOTFS_JFFS2_FLASH_64
 	default BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE if BR2_TARGET_ROOTFS_JFFS2_CUSTOM
@@ -74,8 +57,8 @@ config BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER
 	bool "Do not use Cleanmarker"
 	default y if BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056
 	default y if BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528
-	default y if BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_512_16K
-	default y if BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K
+	default y if BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_16K
+	default y if BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_128K
 	help
 	  Do not use cleanmarkers if using NAND flash or Dataflash where
 	  the pagesize is not a power of 2
@@ -108,4 +91,22 @@ config BR2_TARGET_ROOTFS_JFFS2_SUMMARY
 	  A summarised image can be mounted faster if support is
 	  enabled in the kernel (CONFIG_JFFS2_SUMMARY)
 
+config BR2_TARGET_ROOTFS_JFFS2_USE_CUSTOM_PAGESIZE
+	bool "Select custom virtual memory page size"
+	help
+	  Use a custom virtual memory page size.  Note that this is not related to
+	  the flash memory page size.  Using this option is only needed if Linux is
+	  configured to use a page size different than 4kB.
+
+
+config BR2_TARGET_ROOTFS_JFFS2_CUSTOM_PAGESIZE
+	hex "Virtual memory page size"
+	depends on BR2_TARGET_ROOTFS_JFFS2_USE_CUSTOM_PAGESIZE
+	default 0x1000
+	help
+	  Set to virtual memory page size of target system (in bytes).  This value
+	  should match the virtual page size in Linux (i.e. this should have the
+	  same value as the value of the PAGE_SIZE macro in Linux).  It is not
+	  related to the flash memory page size.
+
 endif
diff --git a/fs/jffs2/jffs2.mk b/fs/jffs2/jffs2.mk
index 0232199..a9cd414 100644
--- a/fs/jffs2/jffs2.mk
+++ b/fs/jffs2/jffs2.mk
@@ -26,7 +26,10 @@ JFFS2_OPTS += -b
 SUMTOOL_OPTS += -b
 endif
 
-JFFS2_OPTS += -s $(BR2_TARGET_ROOTFS_JFFS2_PAGESIZE)
+ifeq ($(BR2_TARGET_ROOTFS_JFFS2_USE_CUSTOM_PAGESIZE),y)
+JFFS2_OPTS += -s $(BR2_TARGET_ROOTFS_JFFS2_CUSTOM_PAGESIZE)
+endif
+
 ifeq ($(BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER),y)
 JFFS2_OPTS += -n
 SUMTOOL_OPTS += -n
