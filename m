From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Aug 2015 00:38:18 +0200
Subject: [Buildroot] [PATCH 3/5] instrumentation: add step-{start,
	end} to target-finalize
In-Reply-To: <cover.1439159331.git.yann.morin.1998@free.fr>
References: <cover.1439159331.git.yann.morin.1998@free.fr>
Message-ID: <ec81397bbf81fa42a769eef1ad0afbb9fc231cdb.1439159331.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Call the global instrumentation hooks at the start and end of the
target-finalize. This will allow users to run their own instrumentation
hooks (via BR2_INSTRUMENTATION_SCRIPTS) on a completely populated
target/ directory.

Since there is no package involved in target-finalise, we pass the
literal 'target' instead.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile                            |  3 +++
 docs/manual/debugging-buildroot.txt | 18 ++++++++++--------
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index b4cef3f..e70bbd6 100644
--- a/Makefile
+++ b/Makefile
@@ -557,6 +557,7 @@ endif
 $(TARGETS_ROOTFS): target-finalize
 
 target-finalize: $(PACKAGES)
+	@$(call step_start,finalize,target)
 	@$(call MESSAGE,"Finalizing target directory")
 	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
@@ -623,6 +624,8 @@ endif
 		$(call MESSAGE,"Executing post-build script $(s)"); \
 		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
+	@$(call step_end,finalize,target)
+
 target-post-image: $(TARGETS_ROOTFS) target-finalize
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
 		$(call MESSAGE,"Executing post-image script $(s)"); \
diff --git a/docs/manual/debugging-buildroot.txt b/docs/manual/debugging-buildroot.txt
index 66ccfd1..7d05cd3 100644
--- a/docs/manual/debugging-buildroot.txt
+++ b/docs/manual/debugging-buildroot.txt
@@ -6,15 +6,16 @@
 == Debugging Buildroot
 
 It is possible to instrument the steps +Buildroot+ does when building
-packages or assembling rootfs images. Define the variable
-+BR2_INSTRUMENTATION_SCRIPTS+ to contain the path of one or more scripts
-(or other executables), in a space-separated list, you want called
-before and after each step. The scripts are called in sequence, with
-three parameters:
+packages, finalizing the target directory, or assembling rootfs images.
+Define the variable +BR2_INSTRUMENTATION_SCRIPTS+ to contain the path
+of one or more scripts (or other executables), in a space-separated
+list, you want called before and after each step. The scripts are called
+in sequence, with three parameters:
 
   - +start+ or +end+ to denote the start (resp. the end) of a step;
   - the name of the step about to be started, or which just ended;
-  - the name of the package or rootfs image.
+  - the name of the package or rootfs image, or +target+ when finalizing
+    the target directory.
 
 For example :
 
@@ -33,9 +34,10 @@ The list of package-related steps is:
   - +install-staging+, when a target-package is installed in +$(STAGING_DIR)+
   - +install-image+, when a target-package installs files in +$(BINARIES_DIR)+
 
-For rootfs images, there is a single step:
+The list of steps not related to packages is:
 
-  - +assemble+
+  - +finalize+, when finalizing the target directory
+  - +assemble+, when assembling a rootfs image
 
 The script has access to the following variables:
 
-- 
1.9.1
