Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0220BC369D3
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 21:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF6D880FAF;
	Mon, 21 Apr 2025 21:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O97tkjOAuqpE; Mon, 21 Apr 2025 21:22:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DA5380FFD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DA5380FFD;
	Mon, 21 Apr 2025 21:22:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CC8A61A0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FBA080DA7
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:21:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v0nQe7umABDZ for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 21:21:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D22980DF5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D22980DF5
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:21:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4DF4082B35; Mon, 21 Apr 2025 21:21:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Apr 2025 23:19:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d9e98d85537185f38ca01aa8a6bccfe81f378fdd
X-Git-Newrev: 1956e4e43459dfa0bfe936a6bfb74f5530abf5bf
X-Patchwork-Hint: ignore
Message-Id: <20250421212158.4DF4082B35@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flutter-engine: bump to version
 3.29.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1956e4e43459dfa0bfe936a6bfb74f5530abf5bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As of Flutter 3.27.4, the flutter-engine github repository is archived, and the
flutter-engine source code now resides at https://github.com/flutter/flutter/.

Because of the above, the following changes must occure:

- Paths are now prefixed with engine/src.

- The "name" field in the dot-gclient file is now "./", and the gen-tarball
  script:
   - Makes the dl-tmp/src dir
   - Copies the dot-gclient file to the dl-tmp/src dir
   - Runs gclient.py inside of the dl-tmp/src dir

Without these changes, gclient creates two directores:
dl-tmp/src/flutter and dl-tmp/src/engine, and cloning fails with the following
error:

```
python3: can't open file 'dl-tmp/src/engine/src/flutter/tools/pub_get_offline.py':
[Errno 2] No such file or directory
```

because the file resides at src/flutter/engine/src/flutter/tools.
Changing the name from src/flutter to ./ and running gclient.py directly in
the src directory creates a proper directory structure suitable for compiling.

Of course, this also means there is a new pushd in the gen_tarball method to
move to ${SCRATCH_DIR} to ensure the tarball is generated outside of the
source directory.

Tested with run-tests tests.package.test_flutter.TestFlutter.test_run.

The license file has changed, but it's still BSD-3-Clause.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-disable-pre-canned-sysroot.patch          |  8 ++++----
 .../0002-remove-explicit-x11-dependency.patch      |  8 ++++----
 .../flutter-engine/0003-fix-toolchain-paths.patch  | 10 ++++-----
 ...pkg-config.py-do-not-prepend-sysroot-path.patch |  8 ++++----
 package/flutter-engine/dot-gclient                 |  4 ++--
 package/flutter-engine/flutter-engine.hash         |  2 +-
 package/flutter-engine/flutter-engine.mk           | 24 +++++++++++-----------
 package/flutter-engine/gen-tarball                 |  6 ++++--
 8 files changed, 36 insertions(+), 34 deletions(-)

diff --git a/package/flutter-engine/0001-disable-pre-canned-sysroot.patch b/package/flutter-engine/0001-disable-pre-canned-sysroot.patch
index a9776d7388..2c02fc4948 100644
--- a/package/flutter-engine/0001-disable-pre-canned-sysroot.patch
+++ b/package/flutter-engine/0001-disable-pre-canned-sysroot.patch
@@ -11,13 +11,13 @@ Upstream: https://github.com/flutter/flutter/issues/123073
 Signed-off-by: Joel Winarske <joel.winarsk@gmail.com>
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 ---
- build/config/sysroot.gni | 2 +-
+ engine/src/build/config/sysroot.gni | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/build/config/sysroot.gni b/build/config/sysroot.gni
+diff --git a/engine/src/build/config/sysroot.gni b/engine/src/build/config/sysroot.gni
 index 7987e519d..1de694263 100644
---- a/build/config/sysroot.gni
-+++ b/build/config/sysroot.gni
+--- a/engine/src/build/config/sysroot.gni
++++ b/engine/src/build/config/sysroot.gni
 @@ -12,7 +12,7 @@ declare_args() {
  
    # Whether to use the default sysroot when building for Linux, if an explicit
diff --git a/package/flutter-engine/0002-remove-explicit-x11-dependency.patch b/package/flutter-engine/0002-remove-explicit-x11-dependency.patch
index 23d7ec9b06..85f6db1c38 100644
--- a/package/flutter-engine/0002-remove-explicit-x11-dependency.patch
+++ b/package/flutter-engine/0002-remove-explicit-x11-dependency.patch
@@ -10,13 +10,13 @@ Upstream: https://github.com/flutter/flutter/issues/123073
 Signed-off-by: Joel Winarske <joel.winarske@gmail.com>
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 ---
- flutter/shell/platform/linux/config/BUILD.gn | 4 ----
+ engine/src/flutter/shell/platform/linux/config/BUILD.gn | 4 ----
  1 file changed, 4 deletions(-)
 
-diff --git a/flutter/shell/platform/linux/config/BUILD.gn b/flutter/shell/platform/linux/config/BUILD.gn
+diff --git a/engine/src/flutter/shell/platform/linux/config/BUILD.gn b/engine/src/flutter/shell/platform/linux/config/BUILD.gn
 index da0ac056b..70c7a0ea1 100644
---- a/flutter/shell/platform/linux/config/BUILD.gn
-+++ b/flutter/shell/platform/linux/config/BUILD.gn
+--- a/engine/src/flutter/shell/platform/linux/config/BUILD.gn
++++ b/engine/src/flutter/shell/platform/linux/config/BUILD.gn
 @@ -5,10 +5,6 @@
  import("//build/config/linux/pkg_config.gni")
  import("//flutter/shell/platform/glfw/config.gni")
diff --git a/package/flutter-engine/0003-fix-toolchain-paths.patch b/package/flutter-engine/0003-fix-toolchain-paths.patch
index ba5d5f8023..93239c039f 100644
--- a/package/flutter-engine/0003-fix-toolchain-paths.patch
+++ b/package/flutter-engine/0003-fix-toolchain-paths.patch
@@ -4,7 +4,7 @@ Date: Sun, 5 Mar 2023 10:43:02 -0800
 Subject: [PATCH] fix toolchain paths
 
 Flutter includes a copy of clang which is required to build. However, by
-default, build/toolchain/custom/BUILD.gn attempts to use several gcc utilities
+default, engine/src/build/toolchain/custom/BUILD.gn attempts to use several gcc utilities
 such as ar, readelf, nm, and strip. Change these to the proper llvm provided
 utility.
 
@@ -13,13 +13,13 @@ Upstream: https://github.com/flutter/flutter/issues/123073
 Signed-off-by: Joel Winarske <joel.winarsk@gmail.com>
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 ---
- build/toolchain/custom/BUILD.gn | 4 +++++------
+ engine/src/build/toolchain/custom/BUILD.gn | 4 +++++------
  1 file changed, 5 insertions(+), 6 deletions(-)
 
-diff --git a/build/toolchain/custom/BUILD.gn b/build/toolchain/custom/BUILD.gn
+diff --git a/engine/src/build/toolchain/custom/BUILD.gn b/engine/src/build/toolchain/custom/BUILD.gn
 index 65b1623..8b3f6f8 100644
---- a/build/toolchain/custom/BUILD.gn
-+++ b/build/toolchain/custom/BUILD.gn
+--- a/engine/src/build/toolchain/custom/BUILD.gn
++++ b/engine/src/build/toolchain/custom/BUILD.gn
 @@ -12,11 +12,11 @@ toolchain("custom") {
    # these values in our scope.
    cc = "${toolchain_bin}/clang"
diff --git a/package/flutter-engine/0004-pkg-config.py-do-not-prepend-sysroot-path.patch b/package/flutter-engine/0004-pkg-config.py-do-not-prepend-sysroot-path.patch
index a31be7d77f..43b4a3ce2e 100644
--- a/package/flutter-engine/0004-pkg-config.py-do-not-prepend-sysroot-path.patch
+++ b/package/flutter-engine/0004-pkg-config.py-do-not-prepend-sysroot-path.patch
@@ -14,13 +14,13 @@ IE: output/host/.../sysroot/output/host/.../sysroot
 Upstream: https://github.com/flutter/flutter/issues/132152
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 ---
- build/config/linux/pkg-config.py | 4 +---
+ engine/src/build/config/linux/pkg-config.py | 4 +---
  1 file changed, 1 insertion(+), 3 deletions(-)
 
-diff --git a/build/config/linux/pkg-config.py b/build/config/linux/pkg-config.py
+diff --git a/engine/src/build/config/linux/pkg-config.py b/engine/src/build/config/linux/pkg-config.py
 index b4a6aff17..44ffdcaea 100644
---- a/build/config/linux/pkg-config.py
-+++ b/build/config/linux/pkg-config.py
+--- a/engine/src/build/config/linux/pkg-config.py
++++ b/engine/src/build/config/linux/pkg-config.py
 @@ -207,9 +207,7 @@ def main():
    all_flags = flag_string.strip().split(' ')
  
diff --git a/package/flutter-engine/dot-gclient b/package/flutter-engine/dot-gclient
index 6ead80c8c2..7dfebdde2c 100644
--- a/package/flutter-engine/dot-gclient
+++ b/package/flutter-engine/dot-gclient
@@ -3,8 +3,8 @@
 
 solutions = [{
     "managed": False,
-    "name": "src/flutter",
-    "url": "https://github.com/flutter/engine.git@!FLUTTER_VERSION!",
+    "name": "./",
+    "url": "https://github.com/flutter/flutter.git@!FLUTTER_VERSION!",
     "custom_vars": {
         "download_android_deps": False,
         "download_windows_deps": False,
diff --git a/package/flutter-engine/flutter-engine.hash b/package/flutter-engine/flutter-engine.hash
index 3309082139..43c75ac19e 100644
--- a/package/flutter-engine/flutter-engine.hash
+++ b/package/flutter-engine/flutter-engine.hash
@@ -1 +1 @@
-sha256  89519eca6f7b9529b35bdddd623a58c3af06a88c458dbd6531ddb4675acf75a9  LICENSE
+sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  LICENSE
diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index a399296247..1fa59a3863 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -22,7 +22,7 @@
 # There is no hash provided for the source tarball, as the gn binary
 # (used for configuration) relies on the .git directories. As such, a
 # reproducible tarball is not possible.
-FLUTTER_ENGINE_VERSION = 3.27.1
+FLUTTER_ENGINE_VERSION = 3.29.2
 
 # There is nothing for Buildroot to download. This is handled by gclient.
 FLUTTER_ENGINE_SITE =
@@ -41,7 +41,7 @@ FLUTTER_ENGINE_DEPENDENCIES = \
 
 # Dispatch all architectures of flutter
 # FLUTTER_ENGINE_TARGET_TRIPPLE must match the directory name found in
-# buildtools/linux-x64/clang/lib/clang/*/lib
+# engine/src/buildtools/linux-x64/clang/lib/clang/*/lib
 ifeq ($(BR2_aarch64),y)
 FLUTTER_ENGINE_TARGET_ARCH = arm64
 FLUTTER_ENGINE_TARGET_TRIPPLE = aarch64-unknown-linux-gnu
@@ -62,13 +62,13 @@ FLUTTER_ENGINE_RUNTIME_MODE=release
 endif
 
 FLUTTER_ENGINE_BUILD_DIR = \
-	$(@D)/out/linux_$(FLUTTER_ENGINE_RUNTIME_MODE)_$(FLUTTER_ENGINE_TARGET_ARCH)
+	$(@D)/engine/src/out/linux_$(FLUTTER_ENGINE_RUNTIME_MODE)_$(FLUTTER_ENGINE_TARGET_ARCH)
 
 FLUTTER_ENGINE_INSTALL_FILES = libflutter_engine.so
 
 # Flutter engine includes a bundled patched clang that must be used for
 # compiling or else there are linking errors.
-FLUTTER_ENGINE_CLANG_PATH = $(@D)/flutter/buildtools/linux-x64/clang
+FLUTTER_ENGINE_CLANG_PATH = $(@D)/engine/src/flutter/buildtools/linux-x64/clang
 
 FLUTTER_ENGINE_CONF_OPTS = \
 	--clang \
@@ -97,10 +97,10 @@ endif
 ifeq ($(BR2_CCACHE),y)
 define FLUTTER_ENGINE_COMPILER_PATH_FIXUP
 	$(SED) "s%cc =.*%cc = \"$(HOST_DIR)/bin/ccache $(FLUTTER_ENGINE_CLANG_PATH)/bin/clang\""%g \
-		$(@D)/build/toolchain/custom/BUILD.gn
+		$(@D)/engine/src/build/toolchain/custom/BUILD.gn
 
 	$(SED) "s%cxx =.*%cxx = \"$(HOST_DIR)/bin/ccache $(FLUTTER_ENGINE_CLANG_PATH)/bin/clang++\""%g \
-		$(@D)/build/toolchain/custom/BUILD.gn
+		$(@D)/engine/src/build/toolchain/custom/BUILD.gn
 endef
 FLUTTER_ENGINE_PRE_CONFIGURE_HOOKS += FLUTTER_ENGINE_COMPILER_PATH_FIXUP
 endif
@@ -154,10 +154,10 @@ FLUTTER_ENGINE_DEPENDENCIES += libxcb
 else
 define FLUTTER_ENGINE_VULKAN_X11_SUPPORT_FIXUP
 	$(SED) "s%vulkan_use_x11.*%vulkan_use_x11 = false%g" -i \
-		$(@D)/flutter/build_overrides/vulkan_headers.gni
+		$(@D)/engine/src/flutter/build_overrides/vulkan_headers.gni
 
 	$(SED) "s%ozone_platform_x11.*%ozone_platform_x11 = false%g" \
-		$(@D)/build/config/BUILDCONFIG.gn
+		$(@D)/engine/src/build/config/BUILDCONFIG.gn
 endef
 FLUTTER_ENGINE_PRE_CONFIGURE_HOOKS += FLUTTER_ENGINE_VULKAN_X11_SUPPORT_FIXUP
 endif
@@ -167,10 +167,10 @@ FLUTTER_ENGINE_DEPENDENCIES += wayland
 else
 define FLUTTER_ENGINE_VULKAN_WAYLAND_SUPPORT_FIXUP
 	$(SED) "s%vulkan_use_wayland.*%vulkan_use_wayland = false%g" \
-		$(@D)/flutter/build_overrides/vulkan_headers.gni
+		$(@D)/engine/src/flutter/build_overrides/vulkan_headers.gni
 
 	$(SED) "s%ozone_platform_wayland.*%ozone_platform_wayland = false%g" \
-		$(@D)/build/config/BUILDCONFIG.gn
+		$(@D)/engine/src/build/config/BUILDCONFIG.gn
 endef
 FLUTTER_ENGINE_PRE_CONFIGURE_HOOKS += FLUTTER_ENGINE_VULKAN_WAYLAND_SUPPORT_FIXUP
 endif
@@ -198,7 +198,7 @@ endef
 # We must set the home directory to the sdk directory or else flutter will
 # place .dart, and .flutter in ~/.
 define FLUTTER_ENGINE_CONFIGURE_CMDS
-	cd $(@D) && \
+	cd $(@D)/engine/src && \
 		rm -rf $(FLUTTER_ENGINE_BUILD_DIR) && \
 		PATH=$(HOST_DIR)/share/depot_tools:$(BR_PATH) \
 		PUB_CACHE=$(FLUTTER_SDK_BIN_PUB_CACHE) \
@@ -208,7 +208,7 @@ define FLUTTER_ENGINE_CONFIGURE_CMDS
 endef
 
 define FLUTTER_ENGINE_BUILD_CMDS
-	cd $(@D) && \
+	cd $(@D)/engine/src && \
 		PATH=$(HOST_DIR)/share/depot_tools:$(BR_PATH) \
 		PUB_CACHE=$(FLUTTER_SDK_BIN_PUB_CACHE) \
 		HOME=$(HOST_FLUTTER_SDK_BIN_SDK) \
diff --git a/package/flutter-engine/gen-tarball b/package/flutter-engine/gen-tarball
index 5bfb8f60e8..e5203b7bca 100755
--- a/package/flutter-engine/gen-tarball
+++ b/package/flutter-engine/gen-tarball
@@ -41,8 +41,8 @@ parse_opts() {
 
 prepare() {
     rm -rf "${SCRATCH_DIR}"
-    mkdir -p "${SCRATCH_DIR}"
-    pushd "${SCRATCH_DIR}" >/dev/null
+    mkdir -p "${SCRATCH_DIR}"/src
+    pushd "${SCRATCH_DIR}"/src >/dev/null
 }
 
 copy_dot_gclient() {
@@ -63,6 +63,7 @@ run_gclient() {
 gen_tarball() {
     message "Generating tarball"
     mkdir -p "${DL_DIR}"
+    pushd "${SCRATCH_DIR}" >/dev/null
     # There are two issues with the flutter-engine buildsystem:
     # - it expects empty directories created by gclient.py to be present; that
     #   means we can't use the mk_tar_gz helper method from support/download/helpers,
@@ -72,6 +73,7 @@ gen_tarball() {
     # So we just create a plain tarball.
     ${TAR} -C "${SCRATCH_DIR}"/src -czf "${TARBALL_NAME}" .
     mv "${TARBALL_NAME}" "${TARBALL_DL_PATH}"
+    popd >/dev/null
 }
 
 cleanup() {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
