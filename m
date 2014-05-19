From: David VomLehn <vomlehn@texas.net>
Date: Mon, 19 May 2014 14:46:58 -0700
Subject: [Buildroot] [PATCH][RFC] Allow creation of sub-filesystems from the
 whole target filesystem
Message-ID: <20140519214658.GA1453@texas.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[I need this functionality and things look to be working as I intended,
but is an RFC because I need other people's feedback to evaluate whether
this is a reasonable interface. Please give it a quick whirl--thanks!]

An example: Say that there is a filesystem where:
o	The root filesystem needs to be a cpio file for use as an initramfs
	filesystems, recreated on each boot.
o	Most of /home needs to be in NAND flash, but shouldn't be writeable.
o	/home/user1 and /home/user2 need to be writeable filesystems in NAND
	flash. A tar image of /home/user1 also needs to be generated so
	it can be reinitialized, if necessary.

This patch allow these three filesystem images to be created from the
target directory, with contents specified as follows:
o	cpio: /
o	squashfs: /home
o	JFFS2: /home/user1 /home/user2
o	tar: home/user1

Five files will be generated:
rootfs.cpio		root-homefs.squashfs 	root-home-user1fs.jffs2
root-home-user1fs.tar	root-home-user2fs.jffs2
---
 Makefile                       |   2 +-
 fs/Config.in                   |  25 +++++
 fs/cloop/Config.in             |  12 +++
 fs/cloop/cloop-post.mk         |  13 +++
 fs/cloop/cloop-pre.mk          |   7 ++
 fs/common.mk                   | 222 +++++++++++++++++++++++++++++++++++++----
 fs/cpio/Config.in              |  12 +++
 fs/cpio/cpio-post.mk           |  43 ++++++++
 fs/cpio/cpio-pre.mk            |   7 ++
 fs/cramfs/Config.in            |  12 +++
 fs/cramfs/cramfs-post.mk       |  19 ++++
 fs/cramfs/cramfs-pre.mk        |   7 ++
 fs/ext2/Config.in              |  12 +++
 fs/ext2/ext2-post.mk           |  37 +++++++
 fs/ext2/ext2-pre.mk            |   6 ++
 fs/initramfs/initramfs-post.mk |  22 ++++
 fs/initramfs/initramfs-pre.mk  |   5 +
 fs/iso9660/iso9660-post.mk     |  51 ++++++++++
 fs/iso9660/iso9660-pre.mk      |   9 ++
 fs/jffs2/Config.in             |  12 +++
 fs/jffs2/jffs2-post.mk         |  49 +++++++++
 fs/jffs2/jffs2-pre.mk          |   7 ++
 fs/romfs/Config.in             |  12 +++
 fs/romfs/romfs-post.mk         |  15 +++
 fs/romfs/romfs-pre.mk          |   7 ++
 fs/squashfs/Config.in          |  12 +++
 fs/squashfs/squashfs-post.mk   |  29 ++++++
 fs/squashfs/squashfs-pre.mk    |   7 ++
 fs/tar/Config.in               |  12 +++
 fs/tar/tar-post.mk             |  13 +++
 fs/tar/tar-pre.mk              |   7 ++
 fs/ubifs/Config.in             |  12 +++
 fs/ubifs/ubi-post.mk           |  30 ++++++
 fs/ubifs/ubi-pre.mk            |   7 ++
 fs/ubifs/ubifs-post.mk         |  27 +++++
 fs/ubifs/ubifs-pre.mk          |   7 ++
 fs/yaffs2/Config.in            |  12 +++
 fs/yaffs2/yaffs-post.mk        |  13 +++
 fs/yaffs2/yaffs-pre.mk         |   7 ++
 39 files changed, 799 insertions(+), 21 deletions(-)
 create mode 100644 fs/cloop/cloop-post.mk
 create mode 100644 fs/cloop/cloop-pre.mk
 create mode 100644 fs/cpio/cpio-post.mk
 create mode 100644 fs/cpio/cpio-pre.mk
 create mode 100644 fs/cramfs/cramfs-post.mk
 create mode 100644 fs/cramfs/cramfs-pre.mk
 create mode 100644 fs/ext2/ext2-post.mk
 create mode 100644 fs/ext2/ext2-pre.mk
 create mode 100644 fs/initramfs/initramfs-post.mk
 create mode 100644 fs/initramfs/initramfs-pre.mk
 create mode 100644 fs/iso9660/iso9660-post.mk
 create mode 100644 fs/iso9660/iso9660-pre.mk
 create mode 100644 fs/jffs2/jffs2-post.mk
 create mode 100644 fs/jffs2/jffs2-pre.mk
 create mode 100644 fs/romfs/romfs-post.mk
 create mode 100644 fs/romfs/romfs-pre.mk
 create mode 100644 fs/squashfs/squashfs-post.mk
 create mode 100644 fs/squashfs/squashfs-pre.mk
 create mode 100644 fs/tar/tar-post.mk
 create mode 100644 fs/tar/tar-pre.mk
 create mode 100644 fs/ubifs/ubi-post.mk
 create mode 100644 fs/ubifs/ubi-pre.mk
 create mode 100644 fs/ubifs/ubifs-post.mk
 create mode 100644 fs/ubifs/ubifs-pre.mk
 create mode 100644 fs/yaffs2/yaffs-post.mk
 create mode 100644 fs/yaffs2/yaffs-pre.mk

diff --git a/Makefile b/Makefile
index 4b93805..9856974 100644
--- a/Makefile
+++ b/Makefile
@@ -332,7 +332,7 @@ TARGET_SKELETON = $(TOPDIR)/system/skeleton
 
 # Location of a file giving a big fat warning that output/target
 # should not be used as the root filesystem.
-TARGET_DIR_WARNING_FILE = $(TARGET_DIR)/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
+TARGET_DIR_WARNING_FILE = THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
 
 ifeq ($(BR2_CCACHE),y)
 CCACHE := $(HOST_DIR)/usr/bin/ccache
diff --git a/fs/Config.in b/fs/Config.in
index 5853113..22df250 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -1,5 +1,30 @@
 menu "Filesystem images"
 
+config BR2_BUILD_SUB_FILESYSTEMS
+	bool "Build sub-filesystems"
+	help
+	  Normally, all target files will be put into a single root filesystem.
+	  Choosing this option allows sub-directories of the root filesystem
+	  to be split into sub-filesystems, possible of different types.
+	  These filesystems can then be written to different devices and
+	  mounted at boot time to create the original view of the root
+	  filesystem.
+
+	  Note that this will split up the root filesystems based on the
+	  concatenation of filesystems listed under all filesystems types.
+	  So, if "/ and /usr" are listed under cpio and "/ /usr/share" are
+	  listed under JFFS2, four filesystem images will be created:
+	  o	rootfs.cpio: A cpio image containing everything under the
+	  	original root filesystem except for /usr
+	  o	rootfs.jffs:  A JFFS2 image with everything under the original
+	  	root filesystem except for /usr, i.e the same contents as
+	  	rootfs.cpio, but as a different filesystem image type.
+	  o	rootfs-usrfs.cpio: Everything under the original /usr directory
+	  	except for files under /usr/share, but including the /usr/share
+	  	directory.
+	  o	rootfs-usr-sharefs.jffs2: Everything under the original
+	  	/usr/share directory.
+
 source "fs/cloop/Config.in"
 source "fs/cpio/Config.in"
 source "fs/cramfs/Config.in"
diff --git a/fs/cloop/Config.in b/fs/cloop/Config.in
index 3e01067..5900cb2 100644
--- a/fs/cloop/Config.in
+++ b/fs/cloop/Config.in
@@ -8,3 +8,15 @@ config BR2_TARGET_ROOTFS_CLOOP
 	  compressed filesystem like a block device and seamlessly
 	  decompress its data while accessing it.  The majority of the
 	  software on an LNX-BBC is accessed in this fashion.
+
+if BR2_BUILD_SUB_FILESYSTEMS
+config BR2_CLOOP_SUB_FILESYSTEMS
+	string "Sub-filesystems to build with cloop"
+	default "/"
+	depends on BR2_TARGET_ROOTFS_CLOOP
+	help
+	  Provide a space-separated list of the root directories of all
+	  filesystems. For example to build a root filesystem with a
+	  separate /usr filesystem, enter:
+	    / /usr
+endif # BR2_BUILD_SUB_FILESYSTEMS
diff --git a/fs/cloop/cloop-post.mk b/fs/cloop/cloop-post.mk
new file mode 100644
index 0000000..a3dd5d4
--- /dev/null
+++ b/fs/cloop/cloop-post.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# Build the compressed loop root filesystem image
+#
+################################################################################
+
+ROOTFS_CLOOP_DEPENDENCIES = host-cloop host-cdrkit
+
+define ROOTFS_CLOOP_CMD
+	$(HOST_DIR)/usr/bin/genisoimage -r $(1) | $(HOST_DIR)/usr/bin/create_compressed_fs - 65536 > $@
+endef
+
+$(eval $(call ROOTFS_TARGETS,cloop,$(CLOOP_SUBFS)))
diff --git a/fs/cloop/cloop-pre.mk b/fs/cloop/cloop-pre.mk
new file mode 100644
index 0000000..ffef696
--- /dev/null
+++ b/fs/cloop/cloop-pre.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# Define cloop filesystems
+#
+################################################################################
+
+CLOOP_SUBFS = $(if $(BR2_BUILD_SUB_FILESYSTEMS),$(BR2_CLOOP_SUB_FILESYSTEMS),/)
diff --git a/fs/common.mk b/fs/common.mk
index 919db25..0205ea6 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -28,6 +28,7 @@
 # BR2_TARGET_ROOTFS_$(FSTYPE)_LZMA exist and are enabled, then the
 # macro will automatically generate a compressed filesystem image.
 
+SUBFS_DIR = $(BINARIES_DIR)/subfs
 FAKEROOT_SCRIPT = $(BUILD_DIR)/_fakeroot.fs
 FULL_DEVICE_TABLE = $(BUILD_DIR)/_device_table.txt
 ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE) \
@@ -35,6 +36,149 @@ ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE) \
 USERS_TABLE = $(BUILD_DIR)/_users_table.txt
 ROOTFS_USERS_TABLES = $(call qstrip,$(BR2_ROOTFS_USERS_TABLES))
 
+# A complete list of filesystems to be built
+include $(sort $(wildcard fs/*/*-pre.mk))
+ALL_FILESYSTEMS = $(sort $(call qstrip,\
+	$(CLOOP_SUBFS) \
+	$(CPIO_SUBFS) \
+	$(CRAMFS_SUBFS) \
+	$(EXT2_SUBFS) \
+	$(JFFS2_SUBFS) \
+	$(ROMFS_SUBFS) \
+	$(SQUASHFS_SUBFS) \
+	$(TAR_SUBFS) \
+	$(UBIFS_SUBFS) \
+	$(UBI_SUBFS) \
+	$(YAFFS2_SUBFS)))
+
+# Translate from a full pathname to a tag.
+# $(1)	Pathname. This must start with a slash
+define SUBFS_TAG
+$(if $(findstring $(1),/),,$(subst /,-,$(1)))
+endef
+
+# Add a leading slash to each of the subdirectory names
+# slashes
+# $(1)	List of directories to which the leading slash should be added
+define ADD_LEADING_SLASH
+$(patsubst //,/,$(addprefix /,$(1)))
+endef
+
+# Add a trailing slash to each of the subdirectory names
+# slashes
+# $(1)	List of directories to which the trailing slash should be added
+define ADD_TRAILING_SLASH
+$(patsubst //,/,$(addsuffix /,$(1)))
+endef
+
+# Pull out all of the subdirectories of a given directory and make them
+# relative to the given directory, using normalized directory names. Normalized
+# directory names all end with exactly one trailing slash
+# $(1)	Directory
+# $(2)	List of possible subdirectories
+define SUB_FILESYSTEMS_NORMALIZED
+$(call ADD_LEADING_SLASH,$(patsubst $(1)%,%,$(filter $(1)%,$(2))))
+endef
+
+# This is given a list of directory names and a starting directory. It pulls
+# out all of the directories properly under the starting directory and makes
+# The result is a list of relative pathnames, each of which ends with a slash.
+# $(1)	Root directory, must start with slash (/)
+define SUB_FILESYSTEMS
+$(patsubst //%,/%,$(call SUB_FILESYSTEMS_NORMALIZED,$(call ADD_TRAILING_SLASH,$(1)),\
+$(call ADD_TRAILING_SLASH,$(sort $(ALL_FILESYSTEMS)))))
+endef
+
+# Create a "-prune" clause for the find command to prune the list of
+# subdirectories.
+# $(1)	List of subdirectories. These are relative pathnames, so they must no
+#	start with a slash (/) but must end with a slash.
+define FIND_PRUNE_SUBDIRECTORIES
+$(if $(1),\( \( $(subst |-o ,,|$(addprefix -o -path '.,$(addsuffix *',$(1)))) \) -prune \),-false)
+endef
+
+# Put together a set of options to the find command that can be used to
+# prune off subdirectories
+# $(1)	Directory at which to start. This must start with a slash (/) character
+# We do a little odd processing to remove the -o from the first name; a
+# better way would be welcome.
+define FIND_PRUNE
+$(call FIND_PRUNE_SUBDIRECTORIES,$(call SUB_FILESYSTEMS,$(1)))
+endef
+
+# Message about sub-filesystem pruning
+# $(1)	Directory being generated
+define PRUNING_MSG
+$(if $(strip $(1)),$(1),nothing)
+endef
+
+# Generate rules for one sub-filesystem target
+# $(1)	Filesystem image type
+# $(2)	Uppercase version of $(1)
+# $(3)	Directory for which to generate the filesystem image
+# $(4)	Location in which to place the directory tree
+define GEN_SUBFS_RULES_TAGGED
+
+$$(BINARIES_DIR)/root$(call SUBFS_TAG,$(3))fs.$(1): \
+	$(SUBFS_DIR)/root-all-$(1)
+	@echo
+	@echo "Creating $(1) directory tree for $(3)" \
+		"(pruning $(call PRUNING_MSG,$(call SUB_FILESYSTEMS,$(3))))"
+	rm -f $$(FAKEROOT_SCRIPT)
+	echo "set -e" >> $$(FAKEROOT_SCRIPT)
+ifeq ($$(ALL_FILESYSTEMS),/)
+	echo "$$(call ROOTFS_$(2)_CMD,$(TARGET_DIR))" >> $$(FAKEROOT_SCRIPT)
+else
+	echo "rm -f $(4)/$$(TARGET_DIR_WARNING_FILE)" >> $$(FAKEROOT_SCRIPT)
+	echo "cd $$(TARGET_DIR)$(3)" >> $$(FAKEROOT_SCRIPT)
+	echo "rm -rf $$@.tmp" >> $$(FAKEROOT_SCRIPT)
+	echo "mkdir -p $(4).tmp" >> $$(FAKEROOT_SCRIPT)
+	echo "find $(call FIND_PRUNE,$(3)) -o -print |" \
+		"cpio --quiet -p --make-directories $(4).tmp" \
+		>> $$(FAKEROOT_SCRIPT)
+	echo "mv $(4).tmp $(4)" >> $$(FAKEROOT_SCRIPT)
+	echo "cd - >/dev/null" >> $$(FAKEROOT_SCRIPT)
+	echo "$$(call ROOTFS_$(2)_CMD,$(4))" >> $$(FAKEROOT_SCRIPT)
+endif
+	chmod a+x $$(FAKEROOT_SCRIPT)
+	PATH=$(BR_PATH) $$(HOST_DIR)/usr/bin/fakeroot -s $$(FAKEROOT_$(2)_ENV) \
+		-i $$(FAKEROOT_$(2)_ENV) -- $$(FAKEROOT_SCRIPT)
+ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
+	$$(ROOTFS_$(2)_COMPRESS_CMD) $$@ > $$@$$(ROOTFS_$(2)_COMPRESS_EXT)
+endif
+	if [ '$$(ALL_FILESYSTEMS)' != '/' ]; then \
+		$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
+			$(4)/$$(TARGET_DIR_WARNING_FILE); \
+	fi
+endef
+
+# Generate rules for one sub-filesystem target
+# $(1)	Filesystem image type
+# $(2)	Uppercase version of $(1)
+# $(3)	Directory for which to generate the filesystem image
+define GEN_SUBFS_RULES
+$(call GEN_SUBFS_RULES_TAGGED,$(1),$(2),$(3),$(SUBFS_DIR)/root$(call SUBFS_TAG,$(3))fs-$(1))
+endef
+
+# Generate rules for a list of sub-filesystem targets
+# $(1)	Filesystem image type
+# $(2)	Uppercase version of $(1)
+# $(3)	Directories at the top of filesystems
+define GEN_SUBFS_RULES_LIST
+$(foreach fs,$(3),$(call GEN_SUBFS_RULES,$(1),$(2),$(fs)))
+endef
+
+# List of all of the generated images for a given type
+# $(1)	Image type
+# $(2)	List of all of the filesystems for this type
+define SUBFS_ALL
+$(foreach subfs,$(2),$$(BINARIES_DIR)/root$(call SUBFS_TAG,$(subfs))fs.$(1))
+endef
+
+# Define targets for building a filesystem image of a particular type
+# $(1)	Filesystem image type
+# $(2)	Uppercased $(1)
+# $(3)	Directories to build
 define ROOTFS_TARGET_INTERNAL
 
 # extra deps
@@ -64,47 +208,85 @@ ROOTFS_$(2)_COMPRESS_EXT = .xz
 ROOTFS_$(2)_COMPRESS_CMD = $$(XZ) -9 -C crc32 -c
 endif
 
-$$(BINARIES_DIR)/rootfs.$(1): target-finalize $$(ROOTFS_$(2)_DEPENDENCIES)
-	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
+FAKEROOT_$(2)_ENV := $$(SUBFS_DIR)/fakeroot-env-$(1)
+
+$(SUBFS_DIR)/root-all-$(1): target-finalize $$(ROOTFS_$(2)_DEPENDENCIES) \
+	$(SUBFS_DIR)
+	@$$(call MESSAGE,"Generating $(1) filesystem image/images")
 	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),$$(call $$(hook))$$(sep))
 	rm -f $$(FAKEROOT_SCRIPT)
-	rm -f $$(TARGET_DIR_WARNING_FILE)
+	rm -f $(TARGET_DIR)/$$(TARGET_DIR_WARNING_FILE)
 	rm -f $(USERS_TABLE)
-	echo "chown -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
+	# Create the device tables
 ifneq ($$(ROOTFS_DEVICE_TABLES),)
-	cat $$(ROOTFS_DEVICE_TABLES) > $$(FULL_DEVICE_TABLE)
+	cat $$(ROOTFS_DEVICE_TABLES) >> $$(FULL_DEVICE_TABLE)
 ifeq ($$(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
-	printf '$$(subst $$(sep),\n,$$(PACKAGES_DEVICES_TABLE))' >> $$(FULL_DEVICE_TABLE)
+	printf '$$(subst $$(sep),\n,$$(PACKAGES_DEVICES_TABLE))' \
+		>> $$(FULL_DEVICE_TABLE)
 endif
-	printf '$$(subst $$(sep),\n,$$(PACKAGES_PERMISSIONS_TABLE))' >> $$(FULL_DEVICE_TABLE)
-	echo "$$(HOST_DIR)/usr/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
+	printf '$$(subst $$(sep),\n,$$(PACKAGES_PERMISSIONS_TABLE))' \
+		>> $$(FULL_DEVICE_TABLE)
 endif
+	# Create the users table
 ifneq ($$(ROOTFS_USERS_TABLES),)
 	cat $$(ROOTFS_USERS_TABLES) >> $(USERS_TABLE)
 endif
 	printf '$(subst $(sep),\n,$(PACKAGES_USERS))' >> $(USERS_TABLE)
-	PATH=$(BR_PATH) $(TOPDIR)/support/scripts/mkusers $(USERS_TABLE) $(TARGET_DIR) >> $(FAKEROOT_SCRIPT)
-	echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)
-	chmod a+x $$(FAKEROOT_SCRIPT)
-	PATH=$(BR_PATH) $$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
-	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
-	- at rm -f $$(FAKEROOT_SCRIPT) $$(FULL_DEVICE_TABLE)
-ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
-	$$(ROOTFS_$(2)_COMPRESS_CMD) $$@ > $$@$$(ROOTFS_$(2)_COMPRESS_EXT)
+	# Create the script to be run under fakeroot
+	echo "set -e" >> $(FAKEROOT_SCRIPT)
+	echo "chown -R 0:0 $$(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
+ifneq ($$(ROOTFS_DEVICE_TABLES),)
+	echo "$$(HOST_DIR)/usr/bin/makedevs -d $$(FULL_DEVICE_TABLE)" \
+		"$$(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
 endif
+	PATH=$(BR_PATH) $(TOPDIR)/support/scripts/mkusers $(USERS_TABLE) \
+		$(TARGET_DIR) >> $(FAKEROOT_SCRIPT)
+	chmod a+x $$(FAKEROOT_SCRIPT)
+	PATH=$(BR_PATH) $$(HOST_DIR)/usr/bin/fakeroot -s \
+		$$(FAKEROOT_$(2)_ENV) -- $$(FAKEROOT_SCRIPT)
 
 rootfs-$(1)-show-depends:
 	@echo $$(ROOTFS_$(2)_DEPENDENCIES)
 
-rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1) $$(ROOTFS_$(2)_POST_TARGETS)
+$(call GEN_SUBFS_RULES_LIST,$(1),$(2),$(3))
+
+fs-finish-$(1):
+	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
+		$(TARGET_DIR)/$$(TARGET_DIR_WARNING_FILE)
+	- at rm -f $$(FAKEROOT_SCRIPT) $$(FULL_DEVICE_TABLE)
+
+rootfs-$(1): $(call SUBFS_ALL,$(1),$(3)) fs-finish-$(1) \
+	$$(ROOTFS_$(2)_POST_TARGETS)
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
 TARGETS_ROOTFS += rootfs-$(1)
 endif
 endef
 
-define ROOTFS_TARGET
-$(call ROOTFS_TARGET_INTERNAL,$(1),$(call UPPERCASE,$(1)))
+# This is the directory in which all of the non-final work produces are
+# placed
+$(SUBFS_DIR):
+	mkdir -p $(SUBFS_DIR)
+
+# Make sure all filesystems specified start with / and do not end with /
+# $(1)	Filesystem image type
+# $(2)	Filesystem directory names
+define VALIDATE_FILESYSTEM_NAMES
+$(if $(2),
+$(if $(filter-out /%,$(2)),
+$(error All $(1) filesystem directory names ($(2))
+must start with slash character))
+$(if $(filter %/,$(filter-out /,$(2))),
+$(error No $(1) filesystem directory names ($(2))
+may end with slash character)))
+endef
+
+# Make the root filesystem image and all sub-filesystems of a given type
+# $(1)	Filesystem image type
+# $(2)	List of directories for which filesystem images are to be made
+define ROOTFS_TARGETS
+$(call VALIDATE_FILESYSTEM_NAMES,$(1),$(call qstrip,$(2)))
+$(if $(2),$(call ROOTFS_TARGET_INTERNAL,$(1),$(call UPPERCASE,$(1)),$(sort $(call qstrip,$(2)))))
 endef
 
-include $(sort $(wildcard fs/*/*.mk))
+include $(sort $(wildcard fs/*/*-post.mk))
diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
index 206baca..7c79bd1 100644
--- a/fs/cpio/Config.in
+++ b/fs/cpio/Config.in
@@ -5,6 +5,18 @@ config BR2_TARGET_ROOTFS_CPIO
 	  used for an initial RAM filesystem that is passed to the kernel
 	  by the bootloader.
 
+if BR2_BUILD_SUB_FILESYSTEMS
+config BR2_CPIO_SUB_FILESYSTEMS
+	string "Sub-filesystems to build with cpio"
+	default "/"
+	depends on BR2_TARGET_ROOTFS_CPIO
+	help
+	  Provide a space-separated list of the root directories of all
+	  filesystems. For example to build a root filesystem with a
+	  separate /usr filesystem, enter:
+	    / /usr
+endif # BR2_BUILD_SUB_FILESYSTEMS
+
 if BR2_TARGET_ROOTFS_CPIO
 
 choice
diff --git a/fs/cpio/cpio-post.mk b/fs/cpio/cpio-post.mk
new file mode 100644
index 0000000..993fdbd
--- /dev/null
+++ b/fs/cpio/cpio-post.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# cpio to archive target filesystem
+#
+################################################################################
+
+ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
+
+define ROOTFS_CPIO_ADD_INIT
+        if [ ! -e $(TARGET_DIR)/init ]; then \
+                ln -sf sbin/init $(TARGET_DIR)/init; \
+        fi
+endef
+
+else
+# devtmpfs does not get automounted when initramfs is used.
+# Add a pre-init script to mount it before running init
+define ROOTFS_CPIO_ADD_INIT
+        if [ ! -e $(TARGET_DIR)/init ]; then \
+                $(INSTALL) -m 0755 fs/cpio/init $(TARGET_DIR)/init; \
+        fi
+endef
+
+PACKAGES_PERMISSIONS_TABLE += /dev/console c 622 0 0 5 1 - - -$(sep)
+
+endif # BR2_ROOTFS_DEVICE_CREATION_STATIC
+
+ROOTFS_CPIO_PRE_GEN_HOOKS += ROOTFS_CPIO_ADD_INIT
+
+define ROOTFS_CPIO_CMD
+	cd $(1) && find . | cpio --quiet -o -H newc > $@
+endef
+
+$(BINARIES_DIR)/rootfs.cpio.uboot: $(BINARIES_DIR)/rootfs.cpio host-uboot-tools
+	$(MKIMAGE) -A $(MKIMAGE_ARCH) -T ramdisk \
+		-C none -d $<$(ROOTFS_CPIO_COMPRESS_EXT) $@
+
+ifeq ($(BR2_TARGET_ROOTFS_CPIO_UIMAGE),y)
+ROOTFS_CPIO_POST_TARGETS += $(BINARIES_DIR)/rootfs.cpio.uboot
+endif
+
+$(info $(call ROOTFS_TARGETS,cpio,$(CPIO_SUBFS)))
+$(eval $(call ROOTFS_TARGETS,cpio,$(CPIO_SUBFS)))
diff --git a/fs/cpio/cpio-pre.mk b/fs/cpio/cpio-pre.mk
new file mode 100644
index 0000000..6792979
--- /dev/null
+++ b/fs/cpio/cpio-pre.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# Define cpio filesystems
+#
+################################################################################
+
+CPIO_SUBFS = $(if $(BR2_BUILD_SUB_FILESYSTEMS),$(BR2_CPIO_SUB_FILESYSTEMS),/)
diff --git a/fs/cramfs/Config.in b/fs/cramfs/Config.in
index 1a4e326..0ab687f 100644
--- a/fs/cramfs/Config.in
+++ b/fs/cramfs/Config.in
@@ -4,3 +4,15 @@ config BR2_TARGET_ROOTFS_CRAMFS
 	  Build a cramfs root filesystem
 
 	  http://sourceforge.net/projects/cramfs/
+
+if BR2_BUILD_SUB_FILESYSTEMS
+config BR2_CRAMFS_SUB_FILESYSTEMS
+	string "Sub-filesystems to build with cramfs"
+	default "/"
+	depends on BR2_TARGET_ROOTFS_CRAMFS
+	help
+	  Provide a space-separated list of the root directories of all
+	  filesystems. For example to build a root filesystem with a
+	  separate /usr filesystem, enter:
+	    / /usr
+endif # BR2_BUILD_SUB_FILESYSTEMS
diff --git a/fs/cramfs/cramfs-post.mk b/fs/cramfs/cramfs-post.mk
new file mode 100644
index 0000000..aa27363
--- /dev/null
+++ b/fs/cramfs/cramfs-post.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# Build the cramfs root filesystem image
+#
+################################################################################
+
+ifeq ($(BR2_ENDIAN),"BIG")
+CRAMFS_OPTS = -b
+else
+CRAMFS_OPTS = -l
+endif
+
+define ROOTFS_CRAMFS_CMD
+ $(HOST_DIR)/usr/bin/mkcramfs $(CRAMFS_OPTS) $(1) $@
+endef
+
+ROOTFS_CRAMFS_DEPENDENCIES = host-cramfs
+
+$(eval $(call ROOTFS_TARGETS,cramfs,$(CRAMFS_SUBFS)))
diff --git a/fs/cramfs/cramfs-pre.mk b/fs/cramfs/cramfs-pre.mk
new file mode 100644
index 0000000..3aff37c
--- /dev/null
+++ b/fs/cramfs/cramfs-pre.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# Define cramfs filesystems
+#
+################################################################################
+
+CRAMFS_SUBFS = $(if $(BR2_BUILD_SUB_FILESYSTEMS),$(BR2_CRAMFS_SUB_FILESYSTEMS),/)
diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index adba6f3..b2c18ee 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -5,6 +5,18 @@ config BR2_TARGET_ROOTFS_EXT2
 	help
 	  Build an ext2/3/4 root filesystem
 
+if BR2_BUILD_SUB_FILESYSTEMS
+config BR2_EXT2_SUB_FILESYSTEMS
+	string "Sub-filesystems to build with ext2/3/4"
+	default "/"
+	depends on BR2_TARGET_ROOTFS_EXT2
+	help
+	  Provide a space-separated list of the root directories of all
+	  filesystems. For example to build a root filesystem with a
+	  separate /usr filesystem, enter:
+	    / /usr
+endif # BR2_BUILD_SUB_FILESYSTEMS
+
 if BR2_TARGET_ROOTFS_EXT2
 
 config BR2_TARGET_ROOTFS_EXT2_2
diff --git a/fs/ext2/ext2-post.mk b/fs/ext2/ext2-post.mk
new file mode 100644
index 0000000..a577b56
--- /dev/null
+++ b/fs/ext2/ext2-post.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# Build the ext2 root filesystem image
+#
+################################################################################
+
+EXT2_OPTS :=
+
+ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)),0)
+EXT2_OPTS += -b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)
+endif
+
+ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_INODES)),0)
+EXT2_OPTS += -N $(BR2_TARGET_ROOTFS_EXT2_INODES)
+endif
+
+ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)),0)
+EXT2_OPTS += -m $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)
+endif
+
+ROOTFS_EXT2_DEPENDENCIES = host-genext2fs host-e2fsprogs
+
+EXT2_ENV  = GEN=$(BR2_TARGET_ROOTFS_EXT2_GEN)
+EXT2_ENV += REV=$(BR2_TARGET_ROOTFS_EXT2_REV)
+
+define ROOTFS_EXT2_CMD
+	PATH=$(BR_PATH) $(EXT2_ENV) fs/ext2/genext2fs.sh -d $(1) $(EXT2_OPTS) $@
+endef
+
+rootfs-ext2-symlink:
+	ln -sf rootfs.ext2$(ROOTFS_EXT2_COMPRESS_EXT) $(BINARIES_DIR)/rootfs.ext$(BR2_TARGET_ROOTFS_EXT2_GEN)$(ROOTFS_EXT2_COMPRESS_EXT)
+
+ifneq ($(BR2_TARGET_ROOTFS_EXT2_GEN),2)
+ROOTFS_EXT2_POST_TARGETS += rootfs-ext2-symlink
+endif
+
+$(eval $(call ROOTFS_TARGETS,ext2,$(EXT2_SUBFS)))
diff --git a/fs/ext2/ext2-pre.mk b/fs/ext2/ext2-pre.mk
new file mode 100644
index 0000000..5c937f4
--- /dev/null
+++ b/fs/ext2/ext2-pre.mk
@@ -0,0 +1,6 @@
+################################################################################
+#
+# Define ext2/3/4 filesystems
+#
+################################################################################
+EXT2_SUBFS = $(if $(BR2_BUILD_SUB_FILESYSTEMS),$(BR2_EXT2_SUB_FILESYSTEMS),/)
diff --git a/fs/initramfs/initramfs-post.mk b/fs/initramfs/initramfs-post.mk
new file mode 100644
index 0000000..5d3ea89
--- /dev/null
+++ b/fs/initramfs/initramfs-post.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# Build a kernel with an integrated initial ramdisk
+# filesystem based on cpio.
+#
+################################################################################
+
+ROOTFS_INITRAMFS_DEPENDENCIES += rootfs-cpio
+
+ROOTFS_INITRAMFS_POST_TARGETS += linux26-rebuild-with-initramfs
+
+
+# The generic fs infrastructure isn't very useful here.
+
+rootfs-initramfs: $(ROOTFS_INITRAMFS_DEPENDENCIES) $(ROOTFS_INITRAMFS_POST_TARGETS)
+
+rootfs-initramfs-show-depends:
+	@echo $(ROOTFS_INITRAMFS_DEPENDENCIES)
+
+ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
+TARGETS_ROOTFS += rootfs-initramfs
+endif
diff --git a/fs/initramfs/initramfs-pre.mk b/fs/initramfs/initramfs-pre.mk
new file mode 100644
index 0000000..e637d4b
--- /dev/null
+++ b/fs/initramfs/initramfs-pre.mk
@@ -0,0 +1,5 @@
+################################################################################
+#
+# Define initramfs filesystems, which doesn't really fit in quite right
+#
+################################################################################
diff --git a/fs/iso9660/iso9660-post.mk b/fs/iso9660/iso9660-post.mk
new file mode 100644
index 0000000..6c8ace0
--- /dev/null
+++ b/fs/iso9660/iso9660-post.mk
@@ -0,0 +1,51 @@
+################################################################################
+#
+# Build the iso96600 root filesystem image
+#
+# Cannot be converted to the ROOTFS_TARGET infrastructure, because of
+# the temporary construction in ISO9660_TARGET_DIR.
+#
+################################################################################
+
+ISO9660_TARGET_DIR = $(BUILD_DIR)/iso9660
+ISO9660_BOOT_MENU := $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
+
+$(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux rootfs-cpio grub
+	@$(call MESSAGE,"Generating root filesystem image rootfs.iso9660")
+	mkdir -p $(ISO9660_TARGET_DIR)
+	mkdir -p $(ISO9660_TARGET_DIR)/boot/grub
+	cp $(GRUB_DIR)/stage2/stage2_eltorito $(ISO9660_TARGET_DIR)/boot/grub/
+	cp $(ISO9660_BOOT_MENU) $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
+ifeq ($(BR2_TARGET_GRUB_SPLASH),)
+	$(SED) '/^splashimage/d' $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
+else
+	cp boot/grub/splash.xpm.gz $(ISO9660_TARGET_DIR)/
+endif
+	cp $(LINUX_IMAGE_PATH) $(ISO9660_TARGET_DIR)/kernel
+ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
+	$(SED) '/initrd/d'  $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
+else
+	cp $(BINARIES_DIR)/rootfs.cpio$(ROOTFS_CPIO_COMPRESS_EXT) $(ISO9660_TARGET_DIR)/initrd
+endif
+	# Use fakeroot to pretend all target binaries are owned by root
+	rm -f $(FAKEROOT_SCRIPT)
+	echo "chown -R 0:0 $(ISO9660_TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
+	# Use fakeroot so mkisofs believes the previous fakery
+	echo "$(HOST_DIR)/usr/bin/genisoimage -R -b boot/grub/stage2_eltorito -no-emul-boot " \
+		"-boot-load-size 4 -boot-info-table -o $@ $(ISO9660_TARGET_DIR)" \
+		>> $(FAKEROOT_SCRIPT)
+	chmod a+x $(FAKEROOT_SCRIPT)
+	$(HOST_DIR)/usr/bin/fakeroot -- $(FAKEROOT_SCRIPT)
+	- at rm -f $(FAKEROOT_SCRIPT)
+	- at rm -rf $(ISO9660_TARGET_DIR)
+
+rootfs-iso9660: $(BINARIES_DIR)/rootfs.iso9660
+
+################################################################################
+#
+# Toplevel Makefile options
+#
+################################################################################
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660),y)
+TARGETS_ROOTFS += rootfs-iso9660
+endif
diff --git a/fs/iso9660/iso9660-pre.mk b/fs/iso9660/iso9660-pre.mk
new file mode 100644
index 0000000..f1edaf5
--- /dev/null
+++ b/fs/iso9660/iso9660-pre.mk
@@ -0,0 +1,9 @@
+################################################################################
+#
+# Build ISO9660 filesystems
+#
+# Cannot be converted to the ROOTFS_TARGET infrastructure, because of
+# the temporary construction in ISO9660_TARGET_DIR.
+#
+################################################################################
+
diff --git a/fs/jffs2/Config.in b/fs/jffs2/Config.in
index e2a3ee9..2e8a008 100644
--- a/fs/jffs2/Config.in
+++ b/fs/jffs2/Config.in
@@ -3,6 +3,18 @@ config BR2_TARGET_ROOTFS_JFFS2
 	help
 	  Build a jffs2 root filesystem
 
+if BR2_BUILD_SUB_FILESYSTEMS
+config BR2_JFFS2_SUB_FILESYSTEMS
+	string "Sub-filesystems to build with JFFS2"
+	default "/"
+	depends on BR2_TARGET_ROOTFS_JFFS2
+	help
+	  Provide a space-separated list of the root directories of all
+	  filesystems. For example to build a root filesystem with a
+	  separate /usr filesystem, enter:
+	    / /usr
+endif # BR2_BUILD_SUB_FILESYSTEMS
+
 if BR2_TARGET_ROOTFS_JFFS2
 
 choice
diff --git a/fs/jffs2/jffs2-post.mk b/fs/jffs2/jffs2-post.mk
new file mode 100644
index 0000000..f8e6548
--- /dev/null
+++ b/fs/jffs2/jffs2-post.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+# Build the jffs2 root filesystem image
+#
+################################################################################
+
+JFFS2_OPTS := -e $(BR2_TARGET_ROOTFS_JFFS2_EBSIZE)
+SUMTOOL_OPTS := $(JFFS2_OPTS)
+
+ifeq ($(BR2_TARGET_ROOTFS_JFFS2_PAD),y)
+ifneq ($(strip $(BR2_TARGET_ROOTFS_JFFS2_PADSIZE)),0x0)
+JFFS2_OPTS += --pad=$(strip $(BR2_TARGET_ROOTFS_JFFS2_PADSIZE))
+else
+JFFS2_OPTS += -p
+endif
+SUMTOOL_OPTS += -p
+endif
+
+ifeq ($(BR2_TARGET_ROOTFS_JFFS2_LE),y)
+JFFS2_OPTS += -l
+SUMTOOL_OPTS += -l
+endif
+
+ifeq ($(BR2_TARGET_ROOTFS_JFFS2_BE),y)
+JFFS2_OPTS += -b
+SUMTOOL_OPTS += -b
+endif
+
+JFFS2_OPTS += -s $(BR2_TARGET_ROOTFS_JFFS2_PAGESIZE)
+ifeq ($(BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER),y)
+JFFS2_OPTS += -n
+SUMTOOL_OPTS += -n
+endif
+
+ROOTFS_JFFS2_DEPENDENCIES = host-mtd
+
+ifneq ($(BR2_TARGET_ROOTFS_JFFS2_SUMMARY),)
+define ROOTFS_JFFS2_CMD
+	$(MKFS_JFFS2) $(JFFS2_OPTS) -d $(1) -o $@.nosummary && \
+	$(SUMTOOL) $(SUMTOOL_OPTS) -i $@.nosummary -o $@ && \
+	rm $@.nosummary
+endef
+else
+define ROOTFS_JFFS2_CMD
+	$(MKFS_JFFS2) $(JFFS2_OPTS) -d $(TARGET_DIR) -o $@
+endef
+endif
+
+$(eval $(call ROOTFS_TARGETS,jffs2,$(JFFS2_SUBFS)))
diff --git a/fs/jffs2/jffs2-pre.mk b/fs/jffs2/jffs2-pre.mk
new file mode 100644
index 0000000..e647cce
--- /dev/null
+++ b/fs/jffs2/jffs2-pre.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# Define JFFS2 filesystems
+#
+################################################################################
+
+JFFS2_SUBFS = $(if $(BR2_BUILD_SUB_FILESYSTEMS),$(BR2_JFFS2_SUB_FILESYSTEMS),/)
diff --git a/fs/romfs/Config.in b/fs/romfs/Config.in
index 84944a0..5db5c3b 100644
--- a/fs/romfs/Config.in
+++ b/fs/romfs/Config.in
@@ -2,3 +2,15 @@ config BR2_TARGET_ROOTFS_ROMFS
 	bool "romfs root filesystem"
 	help
 	  Build a romfs image of the root filesystem.
+
+if BR2_BUILD_SUB_FILESYSTEMS
+config BR2_ROMFS_SUB_FILESYSTEMS
+	string "Sub-filesystems to build as a ROMFS filesystem"
+	default "/"
+	depends on BR2_TARGET_ROOTFS_ROMFS
+	help
+	  Provide a space-separated list of the root directories of all
+	  filesystems. For example to build a root filesystem with a
+	  separate /usr filesystem, enter:
+	    / /usr
+endif # BR2_BUILD_SUB_FILESYSTEMS
diff --git a/fs/romfs/romfs-post.mk b/fs/romfs/romfs-post.mk
new file mode 100644
index 0000000..2c93740
--- /dev/null
+++ b/fs/romfs/romfs-post.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# Build the romfs root filesystem image
+#
+################################################################################
+
+ROMFS_TARGET=$(IMAGE).romfs
+
+ROOTFS_ROMFS_DEPENDENCIES = host-genromfs
+
+define ROOTFS_ROMFS_CMD
+	$(HOST_DIR)/usr/bin/genromfs -d $(1) -f $@
+endef
+
+$(eval $(call ROOTFS_TARGETS,romfs,$(ROMFS_SUBFS)))
diff --git a/fs/romfs/romfs-pre.mk b/fs/romfs/romfs-pre.mk
new file mode 100644
index 0000000..ce5d279
--- /dev/null
+++ b/fs/romfs/romfs-pre.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# Define romfs filesystems
+#
+################################################################################
+
+ROMFS_SUBFS = $(if $(BR2_BUILD_SUB_FILESYSTEMS),$(BR2_ROMFS_SUB_FILESYSTEMS),/)
diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
index 817909d..f4b27c0 100644
--- a/fs/squashfs/Config.in
+++ b/fs/squashfs/Config.in
@@ -3,6 +3,18 @@ config BR2_TARGET_ROOTFS_SQUASHFS
 	help
 	  Build a squashfs root filesystem
 
+if BR2_BUILD_SUB_FILESYSTEMS
+config BR2_SQUASHFS_SUB_FILESYSTEMS
+	string "Sub-filesystems to build with squashfs"
+	default "/"
+	depends on BR2_TARGET_ROOTFS_SQUASHFS
+	help
+	  Provide a space-separated list of the root directories of all
+	  filesystems. For example to build a root filesystem with a
+	  separate /usr filesystem, enter:
+	    / /usr
+endif # BR2_BUILD_SUB_FILESYSTEMS
+
 if BR2_TARGET_ROOTFS_SQUASHFS
 
 choice
diff --git a/fs/squashfs/squashfs-post.mk b/fs/squashfs/squashfs-post.mk
new file mode 100644
index 0000000..9c8fe3f
--- /dev/null
+++ b/fs/squashfs/squashfs-post.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# Build the squashfs root filesystem image
+#
+################################################################################
+
+ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs
+
+ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZO),y)
+ROOTFS_SQUASHFS_ARGS += -comp lzo
+else
+ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZMA),y)
+ROOTFS_SQUASHFS_ARGS += -comp lzma
+else
+ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_XZ),y)
+ROOTFS_SQUASHFS_ARGS += -comp xz
+else
+ROOTFS_SQUASHFS_ARGS += -comp gzip
+endif
+endif
+endif
+
+define ROOTFS_SQUASHFS_CMD
+	$(HOST_DIR)/usr/bin/mksquashfs $(1) $@ -noappend \
+		$(ROOTFS_SQUASHFS_ARGS) && \
+	chmod 0644 $@
+endef
+
+$(eval $(call ROOTFS_TARGETS,squashfs,$(SQUASHFS_SUBFS)))
diff --git a/fs/squashfs/squashfs-pre.mk b/fs/squashfs/squashfs-pre.mk
new file mode 100644
index 0000000..be95a96
--- /dev/null
+++ b/fs/squashfs/squashfs-pre.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# Define squashfs filesystems
+#
+################################################################################
+
+SQUASHFS_SUBFS = $(if $(BR2_BUILD_SUB_FILESYSTEMS),$(BR2_SQUASHFS_SUB_FILESYSTEMS),/)
diff --git a/fs/tar/Config.in b/fs/tar/Config.in
index 63663ec..e65b3fa 100644
--- a/fs/tar/Config.in
+++ b/fs/tar/Config.in
@@ -4,6 +4,18 @@ config BR2_TARGET_ROOTFS_TAR
 	help
 	  Build a tar archive of the root filesystem
 
+if BR2_BUILD_SUB_FILESYSTEMS
+config BR2_TAR_SUB_FILESYSTEMS
+	string "Sub-filesystems to build with tar"
+	default "/"
+	depends on BR2_TARGET_ROOTFS_TAR
+	help
+	  Provide a space-separated list of the root directories of all
+	  filesystems. For example to build a root filesystem with a
+	  separate /usr filesystem, enter:
+	    / /usr
+endif # BR2_BUILD_SUB_FILESYSTEMS
+
 choice
 	prompt "Compression method"
 	default BR2_TARGET_ROOTFS_TAR_NONE
diff --git a/fs/tar/tar-post.mk b/fs/tar/tar-post.mk
new file mode 100644
index 0000000..9acf8d4
--- /dev/null
+++ b/fs/tar/tar-post.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# tar to archive target filesystem
+#
+################################################################################
+
+TAR_OPTS := $(BR2_TARGET_ROOTFS_TAR_OPTIONS)
+
+define ROOTFS_TAR_CMD
+ tar -c$(TAR_OPTS)f $@ -C $(1) .
+endef
+
+$(eval $(call ROOTFS_TARGETS,tar,$(TAR_SUBFS)))
diff --git a/fs/tar/tar-pre.mk b/fs/tar/tar-pre.mk
new file mode 100644
index 0000000..771c5c4
--- /dev/null
+++ b/fs/tar/tar-pre.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# Define tar-archived filesystems
+#
+################################################################################
+
+TAR_SUBFS = $(if $(BR2_BUILD_SUB_FILESYSTEMS),$(BR2_TAR_SUB_FILESYSTEMS),/)
diff --git a/fs/ubifs/Config.in b/fs/ubifs/Config.in
index ff604c5..1aeca86 100644
--- a/fs/ubifs/Config.in
+++ b/fs/ubifs/Config.in
@@ -3,6 +3,18 @@ config BR2_TARGET_ROOTFS_UBIFS
 	help
 	  Build a ubifs root filesystem
 
+if BR2_BUILD_SUB_FILESYSTEMS
+config BR2_UBIFS_SUB_FILESYSTEMS
+	string "Sub-filesystems to build with ubifs"
+	default "/"
+	depends on BR2_TARGET_ROOTFS_UBIFS
+	help
+	  Provide a space-separated list of the root directories of all
+	  filesystems. For example to build a root filesystem with a
+	  separate /usr filesystem, enter:
+	    / /usr
+endif # BR2_BUILD_SUB_FILESYSTEMS
+
 if BR2_TARGET_ROOTFS_UBIFS
 
 config BR2_TARGET_ROOTFS_UBIFS_LEBSIZE
diff --git a/fs/ubifs/ubi-post.mk b/fs/ubifs/ubi-post.mk
new file mode 100644
index 0000000..aa9af24
--- /dev/null
+++ b/fs/ubifs/ubi-post.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# Embed the ubifs image into an ubi image
+#
+################################################################################
+
+UBI_UBINIZE_OPTS := -m $(BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE)
+UBI_UBINIZE_OPTS += -p $(BR2_TARGET_ROOTFS_UBI_PEBSIZE)
+ifneq ($(BR2_TARGET_ROOTFS_UBI_SUBSIZE),0)
+UBI_UBINIZE_OPTS += -s $(BR2_TARGET_ROOTFS_UBI_SUBSIZE)
+endif
+
+UBI_UBINIZE_OPTS += $(call qstrip,$(BR2_TARGET_ROOTFS_UBI_OPTS))
+
+ROOTFS_UBI_DEPENDENCIES = rootfs-ubifs
+
+ifeq ($(BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG),y)
+UBINIZE_CONFIG_FILE_PATH = $(call qstrip,$(BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE))
+else
+UBINIZE_CONFIG_FILE_PATH = fs/ubifs/ubinize.cfg
+endif
+
+define ROOTFS_UBI_CMD
+	$(INSTALL) -m 0644 $(UBINIZE_CONFIG_FILE_PATH) $(BUILD_DIR)/ubinize.cfg ;\
+	$(SED) 's;BR2_ROOTFS_UBIFS_PATH;$@fs;' $(BUILD_DIR)/ubinize.cfg ;\
+	$(HOST_DIR)/usr/sbin/ubinize -o $@ $(UBI_UBINIZE_OPTS) $(BUILD_DIR)/ubinize.cfg ;\
+	rm $(BUILD_DIR)/ubinize.cfg
+endef
+
+$(eval $(call ROOTFS_TARGETS,ubi,$(UBI_SUBFS)))
diff --git a/fs/ubifs/ubi-pre.mk b/fs/ubifs/ubi-pre.mk
new file mode 100644
index 0000000..da6b800
--- /dev/null
+++ b/fs/ubifs/ubi-pre.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# Define embedded UBI filesystems
+#
+################################################################################
+
+UBI_SUBFS = $(if $(BR2_BUILD_SUB_FILESYSTEMS),$(BR2_UBI_SUB_FILESYSTEMS),/)
diff --git a/fs/ubifs/ubifs-post.mk b/fs/ubifs/ubifs-post.mk
new file mode 100644
index 0000000..7e5d88e
--- /dev/null
+++ b/fs/ubifs/ubifs-post.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# Build the ubifs root filesystem image
+#
+################################################################################
+
+UBIFS_OPTS := -e $(BR2_TARGET_ROOTFS_UBIFS_LEBSIZE) -c $(BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT) -m $(BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE)
+
+ifeq ($(BR2_TARGET_ROOTFS_UBIFS_RT_ZLIB),y)
+UBIFS_OPTS += -x zlib
+endif
+ifeq ($(BR2_TARGET_ROOTFS_UBIFS_RT_LZO),y)
+UBIFS_OPTS += -x lzo
+endif
+ifeq ($(BR2_TARGET_ROOTFS_UBIFS_RT_NONE),y)
+UBIFS_OPTS += -x none
+endif
+
+UBIFS_OPTS += $(call qstrip,$(BR2_TARGET_ROOTFS_UBIFS_OPTS))
+
+ROOTFS_UBIFS_DEPENDENCIES = host-mtd
+
+define ROOTFS_UBIFS_CMD
+	$(HOST_DIR)/usr/sbin/mkfs.ubifs -d $(1) $(UBIFS_OPTS) -o $@
+endef
+
+$(eval $(call ROOTFS_TARGETS,ubifs,$(UBIFS_SUBFS)))
diff --git a/fs/ubifs/ubifs-pre.mk b/fs/ubifs/ubifs-pre.mk
new file mode 100644
index 0000000..25a8fde
--- /dev/null
+++ b/fs/ubifs/ubifs-pre.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# Define ubifs filesystems
+#
+################################################################################
+
+UBIFS_SUBFS = $(if $(BR2_BUILD_SUB_FILESYSTEMS),$(BR2_UBIFS_SUB_FILESYSTEMS),/)
diff --git a/fs/yaffs2/Config.in b/fs/yaffs2/Config.in
index 27da4ba..23fe6fb 100644
--- a/fs/yaffs2/Config.in
+++ b/fs/yaffs2/Config.in
@@ -2,3 +2,15 @@ config BR2_TARGET_ROOTFS_YAFFS2
 	bool "yaffs2 root filesystem"
 	help
 	  Build a yaffs2 root filesystem
+
+if BR2_BUILD_SUB_FILESYSTEMS
+config BR2_YAFFS2_SUB_FILESYSTEMS
+	string "Sub-filesystems to build with YAFFS2"
+	default "/"
+	depends on BR2_TARGET_ROOTFS_YAFFS2
+	help
+	  Provide a space-separated list of the root directories of all
+	  filesystems. For example to build a root filesystem with a
+	  separate /usr filesystem, enter:
+	    / /usr
+endif # BR2_BUILD_SUB_FILESYSTEMS
diff --git a/fs/yaffs2/yaffs-post.mk b/fs/yaffs2/yaffs-post.mk
new file mode 100644
index 0000000..84a1072
--- /dev/null
+++ b/fs/yaffs2/yaffs-post.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# Build the yaffs2 root filesystem image
+#
+################################################################################
+
+ROOTFS_YAFFS2_DEPENDENCIES = host-yaffs2utils
+
+define ROOTFS_YAFFS2_CMD
+	$(HOST_DIR)/usr/bin/mkyaffs2 --all-root $(1) $@
+endef
+
+$(eval $(call ROOTFS_TARGETS,yaffs2,$(YAFFS2_SUBFS)))
diff --git a/fs/yaffs2/yaffs-pre.mk b/fs/yaffs2/yaffs-pre.mk
new file mode 100644
index 0000000..2f96b95
--- /dev/null
+++ b/fs/yaffs2/yaffs-pre.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# Define YAFFS2 filesystems
+#
+################################################################################
+
+YAFFS2_SUBFS = $(if $(BR2_BUILD_SUB_FILESYSTEMS),$(BR2_YAFFS2_SUB_FILESYSTEMS),/)
-- 
1.8.5.1
