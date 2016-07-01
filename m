From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri,  1 Jul 2016 17:53:30 +0200
Subject: [Buildroot] [PATCH 3/3] Don't build host-cmake if it is available
	on the build host
In-Reply-To: <1467388410-28135-1-git-send-email-luca@lucaceresoli.net>
References: <1467388410-28135-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1467388410-28135-4-git-send-email-luca@lucaceresoli.net>
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

Thus we introduce the possibility to skip entirely building host-cmake
and use the one on the system. However this feature has to be enabled
with a kconfig knob because it introduces problems in some
cases, described below.

In detail, we avoid building host-cmake if:
 - the knob is enabled and
 - cmake is available on the system and
 - it is recent enough.

First, we leverage the existing infrastructure in
support/dependencies/dependencies.mk to find out whether there's a
suitable cmake executable on the system. Its path can be passed in the
BR2_HOST_CMAKE environment variable, otherwise it defaults to
"cmake". If it is enabled, found and suitable then we set
USE_SYSTEM_HOST_CMAKE. Otherwise we override BR2_HOST_CMAKE with
"$(HOST_DIR)/usr/bin/cmake" to revert to the old behaviour.

Then in pkg-cmake.mk we launch $(BR2_HOST_CMAKE) instead of
$(HOST_DIR)/usr/bin/cmake.

Finally, we skip adding the dependency on host-cmake for all cmake
packages when $(USE_SYSTEM_HOST_CMAKE) = YES.

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

Discussion:

There's an open point about this patch. Currently check-host-cmake.sh
only selects a cmake executable if it is >= 3.0, which is the highest
requirement among all Buildroot packages on current master. In the
future when bumping cmake-packages we should check whether they need a
more recent CMake and bump the required version. Doing that we will
silently disable the speedup for all users who upgrade Buildroot, even
if they do not use the specific package requiring a more recent CMake.

This issue can be handled in several ways:
 1. remove the version check entirely
 2. let the check as it is in this patch
 3. add a "minimum required version" kconfig parameter

Option 1 makes the Buildroot code simpler but breaks builds for people
using one of the mentioned packages. They can address the issue:
 - installing a more recent cmake (maybe in their $HOME, if they
   cannot do any better)
 - disabling BR2_TRY_SYSTEM_CMAKE

Option 2 is similar, except it silently disables the "speedup" feature
for known-too-old versions of cmake. This is bad because it does it
silently as discussed above. On the other hand this option handles the
use case where exactly the same configuration is built on several
machines with different distros, e.g. developer PC and CI server. The
system cmake will be used where suitable, built otherwise.

Option 3 means adding another parameter (and implement a proper
version number comparison). It would also force the user to take care
of setting it properly, which is easy however: if a package fails at
cmake_minimum_required(), raise the parameter. The advantage is that
users not using a specific package can keep the number lower, thus
enabling the speedup on more build hosts.

None of these options is totally satisfying. For this reason I added
the configration knob and kept it off by default. This forces the user
to think before enabling it, and to check whether he has a recent
enough cmake.

Any comments about the three possible alternatives is very welcome.

Results:

On my build server, this patch reduced the build time for a batch of
16 Buildroot configurations (all building cmake-based packages) from
2h44m to 1h54m. Woah, it's a 30% saving!

Changes v2 -> v3:
 - make this feature optional via the BR2_TRY_SYSTEM_CMAKE kconfig
   variable
 - rename the CMAKE variable to BR2_HOST_CMAKE, so it's coherent
   with the naming of other variables overridable by the
   environment, e.g. BR2_DL_DIR
 - invert the logic of the variable triggering the host-cmake
   dependency: USE_SYSTEM_HOST_CMAKE instead of BUILD_HOST_CMAKE;
   needed to implement BR2_TRY_SYSTEM_CMAKE

Changes v1 -> v2:
 - Require cmake >= 3.0. Fixes qjson failure (Luca, Samuel, Thomas)
 - In check-host-cmake.sh only search $1, not "cmake" (Arnout)
 - typo: host-ccache -> host-cmake (Arnout)
---
 Config.in                                | 19 +++++++++++++++++++
 package/pkg-cmake.mk                     |  6 ++++--
 support/dependencies/check-host-cmake.mk | 11 +++++++++++
 support/dependencies/check-host-cmake.sh | 30 ++++++++++++++++++++++++++++++
 4 files changed, 64 insertions(+), 2 deletions(-)
 create mode 100644 support/dependencies/check-host-cmake.mk
 create mode 100755 support/dependencies/check-host-cmake.sh

diff --git a/Config.in b/Config.in
index 820b1f0..58eaa79 100644
--- a/Config.in
+++ b/Config.in
@@ -357,6 +357,25 @@ config BR2_CCACHE_USE_BASEDIR
 
 endif
 
+config BR2_TRY_SYSTEM_CMAKE
+	bool "Try to use a CMake installed on the system"
+	help
+	  By default Buildroot builds CMake to run on the host
+	  (host-cmake) when any cmake-package is enabled. However
+	  building host-cmake takes a long time. If you have a
+	  suitable cmake on your build host you can use it by enabling
+	  this options: Buildroot will skip building host-cmake and
+	  use the system-provided one.
+
+	  By default Buildroot looks for an executable named "cmake"
+	  in your $PATH. You can specify another one by setting its
+	  path in the BR2_HOST_CMAKE environment variable.
+
+	  Note the system-provided CMake must be recent enough to
+	  support all enabled packages. Make sure it is no lower than
+	  the value passed to cmake_minimum_required() in the
+	  cmake-packages you use.
+
 config BR2_DEPRECATED
 	bool "Show options and packages that are deprecated or obsolete"
 	help
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 8d7d265..a96b9cd 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -85,7 +85,7 @@ define $(2)_CONFIGURE_CMDS
 	cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
-	$$($$(PKG)_CONF_ENV) $$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
+	$$($$(PKG)_CONF_ENV) $$(BR2_HOST_CMAKE) $$($$(PKG)_SRCDIR) \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
 		-DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),Debug,Release) \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
@@ -110,7 +110,7 @@ define $(2)_CONFIGURE_CMDS
 	cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
-	$$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
+	$$(BR2_HOST_CMAKE) $$($$(PKG)_SRCDIR) \
 		-DCMAKE_INSTALL_SO_NO_EXE=0 \
 		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
 		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
@@ -153,7 +153,9 @@ endif
 # primitives to find {C,LD}FLAGS, add it to the dependency list.
 $(2)_DEPENDENCIES += host-pkgconf
 
+ifneq ($$(USE_SYSTEM_HOST_CMAKE),YES)
 $(2)_DEPENDENCIES += host-cmake
+endif
 
 #
 # Build step. Only define it if not already defined by the package .mk
diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
new file mode 100644
index 0000000..20ef81f
--- /dev/null
+++ b/support/dependencies/check-host-cmake.mk
@@ -0,0 +1,11 @@
+BR2_HOST_CMAKE ?= cmake
+
+ifeq ($(BR2_TRY_SYSTEM_CMAKE),y)
+ifneq (,$(call suitable-host-package,cmake,$(BR2_HOST_CMAKE)))
+USE_SYSTEM_HOST_CMAKE = YES
+endif
+endif
+
+ifneq ($(USE_SYSTEM_HOST_CMAKE),YES)
+BR2_HOST_CMAKE = $(HOST_DIR)/usr/bin/cmake
+endif
diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
new file mode 100755
index 0000000..08de60c
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
