From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Aug 2015 00:38:17 +0200
Subject: [Buildroot] [PATCH 2/5] fs: add instrumentation steps
In-Reply-To: <cover.1439159331.git.yann.morin.1998@free.fr>
References: <cover.1439159331.git.yann.morin.1998@free.fr>
Message-ID: <7a7b0d224e33e098a9898ecc918f74bfd217f2a6.1439159331.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 docs/manual/debugging-buildroot.txt | 17 +++++++++++------
 fs/common.mk                        |  2 ++
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/docs/manual/debugging-buildroot.txt b/docs/manual/debugging-buildroot.txt
index f575fc4..66ccfd1 100644
--- a/docs/manual/debugging-buildroot.txt
+++ b/docs/manual/debugging-buildroot.txt
@@ -6,14 +6,15 @@
 == Debugging Buildroot
 
 It is possible to instrument the steps +Buildroot+ does when building
-packages. Define the variable +BR2_INSTRUMENTATION_SCRIPTS+ to contain
-the path of one or more scripts (or other executables), in a
-space-separated list, you want called before and after each step. The
-scripts are called in sequence, with three parameters:
+packages or assembling rootfs images. Define the variable
++BR2_INSTRUMENTATION_SCRIPTS+ to contain the path of one or more scripts
+(or other executables), in a space-separated list, you want called
+before and after each step. The scripts are called in sequence, with
+three parameters:
 
   - +start+ or +end+ to denote the start (resp. the end) of a step;
   - the name of the step about to be started, or which just ended;
-  - the name of the package.
+  - the name of the package or rootfs image.
 
 For example :
 
@@ -21,7 +22,7 @@ For example :
 make BR2_INSTRUMENTATION_SCRIPTS="/path/to/my/script1 /path/to/my/script2"
 ----
 
-The list of steps is:
+The list of package-related steps is:
 
   - +extract+
   - +patch+
@@ -32,6 +33,10 @@ The list of steps is:
   - +install-staging+, when a target-package is installed in +$(STAGING_DIR)+
   - +install-image+, when a target-package installs files in +$(BINARIES_DIR)+
 
+For rootfs images, there is a single step:
+
+  - +assemble+
+
 The script has access to the following variables:
 
   - +BR2_CONFIG+: the path to the Buildroot .config file
diff --git a/fs/common.mk b/fs/common.mk
index ad1bcf3..4e9427e 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -68,6 +68,7 @@ ROOTFS_$(2)_COMPRESS_CMD = xz -9 -C crc32 -c
 endif
 
 $$(BINARIES_DIR)/rootfs.$(1): target-finalize $$(ROOTFS_$(2)_DEPENDENCIES)
+	@$$(call step_start,assemble,rootfs-$(1))
 	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
 	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),$$(call $$(hook))$$(sep))
 	rm -f $$(FAKEROOT_SCRIPT)
@@ -96,6 +97,7 @@ endif
 ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
 	PATH=$$(BR_PATH) $$(ROOTFS_$(2)_COMPRESS_CMD) $$@ > $$@$$(ROOTFS_$(2)_COMPRESS_EXT)
 endif
+	@$$(call step_end,assemble,rootfs-$(1))
 
 rootfs-$(1)-show-depends:
 	@echo $$(ROOTFS_$(2)_DEPENDENCIES)
-- 
1.9.1
