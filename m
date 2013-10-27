From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Oct 2013 17:24:10 +0000
Subject: [Buildroot] [PATCH 1/4] post-{build,
	images} hooks: export BUILD_DIR too
In-Reply-To: <cover.1382894622.git.yann.morin.1998@free.fr>
References: <cover.1382894622.git.yann.morin.1998@free.fr>
Message-ID: <a356a9112eac610a00a35e48fa9a04a81a460fe0.1382894622.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Also export BUILD_DIR for post-{build,images} hooks, so they do have
a place to store generated files.

Note: this will be more einteresting for the instrumentation of steps,
to come in a later patch.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile                         | 4 ++--
 docs/manual/customize-rootfs.txt | 5 +++--
 package/Makefile.in              | 5 +++++
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index f266e2d..0113f75 100644
--- a/Makefile
+++ b/Makefile
@@ -511,7 +511,7 @@ endif
 
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
 		$(call MESSAGE,"Executing post-build script $(s)"); \
-		$(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
+		$(USER_HOOKS_EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
 ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
 LOCALE_WHITELIST=$(BUILD_DIR)/locales.nopurge
@@ -557,7 +557,7 @@ endif
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
index 612f3c7..2224f27 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -275,6 +275,11 @@ HOST_MAKE_ENV=PATH=$(HOST_PATH) \
 		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig" \
 		PERLLIB="$(HOST_DIR)/usr/lib/perl"
 
+# This extra environment we can not export ourselves, so we have
+# to expicitly pass it to user-supplied external hooks (eg.
+# post-build, post-images)
+USER_HOOKS_EXTRA_ENV=\
+	BUILD_DIR=$(BUILD_DIR)
 
 ################################################################################
 # settings we need to pass to configure
-- 
1.8.1.2
