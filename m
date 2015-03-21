From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 21 Mar 2015 20:27:45 +0200
Subject: [Buildroot] [RFC 02/11] per-package .users and .files lists
In-Reply-To: <cover.1426960081.git.alex.suykov@gmail.com>
References: <cover.1426960081.git.alex.suykov@gmail.com>
Message-ID: <e1c1a71680aa988903d278c9413cef7b48bad2ad.1426960081.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following .run and .hash files, move package-specific users and
file permissions from .mk strings into standalone files, to be
picked up by pkg-generic code.
No additional code in package .mk is necessary.

This change does not simplify things much at present, but it
removes inter-package dependency via make variables.
Without this patch, reading all enabled package/*/*.mk files from
a single Makefile was necessary to build user and permission lists.
With this patch, the data is stored outside of make, possibly
allowing one make invocation per package .mk file in the future.

To keep installed per-package .users and .files, a new directory
is introduced: output/parts.
The directory is meant for stuff that is installed during build stage
but does not belong in the target/ directory, at least not without
some processing.
---
 Makefile                   |  1 +
 fs/common.mk               | 21 +++++++++++++--------
 package/pkg-generic.mk     |  2 ++
 support/init/install-parts |  5 +++++
 4 files changed, 21 insertions(+), 8 deletions(-)
 create mode 100755 support/init/install-parts

diff --git a/Makefile b/Makefile
index 33a89b1..98f67d3 100644
--- a/Makefile
+++ b/Makefile
@@ -156,6 +156,7 @@ endif
 BR_GRAPH_OUT := $(or $(BR2_GRAPH_OUT),pdf)
 
 BUILD_DIR := $(BASE_DIR)/build
+PARTS_DIR := $(BASE_DIR)/parts
 BINARIES_DIR := $(BASE_DIR)/images
 TARGET_DIR := $(BASE_DIR)/target
 # initial definition so that 'make clean' works for most users, even without
diff --git a/fs/common.mk b/fs/common.mk
index 5d07f00..e60c82f 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -28,12 +28,14 @@
 # BR2_TARGET_ROOTFS_$(FSTYPE)_LZMA exist and are enabled, then the
 # macro will automatically generate a compressed filesystem image.
 
-FAKEROOT_SCRIPT = $(BUILD_DIR)/_fakeroot.fs
-FULL_DEVICE_TABLE = $(BUILD_DIR)/_device_table.txt
+FAKEROOT_SCRIPT = $(PARTS_DIR)/fakeroot.fs
+FULL_DEVICE_TABLE = $(PARTS_DIR)/device_table.txt
 ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE) \
 	$(BR2_ROOTFS_STATIC_DEVICE_TABLE))
-USERS_TABLE = $(BUILD_DIR)/_users_table.txt
+USERS_TABLE = $(PARTS_DIR)/users_table.txt
 ROOTFS_USERS_TABLES = $(call qstrip,$(BR2_ROOTFS_USERS_TABLES))
+PARTS_LIST_USERS = $(wildcard $(PARTS_DIR)/users/*.users)
+PARTS_LIST_FILES = $(wildcard $(PARTS_DIR)/files/*.files)
 
 # Since this function will be called from within an $(eval ...)
 # all variable references except the arguments must be $$-quoted.
@@ -41,7 +43,7 @@ define ROOTFS_TARGET_INTERNAL
 
 # extra deps
 ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs \
-	$$(if $$(PACKAGES_USERS),host-mkpasswd)
+	$$(if $$(PARTS_LIST_USERS),host-mkpasswd)
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
 ROOTFS_$(2)_COMPRESS_EXT = .gz
@@ -77,16 +79,19 @@ $$(BINARIES_DIR)/rootfs.$(1): target-finalize $$(ROOTFS_$(2)_DEPENDENCIES)
 	echo "chown -h -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 ifneq ($$(ROOTFS_DEVICE_TABLES),)
 	cat $$(ROOTFS_DEVICE_TABLES) > $$(FULL_DEVICE_TABLE)
-ifeq ($$(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
-	printf '$$(subst $$(sep),\n,$$(PACKAGES_DEVICES_TABLE))' >> $$(FULL_DEVICE_TABLE)
+ifdef PARTS_LIST_FILES
+	cat $$(PARTS_LIST_FILES) \
+		$$(if $$(BR2_ROOTFS_DEVICE_CREATION_STATIC),,| grep -v ^/dev) \
+			>> $$(FULL_DEVICE_TABLE)
 endif
-	printf '$$(subst $$(sep),\n,$$(PACKAGES_PERMISSIONS_TABLE))' >> $$(FULL_DEVICE_TABLE)
 	echo "$$(HOST_DIR)/usr/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 endif
 ifneq ($$(ROOTFS_USERS_TABLES),)
 	cat $$(ROOTFS_USERS_TABLES) >> $$(USERS_TABLE)
 endif
-	printf '$$(subst $$(sep),\n,$$(PACKAGES_USERS))' >> $$(USERS_TABLE)
+ifdef PARTS_LIST_USERS
+	cat $$(PARTS_LIST_USERS) >> $$(USERS_TABLE)
+endif
 	PATH=$$(BR_PATH) $$(TOPDIR)/support/scripts/mkusers $$(USERS_TABLE) $$(TARGET_DIR) >> $$(FAKEROOT_SCRIPT)
 	echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)
 	chmod a+x $$(FAKEROOT_SCRIPT)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index fe7de8a..009b116 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -774,6 +774,8 @@ ifndef $(2)_INSTALL_INIT
 define $(2)_INSTALL_INIT
 	$$(call ifargs,support/init/install-run $$(BR2_INIT) \
 		$$($$(PKG)_INIT_SUBST),$$(addprefix package/$1/,$$($$(PKG)_INIT)))
+	$$(call ifargs,support/init/install-parts users,$$(wildcard package/$1/*.users))
+	$$(call ifargs,support/init/install-parts files,$$(wildcard package/$1/*.files))
 	$$(call ifargs,support/init/install-tmpconf $$(BR2_INIT),$$(wildcard package/$1/*.tmp.conf))
 endef
 endif
diff --git a/support/init/install-parts b/support/init/install-parts
new file mode 100755
index 0000000..f5305fd
--- /dev/null
+++ b/support/init/install-parts
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+part="$1"; shift; test -z "$part" && exit 1
+mkdir -p output/parts/$part/
+cp "$@" output/parts/$part/
-- 
2.0.3
