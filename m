From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 00:19:17 +0100
Subject: [Buildroot] [git commit master] gcc: add avr32 special version
Message-ID: <20091214232051.DCA2C77696@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d3f383b1eeafa11b093d7a5626d375d07ed2c3d7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 * Add new gcc version 4.2.2-avr32-2.1.5 in Config.in

 * Select the Atmel mirror to download gcc with avr32 in their version
   name, in gcc-uclibc-*.mk

 * Do not apply patches if the patch directory is empty, in
   gcc-uclibc-*.mk

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gcc/Config.in         |    7 ++++++-
 toolchain/gcc/gcc-uclibc-3.x.mk |   16 ++++++++++------
 toolchain/gcc/gcc-uclibc-4.x.mk |   16 ++++++++++------
 3 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 7e58516..3d3da46 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -26,6 +26,10 @@ choice
 		depends on BR2_DEPRECATED || BR2_avr32
 		bool "gcc 4.2.2"
 
+	config BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
+	       depends on BR2_avr32
+	       bool "gcc 4.2.2-avr32-2.1.5"
+
 	config BR2_GCC_VERSION_4_2_3
 		depends on !BR2_nios2
 		depends on BR2_EXT_GCC_VERSION_4_2_3
@@ -66,7 +70,7 @@ config BR2_GCC_SUPPORTS_SYSROOT
 
 config BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 	bool
-	default y if !BR2_GCC_VERSION_4_1_2 && !BR2_GCC_VERSION_4_2_1 && !BR2_GCC_VERSION_4_2_2 && !BR2_GCC_VERSION_4_2_3 && !BR2_GCC_VERSION_4_2_4
+	default y if !BR2_GCC_VERSION_4_1_2 && !BR2_GCC_VERSION_4_2_1 && !BR2_GCC_VERSION_4_2_2 && !BR2_GCC_VERSION_4_2_3 && !BR2_GCC_VERSION_4_2_4 && !BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
 
 config BR2_GCC_SNAP_DATE
 	string "GCC snapshot date"
@@ -81,6 +85,7 @@ config BR2_GCC_VERSION
 	default "4.1.2"     if BR2_GCC_VERSION_4_1_2
 	default "4.2.1"     if BR2_GCC_VERSION_4_2_1
 	default "4.2.2"     if BR2_GCC_VERSION_4_2_2
+	default "4.2.2-avr32-2.1.5" if BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
 	default "4.2.3"     if BR2_GCC_VERSION_4_2_3
 	default "4.2.4"     if BR2_GCC_VERSION_4_2_4
 	default "4.3.2"     if BR2_GCC_VERSION_4_3_2
diff --git a/toolchain/gcc/gcc-uclibc-3.x.mk b/toolchain/gcc/gcc-uclibc-3.x.mk
index e737313..bc3d423 100644
--- a/toolchain/gcc/gcc-uclibc-3.x.mk
+++ b/toolchain/gcc/gcc-uclibc-3.x.mk
@@ -22,13 +22,15 @@ ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
 # without sysroot support. Sysroot toolchain is gcc-uclibc-4.x.mk
 ifneq ($(BR2_TOOLCHAIN_SYSROOT),y)
 
-ifeq ($(GCC_SNAP_DATE),)
-GCC_OFFICIAL_VER:=$(GCC_VERSION)
-GCC_SITE:=$(BR2_GNU_MIRROR)/gcc/gcc-$(GCC_VERSION)
-#GCC_SITE:=ftp://ftp.ibiblio.org/pub/mirrors/gnu/ftp/gnu/gcc/gcc-$(GCC_OFFICIAL_VER)
+ifneq ($(GCC_SNAP_DATE),)
+ GCC_SITE:=ftp://sources.redhat.com/pub/gcc/snapshots/$(GCC_VERSION)
+ GCC_OFFICIAL_VER:=$(GCC_VERSION)-$(GCC_SNAP_DATE)
+else ifeq ($(findstring avr32,$(GCC_VERSION)),avr32)
+ GCC_SITE:=ftp://www.at91.com/pub/buildroot/
+ GCC_OFFICIAL_VER:=$(GCC_VERSION)
 else
-GCC_OFFICIAL_VER:=$(GCC_VERSION)-$(GCC_SNAP_DATE)
-GCC_SITE:=ftp://sources.redhat.com/pub/gcc/snapshots/$(GCC_OFFICIAL_VER)
+ GCC_SITE:=$(BR2_GNU_MIRROR)/gcc/gcc-$(GCC_VERSION)
+ GCC_OFFICIAL_VER:=$(GCC_VERSION)
 endif
 
 
@@ -142,7 +144,9 @@ $(GCC_DIR)/.unpacked: $(DL_DIR)/$(GCC_SOURCE)
 gcc-patched: $(GCC_DIR)/.patched
 $(GCC_DIR)/.patched: $(GCC_DIR)/.unpacked
 	# Apply any files named gcc-*.patch from the source directory to gcc
+ifneq ($(wildcard $(GCC_PATCH_DIR)),)
 	toolchain/patch-kernel.sh $(GCC_DIR) $(GCC_PATCH_DIR) \*.patch
+endif
 	# Note: The soft float situation has improved considerably with gcc 3.4.x.
 	# We can dispense with the custom spec files, as well as libfloat for the arm case.
 	# However, we still need a patch for arm. There's a similar patch for gcc 3.3.x
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index d5a889f..14afb36 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -20,13 +20,15 @@
 # sysroot support works with gcc >= 4.2.0 only
 ifeq ($(BR2_TOOLCHAIN_SYSROOT),y)
 
-ifeq ($(GCC_SNAP_DATE),)
-GCC_OFFICIAL_VERSION:=$(GCC_VERSION)
-GCC_SITE:=$(BR2_GNU_MIRROR)/gcc/gcc-$(GCC_VERSION)
-#GCC_SITE:=ftp://ftp.ibiblio.org/pub/mirrors/gnu/ftp/gnu/gcc/gcc-$(GCC_OFFICIAL_VERSION)
+ifneq ($(GCC_SNAP_DATE),)
+ GCC_SITE:=ftp://sources.redhat.com/pub/gcc/snapshots/$(GCC_VERSION)
+ GCC_OFFICIAL_VER:=$(GCC_VERSION)-$(GCC_SNAP_DATE)
+else ifeq ($(findstring avr32,$(GCC_VERSION)),avr32)
+ GCC_SITE:=ftp://www.at91.com/pub/buildroot/
+ GCC_OFFICIAL_VER:=$(GCC_VERSION)
 else
-GCC_OFFICIAL_VERSION:=$(GCC_VERSION)-$(GCC_SNAP_DATE)
-GCC_SITE:=ftp://sources.redhat.com/pub/gcc/snapshots/$(GCC_OFFICIAL_VERSION)
+ GCC_SITE:=$(BR2_GNU_MIRROR)/gcc/gcc-$(GCC_VERSION)
+ GCC_OFFICIAL_VER:=$(GCC_VERSION)
 endif
 
 # redefine if using an external prepatched gcc source
@@ -182,7 +184,9 @@ $(GCC_DIR)/.unpacked: $(DL_DIR)/$(GCC_SOURCE)
 gcc-patched: $(GCC_DIR)/.patched
 $(GCC_DIR)/.patched: $(GCC_DIR)/.unpacked
 	# Apply any files named gcc-*.patch from the source directory to gcc
+ifneq ($(wildcard $(GCC_PATCH_DIR)),)
 	toolchain/patch-kernel.sh $(GCC_DIR) $(GCC_PATCH_DIR) \*.patch $(GCC_PATCH_EXTRA)
+endif
 
 	# Note: The soft float situation has improved considerably with gcc 3.4.x.
 	# We can dispense with the custom spec files, as well as libfloat for the arm case.
-- 
1.6.3.3
