From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Dec 2019 22:59:44 +0100
Subject: [Buildroot] [PATCH 05/12] arch/arch.mk.xtensa: fix usage of
 arch-xtensa-overlay-extract
In-Reply-To: <20191210215952.902477-1-thomas.petazzoni@bootlin.com>
References: <20191210215952.902477-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191210215952.902477-6-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

arch-xtensa-overlay-extract was used in gcc, linux, uboot, binutils
and gdb without properly accouting for the package dependencies that
may be needed to extract the overlay tarball.

This commit fixes that by introducing an
ARCH_XTENSA_OVERLAY_EXTRACT_DEPENDENCIES variable in arch.mk.xtensa,
and then use it where appropriate in gcc, linux, uboot, binutils and
gdb.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Note: if this is preferred, we could avoid adding the
ARCH_XTENSA_OVERLAY_EXTRACT_DEPENDENCIES variable, and directly call
extractor-pkg-dependency from each of gcc, linux, uboot, binutils and
gdb. Having an intermediate variable felt a bit simpler/cleaner, but I
wouldn't mind changing it.
---
 arch/arch.mk.xtensa                    | 2 ++
 boot/uboot/uboot.mk                    | 1 +
 linux/linux.mk                         | 1 +
 package/binutils/binutils.mk           | 2 ++
 package/gcc/gcc-final/gcc-final.mk     | 1 +
 package/gcc/gcc-initial/gcc-initial.mk | 1 +
 package/gdb/gdb.mk                     | 2 ++
 7 files changed, 10 insertions(+)

diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
index fd410f6bfa..c0f83c27d2 100644
--- a/arch/arch.mk.xtensa
+++ b/arch/arch.mk.xtensa
@@ -19,6 +19,8 @@ else
 ARCH_XTENSA_OVERLAY_FILE = $(BR_ARCH_XTENSA_OVERLAY_FILE)
 endif
 
+ARCH_XTENSA_OVERLAY_EXTRACT_DEPENDENCIES += $(call extractor-pkg-dependency,$(ARCH_XTENSA_OVERLAY_FILE))
+
 ################################################################################
 # arch-xtensa-overlay-extract -- extract an extensa overlay
 #
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 0ebda6588c..eaf8d4a30a 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -185,6 +185,7 @@ ifneq ($(ARCH_XTENSA_OVERLAY_FILE),)
 define UBOOT_XTENSA_OVERLAY_EXTRACT
 	$(call arch-xtensa-overlay-extract,$(@D),u-boot)
 endef
+UBOOT_EXTRACT_DEPENDENCIES += $(ARCH_XTENSA_OVERLAY_EXTRACT_DEPENDENCIES)
 UBOOT_POST_EXTRACT_HOOKS += UBOOT_XTENSA_OVERLAY_EXTRACT
 UBOOT_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
 endif
diff --git a/linux/linux.mk b/linux/linux.mk
index 762f8868b1..325a15f74c 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -120,6 +120,7 @@ ifneq ($(ARCH_XTENSA_OVERLAY_FILE),)
 define LINUX_XTENSA_OVERLAY_EXTRACT
 	$(call arch-xtensa-overlay-extract,$(@D),linux)
 endef
+LINUX_EXTRACT_DEPENDENCIES += $(ARCH_XTENSA_OVERLAY_EXTRACT_DEPENDENCIES)
 LINUX_POST_EXTRACT_HOOKS += LINUX_XTENSA_OVERLAY_EXTRACT
 LINUX_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
 endif
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index a19d6940f7..0af83e92d0 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -120,8 +120,10 @@ ifneq ($(ARCH_XTENSA_OVERLAY_FILE),)
 define BINUTILS_XTENSA_OVERLAY_EXTRACT
 	$(call arch-xtensa-overlay-extract,$(@D),binutils)
 endef
+BINUTILS_EXTRACT_DEPENDENCIES += $(ARCH_XTENSA_OVERLAY_EXTRACT_DEPENDENCIES)
 BINUTILS_POST_EXTRACT_HOOKS += BINUTILS_XTENSA_OVERLAY_EXTRACT
 BINUTILS_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
+HOST_BINUTILS_EXTRACT_DEPENDENCIES += $(ARCH_XTENSA_OVERLAY_EXTRACT_DEPENDENCIES)
 HOST_BINUTILS_POST_EXTRACT_HOOKS += BINUTILS_XTENSA_OVERLAY_EXTRACT
 HOST_BINUTILS_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
 endif
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 24d034b720..57a7e6d8a2 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -17,6 +17,7 @@ HOST_GCC_FINAL_DEPENDENCIES = \
 HOST_GCC_FINAL_EXCLUDES = $(HOST_GCC_EXCLUDES)
 
 ifneq ($(ARCH_XTENSA_OVERLAY_FILE),)
+HOST_GCC_FINAL_EXTRACT_DEPENDENCIES += $(ARCH_XTENSA_OVERLAY_EXTRACT_DEPENDENCIES)
 HOST_GCC_FINAL_POST_EXTRACT_HOOKS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
 HOST_GCC_FINAL_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
 endif
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index f5bc6c5b77..36460d3712 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -18,6 +18,7 @@ HOST_GCC_INITIAL_DEPENDENCIES = $(HOST_GCC_COMMON_DEPENDENCIES)
 HOST_GCC_INITIAL_EXCLUDES = $(HOST_GCC_EXCLUDES)
 
 ifneq ($(ARCH_XTENSA_OVERLAY_FILE),)
+HOST_GCC_INITIAL_EXTRACT_DEPENDENCIES += $(ARCH_XTENSA_OVERLAY_EXTRACT_DEPENDENCIES)
 HOST_GCC_INITIAL_POST_EXTRACT_HOOKS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
 HOST_GCC_INITIAL_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
 endif
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 46d745a897..b1bfca1535 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -48,8 +48,10 @@ ifneq ($(ARCH_XTENSA_OVERLAY_FILE),)
 define GDB_XTENSA_OVERLAY_EXTRACT
 	$(call arch-xtensa-overlay-extract,$(@D),gdb)
 endef
+GDB_EXTRACT_DEPENDENCIES += $(ARCH_XTENSA_OVERLAY_EXTRACT_DEPENDENCIES)
 GDB_POST_EXTRACT_HOOKS += GDB_XTENSA_OVERLAY_EXTRACT
 GDB_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
+HOST_GDB_EXTRACT_DEPENDENCIES += $(ARCH_XTENSA_OVERLAY_EXTRACT_DEPENDENCIES)
 HOST_GDB_POST_EXTRACT_HOOKS += GDB_XTENSA_OVERLAY_EXTRACT
 HOST_GDB_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
 endif
-- 
2.23.0
