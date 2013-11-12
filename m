From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Nov 2013 00:25:18 +0100
Subject: [Buildroot] [git commit branch/next] post-{build,
	images} hooks: export BUILD_DIR too
Message-ID: <20131112233230.149779BC19@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cfd497d4c3b4d79319a2f90f38ce3fc0fd482356
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Also export BUILD_DIR for post-{build,images} hooks, so they do have
a place to store generated files.

Note: this will be more einteresting for the instrumentation of steps,
to come in a later patch.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile                         |    4 ++--
 docs/manual/customize-rootfs.txt |    5 +++--
 package/Makefile.in              |    6 ++++++
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 20c9bbf..a425875 100644
--- a/Makefile
+++ b/Makefile
@@ -513,7 +513,7 @@ endif
 
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
 		$(call MESSAGE,"Executing post-build script $(s)"); \
-		$(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
+		$(USER_HOOKS_EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
 ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
 LOCALE_WHITELIST=$(BUILD_DIR)/locales.nopurge
@@ -559,7 +559,7 @@ endif
 target-post-image:
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
 		$(call MESSAGE,"Executing post-image script $(s)"); \
-		$(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
+		$(USER_HOOKS_EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
 toolchain-eclipse-register:
 	./support/scripts/eclipse-register-toolchain `readlink -f $(O)` $(notdir $(TARGET_CROSS)) $(BR2_ARCH)
diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index 49a6b4b..450b3d5 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -41,6 +41,7 @@ there are a few ways to customize the resulting target filesystem.
     - +BUILDROOT_CONFIG+: the path to the Buildroot .config file
     - +HOST_DIR+, +STAGING_DIR+, +TARGET_DIR+: see
       xref:generic-package-reference[]
+    - +BUILD_DIR+: the directory where packages are extracted and built
     - +BINARIES_DIR+: the place where all binary files (aka images) are
       stored
     - +BASE_DIR+: the base output directory
@@ -78,8 +79,8 @@ in one of these _post-image scripts_ will require special handling
 
 Just like for the _post-build scripts_ mentioned above, you also have
 access to the following environment variables from your _post-image
-scripts_: +BUILDROOT_CONFIG+, +HOST_DIR+, +STAGING_DIR+, +TARGET_DIR+,
-+BINARIES_DIR+ and +BASE_DIR+.
+scripts_: +BUILDROOT_CONFIG+, +BUILD_DIR+, +HOST_DIR+, +STAGING_DIR+,
++TARGET_DIR+, +BINARIES_DIR+ and +BASE_DIR+.
 
 Additionally, each of the +BR2_ROOTFS_POST_BUILD_SCRIPT+ and
 +BR2_ROOTFS_POST_IMAGE_SCRIPT+ scripts will be passed the arguments
diff --git a/package/Makefile.in b/package/Makefile.in
index 612f3c7..5d52fbd 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -275,6 +275,12 @@ HOST_MAKE_ENV=PATH=$(HOST_PATH) \
 		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig" \
 		PERLLIB="$(HOST_DIR)/usr/lib/perl"
 
+# This extra environment we can not export ourselves (eg. because some
+# packages use that variable internally, eg. uboot), so we have to
+# explicitly pass it to user-supplied external hooks (eg. post-build,
+# post-images)
+USER_HOOKS_EXTRA_ENV=\
+	BUILD_DIR=$(BUILD_DIR)
 
 ################################################################################
 # settings we need to pass to configure
