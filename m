From: Kuldeep Singh Dhaka <kuldeepdhaka9@gmail.com>
Date: Fri, 20 Jul 2018 16:28:36 +0530
Subject: [Buildroot] [PATCH] Artik5 Example: Minimal SD Card boot
Message-ID: <20180720105836.1910-1-kuldeep@madresistor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Kuldeep Singh Dhaka <kuldeep@madresistor.com>
---
 DEVELOPERS                                    |   5 +
 board/artik520/genimage.cfg                   |  56 ++++
 ...ing-able-to-find-skinny-extents-duri.patch |  88 ++++++
 ...-mali-Fix-out-of-tree-compile-errors.patch | 278 ++++++++++++++++++
 board/artik520/post-image.sh                  |  33 +++
 ...0001-fix-single-sdfuse-flash-command.patch |  17 ++
 configs/artik520_sdboot_defconfig             |  28 ++
 package/Config.in                             |   1 +
 package/artik520-boot-firmware/Config.in      |   6 +
 .../artik520-boot-firmware.hash               |   2 +
 .../artik520-boot-firmware.mk                 |  16 +
 11 files changed, 530 insertions(+)
 create mode 100644 board/artik520/genimage.cfg
 create mode 100644 board/artik520/linux/0001-Btrfs-fix-not-being-able-to-find-skinny-extents-duri.patch
 create mode 100644 board/artik520/linux/0002-mali-Fix-out-of-tree-compile-errors.patch
 create mode 100755 board/artik520/post-image.sh
 create mode 100644 board/artik520/u-boot/0001-fix-single-sdfuse-flash-command.patch
 create mode 100644 configs/artik520_sdboot_defconfig
 create mode 100644 package/artik520-boot-firmware/Config.in
 create mode 100644 package/artik520-boot-firmware/artik520-boot-firmware.hash
 create mode 100644 package/artik520-boot-firmware/artik520-boot-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index eaf64ede61..ac356835d2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1111,6 +1111,11 @@ F:	package/libgphoto2/
 N:	Koen Martens <gmc@sonologic.nl>
 F:	package/linuxconsoletools/
 
+N:	Kuldeep Singh Dhaka <kuldeep@madresistor.com>
+F:	board/artik520/
+F:	configs/artik520_sdboot_defconfig
+F:	package/artik520-boot-firmware/
+
 N:	Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
 F:	package/bcusdk/
 F:	package/libpthsem/
diff --git a/board/artik520/genimage.cfg b/board/artik520/genimage.cfg
new file mode 100644
index 0000000000..5923c122e3
--- /dev/null
+++ b/board/artik520/genimage.cfg
@@ -0,0 +1,56 @@
+image boot.vfat {
+  vfat {
+    files = {
+      "exynos3250-artik5.dtb",
+      "zImage"
+    }
+  }
+  size = 30M
+}
+
+image sdcard.img {
+
+  hdimage {
+  }
+
+  partition bl1 {
+    in-partition-table = "no"
+    image = "bl1.bin"
+    offset = 0x200 # 512 = 1 * 512
+  }
+
+  partition bl2 {
+    in-partition-table = "no"
+    image = "espresso3250-spl.bin"
+    offset = 0x3E00 # 15872 = 31 * 512
+  }
+
+  partition u-boot {
+    in-partition-table = "no"
+    image = "u-boot.bin"
+    offset = 0x7E00 # 32256 = 63 * 512
+  }
+
+  partition tzsw {
+    in-partition-table = "no"
+    image = "tzsw.bin"
+    offset = 0x107E00 # 1080832 = 2111 * 512
+  }
+
+  partition u-boot-env {
+    in-partition-table = "no"
+    image = "u-boot-env.bin"
+    offset = 0x207E00 # 2129408 = 4159 * 512
+  }
+
+  partition boot {
+    partition-type = 0xC
+    bootable = "true"
+    image = "boot.vfat"
+  }
+
+  partition root {
+    partition-type = 0x83
+    image = "rootfs.ext2"
+  }
+}
diff --git a/board/artik520/linux/0001-Btrfs-fix-not-being-able-to-find-skinny-extents-duri.patch b/board/artik520/linux/0001-Btrfs-fix-not-being-able-to-find-skinny-extents-duri.patch
new file mode 100644
index 0000000000..f5c5dcf05b
--- /dev/null
+++ b/board/artik520/linux/0001-Btrfs-fix-not-being-able-to-find-skinny-extents-duri.patch
@@ -0,0 +1,88 @@
+From aee68ee5f5427b91be5b23459993134ca64ecf00 Mon Sep 17 00:00:00 2001
+From: Josef Bacik <jbacik@fusionio.com>
+Date: Thu, 13 Jun 2013 13:50:23 -0400
+Subject: [PATCH] Btrfs: fix not being able to find skinny extents during
+ relocate
+
+We unconditionally search for the EXTENT_ITEM_KEY for metadata during balance,
+and then check the key that we found to see if it is actually a
+METADATA_ITEM_KEY, but this doesn't work right because METADATA is a higher key
+value, so if what we are looking for happens to be the first item in the leaf
+the search will dump us out at the previous leaf, and we won't find our item.
+So instead do what we do everywhere else, search for the skinny extent first and
+if we don't find it go back and re-search for the extent item.  This patch fixes
+the panic I was hitting when balancing a large file system with skinny extents.
+Thanks,
+
+Signed-off-by: Josef Bacik <jbacik@fusionio.com>
+
+Upstream-Status: Backport
+Signed-off-by: Florin Sarbu <florin@resin.io>
+---
+ fs/btrfs/relocation.c | 35 +++++++++++++++++++++++++++--------
+ 1 file changed, 27 insertions(+), 8 deletions(-)
+
+diff --git a/fs/btrfs/relocation.c b/fs/btrfs/relocation.c
+index 4a404b4..d91f106 100644
+--- a/fs/btrfs/relocation.c
++++ b/fs/btrfs/relocation.c
+@@ -3309,6 +3309,8 @@ static int __add_tree_block(struct reloc_control *rc,
+ 	struct btrfs_path *path;
+ 	struct btrfs_key key;
+ 	int ret;
++	bool skinny = btrfs_fs_incompat(rc->extent_root->fs_info,
++					SKINNY_METADATA);
+ 
+ 	if (tree_block_processed(bytenr, blocksize, rc))
+ 		return 0;
+@@ -3319,10 +3321,15 @@ static int __add_tree_block(struct reloc_control *rc,
+ 	path = btrfs_alloc_path();
+ 	if (!path)
+ 		return -ENOMEM;
+-
++again:
+ 	key.objectid = bytenr;
+-	key.type = BTRFS_EXTENT_ITEM_KEY;
+-	key.offset = blocksize;
++	if (skinny) {
++		key.type = BTRFS_METADATA_ITEM_KEY;
++		key.offset = (u64)-1;
++	} else {
++		key.type = BTRFS_EXTENT_ITEM_KEY;
++		key.offset = blocksize;
++	}
+ 
+ 	path->search_commit_root = 1;
+ 	path->skip_locking = 1;
+@@ -3330,11 +3337,23 @@ static int __add_tree_block(struct reloc_control *rc,
+ 	if (ret < 0)
+ 		goto out;
+ 
+-	btrfs_item_key_to_cpu(path->nodes[0], &key, path->slots[0]);
+-	if (ret > 0) {
+-		if (key.objectid == bytenr &&
+-		    key.type == BTRFS_METADATA_ITEM_KEY)
+-			ret = 0;
++	if (ret > 0 && skinny) {
++		if (path->slots[0]) {
++			path->slots[0]--;
++			btrfs_item_key_to_cpu(path->nodes[0], &key,
++					      path->slots[0]);
++			if (key.objectid == bytenr &&
++			    (key.type == BTRFS_METADATA_ITEM_KEY ||
++			     (key.type == BTRFS_EXTENT_ITEM_KEY &&
++			      key.offset == blocksize)))
++				ret = 0;
++		}
++
++		if (ret) {
++			skinny = false;
++			btrfs_release_path(path);
++			goto again;
++		}
+ 	}
+ 	BUG_ON(ret);
+ 
+-- 
+2.5.5
+
diff --git a/board/artik520/linux/0002-mali-Fix-out-of-tree-compile-errors.patch b/board/artik520/linux/0002-mali-Fix-out-of-tree-compile-errors.patch
new file mode 100644
index 0000000000..5430d52919
--- /dev/null
+++ b/board/artik520/linux/0002-mali-Fix-out-of-tree-compile-errors.patch
@@ -0,0 +1,278 @@
+From 257a95903a9d6941d836c3afdc45d4f62022eec0 Mon Sep 17 00:00:00 2001
+From: Florin Sarbu <florin@resin.io>
+Date: Mon, 26 Jun 2017 13:09:42 +0200
+Subject: [PATCH] mali: Fix out of tree compile errors
+
+When we build the kernel in a directory outside the sources directory,
+we get these errors for the mali drivers:
+
+"Profiling is incompatible with non-GPL license.  Stop."
+
+This patch corrects these out of source tree compile errors by supplying
+the expected path.
+
+Upstream-Status: Pending
+
+Signed-off-by: Florin Sarbu <florin@resin.io>
+---
+ drivers/gpu/arm/mali400/mali/Kbuild      | 34 ++++++++++++++++----------------
+ drivers/gpu/arm/mali400/r4p0_rel0/Kbuild | 34 ++++++++++++++++----------------
+ drivers/gpu/arm/mali400/ump/Kbuild       | 14 ++++++-------
+ 3 files changed, 41 insertions(+), 41 deletions(-)
+
+diff --git a/drivers/gpu/arm/mali400/mali/Kbuild b/drivers/gpu/arm/mali400/mali/Kbuild
+index 39e97f3..a7bf295 100644
+--- a/drivers/gpu/arm/mali400/mali/Kbuild
++++ b/drivers/gpu/arm/mali400/mali/Kbuild
+@@ -25,8 +25,8 @@ MALI_ENABLE_CPU_CYCLES ?= 0
+ # For customer releases the Linux Device Drivers will be provided as ARM proprietary and GPL releases:
+ # The ARM proprietary product will only include the license/proprietary directory
+ # The GPL product will only include the license/gpl directory
+-ifeq ($(wildcard $(src)/linux/license/gpl/*),)
+-    ccflags-y += -I$(src)/linux/license/proprietary
++ifeq ($(wildcard $(srctree)/$(src)/linux/license/gpl/*),)
++    ccflags-y += -I$(srctree)/$(src)/linux/license/proprietary
+     ifeq ($(CONFIG_MALI400_PROFILING),y)
+         $(error Profiling is incompatible with non-GPL license)
+     endif
+@@ -38,7 +38,7 @@ ifeq ($(wildcard $(src)/linux/license/gpl/*),)
+     endif
+     $(error Linux Device integration is incompatible with non-GPL license)
+ else
+-    ccflags-y += -I$(src)/linux/license/gpl
++    ccflags-y += -I$(srctree)/$(src)/linux/license/gpl
+ endif
+ 
+ ifeq ($(USING_GPU_UTILIZATION), 1)
+@@ -53,7 +53,7 @@ endif
+ 
+ ifeq ($(MALI_PLATFORM_FILES),)
+ EXTRA_DEFINES += -DMALI_FAKE_PLATFORM_DEVICE=1
+-export MALI_PLATFORM_FILES_BUILDIN = $(notdir $(wildcard $(src)/platform/$(MALI_PLATFORM)/*.c))
++export MALI_PLATFORM_FILES_BUILDIN = $(notdir $(wildcard $(srctree)/$(src)/platform/$(MALI_PLATFORM)/*.c))
+ export MALI_PLATFORM_FILES_ADD_PREFIX = $(addprefix platform/$(MALI_PLATFORM)/,$(MALI_PLATFORM_FILES_BUILDIN)) 
+ endif
+ 
+@@ -135,7 +135,7 @@ mali-y += \
+ 	linux/mali_pmu_power_up_down.o \
+ 	__malidrv_build_info.o
+ 
+-ifneq ($(wildcard $(src)/linux/mali_slp_global_lock.c),)
++ifneq ($(wildcard $(srctree)/$(src)/linux/mali_slp_global_lock.c),)
+ 	mali-y += linux/mali_slp_global_lock.o
+ endif
+ 
+@@ -151,7 +151,7 @@ mali-$(CONFIG_MALI400_PROFILING) += linux/mali_ukk_profiling.o
+ mali-$(CONFIG_MALI400_PROFILING) += linux/mali_osk_profiling.o
+ 
+ mali-$(CONFIG_MALI400_INTERNAL_PROFILING) += linux/mali_profiling_internal.o timestamp-$(TIMESTAMP)/mali_timestamp.o
+-ccflags-$(CONFIG_MALI400_INTERNAL_PROFILING) += -I$(src)/timestamp-$(TIMESTAMP)
++ccflags-$(CONFIG_MALI400_INTERNAL_PROFILING) += -I$(srctree)/$(src)/timestamp-$(TIMESTAMP)
+ 
+ mali-$(CONFIG_DMA_SHARED_BUFFER) += linux/mali_memory_dma_buf.o
+ mali-$(CONFIG_DMA_SHARED_BUFFER) += linux/mali_memory_secure.o
+@@ -183,19 +183,19 @@ endif
+ 
+ #build-in include path is different
+ ifeq ($(MALI_PLATFORM_FILES),)
+-ccflags-$(CONFIG_MALI400_UMP) += -I$(src)/../ump/include/
++ccflags-$(CONFIG_MALI400_UMP) += -I$(srctree)/$(src)/../ump/include/
+ else
+-ccflags-$(CONFIG_MALI400_UMP) += -I$(src)/../../ump/include/ump
++ccflags-$(CONFIG_MALI400_UMP) += -I$(srctree)/$(src)/../../ump/include/ump
+ endif
+ ccflags-$(CONFIG_MALI400_DEBUG) += -DDEBUG
+ 
+ # Use our defines when compiling
+-ccflags-y += -I$(src) -I$(src)/include -I$(src)/common -I$(src)/linux -I$(src)/platform -Wno-date-time
++ccflags-y += -I$(srctree)/$(src) -I$(srctree)/$(src)/include -I$(srctree)/$(src)/common -I$(srctree)/$(src)/linux -I$(srctree)/$(src)/platform -Wno-date-time
+ 
+ # Get subversion revision number, fall back to only ${MALI_RELEASE_NAME} if no svn info is available
+-MALI_RELEASE_NAME=$(shell cat $(src)/.version 2> /dev/null)
++MALI_RELEASE_NAME=$(shell cat $(srctree)/$(src)/.version 2> /dev/null)
+ 
+-SVN_INFO = (cd $(src); svn info 2>/dev/null)
++SVN_INFO = (cd $(srctree)/$(src); svn info 2>/dev/null)
+ 
+ ifneq ($(shell $(SVN_INFO) 2>/dev/null),)
+ # SVN detected
+@@ -206,13 +206,13 @@ CHANGED_REVISION := $(shell $(SVN_INFO) | grep '^Last Changed Rev: ' | cut -d: -
+ REPO_URL := $(shell $(SVN_INFO) | grep '^URL: ' | cut -d: -f2- | cut -b2-)
+ 
+ else # SVN
+-GIT_REV := $(shell cd $(src); git describe --always 2>/dev/null)
++GIT_REV := $(shell cd $(srctree)/$(src); git describe --always 2>/dev/null)
+ ifneq ($(GIT_REV),)
+ # Git detected
+ DRIVER_REV := $(MALI_RELEASE_NAME)-$(GIT_REV)
+-CHANGE_DATE := $(shell cd $(src); git log -1 --format="%ci")
++CHANGE_DATE := $(shell cd $(srctree)/$(src); git log -1 --format="%ci")
+ CHANGED_REVISION := $(GIT_REV)
+-REPO_URL := $(shell cd $(src); git describe --all --always 2>/dev/null)
++REPO_URL := $(shell cd $(srctree)/$(src); git describe --all --always 2>/dev/null)
+ 
+ else # Git
+ # No Git or SVN detected
+@@ -225,7 +225,7 @@ endif
+ ccflags-y += -DSVN_REV_STRING=\"$(DRIVER_REV)\"
+ 
+ VERSION_STRINGS :=
+-VERSION_STRINGS += API_VERSION=$(shell cd $(src); grep "\#define _MALI_API_VERSION" $(FILES_PREFIX)include/linux/mali/mali_utgard_uk_types.h | cut -d' ' -f 3 )
++VERSION_STRINGS += API_VERSION=$(shell cd $(srctree)/$(src); grep "\#define _MALI_API_VERSION" $(FILES_PREFIX)include/linux/mali/mali_utgard_uk_types.h | cut -d' ' -f 3 )
+ VERSION_STRINGS += REPO_URL=$(REPO_URL)
+ VERSION_STRINGS += REVISION=$(DRIVER_REV)
+ VERSION_STRINGS += CHANGED_REVISION=$(CHANGED_REVISION)
+@@ -249,5 +249,5 @@ VERSION_STRINGS += USING_DMA_BUF_FENCE = $(CONFIG_MALI_DMA_BUF_FENCE)
+ VERSION_STRINGS += MALI_UPPER_HALF_SCHEDULING=$(MALI_UPPER_HALF_SCHEDULING)
+ 
+ # Create file with Mali driver configuration
+-$(src)/__malidrv_build_info.c:
+-	@echo 'const char *__malidrv_build_info(void) { return "malidrv: $(VERSION_STRINGS)";}' > $(src)/__malidrv_build_info.c
++$(srctree)/$(src)/__malidrv_build_info.c:
++	@echo 'const char *__malidrv_build_info(void) { return "malidrv: $(VERSION_STRINGS)";}' > $(srctree)/$(src)/__malidrv_build_info.c
+diff --git a/drivers/gpu/arm/mali400/r4p0_rel0/Kbuild b/drivers/gpu/arm/mali400/r4p0_rel0/Kbuild
+index 4628b4b..f093695 100644
+--- a/drivers/gpu/arm/mali400/r4p0_rel0/Kbuild
++++ b/drivers/gpu/arm/mali400/r4p0_rel0/Kbuild
+@@ -41,17 +41,17 @@ ifeq ($(CONFIG_SOC_EXYNOS3250),y)
+ 	TARGET_PLATFORM=exynos3250
+ endif
+ 
+-include $(src)/MALI_CONFIGURATION
++include $(srctree)/$(src)/MALI_CONFIGURATION
+ MALI_PLATFORM = $(MALI_PLATFORM-$(TARGET_PLATFORM))
+ EXTRA_DEFINES += -DMALI_FAKE_PLATFORM_DEVICE=1
+-MALI_PLATFORM_FILES = $(subst $(src)/,,$(wildcard $(src)/platform/$(MALI_PLATFORM)/*.c))
++MALI_PLATFORM_FILES = $(subst $(srctree)/$(src)/,,$(wildcard $(srctree)/$(src)/platform/$(MALI_PLATFORM)/*.c))
+ # End of MALI_SEC
+ 
+ # For customer releases the Linux Device Drivers will be provided as ARM proprietary and GPL releases:
+ # The ARM proprietary product will only include the license/proprietary directory
+ # The GPL product will only include the license/gpl directory
+-ifeq ($(wildcard $(src)/linux/license/gpl/*),)
+-    ccflags-y += -I$(src)/linux/license/proprietary
++ifeq ($(wildcard $(srctree)/$(src)/linux/license/gpl/*),)
++    ccflags-y += -I$(srctree)/$(src)/linux/license/proprietary
+     ifeq ($(CONFIG_MALI400_PROFILING),y)
+         $(error Profiling is incompatible with non-GPL license)
+     endif
+@@ -63,7 +63,7 @@ ifeq ($(wildcard $(src)/linux/license/gpl/*),)
+     endif
+     $(error Linux Device integration is incompatible with non-GPL license)
+ else
+-    ccflags-y += -I$(src)/linux/license/gpl
++    ccflags-y += -I$(srctree)/$(src)/linux/license/gpl
+ endif
+ 
+ mali-y += \
+@@ -141,7 +141,7 @@ mali-$(CONFIG_MALI400_PROFILING) += linux/mali_ukk_profiling.o
+ mali-$(CONFIG_MALI400_PROFILING) += linux/mali_osk_profiling.o
+ 
+ mali-$(CONFIG_MALI400_INTERNAL_PROFILING) += linux/mali_profiling_internal.o timestamp-$(TIMESTAMP)/mali_timestamp.o
+-ccflags-$(CONFIG_MALI400_INTERNAL_PROFILING) += -I$(src)/timestamp-$(TIMESTAMP)
++ccflags-$(CONFIG_MALI400_INTERNAL_PROFILING) += -I$(srctree)/$(src)/timestamp-$(TIMESTAMP)
+ 
+ mali-$(CONFIG_DMA_SHARED_BUFFER) += linux/mali_memory_dma_buf.o
+ mali-$(CONFIG_SYNC) += linux/mali_sync.o
+@@ -171,18 +171,18 @@ ifeq ($(MALI_UPPER_HALF_SCHEDULING),1)
+ 	ccflags-y += -DMALI_UPPER_HALF_SCHEDULING
+ endif
+ 
+-ccflags-$(CONFIG_MALI400_UMP) += -I$(src)/../../ump/include/ump
++ccflags-$(CONFIG_MALI400_UMP) += -I$(srctree)/$(src)/../../ump/include/ump
+ ccflags-$(CONFIG_MALI400_DEBUG) += -DDEBUG
+ 
+ # Use our defines when compiling
+-ccflags-y += -I$(src) -I$(src)/include -I$(src)/common -I$(src)/linux -I$(src)/platform
++ccflags-y += -I$(srctree)/$(src) -I$(srctree)/$(src)/include -I$(srctree)/$(src)/common -I$(srctree)/$(src)/linux -I$(srctree)/$(src)/platform
+ # MALI_SEC 
+-ccflags-y += -I$(src)/../ump/include -I$(src)/include/linux/mali -I$(src)/platform/$(MALI_PLATFORM)
++ccflags-y += -I$(srctree)/$(src)/../ump/include -I$(srctree)/$(src)/include/linux/mali -I$(srctree)/$(src)/platform/$(MALI_PLATFORM)
+ 
+ # Get subversion revision number, fall back to only ${MALI_RELEASE_NAME} if no svn info is available
+-MALI_RELEASE_NAME=$(shell cat $(src)/.version 2> /dev/null)
++MALI_RELEASE_NAME=$(shell cat $(srctree)/$(src)/.version 2> /dev/null)
+ 
+-SVN_INFO = (cd $(src); svn info 2>/dev/null)
++SVN_INFO = (cd $(srctree)/$(src); svn info 2>/dev/null)
+ 
+ ifneq ($(shell $(SVN_INFO) 2>/dev/null),)
+ # SVN detected
+@@ -193,13 +193,13 @@ CHANGED_REVISION := $(shell $(SVN_INFO) | grep '^Last Changed Rev: ' | cut -d: -
+ REPO_URL := $(shell $(SVN_INFO) | grep '^URL: ' | cut -d: -f2- | cut -b2-)
+ 
+ else # SVN
+-GIT_REV := $(shell cd $(src); git describe --always 2>/dev/null)
++GIT_REV := $(shell cd $(srctree)/$(src); git describe --always 2>/dev/null)
+ ifneq ($(GIT_REV),)
+ # Git detected
+ DRIVER_REV := $(MALI_RELEASE_NAME)-$(GIT_REV)
+-CHANGE_DATE := $(shell cd $(src); git log -1 --format="%ci")
++CHANGE_DATE := $(shell cd $(srctree)/$(src); git log -1 --format="%ci")
+ CHANGED_REVISION := $(GIT_REV)
+-REPO_URL := $(shell cd $(src); git describe --all --always 2>/dev/null)
++REPO_URL := $(shell cd $(srctree)/$(src); git describe --all --always 2>/dev/null)
+ 
+ else # Git
+ # No Git or SVN detected
+@@ -212,7 +212,7 @@ endif
+ ccflags-y += -DSVN_REV_STRING=\"$(DRIVER_REV)\"
+ 
+ VERSION_STRINGS :=
+-VERSION_STRINGS += API_VERSION=$(shell cd $(src); grep "\#define _MALI_API_VERSION" $(FILES_PREFIX)include/linux/mali/mali_utgard_uk_types.h | cut -d' ' -f 3 )
++VERSION_STRINGS += API_VERSION=$(shell cd $(srctree)/$(src); grep "\#define _MALI_API_VERSION" $(FILES_PREFIX)include/linux/mali/mali_utgard_uk_types.h | cut -d' ' -f 3 )
+ VERSION_STRINGS += REPO_URL=$(REPO_URL)
+ VERSION_STRINGS += REVISION=$(DRIVER_REV)
+ VERSION_STRINGS += CHANGED_REVISION=$(CHANGED_REVISION)
+@@ -235,5 +235,5 @@ VERSION_STRINGS += USING_POWER_PERFORMANCE_POLICY=$(CONFIG_POWER_PERFORMANCE_POL
+ VERSION_STRINGS += MALI_UPPER_HALF_SCHEDULING=$(MALI_UPPER_HALF_SCHEDULING)
+ 
+ # Create file with Mali driver configuration
+-$(src)/__malidrv_build_info.c:
+-	@echo 'const char *__malidrv_build_info(void) { return "malidrv: $(VERSION_STRINGS)";}' > $(src)/__malidrv_build_info.c
++$(srctree)/$(src)/__malidrv_build_info.c:
++	@echo 'const char *__malidrv_build_info(void) { return "malidrv: $(VERSION_STRINGS)";}' > $(srctree)/$(src)/__malidrv_build_info.c
+diff --git a/drivers/gpu/arm/mali400/ump/Kbuild b/drivers/gpu/arm/mali400/ump/Kbuild
+index df3b897..60734d5 100644
+--- a/drivers/gpu/arm/mali400/ump/Kbuild
++++ b/drivers/gpu/arm/mali400/ump/Kbuild
+@@ -15,8 +15,8 @@
+ CONFIG ?= release
+ 
+ # Validate selected config
+-ifneq ($(shell [ -d $(src)/arch-$(CONFIG) ] && [ -f  $(src)/arch-$(CONFIG)/config.h ] && echo "OK"), OK)
+-$(warning Current directory is $(src))
++ifneq ($(shell [ -d $(srctree)/$(src)/arch-$(CONFIG) ] && [ -f  $(srctree)/$(src)/arch-$(CONFIG)/config.h ] && echo "OK"), OK)
++$(warning Current directory is $(srctree)/$(src))
+ $(error No configuration found for config $(CONFIG). Check that arch-$(CONFIG)/config.h exists)
+ endif
+ 
+@@ -28,9 +28,9 @@ SVN_REV := $(shell ((svnversion | grep -qv exported && echo -n 'Revision: ' && s
+ ccflags-y += -DSVN_REV=$(SVN_REV)
+ ccflags-y += -DSVN_REV_STRING=\"$(SVN_REV)\"
+ 
+-ccflags-y += -I$(src) -I$(src)/common -I$(src)/linux -I$(src)/../mali/common -I$(src)/../mali/linux -I$(src)/../../ump/include/ump
++ccflags-y += -I$(srctree)/$(src) -I$(srctree)/$(src)/common -I$(srctree)/$(src)/linux -I$(srctree)/$(src)/../mali/common -I$(srctree)/$(src)/../mali/linux -I$(srctree)/$(src)/../../ump/include/ump
+ # MALI_SEC
+-ccflags-y += -I$(src)/include
++ccflags-y += -I$(srctree)/$(src)/include
+ ccflags-y += -DUSING_MEMORY=1 -DUMP_MEM_SIZE=512
+ 
+ ccflags-y += -DMALI_STATE_TRACKING=0
+@@ -40,10 +40,10 @@ ccflags-$(CONFIG_UMP_DEBUG) += -DDEBUG
+ # The ARM proprietary product will only include the license/proprietary directory
+ # The GPL product will only include the license/gpl directory
+ 
+-ifeq ($(wildcard $(src)/linux/license/gpl/*),)
+-ccflags-y += -I$(src)/linux/license/proprietary
++ifeq ($(wildcard $(srctree)/$(src)/linux/license/gpl/*),)
++ccflags-y += -I$(srctree)/$(src)/linux/license/proprietary
+ else
+-ccflags-y += -I$(src)/linux/license/gpl
++ccflags-y += -I$(srctree)/$(src)/linux/license/gpl
+ endif
+ 
+ ump-y = common/ump_kernel_common.o \
+-- 
+2.7.4
+
diff --git a/board/artik520/post-image.sh b/board/artik520/post-image.sh
new file mode 100755
index 0000000000..e9c8acf53e
--- /dev/null
+++ b/board/artik520/post-image.sh
@@ -0,0 +1,33 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+ARTIK520_TMP="${BUILD_DIR}/artik520.tmp"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+
+rm -rf "${ARTIK520_TMP}" "${GENIMAGE_TMP}"
+mkdir -p "${ARTIK520_TMP}"
+
+cp "${BUILD_DIR}/uboot-custom/common/env_common.o" "${ARTIK520_TMP}/env_common.o"
+arm-linux-objcopy -O binary --only-section=.rodata "${ARTIK520_TMP}/env_common.o"
+tr '\0' '\n' < "${ARTIK520_TMP}/env_common.o" | grep '=' > "${ARTIK520_TMP}/env_common.txt"
+
+# /dev/mmcblk1 is SD Card
+# Kernel in /dev/mmcblk1p1
+# FAT32 filesystem for /dev/mmcblk1p1
+# root=/dev/mmcblk1p2
+# When u-boot is loaded from SD card, eMMC is device 1! (0 if u-boot from eMMC)
+sed -i -e 's/rootdev=[0-9]/rootdev=1/g' \
+	-e 's/rootpart=[0-9]/rootpart=2/g' \
+	-e 's/bootcmd=.*/bootcmd=run mmcboot/g' \
+	-e 's/emmc_dev=0/emmc_dev=1/g' \
+	"${ARTIK520_TMP}/env_common.txt"
+
+mkenvimage -s 16384 -o "${BINARIES_DIR}/u-boot-env.bin" "${ARTIK520_TMP}/env_common.txt"
+
+genimage                           \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
diff --git a/board/artik520/u-boot/0001-fix-single-sdfuse-flash-command.patch b/board/artik520/u-boot/0001-fix-single-sdfuse-flash-command.patch
new file mode 100644
index 0000000000..5c57c56674
--- /dev/null
+++ b/board/artik520/u-boot/0001-fix-single-sdfuse-flash-command.patch
@@ -0,0 +1,17 @@
+u-boot-artik: Fix sdfuse command when flashing individual components
+
+Signed-off-by: Florin Sarbu <florin@resin.io>
+
+
+Index: git/common/cmd_fastboot.c
+===================================================================
+--- git.orig/common/cmd_fastboot.c
++++ git/common/cmd_fastboot.c
+@@ -2268,6 +2268,7 @@ int do_sdfuse (cmd_tbl_t *cmdtp, int fla
+ 
+ 		ret = 0;
+ 	} else if ((argc == 5) && !strcmp(argv[1], "flash")) {
++		part_num = simple_strtoul(argv[2], NULL, 16);
+ 		if (update_from_sd(part_num, argv[3], argv[4]))
+ 			return -1;
+ 
diff --git a/configs/artik520_sdboot_defconfig b/configs/artik520_sdboot_defconfig
new file mode 100644
index 0000000000..61784bcf08
--- /dev/null
+++ b/configs/artik520_sdboot_defconfig
@@ -0,0 +1,28 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_VFPV4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
+BR2_GCC_VERSION_6_X=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/artik520/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,SamsungARTIK,linux-artik,artik-exynos/v3.10.x)/linux-artik-exynos-v3.10.x.tar.gz"
+BR2_LINUX_KERNEL_PATCH="board/artik520/linux/"
+BR2_LINUX_KERNEL_DEFCONFIG="artik5"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="exynos3250-artik5"
+BR2_PACKAGE_ARTIK520_BOOT_FIRMWARE=y
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="artik5"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,SamsungARTIK,u-boot-artik,artik-exynos/v2012.07)/u-boot-artik-exynos-v2012.07.tar.gz"
+BR2_TARGET_UBOOT_PATCH="board/artik520/u-boot/"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/espresso3250-spl.bin"
+BR2_PACKAGE_HOST_DTC=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
diff --git a/package/Config.in b/package/Config.in
index fcabed4fde..a595be559e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -370,6 +370,7 @@ menu "Hardware handling"
 menu "Firmware"
 	source "package/am33x-cm3/Config.in"
 	source "package/armbian-firmware/Config.in"
+	source "package/artik520-boot-firmware/Config.in"
 	source "package/b43-firmware/Config.in"
 	source "package/linux-firmware/Config.in"
 	source "package/rpi-bt-firmware/Config.in"
diff --git a/package/artik520-boot-firmware/Config.in b/package/artik520-boot-firmware/Config.in
new file mode 100644
index 0000000000..f22adc2419
--- /dev/null
+++ b/package/artik520-boot-firmware/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_ARTIK520_BOOT_FIRMWARE
+	bool "artik520-boot-firmware"
+	help
+	  Artik520 pre-compiled binaries of bootloader.
+
+	  https://github.com/SamsungARTIK/boot-firmwares-artik5
diff --git a/package/artik520-boot-firmware/artik520-boot-firmware.hash b/package/artik520-boot-firmware/artik520-boot-firmware.hash
new file mode 100644
index 0000000000..117848a9fd
--- /dev/null
+++ b/package/artik520-boot-firmware/artik520-boot-firmware.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 f4d52b20438b5d9fa0f0ed82e67942748e339c91ff14cbf621c369a00c00f48c  artik520-boot-firmware-A520_os_2.0.0.tar.gz
diff --git a/package/artik520-boot-firmware/artik520-boot-firmware.mk b/package/artik520-boot-firmware/artik520-boot-firmware.mk
new file mode 100644
index 0000000000..4dc0e39726
--- /dev/null
+++ b/package/artik520-boot-firmware/artik520-boot-firmware.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# artik520-boot-firmware
+#
+################################################################################
+
+ARTIK520_BOOT_FIRMWARE_VERSION = A520_os_2.0.0
+ARTIK520_BOOT_FIRMWARE_SITE = $(call github,SamsungARTIK,boot-firmwares-artik5,$(ARTIK520_BOOT_FIRMWARE_VERSION))
+ARTIK520_BOOT_FIRMWARE_INSTALL_IMAGES = YES
+
+define ARTIK520_BOOT_FIRMWARE_INSTALL_IMAGES_CMDS
+	$(INSTALL) -m 0644 $(@D)/bl1.bin $(BINARIES_DIR)/bl1.bin
+	$(INSTALL) -m 0644 $(@D)/tzsw.bin $(BINARIES_DIR)/tzsw.bin
+endef
+
+$(eval $(generic-package))
-- 
2.18.0
