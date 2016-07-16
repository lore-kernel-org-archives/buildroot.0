From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 16 Jul 2016 22:56:11 +0200
Subject: [Buildroot] [PATCH v4] Don't build host-cmake if it is available on
	the build host
Message-ID: <1468702571-23265-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently all cmake packages depend on host-cmake. Unfortunately
host-cmake takes a long time to configure and build: almost 7 minutes
on a dual-core i5 with SSD. The time does not change even with ccache
enabled.

Indeed, building host-cmake is avoidable if it is already installed on
the build host: CMake is supposed to be quite portable, and the only
patch in Buildroot for the CMake package seems to only affect
target-cmake.

Thus we automatically skip building host-cmake and use the one on the
system if:
 - cmake is available on the system and
 - it is recent enough.

First, we leverage the existing infrastructure in
support/dependencies/dependencies.mk to find out whether there's a
suitable cmake executable on the system. Its path can be passed in the
BR2_CMAKE environment variable, otherwise it defaults to "cmake". If
it is enabled, found and suitable then we set
USE_SYSTEM_CMAKE. Otherwise we override BR2_CMAKE with
"$(HOST_DIR)/usr/bin/cmake" to revert to the old behaviour.

Then in pkg-cmake.mk we launch $(BR2_CMAKE) instead of
$(HOST_DIR)/usr/bin/cmake.

Finally, we skip adding the dependency on host-cmake for all cmake
packages when $(USE_SYSTEM_CMAKE) = YES.

Unlike what we do for host-tar and host-xzcat, for host-cmake we do
not add host-cmake to DEPENDENCIES_HOST_PREREQ. If we did, host-cmake
would be a dependency for _any_ package when it's not installed on the
host, even when no cmake package is selected.

check-host-cmake.sh requires CMake to be at least 3.0 to consider it
suitable. This is because older versions are affected by the bug
described and fixed in Buildroot in ef2c1970e4bf ("cmake: add patch to
fix Qt mkspecs detection"). The bug was fixed in upstream CMake in
version 3.0 [0].

Besides, among all the cmake packages currently in Buildroot, the
highest version mentioned in cmake_minimum_required() is 3.0 (the
grantlee package). Thus 3.0 should be enough to build all current
packages. Of course, with the addition or bump of packages, the
minimum required version will raise.

Tested on:
 - Ubuntu 14.04 without CMake, with official CMake (2.8), PPA CMake
   (3.2)
 - Ubuntu 15.10 without CMake, with official CMake (3.2)
 - Ubuntu 16.04 without CMake, with official CMake (3.5)

[0] https://cmake.org/gitweb?p=cmake.git;h=e8b8b37ef6fef094940d3384df5a1d421b9fa568

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Davide Viti <zinosat@tiscali.it>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---

Results:

On my build server, this patch reduced the build time for a batch of
16 Buildroot configurations (all building cmake-based packages) from
2h44m to 1h54m. Woah, it's a 30% saving!

Changes v3 -> v4:
 - rename USE_SYSTEM_HOST_CMAKE -> USE_SYSTEM_CMAKE (Arnout)
 - ditch BR2_TRY_SYSTEM_CMAKE and use system-cmake unconditionally
   if it is found and >= 3.0 (Arnout)
 - rename BR2_HOST_CMAKE -> BR2_CMAKE since it can be either a
   host-cmake (built by Buildroot) or a system-cmake

Changes v2 -> v3:
 - make this feature optional via the BR2_TRY_SYSTEM_CMAKE kconfig
   variable
 - rename the CMAKE variable to BR2_HOST_CMAKE, so it's coherent
   with the naming of other variables overridable by the
   environment, e.g. BR2_DL_DIR
 - invert the logic of the variable triggering the host-cmake
   dependency: USE_SYSTEM_CMAKE instead of BUILD_HOST_CMAKE;
   needed to implement BR2_TRY_SYSTEM_CMAKE

Changes v1 -> v2:
 - Require cmake >= 3.0. Fixes qjson failure (Luca, Samuel, Thomas)
 - In check-host-cmake.sh only search $1, not "cmake" (Arnout)
 - typo: host-ccache -> host-cmake (Arnout)
---
 package/pkg-cmake.mk                     |  6 ++++--
 support/dependencies/check-host-cmake.mk |  7 +++++++
 support/dependencies/check-host-cmake.sh | 30 ++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 support/dependencies/check-host-cmake.mk
 create mode 100755 support/dependencies/check-host-cmake.sh

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 4c6dc6227036..d63fd321fedc 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -85,7 +85,7 @@ define $(2)_CONFIGURE_CMDS
 	cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
-	$$($$(PKG)_CONF_ENV) $$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
+	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
 		-DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),RelWithDebInfo,Release) \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
@@ -110,7 +110,7 @@ define $(2)_CONFIGURE_CMDS
 	cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
-	$$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
+	$$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
 		-DCMAKE_INSTALL_SO_NO_EXE=0 \
 		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
 		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
@@ -146,7 +146,9 @@ endif
 # primitives to find {C,LD}FLAGS, add it to the dependency list.
 $(2)_DEPENDENCIES += host-pkgconf
 
+ifneq ($$(USE_SYSTEM_CMAKE),YES)
 $(2)_DEPENDENCIES += host-cmake
+endif
 
 #
 # Build step. Only define it if not already defined by the package .mk
diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
new file mode 100644
index 000000000000..3005cfe68365
--- /dev/null
+++ b/support/dependencies/check-host-cmake.mk
@@ -0,0 +1,7 @@
+BR2_CMAKE ?= cmake
+
+ifneq (,$(call suitable-host-package,cmake,$(BR2_CMAKE)))
+USE_SYSTEM_CMAKE = YES
+else
+BR2_CMAKE = $(HOST_DIR)/usr/bin/cmake
+endif
diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
new file mode 100755
index 000000000000..08de60c974e8
--- /dev/null
+++ b/support/dependencies/check-host-cmake.sh
@@ -0,0 +1,30 @@
+#!/bin/sh
+
+candidate="$1"
+
+cmake=`which $candidate`
+if [ ! -x "$cmake" ]; then
+	# echo nothing: no suitable cmake found
+	exit 1
+fi
+
+version=`$cmake --version | head -n1 | cut -d\  -f3`
+major=`echo "$version" | cut -d. -f1`
+minor=`echo "$version" | cut -d. -f2`
+
+# Versions before 3.0 are affected by the bug described in
+# https://git.busybox.net/buildroot/commit/?id=ef2c1970e4bff3be3992014070392b0e6bc28bd2
+# and fixed in upstream CMake in version 3.0:
+# https://cmake.org/gitweb?p=cmake.git;h=e8b8b37ef6fef094940d3384df5a1d421b9fa568
+major_min=3
+minor_min=0
+if [ $major -gt $major_min ]; then
+	echo $cmake
+else
+	if [ $major -eq $major_min -a $minor -ge $minor_min ]; then
+		echo $cmake
+	else
+		# echo nothing: no suitable cmake found
+		exit 1
+	fi
+fi
-- 
2.7.4
