From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 00:19:17 +0100
Subject: [Buildroot] [git commit master] gcc: remove GCC_OFFICIAL_VERSION
	and just use GCC_VERSION instead
Message-ID: <20091214232055.9A22377796@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=495e5bdca3146a5debfa98a90b7e1a4e9b2e5c09
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gcc/gcc-uclibc-3.x.mk |   17 ++---------------
 toolchain/gcc/gcc-uclibc-4.x.mk |   21 ++++-----------------
 2 files changed, 6 insertions(+), 32 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-3.x.mk b/toolchain/gcc/gcc-uclibc-3.x.mk
index c7ae913..0af3f38 100644
--- a/toolchain/gcc/gcc-uclibc-3.x.mk
+++ b/toolchain/gcc/gcc-uclibc-3.x.mk
@@ -24,28 +24,15 @@ ifneq ($(BR2_TOOLCHAIN_SYSROOT),y)
 
 ifneq ($(GCC_SNAP_DATE),)
  GCC_SITE:=ftp://sources.redhat.com/pub/gcc/snapshots/$(GCC_VERSION)
- GCC_OFFICIAL_VER:=$(GCC_VERSION)-$(GCC_SNAP_DATE)
 else ifeq ($(findstring avr32,$(GCC_VERSION)),avr32)
  GCC_SITE:=ftp://www.at91.com/pub/buildroot/
- GCC_OFFICIAL_VER:=$(GCC_VERSION)
 else
  GCC_SITE:=$(BR2_GNU_MIRROR)/gcc/gcc-$(GCC_VERSION)
- GCC_OFFICIAL_VER:=$(GCC_VERSION)
 endif
 
-GCC_SOURCE:=gcc-$(GCC_OFFICIAL_VER).tar.bz2
-GCC_DIR:=$(TOOLCHAIN_DIR)/gcc-$(GCC_OFFICIAL_VER)
-
-ifeq ($(GCC_SNAP_DATE),)
-GCC_PATCH_DIR:=toolchain/gcc/$(GCC_VERSION)
-else
-ifneq ($(wildcard toolchain/gcc/$(GCC_OFFICIAL_VER)),)
-GCC_PATCH_DIR:=toolchain/gcc/$(GCC_OFFICIAL_VER)
-else
+GCC_SOURCE:=gcc-$(GCC_VERSION).tar.bz2
+GCC_DIR:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)
 GCC_PATCH_DIR:=toolchain/gcc/$(GCC_VERSION)
-endif
-endif
-
 GCC_CAT:=$(BZCAT)
 GCC_STRIP_HOST_BINARIES:=true
 
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index b3ee266..b162b93 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -22,33 +22,20 @@ ifeq ($(BR2_TOOLCHAIN_SYSROOT),y)
 
 ifneq ($(GCC_SNAP_DATE),)
  GCC_SITE:=ftp://sources.redhat.com/pub/gcc/snapshots/$(GCC_VERSION)
- GCC_OFFICIAL_VER:=$(GCC_VERSION)-$(GCC_SNAP_DATE)
 else ifeq ($(findstring avr32,$(GCC_VERSION)),avr32)
  GCC_SITE:=ftp://www.at91.com/pub/buildroot/
- GCC_OFFICIAL_VER:=$(GCC_VERSION)
 else
  GCC_SITE:=$(BR2_GNU_MIRROR)/gcc/gcc-$(GCC_VERSION)
- GCC_OFFICIAL_VER:=$(GCC_VERSION)
 endif
 
-ifeq ($(GCC_SNAP_DATE),) # Not a snapshot
-GCC_PATCH_DIR:=toolchain/gcc/$(GCC_VERSION)
-else # Is a snapshot
-ifneq ($(wildcard toolchain/gcc/$(GCC_OFFICIAL_VERSION)),) # Snapshot patch?
-GCC_PATCH_DIR:=toolchain/gcc/$(GCC_OFFICIAL_VERSION)
-else # Normal patch to snapshot
-# Use the normal location, if the dedicated location does not exist
-GCC_PATCH_DIR:=toolchain/gcc/$(GCC_VERSION)
-endif # Snapshot patch
-endif # Not a snapshot
-
 ifneq ($(filter xtensa%,$(ARCH)),)
 include target/xtensa/patch.in
 GCC_PATCH_EXTRA:=$(call XTENSA_PATCH,gcc,$(GCC_PATCH_DIR),. ..)
 endif
 
-GCC_SOURCE:=gcc-$(GCC_OFFICIAL_VERSION).tar.bz2
-GCC_DIR:=$(TOOLCHAIN_DIR)/gcc-$(GCC_OFFICIAL_VERSION)
+GCC_SOURCE:=gcc-$(GCC_VERSION).tar.bz2
+GCC_PATCH_DIR:=toolchain/gcc/$(GCC_VERSION)
+GCC_DIR:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)
 GCC_CAT:=$(BZCAT)
 GCC_STRIP_HOST_BINARIES:=nope
 GCC_SRC_DIR:=$(GCC_DIR)
@@ -516,7 +503,7 @@ gcc_target-dirclean:
 	rm -rf $(GCC_BUILD_DIR3)
 
 gcc-status:
-	@echo GCC_OFFICIAL_VERSION=$(GCC_OFFICIAL_VERSION)
+	@echo GCC_VERSION=$(GCC_VERSION)
 	@echo GCC_PATCH_DIR=$(GCC_PATCH_DIR)
 	@echo GCC_SITE=$(GCC_SITE)
 
-- 
1.6.3.3
