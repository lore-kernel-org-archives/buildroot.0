From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  4 Jun 2015 17:05:19 +0200
Subject: [Buildroot] [PATCH 01/12] fs/common: add <fs>_POST_GEN_HOOKS support
In-Reply-To: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1433430330-2166-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The common filesystem infrastructure already supports a
<fs>_PRE_GEN_HOOKS variable, which allows filesystem makefiles to
register some actions to be done before the root filesystem image is
generated.

This commit adds a similiar <fs>_POST_GEN_HOOKS variable, which will
allow filesystem makefiles to do some actions after the filesystem
image has been generated. It will initially be used by the iso9660
filesystem to delete the temporary directory it creates.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/common.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/common.mk b/fs/common.mk
index 4387d06..40389bd 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -16,6 +16,9 @@
 #  ROOTFS_$(FSTYPE)_PRE_GEN_HOOKS, a list of hooks to call before
 #  generating the filesystem image
 #
+#  ROOTFS_$(FSTYPE)_POST_GEN_HOOKS, a list of hooks to call after
+#  generating the filesystem image
+#
 #  ROOTFS_$(FSTYPE)_POST_TARGETS, the list of targets that should be
 #  run after running the main filesystem target. This is useful for
 #  initramfs, to rebuild the kernel once the initramfs is generated.
@@ -96,6 +99,7 @@ endif
 ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
 	PATH=$$(BR_PATH) $$(ROOTFS_$(2)_COMPRESS_CMD) $$@ > $$@$$(ROOTFS_$(2)_COMPRESS_EXT)
 endif
+	$$(foreach hook,$$(ROOTFS_$(2)_POST_GEN_HOOKS),$$(call $$(hook))$$(sep))
 
 rootfs-$(1)-show-depends:
 	@echo $$(ROOTFS_$(2)_DEPENDENCIES)
-- 
2.1.0
