From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  7 Mar 2013 23:04:40 +0100
Subject: [Buildroot] [PATCH 3/6] fs: allow image generators to specify
	file-extension
In-Reply-To: <cover.1362693453.git.yann.morin.1998@free.fr>
References: <cover.1362693453.git.yann.morin.1998@free.fr>
Message-ID: <89f7ec68ff45d56fb1c6e20778032a5a4a1cb004.1362693453.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some filesystems, the generator can output different /versions/ of
the filesystem (eg. ext can output ext{2,3,4}). In this case, it can
be usefull to have the generated rootfs image with the actual version
of the filesystem, rather than the generic name.

Add a second parameter to ROOTFS_TARGET, to specify the extension, and
default to using the generator name.

Thanks to Arnout for the initial idea (my implementation is a bit
different than what he suggested):
    http://lists.busybox.net/pipermail/buildroot/2013-February/067554.html

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 fs/common.mk |   17 +++++++++++++----
 1 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 8b5b2f2..9ba9faa 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -36,13 +36,18 @@ FULL_DEVICE_TABLE = $(BUILD_DIR)/_device_table.txt
 ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE)) \
 	$(call qstrip,$(BR2_ROOTFS_STATIC_DEVICE_TABLE))
 
+# Internal image generation rules
+# Arguments:
+#   $1: name of the image generator (eg. ext, squashfs, tar...)
+#   $2: uppercase of $1
+#   $3: file-extension of the generated image file
 define ROOTFS_TARGET_INTERNAL
 
 # extra deps
 ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs $$(if $$(BR2_TARGET_ROOTFS_$(2)_LZMA),host-lzma)
 
-$$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
-	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
+$$(BINARIES_DIR)/rootfs.$(3): $$(ROOTFS_$(2)_DEPENDENCIES)
+	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(3)")
 	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),$$(call $$(hook))$$(sep))
 	rm -f $$(FAKEROOT_SCRIPT)
 	rm -f $$(TARGET_DIR_WARNING_FILE)
@@ -74,15 +79,19 @@ endif
 rootfs-$(1)-show-depends:
 	@echo $$(ROOTFS_$(2)_DEPENDENCIES)
 
-rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1) $$(ROOTFS_$(2)_POST_TARGETS)
+rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(3) $$(ROOTFS_$(2)_POST_TARGETS)
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
 TARGETS += rootfs-$(1)
 endif
 endef
 
+# Define the way to build a rootfs image (eg. filesystem, tarball...)
+# Arguments:
+#   $1: name of the image generator (eg. ext2, tar...)
+#   $2: file-extension of the generated image (optional, defaults to $1)
 define ROOTFS_TARGET
-$(call ROOTFS_TARGET_INTERNAL,$(1),$(call UPPERCASE,$(1)))
+$(call ROOTFS_TARGET_INTERNAL,$(1),$(call UPPERCASE,$(1)),$(or $(2),$(1)))
 endef
 
 include fs/*/*.mk
-- 
1.7.2.5
