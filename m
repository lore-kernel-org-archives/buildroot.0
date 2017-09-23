From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 21:59:50 +0200
Subject: [Buildroot] [git commit] mtd-utils: add mtd test tools
Message-ID: <20170923201331.A6F4D81027@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3c66520ee37473dd6467d0253b4db15b2dfe7e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the possibility to choose more test tools than only integck
from the MTD utils test-suite.

Move the hidden BR2_PACKAGE_MTD_TESTS configuration to the bottom
of the page and make it visible. When checked, a new list of available
binaries is displayed and may be selected and compiled into the image
with the --enable-install-tests configure script option:
- flash_torture
- flash_stress
- flash_speed
- nandbiterrs
- flash_readtest
- nandpagetest
- nandsubpagetest

Most of these tests may be performed by inserting kernel modules
which are almost legacy so having the userspace tools available
might become useful.

Legacy handling for users who had BR2_PACKAGE_MTD_INTEGCK selected is
not needed: they also have the BR2_PACKAGE_MTD_TESTS option enabled in
their .config. That option has now become a selectable option so it is
not removed any more by oldconfig.

Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
[Arnout:
 - fix threads and MMU dependency;
 - order Config.in options and mtd.mk lines alphabetically;
 - add note on legacy handling to commit message.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

fixup
---
 package/mtd/Config.in | 49 ++++++++++++++++++++++++++++++++++++-------------
 package/mtd/mtd.mk    | 11 +++++++++--
 2 files changed, 45 insertions(+), 15 deletions(-)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 37e4b4a..590ca7f 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -7,8 +7,8 @@ config BR2_PACKAGE_MTD
 
 if BR2_PACKAGE_MTD
 
-# The three hidden options below match mtd configure script options
-# --enable-jffs, --enable-ubifs and --enable-tests.
+# The two hidden options below match mtd configure script options
+# --enable-jffs and --enable-ubifs
 
 config BR2_PACKAGE_MTD_JFFS_UTILS
 	bool
@@ -22,10 +22,6 @@ config BR2_PACKAGE_MTD_UBIFS_UTILS
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_ZLIB
 
-config BR2_PACKAGE_MTD_TESTS
-	bool
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-
 comment "MTD tools selection"
 
 config BR2_PACKAGE_MTD_DOCFDISK
@@ -173,16 +169,43 @@ config BR2_PACKAGE_MTD_UBIBLOCK
 	bool "ubiblock"
 	default y
 
+config BR2_PACKAGE_MTD_TESTS
+	bool "MTD test tools"
+	depends on BR2_USE_MMU # fork() in fstests
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Build and install tools for testing MTD devices and drivers.
+
+if BR2_PACKAGE_MTD_TESTS
+
+config BR2_PACKAGE_MTD_FLASH_READTEST
+	bool "flash_readtest"
+
+config BR2_PACKAGE_MTD_FLASH_SPEED
+	bool "flash_speed"
+
+config BR2_PACKAGE_MTD_FLASH_STRESS
+	bool "flash_stress"
+
+config BR2_PACKAGE_MTD_FLASH_TORTURE
+	bool "flash_torture"
+
 config BR2_PACKAGE_MTD_INTEGCK
 	bool "integck"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # mtd-tests
-	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_MTD_TESTS
-	help
-	  Install the integck test program.
 
-comment "integck needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+config BR2_PACKAGE_MTD_NANDBITERRS
+	bool "nandbiterrs"
+
+config BR2_PACKAGE_MTD_NANDPAGETEST
+	bool "nandpagetest"
+
+config BR2_PACKAGE_MTD_NANDSUBPAGETEST
+	bool "nandsubpagetest"
+
+endif
+
+comment "MTD test tools need a toolchain w/ threads"
 	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 endif
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index e666bf0..a69ef40 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -26,9 +26,9 @@ MTD_CONF_OPTS += --without-ubifs
 endif
 
 ifeq ($(BR2_PACKAGE_MTD_TESTS),y)
-MTD_CONF_OPTS += --enable-tests
+MTD_CONF_OPTS += --enable-tests --enable-install-tests
 else
-MTD_CONF_OPTS += --disable-tests
+MTD_CONF_OPTS += --disable-tests --disable-install-tests
 endif
 
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
@@ -90,7 +90,14 @@ MTD_TARGETS_$(BR2_PACKAGE_MTD_UBIRSVOL)		+= ubirsvol
 MTD_TARGETS_$(BR2_PACKAGE_MTD_UBIUPDATEVOL)	+= ubiupdatevol
 MTD_TARGETS_$(BR2_PACKAGE_MTD_UBIBLOCK)		+= ubiblock
 MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSUBIFS)	+= mkfs.ubifs
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_READTEST)	+= flash_readtest
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_SPEED)	+= flash_speed
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_STRESS)	+= flash_stress
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_TORTURE)	+= flash_torture
 MTD_TARGETS_$(BR2_PACKAGE_MTD_INTEGCK)		+= integck
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDBITERRS)	+= nandbiterrs
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDPAGETEST)	+= nandpagetest
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDSUBPAGETEST)	+= nandsubpagetest
 
 define MTD_INSTALL_TARGET_CMDS
 	$(foreach f,$(MTD_TARGETS_y), \
