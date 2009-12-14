From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 00:04:36 +0100
Subject: [Buildroot] [PATCH 04/23] gdb: add avr32 special verson
In-Reply-To: <cover.1260831891.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260831891.git.thomas.petazzoni@free-electrons.com>
Message-ID: <9f21bfee0877be5ec1e3fe3a8cb98fa7de539827.1260831891.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 * Add a new gdb version for AVR32 in Config.in

 * Use a special mirror for this gdb version in gdb.mk

 * Do not try to apply patches when the patch directory does not exist
   in gdb.mk

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gdb/Config.in |    7 ++++++-
 toolchain/gdb/gdb.mk    |   13 +++++++++----
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index e193fb9..947cd11 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -20,7 +20,7 @@ config BR2_PACKAGE_GDB_HOST
 choice
 	prompt "GDB debugger Version"
 	default BR2_GDB_VERSION_6_8 if !BR2_avr32
-	default BR2_GDB_VERSION_6_7_1 if BR2_avr32
+	default BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 if BR2_avr32
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_GDB_SERVER || BR2_PACKAGE_GDB_HOST
 	help
 	  Select the version of gdb you wish to use.
@@ -43,6 +43,10 @@ choice
 	config BR2_GDB_VERSION_6_7_1
 		bool "gdb 6.7.1"
 
+	config BR2_GDB_VERSION_6_7_1_AVR32_2_1_5
+		depends on BR2_avr32
+		bool "gdb 6.7.1-avr32-2.1.5"
+
 	config BR2_GDB_VERSION_6_8
 		bool "gdb 6.8"
 		depends on !BR2_avr32
@@ -55,4 +59,5 @@ config BR2_GDB_VERSION
 	default "6.5"      if BR2_GDB_VERSION_6_5
 	default "6.6"      if BR2_GDB_VERSION_6_6
 	default "6.7.1"    if BR2_GDB_VERSION_6_7_1
+	default "6.7.1-avr32-2.1.5" if BR2_GDB_VERSION_6_7_1_AVR32_2_1_5
 	default "6.8"      if BR2_GDB_VERSION_6_8
diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
index 4c72a21..bdefd09 100644
--- a/toolchain/gdb/gdb.mk
+++ b/toolchain/gdb/gdb.mk
@@ -11,11 +11,14 @@ GDB_SOURCE:=gdb-$(GDB_OFFICIAL_VERSION).tar.bz2
 GDB_CAT:=$(BZCAT)
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SOURCE),y)
-GDB_SITE:=$(VENDOR_SITE)
-GDB_PATCH_DIR:=toolchain/gdb/ext_source/$(VENDOR_PATCH_DIR)/$(GDB_OFFICIAL_VERSION)
+ GDB_SITE:=$(VENDOR_SITE)
+ GDB_PATCH_DIR:=toolchain/gdb/ext_source/$(VENDOR_PATCH_DIR)/$(GDB_OFFICIAL_VERSION)
+else ifeq ($(findstring avr32,$(GDB_VERSION)),avr32)
+ GDB_SITE:=ftp://www.at91.com/pub/buildroot/
+ GDB_PATCH_DIR:=toolchain/gdb/$(GDB_OFFICIAL_VERSION)
 else
-GDB_SITE:=$(BR2_GNU_MIRROR)/gdb
-GDB_PATCH_DIR:=toolchain/gdb/$(GDB_OFFICIAL_VERSION)
+ GDB_SITE:=$(BR2_GNU_MIRROR)/gdb
+ GDB_PATCH_DIR:=toolchain/gdb/$(GDB_OFFICIAL_VERSION)
 endif
 
 ifneq ($(filter xtensa%,$(ARCH)),)
@@ -37,7 +40,9 @@ ifeq ($(GDB_VERSION),snapshot)
 		tar jtf $(DL_DIR)/$(GDB_SOURCE) | head -1 | cut -d"/" -f1)
 	ln -sf $(TOOLCHAIN_DIR)/$(shell tar jtf $(DL_DIR)/$(GDB_SOURCE) | head -1 | cut -d"/" -f1) $(GDB_DIR)
 endif
+ifneq ($(wildcard $(GDB_PATCH_DIR)),)
 	toolchain/patch-kernel.sh $(GDB_DIR) $(GDB_PATCH_DIR) \*.patch $(GDB_PATCH_EXTRA)
+endif
 	$(CONFIG_UPDATE) $(@D)
 	touch $@
 
-- 
1.6.3.3
