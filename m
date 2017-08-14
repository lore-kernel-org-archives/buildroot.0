From: Miquel Raynal <miquel.raynal@free-electrons.com>
Date: Mon, 14 Aug 2017 22:21:50 +0200
Subject: [Buildroot] [PATCH] mtd-utils: add mtd test tools
Message-ID: <20170814202150.24413-1-miquel.raynal@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---
 package/mtd/Config.in | 43 +++++++++++++++++++++++++++++++++++--------
 package/mtd/mtd.mk    | 11 +++++++++--
 2 files changed, 44 insertions(+), 10 deletions(-)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index a1df4cfc0..290fdd350 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -7,8 +7,10 @@ config BR2_PACKAGE_MTD
 
 if BR2_PACKAGE_MTD
 
-# The three hidden options below match mtd configure script options
-# --enable-jffs, --enable-ubifs and --enable-tests.
+# The two hidden options below match mtd configure script options
+# --enable-jffs and --enable-ubifs
+# At the bottom of the page, there is another option to enable
+# tests tools that match the configure script option --enable-tests.
 
 config BR2_PACKAGE_MTD_JFFS_UTILS
 	bool
@@ -22,9 +24,6 @@ config BR2_PACKAGE_MTD_UBIFS_UTILS
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_ZLIB
 
-config BR2_PACKAGE_MTD_TESTS
-	bool
-
 comment "MTD tools selection"
 
 config BR2_PACKAGE_MTD_DOCFDISK
@@ -172,11 +171,39 @@ config BR2_PACKAGE_MTD_UBIBLOCK
 	bool "ubiblock"
 	default y
 
+config BR2_PACKAGE_MTD_TESTS
+	bool "MTD test tools"
+	default n
+	help
+	  Build and install test tools usually not shipped
+
+if BR2_PACKAGE_MTD_TESTS
+
 config BR2_PACKAGE_MTD_INTEGCK
 	bool "integck"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_MTD_TESTS
-	help
-	  Install the integck test program.
+
+config BR2_PACKAGE_MTD_FLASH_TORTURE
+	bool "flash_torture"
+
+config BR2_PACKAGE_MTD_FLASH_STRESS
+	bool "flash_stress"
+
+config BR2_PACKAGE_MTD_FLASH_SPEED
+	bool "flash_speed"
+
+config BR2_PACKAGE_MTD_NANDBITERRS
+	bool "nandbiterrs"
+
+config BR2_PACKAGE_MTD_FLASH_READTEST
+	bool "flash_readtest"
+
+config BR2_PACKAGE_MTD_NANDPAGETEST
+	bool "nandpagetest"
+
+config BR2_PACKAGE_MTD_NANDSUBPAGETEST
+	bool "nandsubpagetest"
+
+endif
 
 endif
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 3bac2d559..c80144bbe 100644
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
@@ -91,6 +91,13 @@ MTD_TARGETS_$(BR2_PACKAGE_MTD_UBIUPDATEVOL)	+= ubiupdatevol
 MTD_TARGETS_$(BR2_PACKAGE_MTD_UBIBLOCK)		+= ubiblock
 MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSUBIFS)	+= mkfs.ubifs
 MTD_TARGETS_$(BR2_PACKAGE_MTD_INTEGCK)		+= integck
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_TORTURE)	+= flash_torture
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_STRESS)	+= flash_stress
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_SPEED)	+= flash_speed
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDBITERRS)	+= nandbiterrs
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FLASH_READTEST)	+= flash_readtest
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDPAGETEST)	+= nandpagetest
+MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDSUBPAGETEST)	+= nandsubpagetest
 
 define MTD_INSTALL_TARGET_CMDS
 	$(foreach f,$(MTD_TARGETS_y), \
-- 
2.11.0
