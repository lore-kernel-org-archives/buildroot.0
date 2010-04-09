From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Apr 2010 16:19:13 +0200
Subject: [Buildroot] [git commit master] target: Add new infrastructure for
	filesystem generation
Message-ID: <20100409142128.B8D8E20E60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=21f3bcc1868022e990c0d7ec4171727722b41fd9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to avoid code duplication between the different filesystem
generation makefile, we introduce a ROOTFS_TARGET macro. Documentation
for this macro is contained in the patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/Makefile.in |    1 +
 target/common.mk   |   68 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+), 0 deletions(-)
 create mode 100644 target/common.mk

diff --git a/target/Makefile.in b/target/Makefile.in
index df980b4..38993e5 100644
--- a/target/Makefile.in
+++ b/target/Makefile.in
@@ -63,6 +63,7 @@ include target/u-boot/Makefile.in
 endif
 
 # and finally build the filesystems/tarballs
+include target/common.mk
 include target/*/*.mk
 
 # kernel rules
diff --git a/target/common.mk b/target/common.mk
new file mode 100644
index 0000000..c7eff74
--- /dev/null
+++ b/target/common.mk
@@ -0,0 +1,68 @@
+#
+# Macro that builds the needed Makefile target to create a root
+# filesystem image.
+#
+# The following variable must be defined before calling this macro
+#
+#  ROOTFS_$(FSTYPE)_CMD, the command that generates the root
+#  filesystem image. A single command is allowed. The filename of the
+#  filesystem image that it must generate is $$@.
+#
+# The following variables can optionaly be defined
+#
+#  ROOTFS_$(FSTYPE)_DEPENDENCIES, the list of dependencies needed to
+#  build the root filesystem (usually host tools)
+#
+#  ROOTFS_$(FSTYPE)_PRE_GEN_HOOKS, a list of hooks to call before
+#  generating the filesystem image
+#
+#  ROOTFS_$(FSTYPE)_POST_GEN_HOOKS, a list of hooks to call after
+#  generating the filesystem image
+#
+# In terms of configuration option, this macro assumes that the
+# BR2_TARGET_ROOTFS_$(FSTYPE) config option allows to enable/disable
+# the generation of a filesystem image of a particular type. If
+# configura options BR2_TARGET_ROOTFS_$(FSTYPE)_GZIP,
+# BR2_TARGET_ROOTFS_$(FSTYPE)_BZIP2 or
+# BR2_TARGET_ROOTFS_$(FSTYPE)_LZMA exist and are enabled, then the
+# macro will automatically generate a compressed filesystem image.
+
+FAKEROOT_SCRIPT = $(BUILD_DIR)/_fakeroot.fs
+
+define ROOTFS_TARGET_INTERNAL
+
+$(IMAGE).$(1): $(ROOTFS_$(2)_DEPENDENCIES) host-fakeroot makedevs $(if $(BR2_TARGET_ROOTFS_$(2)_LZMA),host-lzma)
+	@$(call MESSAGE,"Generating root filesystem image $(IMAGE).$(1)")
+	$(foreach hook,$(ROOTFS_$(2)_PRE_GEN_HOOKS),$(call $(hook))$(sep))
+	rm -f $(FAKEROOT_SCRIPT)
+	touch $(BUILD_DIR)/.fakeroot.00000
+	cat $(BUILD_DIR)/.fakeroot* > $(FAKEROOT_SCRIPT)
+	echo "chown -R 0:0 $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
+ifneq ($(TARGET_DEVICE_TABLE),)
+	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
+endif
+	echo "$(ROOTFS_$(2)_CMD)" >> $(FAKEROOT_SCRIPT)
+	chmod a+x $(FAKEROOT_SCRIPT)
+	$(HOST_DIR)/usr/bin/fakeroot -- $(FAKEROOT_SCRIPT)
+	- at rm -f $(FAKEROOT_SCRIPT)
+	$(foreach hook,$(ROOTFS_$(2)_POST_GEN_HOOKS),$(call $(hook))$(sep))
+ifeq ($$(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
+	gzip -9 -c $$@ > $$@.gz
+endif
+ifeq ($$(BR2_TARGET_ROOTFS_$(2)_BZIP2),y)
+	bzip2 -9 -c $$@ > $$@.bz2
+endif
+ifeq ($$(BR2_TARGET_ROOTFS_$(2)_LZMA),y)
+	$(LZMA) -9 -c $$@ > $$@.lzma
+endif
+
+$(1)-root: $(IMAGE).$(1)
+
+ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
+TARGETS += $(1)-root
+endif
+endef
+
+define ROOTFS_TARGET
+$(call ROOTFS_TARGET_INTERNAL,$(1),$(call UPPERCASE,$(1)))
+endef
\ No newline at end of file
-- 
1.6.3.3
