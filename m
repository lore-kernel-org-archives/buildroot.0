From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 10 Apr 2007 20:27:03 +0200
Subject: [Buildroot] BSP patch resend to avoid confusion (slightly different)
Message-ID: <018901c77b9d$dac2a620$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: Ulf Samuelsson
Date: 2007-01-28

Log:
 Here is my suggestion for supporting different BSP's in the same buildroot structure. 
 The rest of the BSP depends on fixing the names of the different
 directory structures and cannot be properly submitted until this is fixed.
 ----------------------------
 Add BR2_HOSTNAME which you set to define your build directory
 It is also written to $(TARGET_DIR)/etc/hostname

 Add BINARIES_DIR directory, 
 where resulting binaries can be stored
 Typically this directory contains a subdirectory for each BSP.
 BINARIES_DIR:=$(TOPDIR)/binaries/$(BR2_HOSTNAME)

 Add TARGET_BUILD_DIR directory, where BSP for different
 boards can be built without destroying results of previous builds.
 Typically each BSP would build in a subdirectory of TARGET_BUILD_DIR
 TARGET_BUILD_DIR:=$(TOPDIR)/target_build_<arch>/$(BR2_HOSTNAME)

 Move TARGET_DIR to $(TARGET_BUILD_DIR)/root to allow each board
 to have their own root directory

 Define a "DATE" of build the root file system, 
 which can be used for various filenames.
 
Modified:
 Config.in
 Makefile
 package/Makefile.in

Changeset
 Config.in
 Makefile
 package/Makefile.in

Signed-off-by: Ulf Samuelsson <ulf@atmel.com>
diff -urN buildroot-0rig/Config.in buildroot/Config.in
--- buildroot-0rig/Config.in 2007-04-05 12:38:31.000000000 +0200
+++ buildroot/Config.in 2007-04-10 19:53:52.000000000 +0200
@@ -6,6 +6,21 @@
  bool
  default y
 
+menu "Board"
+
+config BR2_HOSTNAME
+ string "Hostname"
+ default "uclibc"
+ help
+   The boardname is used to define subdirectories
+   * where the Board Support Packages are built
+     (Linux,Root fs Bootmonitor,Utilities etc.)
+   * where the resulting binaries are stored.
+   Older target may still build in the build_<arch>
+   and store binaries in the top directory.
+
+endmenu
+
 choice
  prompt "Target Architecture"
  default BR2_i386
diff -urN buildroot-0rig/Makefile buildroot/Makefile
--- buildroot-0rig/Makefile 2007-04-05 12:38:31.000000000 +0200
+++ buildroot/Makefile 2007-04-10 20:05:51.000000000 +0200
@@ -26,6 +26,8 @@
 CONFIG_DEFCONFIG = .defconfig
 CONFIG = package/config
 
+DATE=$(shell date +%F)
+
 noconfig_targets := menuconfig config oldconfig randconfig \
  defconfig allyesconfig allnoconfig release tags    \
 
@@ -56,6 +58,8 @@
 else
 TARGETS:=uclibc
 endif
+HOSTNAME:=$(strip $(subst ",, $(BR2_HOSTNAME)))
+
 include toolchain/Makefile.in
 include package/Makefile.in
 
@@ -86,12 +90,16 @@
 TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS))
 TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
 
-world: $(DL_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) $(TARGETS)
+world: $(DL_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
+ $(TARGET_BUILD_DIR) $(BINARIES_DIR) \
+ $(TARGETS)
+
 dirs: $(DL_DIR) $(BUILD_DIR) $(STAGING_DIR)
 
 .PHONY: all world dirs clean dirclean distclean source $(TARGETS) \
  $(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
- $(DL_DIR) $(BUILD_DIR) $(TOOL_BUILD_DIR) $(STAGING_DIR)
+ $(DL_DIR) $(BUILD_DIR) $(TOOL_BUILD_DIR) $(STAGING_DIR) \
+ $(TARGET_BUILD_DIR) $(BINARIES_DIR)
 
 #############################################################
 #
@@ -99,7 +107,8 @@
 # dependencies anywhere else
 #
 #############################################################
-$(DL_DIR) $(BUILD_DIR) $(TOOL_BUILD_DIR):
+$(DL_DIR) $(BUILD_DIR) $(TOOL_BUILD_DIR) \
+$(TARGET_BUILD_DIR) $(BINARIES_DIR):
  @mkdir -p $@
 
 $(STAGING_DIR):
@@ -115,6 +124,8 @@
  if [ -d "$(TARGET_SKELETON)" ] ; then \
   cp -fa $(TARGET_SKELETON)/* $(TARGET_DIR)/; \
  fi;
+ mkdir -p $(TARGET_DIR)/etc
+ echo "$(HOSTNAME)" > $(TARGET_DIR)/etc/hostname
  touch $(STAGING_DIR)/.fakeroot.00000
  -find $(TARGET_DIR) -type d -name CVS | xargs rm -rf
  -find $(TARGET_DIR) -type d -name .svn | xargs rm -rf
diff -urN buildroot-0rig/package/Makefile.in buildroot/package/Makefile.in
--- buildroot-0rig/package/Makefile.in 2007-04-05 12:38:31.000000000 +0200
+++ buildroot/package/Makefile.in 2007-04-09 02:49:19.000000000 +0200
@@ -48,7 +48,9 @@
 endif
 #PATCH_DIR=$(BASE_DIR)/sources/patches
 BUILD_DIR:=$(BASE_DIR)/$(TOPDIR_PREFIX)build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
-TARGET_DIR:=$(BUILD_DIR)/root
+TARGET_BUILD_DIR:=$(BASE_DIR)/$(TOPDIR_PREFIX)target_build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)/$(HOSTNAME)
+BINARIES_DIR:=$(BASE_DIR)/binaries/$(HOSTNAME)
+TARGET_DIR:=$(TARGET_BUILD_DIR)/root
 
 GNU_TARGET_SUFFIX:=-$(strip $(subst ",, $(BR2_GNU_TARGET_SUFFIX)))
 #"))

Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57

Technical support when I am not available:
AT90 AVR Applications Group: mailto:avr at atmel.com
AT91 ARM Applications Group: mailto:at91support at atmel.com
AVR32 Applications Group        mailto:avr32 at atmel.com
http://www.avrfreaks.net/;            http://avr32linux.org/
http://www.at91.com/ ;                ftp://at91dist:distrib at 81.80.104.162/
