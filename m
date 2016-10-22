From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 16:14:07 +0200
Subject: [Buildroot] [git commit] Revert "package/cmake: with
	BR2_ENABLE_DEBUG use RelWithDebInfo"
Message-ID: <20161022144115.6CC0F8172A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=104bb29e0490bfb487e2e665448dd3ca07fcc2b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 4b0120183404913f7f7788ef4f0f6b51498ef363.

Before reverting this patch, CMake packages are built with the following
options:
  * if BR2_ENABLE_DEBUG is set:
    The CMake build type is set to RelWithDebInfo, which means:
    - Optimization level is forced to: -O2;
    - no log nor assert due to -DNDEBUG;
    - BR2_DEBUG_{1..3} effect is unchanged;
  * otherwise:
    The CMake build type is set to Release, which means:
    - Optimization level is forced to: -O3;
    - no log nor assert due to -DNDEBUG (as expected).
  In any case, the optimization WRT the binary size is always ignored
  and forced.

Reverting to the previous situation, so Buildroot now chooses between
the 'Debug' and 'Release' config types, which are semantically closer
to what Buildroot does everywhere else:
  * if BR2_ENABLE_DEBUG is set:
    The CMake build type is set to Debug, which means:
    - only -g option is passed by CMake;
    - optimization is not forced, nor debug level, so they are kept
      as-is;
  * otherwise:
    The CMake build type is set to Release, so no change in this case:
    - Optimization level is forced to: -O3;
    - no log nor assert due to -DNDEBUG (as expected);
    - size optimization is ignored.

Follow-up patches will fix the CMake flag variables that are appended by
CMake.

Cc: Charles Hardin <ckhardin@exablox.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-cmake.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index aca9e61..4883b3b 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -87,7 +87,7 @@ define $(2)_CONFIGURE_CMDS
 	PATH=$$(BR_PATH) \
 	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
-		-DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),RelWithDebInfo,Release) \
+		-DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),Debug,Release) \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
 		-DCMAKE_COLOR_MAKEFILE=OFF \
 		-DBUILD_DOC=OFF \
