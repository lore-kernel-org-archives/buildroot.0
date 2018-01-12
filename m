From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 22:45:45 +0100
Subject: [Buildroot] [git commit] uboot-tools: bump to version 2018.01
Message-ID: <20180112215200.63B5583CE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2037b3f3c0e4ceaf70b5654e406e0a1a9332ce5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch 0004-uboot-tools-disable-pylibfdt.patch. The issue addressed by
this patch has been fixed in upstream commit
15b97f5c5e6d88e0560c6928f3acd01c999a494d.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Tested-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0004-uboot-tools-disable-pylibfdt.patch        | 63 ----------------------
 package/uboot-tools/uboot-tools.hash               |  2 +-
 package/uboot-tools/uboot-tools.mk                 |  2 +-
 3 files changed, 2 insertions(+), 65 deletions(-)

diff --git a/package/uboot-tools/0004-uboot-tools-disable-pylibfdt.patch b/package/uboot-tools/0004-uboot-tools-disable-pylibfdt.patch
deleted file mode 100644
index 0c2f54d..0000000
--- a/package/uboot-tools/0004-uboot-tools-disable-pylibfdt.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From d882c99de59316e50bfee7f5fce10fe9062dfa32 Mon Sep 17 00:00:00 2001
-From: Matt Weber <matthew.weber@rockwellcollins.com>
-Date: Wed, 1 Nov 2017 10:57:31 -0500
-Subject: [PATCH] uboot-tools: disable pylibfdt
-
-The current U-Boot build system assumes that if swig is installed on
-the host system, it should build pylibfdt, without checking if other
-dependencies are available. This causes a number of build failures.
-
-This patch fixes that by using concepts from the future upstream fix
-(post 2017.11), which sets up a kconfig variable for pylibfdt and
-conditionally enables the swig wrapper creation (default=n).
-
-Relevant upstream patches under review:
-
- - https://patchwork.ozlabs.org/patch/826742/
- - https://patchwork.ozlabs.org/patch/826752/
-
-Fixes (one of many):
-http://autobuild.buildroot.net/results/f9e13caae9b31c9dcde7d24caecc036324f269cc
-
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- Kconfig        | 5 +++++
- tools/Makefile | 6 +++---
- 2 files changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/Kconfig b/Kconfig
-index bb80ada..99b0258 100644
---- a/Kconfig
-+++ b/Kconfig
-@@ -358,6 +358,11 @@ source "disk/Kconfig"
- 
- source "dts/Kconfig"
- 
-+config PYLIBFDT
-+	bool
-+	help
-+	  Enables the generation of the pylibfdt swig wrapper.
-+
- source "net/Kconfig"
- 
- source "drivers/Kconfig"
-diff --git a/tools/Makefile b/tools/Makefile
-index 77706a9..cb6cb7a 100644
---- a/tools/Makefile
-+++ b/tools/Makefile
-@@ -226,9 +226,9 @@ clean-dirs := lib common
- 
- always := $(hostprogs-y)
- 
--# Build a libfdt Python module if swig is available
--# Use 'sudo apt-get install swig libpython-dev' to enable this
--always += $(if $(shell which swig 2> /dev/null),_libfdt.so)
-+ifneq ($(CONFIG_PYLIBFDT),)
-+always += _libfdt.so
-+endif
- 
- # Generated LCD/video logo
- LOGO_H = $(objtree)/include/bmp_logo.h
--- 
-1.8.3.1
-
diff --git a/package/uboot-tools/uboot-tools.hash b/package/uboot-tools/uboot-tools.hash
index db15efb..9425df3 100644
--- a/package/uboot-tools/uboot-tools.hash
+++ b/package/uboot-tools/uboot-tools.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  6a018fd3caf58f3dcfa23ee989a82bd35df03af71872b9dca8c6d758a0d26c05  u-boot-2017.11.tar.bz2
+sha256  938f597394b33e82e5af8c98bd5ea1a238f61892aabef36384adbf7ca5b52dda  u-boot-2018.01.tar.bz2
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 4c55918..cc57ce8 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_TOOLS_VERSION = 2017.11
+UBOOT_TOOLS_VERSION = 2018.01
 UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPL-2.0+
