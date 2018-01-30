From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Jan 2018 09:47:27 +0100
Subject: [Buildroot] [git commit] package/binutils: remove support for 2.27
Message-ID: <20180130085057.7BD5A88081@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=453d29f1f45736d0156071930a09015def68994a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that binutils 2.30 has been introduced, and we have moved to
2.29.1 as the default version, it is time to drop support for binutils
2.27.

Also use xz-compressed tarball for all official supported version.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                | 8 ++++++++
 package/binutils/Config.in.host | 7 -------
 package/binutils/binutils.hash  | 1 -
 package/binutils/binutils.mk    | 8 --------
 4 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index adcf992f4c..fd8505b167 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2018.02"
 
+config BR2_BINUTILS_VERSION_2_27_X
+	bool "binutils version 2.27 support removed"
+	select BR2_LEGACY
+	help
+	  Support for binutils version 2.27 has been removed. The
+	  current default version (2.29 or later) has been selected
+	  instead.
+
 config BR2_PACKAGE_EEPROG
 	bool "eeprog package removed"
 	select BR2_LEGACY
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index fd8a7fa981..d4ed1e3183 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -7,12 +7,6 @@ choice
 	help
 	  Select the version of binutils you wish to use.
 
-config BR2_BINUTILS_VERSION_2_27_X
-	bool "binutils 2.27"
-	# binutils 2.27 triggers a bug in elf2flt on ARM/noMMU
-	depends on !(BR2_arm && !BR2_USE_MMU)
-	depends on !BR2_arc
-
 config BR2_BINUTILS_VERSION_2_28_X
 	bool "binutils 2.28.1"
 	depends on !BR2_arc
@@ -31,7 +25,6 @@ endchoice
 config BR2_BINUTILS_VERSION
 	string
 	default "arc-2017.09-release"	if BR2_BINUTILS_VERSION_ARC
-	default "2.27"		if BR2_BINUTILS_VERSION_2_27_X
 	default "2.28.1"	if BR2_BINUTILS_VERSION_2_28_X
 	default "2.29.1"	if BR2_BINUTILS_VERSION_2_29_X
 	default "2.30"		if BR2_BINUTILS_VERSION_2_30_X
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index d2ffffe9de..4578a7f56a 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -1,5 +1,4 @@
 # From ftp://gcc.gnu.org/pub/binutils/releases/sha512.sum
-sha512	cf276f84935312361a2ca077e04d0b469d23a3aed979d8ba5d92ea590904ffb2c2e7ed12cc842822bfc402836be86f479660cef3791aa62f3753d8a1a6f564cb  binutils-2.27.tar.bz2
 sha512	dc5b6872ae01c07c12d38f3bb7ead06effc6da3265ac872e2d9c6104304f89f85f2645b029a43f308a7938a7299b1928d385205d0a2245674a621649032a138d  binutils-2.28.1.tar.xz
 sha512  d748d22306477d60d921078804d21943248c23fca0707aac9b016a352c01c75ca69e82624ae37fb0bbd03af3b17088a94f60dfe1a86a7ff82e18ece3c24f0fd0  binutils-2.29.1.tar.xz
 sha512  e747ea20d8d79fcd21b9d9f6695059caa7189d60f19256da398e34b789fea9a133c32b192e9693b5828d27683739b0198431bf8b3e39fb3b04884cf89d9aa839  binutils-2.30.tar.xz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 0f7ff0048a..1bd01ecefc 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -21,15 +21,7 @@ BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
 BINUTILS_FROM_GIT = y
 endif
 BINUTILS_SITE ?= $(BR2_GNU_MIRROR)/binutils
-ifeq ($(BINUTILS_VERSION),2.28.1)
 BINUTILS_SOURCE ?= binutils-$(BINUTILS_VERSION).tar.xz
-else ifeq ($(BINUTILS_VERSION),2.29.1)
-BINUTILS_SOURCE ?= binutils-$(BINUTILS_VERSION).tar.xz
-else ifeq ($(BINUTILS_VERSION),2.30)
-BINUTILS_SOURCE ?= binutils-$(BINUTILS_VERSION).tar.xz
-else
-BINUTILS_SOURCE ?= binutils-$(BINUTILS_VERSION).tar.bz2
-endif
 BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
 BINUTILS_INSTALL_STAGING = YES
 BINUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
