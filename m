From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Sat,  9 Mar 2013 18:04:12 -0300
Subject: [Buildroot] [RFC/PATCH] fs/common.mk: Fix wrong double dollar usage
Message-ID: <1362863052-8781-1-git-send-email-ezequiel.garcia@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Double dollar sign is used to put an explicit dollar sign,
for instance, when writing a makefile rule.

In this case, there are some makefile conditionals where
makefile variables are evaluated using double dollar signs
instead of single dollar, which is wrong.

In particular, this fixes a buildroot 'make' stall
when building with an empty device table (empty BR2_ROOTFS_DEVICE_TABLE).

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
I'm sending this as RFC because I'm new to buildroot
and because I'm not a makefile wizard.
AFAIK, this fixes a real bug in my compilation,
as explained in the commit message.

 fs/common.mk |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 8b5b2f2..700dc00 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -47,9 +47,9 @@ $$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
 	rm -f $$(FAKEROOT_SCRIPT)
 	rm -f $$(TARGET_DIR_WARNING_FILE)
 	echo "chown -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
-ifneq ($$(ROOTFS_DEVICE_TABLES),)
+ifneq ($(ROOTFS_DEVICE_TABLES),)
 	cat $$(ROOTFS_DEVICE_TABLES) > $$(FULL_DEVICE_TABLE)
-ifeq ($$(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
+ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
 	printf '$$(subst $$(sep),\n,$$(PACKAGES_DEVICES_TABLE))' >> $$(FULL_DEVICE_TABLE)
 endif
 	printf '$$(subst $$(sep),\n,$$(PACKAGES_PERMISSIONS_TABLE))' >> $$(FULL_DEVICE_TABLE)
@@ -61,13 +61,13 @@ endif
 	cp support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
 	- at rm -f $$(FAKEROOT_SCRIPT) $$(FULL_DEVICE_TABLE)
 	$$(foreach hook,$$(ROOTFS_$(2)_POST_GEN_HOOKS),$$(call $$(hook))$$(sep))
-ifeq ($$(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
+ifeq ($(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
 	gzip -9 -c $$@ > $$@.gz
 endif
-ifeq ($$(BR2_TARGET_ROOTFS_$(2)_BZIP2),y)
+ifeq ($(BR2_TARGET_ROOTFS_$(2)_BZIP2),y)
 	bzip2 -9 -c $$@ > $$@.bz2
 endif
-ifeq ($$(BR2_TARGET_ROOTFS_$(2)_LZMA),y)
+ifeq ($(BR2_TARGET_ROOTFS_$(2)_LZMA),y)
 	$$(LZMA) -9 -c $$@ > $$@.lzma
 endif
 
@@ -76,7 +76,7 @@ rootfs-$(1)-show-depends:
 
 rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1) $$(ROOTFS_$(2)_POST_TARGETS)
 
-ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
+ifeq ($(BR2_TARGET_ROOTFS_$(2)),y)
 TARGETS += rootfs-$(1)
 endif
 endef
-- 
1.7.8.6
