From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 15 Oct 2016 23:03:41 +0200
Subject: [Buildroot] [PATCH v5 1/9] package/pkg-cmake.mk: fix build type and
	optimization flags
In-Reply-To: <20161015210349.29432-1-s.martin49@gmail.com>
References: <20161015210349.29432-1-s.martin49@gmail.com>
Message-ID: <20161015210349.29432-2-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tl;dr:

Before applying this patch, CMake packages are built with the following
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
  In any case, the optimization WRT the binary size is always ignored and
  forced.

This change chooses the build type doing the closest thing to what
Buildroot attempts to do.

Long version:

Flags set by Buildroot depending on the configuration:

  BR2_ENABLE_DEBUG | Optim. level   | Buildroot {C,CXX}FLAGS
  =================+================+=======================
          y        | BR2_OPTIMIZE_S | -Os -gx
          y        | BR2_OPTIMIZE_G | -Og -gx
          y        | BR2_OPTIMIZE_n | -On -gx
          n        | BR2_OPTIMIZE_S | -Os
          n        | BR2_OPTIMIZE_G | -Og
          n        | BR2_OPTIMIZE_n | -On

Default flags appended by CMake depending on the build type:

  Build type     | Flags           | Effects on {C,CXX}FLAGS
  ===============+=================+===========================================
  Debug          | -g              | Force -g, compatible with BR2_ENABLE_DEBUG
  MinSizeRel     | -Os -DNDEBUG    | Set -Os, compatible with BR2_OPTIMIZE_S
  Release        | -O3 -DNDEBUG    | Set -O3, closest to the others cases,
                 |                 | though the optimization level is forced.
  RelWithDebInfo | -O2 -g -DNDEBUG | Force -g and set -O2, not friendly with BR

Since CMake appends its own build type flags and because of the gcc
option parser, the CMake flags takes precedence over the Buildroot
flags.

So, this change sets the build type in a very simple way depending on
the BR2_ENABLE_DEBUG symbol.

Follow-up patches will fix the CMake flag variables that are appended by
CMake.

Cc: Charles Hardin <ckhardin@exablox.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

---
changes v4->v5:
- none

changes v3->v4:
- simplify build type selection
---
 package/pkg-cmake.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index aca9e61..259865d 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -35,6 +35,14 @@ ifneq ($(QUIET),)
 CMAKE_QUIET = -DCMAKE_RULE_MESSAGES=OFF -DCMAKE_INSTALL_MESSAGE=NEVER
 endif
 
+# Set the CMake build type which matches the best the build configuration sets
+# in Buildroot.
+ifeq ($(BR2_ENABLE_DEBUG),y)
+BR_CMAKE_BUILD_TYPE=Debug
+else
+BR_CMAKE_BUILD_TYPE=Release
+endif
+
 ################################################################################
 # inner-cmake-package -- defines how the configuration, compilation and
 # installation of a CMake package should be done, implements a few hooks to
@@ -87,7 +95,7 @@ define $(2)_CONFIGURE_CMDS
 	PATH=$$(BR_PATH) \
 	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
-		-DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),RelWithDebInfo,Release) \
+		-DCMAKE_BUILD_TYPE=$(BR_CMAKE_BUILD_TYPE) \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
 		-DCMAKE_COLOR_MAKEFILE=OFF \
 		-DBUILD_DOC=OFF \
-- 
2.10.0
