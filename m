From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 10 Jul 2013 08:52:21 +0200
Subject: [Buildroot] [git commit] system: add option to pass extra args to
	post-build and post-image scripts
Message-ID: <20130710075652.D59149A655@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1f97b3a0587df7a44249ccf3e47c6d0d3087fa0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It can be useful to have different configuration use the same post-build
and/or post-image scripts as they share a common infrastructure, but yet
have minor differentiation.

This option allows passing zero or more additional arguments to each
post-build or post-image script.

The same set of extra arguments are passed to all scripts, it is not
possible to pass different arguments to each script.

[Peter: fix help text, post-image gets called with the images dir]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile                         |    4 ++--
 docs/manual/customize-rootfs.txt |   19 ++++++++++++-------
 system/Config.in                 |   26 +++++++++++++++++++++-----
 3 files changed, 35 insertions(+), 14 deletions(-)

diff --git a/Makefile b/Makefile
index 955e684..f6e9965 100644
--- a/Makefile
+++ b/Makefile
@@ -512,7 +512,7 @@ endif
 
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
 		$(call MESSAGE,"Executing post-build script $(s)"); \
-		$(s) $(TARGET_DIR)$(sep))
+		$(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
 ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
 LOCALE_WHITELIST=$(BUILD_DIR)/locales.nopurge
@@ -558,7 +558,7 @@ endif
 target-post-image:
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
 		$(call MESSAGE,"Executing post-image script $(s)"); \
-		$(s) $(BINARIES_DIR)$(sep))
+		$(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
 toolchain-eclipse-register:
 	./support/scripts/eclipse-register-toolchain `readlink -f $(O)` $(notdir $(TARGET_CROSS)) $(BR2_ARCH)
diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index 7ff8d8b..49a6b4b 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -69,15 +69,20 @@ specify a space-separated list of scripts in the
 found in the +System configuration+ menu as well.
 
 Each of those scripts will be called with the path to the +images+
-output directory as first and unique argument, and will be executed
-with the main Buildroot source directory as the current
-directory. Those scripts will be executed as the user that executes
-Buildroot, which should normally not be the root user. Therefore, any
-action requiring root permissions in one of these _post-image scripts_
-will require special handling (usage of fakeroot or sudo), which is
-left to the script developer.
+output directory as first argument, and will be executed with the main
+Buildroot source directory as the current directory. Those scripts will
+be executed as the user that executes Buildroot, which should normally
+not be the root user. Therefore, any action requiring root permissions
+in one of these _post-image scripts_ will require special handling
+(usage of fakeroot or sudo), which is left to the script developer.
 
 Just like for the _post-build scripts_ mentioned above, you also have
 access to the following environment variables from your _post-image
 scripts_: +BUILDROOT_CONFIG+, +HOST_DIR+, +STAGING_DIR+, +TARGET_DIR+,
 +BINARIES_DIR+ and +BASE_DIR+.
+
+Additionally, each of the +BR2_ROOTFS_POST_BUILD_SCRIPT+ and
++BR2_ROOTFS_POST_IMAGE_SCRIPT+ scripts will be passed the arguments
+specified in +BR2_ROOTFS_POST_SCRIPT_ARGS+ (if that is not empty).
+All the scripts will be passed the exact same set of arguments, it
+is not possible to pass different sets of arguments to each script.
diff --git a/system/Config.in b/system/Config.in
index c0e4f4a..d41f184 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -272,9 +272,9 @@ config BR2_ROOTFS_POST_BUILD_SCRIPT
 	  add-ons and the like, so the generated files can be used directly
 	  without further processing.
 
-	  These scripts are called with the target directory name as first and
-	  only argument. Make sure the exit code of those scripts are 0,
-	  otherwise make will stop after calling them.
+	  These scripts are called with the target directory name as first
+	  argument. Make sure the exit code of those scripts are 0, otherwise
+	  make will stop after calling them.
 
 config BR2_ROOTFS_POST_IMAGE_SCRIPT
 	string "Custom scripts to run after creating filesystem images"
@@ -291,7 +291,23 @@ config BR2_ROOTFS_POST_IMAGE_SCRIPT
 	  action.
 
 	  These scripts are called with the images directory name as
-	  first and only argument. The script is executed from the
-	  main Buildroot source directory as the current directory.
+	  first argument. The script is executed from the main Buildroot
+	  source directory as the current directory.
+
+config BR2_ROOTFS_POST_SCRIPT_ARGS
+	string "Extra post-{build,image} arguments"
+	depends on BR2_ROOTFS_POST_BUILD_SCRIPT != "" || BR2_ROOTFS_POST_IMAGE_SCRIPT != ""
+	help
+	  Pass these aditional arguments to each post-build or post-image
+	  scripts.
+
+	  Note that all the post-build and post-image scripts will be passed
+	  the same set of arguments, you can not pass different arguments to
+	  each script.
+
+	  Note also, as stated in their respective help text, that the first
+	  argument to each post-build or post-image script is the target
+	  directory / images directory. The arguments in this option will be
+	  passed *after* those.
 
 endmenu
