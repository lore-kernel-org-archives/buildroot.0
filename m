From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon,  8 Feb 2010 16:56:08 +0100
Subject: [Buildroot] [PATCH] toolchain/gdb: get rid of another legacy and
	unused variable
Message-ID: <1265644568-31089-1-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_VENDOR_GDB_VERSION and VENDOR_GDB_VERSION are no longer settable.
The only user is gdb, and it's totally useless in this case.

Signed-off-by: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
---
 Makefile             |    1 -
 toolchain/gdb/gdb.mk |   12 +++++-------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 54a5b7b..177701e 100644
--- a/Makefile
+++ b/Makefile
@@ -265,7 +265,6 @@ VENDOR_SITE:=$(call qstrip,$(BR2_VENDOR_SITE))
 VENDOR_BINUTILS_RELEASE:=$(call qstrip,$(BR2_VENDOR_BINUTILS_RELEASE))
 VENDOR_GCC_RELEASE:=$(call qstrip,$(BR2_VENDOR_GCC_RELEASE))
 VENDOR_UCLIBC_RELEASE:=$(call qstrip,$(BR2_VENDOR_UCLIBC_RELEASE))
-VENDOR_GDB_RELEASE:=$(call qstrip,$(BR2_VENDOR_GDB_RELEASE))
 VENDOR_PATCH_DIR:=$(call qstrip,$(BR2_VENDOR_PATCH_DIR))
 
 BR2_DEPENDS_DIR=$(BUILD_DIR)/buildroot-config
diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
index 02da152..6288959 100644
--- a/toolchain/gdb/gdb.mk
+++ b/toolchain/gdb/gdb.mk
@@ -5,20 +5,18 @@
 ######################################################################
 GDB_VERSION:=$(call qstrip,$(BR2_GDB_VERSION))
 
-GDB_OFFICIAL_VERSION:=$(GDB_VERSION)$(VENDOR_GDB_RELEASE)
-
-GDB_SOURCE:=gdb-$(GDB_OFFICIAL_VERSION).tar.bz2
+GDB_SOURCE:=gdb-$(GDB_VERSION).tar.bz2
 GDB_CAT:=$(BZCAT)
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SOURCE),y)
  GDB_SITE:=$(VENDOR_SITE)
- GDB_PATCH_DIR:=toolchain/gdb/ext_source/$(VENDOR_PATCH_DIR)/$(GDB_OFFICIAL_VERSION)
+ GDB_PATCH_DIR:=toolchain/gdb/ext_source/$(VENDOR_PATCH_DIR)/$(GDB_VERSION)
 else ifeq ($(findstring avr32,$(GDB_VERSION)),avr32)
  GDB_SITE:=ftp://www.at91.com/pub/buildroot/
- GDB_PATCH_DIR:=toolchain/gdb/$(GDB_OFFICIAL_VERSION)
+ GDB_PATCH_DIR:=toolchain/gdb/$(GDB_VERSION)
 else
  GDB_SITE:=$(BR2_GNU_MIRROR)/gdb
- GDB_PATCH_DIR:=toolchain/gdb/$(GDB_OFFICIAL_VERSION)
+ GDB_PATCH_DIR:=toolchain/gdb/$(GDB_VERSION)
 endif
 
 ifneq ($(filter xtensa%,$(ARCH)),)
@@ -26,7 +24,7 @@ include target/xtensa/patch.in
 GDB_PATCH_EXTRA:=$(call XTENSA_PATCH,gdb,$(GDB_PATCH_DIR),. ..)
 endif
 
-GDB_DIR:=$(TOOLCHAIN_DIR)/gdb-$(GDB_OFFICIAL_VERSION)
+GDB_DIR:=$(TOOLCHAIN_DIR)/gdb-$(GDB_VERSION)
 
 $(DL_DIR)/$(GDB_SOURCE):
 	$(call DOWNLOAD,$(GDB_SITE),$(GDB_SOURCE))
-- 
1.6.5
