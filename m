From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  1 Feb 2016 22:44:23 +0100
Subject: [Buildroot] [PATCH] Don't build host-cmake if it is available on
	the build host
Message-ID: <1454363063-21105-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently all cmake packages depend on host-cmake. Unfortunately
host-cmake takes a long time to configure and build: almost 7 minutes
on a dual-core i5 with SSD. The time does not change even with ccache
enabled.

Indeed, building host-ccache is not very useful if it is already
installed on the build host: it is supposed to be quite portable, and
the only patch we have for cmake seems to only affect target-cmake.

We avoid building host-cmake if cmake is already available on the host
using a technique similar to the one used for host-tar and host-xzcat.

First, we leverage the existing infrastructure in
support/dependencies/dependencies.mk to set CMAKE to either "cmake" or
"$(HOST_DIR)/usr/bin/cmake". In the latter case we also set
BUILD_HOST_CMAKE = YES meaning we need to build host-cmake.

Then in pkg-cmake.mk we launch $(CMAKE) instead of
$(HOST_DIR)/usr/bin/cmake.

Finally, we do skip adding the dependency on host-cmake for all cmake
packages when $(BUILD_HOST_CMAKE) != YES.

Unlike what we do for host-tar and host-xzcat, for host-cmake we do
not add host-cmake to DEPENDENCIES_HOST_PREREQ. Otherwise host-cmake
would be a dependency for _any_ package when it's not installed on the
host, even if no cmake package is selected.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Davide Viti <zinosat@tiscali.it>
---
 package/pkg-cmake.mk                     |  6 ++++--
 support/dependencies/check-host-cmake.mk |  6 ++++++
 support/dependencies/check-host-cmake.sh | 14 ++++++++++++++
 3 files changed, 24 insertions(+), 2 deletions(-)
 create mode 100644 support/dependencies/check-host-cmake.mk
 create mode 100755 support/dependencies/check-host-cmake.sh

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 81dcfcc..e3bd603 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -85,7 +85,7 @@ define $(2)_CONFIGURE_CMDS
 	cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
-	$$($$(PKG)_CONF_ENV) $$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
+	$$($$(PKG)_CONF_ENV) $$(CMAKE) $$($$(PKG)_SRCDIR) \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
 		-DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),Debug,Release) \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
@@ -110,7 +110,7 @@ define $(2)_CONFIGURE_CMDS
 	cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
-	$$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
+	$$(CMAKE) $$($$(PKG)_SRCDIR) \
 		-DCMAKE_INSTALL_SO_NO_EXE=0 \
 		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
 		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
@@ -149,7 +149,9 @@ $(2)_DEPENDENCIES ?= $$(filter-out host-skeleton host-toolchain $(1),\
 	$$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
 endif
 
+ifeq ($$(BUILD_HOST_CMAKE),YES)
 $(2)_DEPENDENCIES += host-cmake
+endif
 
 #
 # Build step. Only define it if not already defined by the package .mk
diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
new file mode 100644
index 0000000..fe16322
--- /dev/null
+++ b/support/dependencies/check-host-cmake.mk
@@ -0,0 +1,6 @@
+CMAKE ?= cmake
+
+ifeq (,$(call suitable-host-package,cmake,$(CMAKE)))
+BUILD_HOST_CMAKE = YES
+CMAKE = $(HOST_DIR)/usr/bin/cmake
+endif
diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
new file mode 100755
index 0000000..76a81e0
--- /dev/null
+++ b/support/dependencies/check-host-cmake.sh
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+candidate="$1"
+
+cmake=`which $candidate`
+if [ ! -x "$cmake" ]; then
+	cmake=`which cmake`
+	if [ ! -x "$cmake" ]; then
+		# echo nothing: no suitable cmake found
+		exit 1
+	fi
+fi
+
+echo $cmake
-- 
1.9.1
