From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  5 Sep 2016 17:41:56 +0200
Subject: [Buildroot] [PATCHv5] core: don't build host-cmake if it is
	available on the build host
Message-ID: <1473090116-9851-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Luca Ceresoli <luca@lucaceresoli.net>

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

check-host-cmake.mk requires CMake to be at least 3.0 (but see below) to
consider it suitable. This is because older versions are affected by the
bug described and fixed in Buildroot in ef2c1970e4bf ("cmake: add patch
to fix Qt mkspecs detection"). The bug was fixed in upstream CMake in
version 3.0 [0].

Amongst all the cmake packages currently in Buildroot, the currently
highest version mentioned in cmake_minimum_required() is 3.1 (grantlee
and opencv3).

Thus we use 3.1 as the lowest required cmake for now, until a package is
bumped, or a new package added, with a higher required version.

We then ensure, as a post-patch hook in the cmake infra, that no
package requires a cmake version higher than what we do in Buildroot.
If that's not the case, this is considered an error and the build is
aborted. We use a post-patch hook rather a more obvious pre-configure
hook because it is then easier to check the requirements of a package
without having to build all its dependencies first.

However, the target cmake requires up to cmake 3.4 for running its
tests; and they do not get built in our case. Bumping the required host
cmake minimum version for the whole of Buildroot would almost always
defeat the purpose of this change. So we just exclude the target cmake
from the version check.

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
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Tested-by: Romain Naour <romain.naour@gmail.com>
[yann.morin.1998 at free.fr:
  - simplify logic in check-host-cmake.mk;
  - set and use BR2_CMAKE_HOST_DEPENDENCY, drop USE_SYSTEM_CMAKE;
  - bump to cmake 3.1 for grantlee and opencv;
  - add the post-patch hook; exclude target cmake from the check.
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---

Results (by Luca):

On my build server, this patch reduced the build time for a batch of
16 Buildroot configurations (all building cmake-based packages) from
2h44m to 1h54m. Woah, it's a 30% saving!

Results (by Yann):

On my machine, this gains about 5min 30s per build, which is far from
negligible.

Changes v4 -> v5:
 - adopted by Yann;
 - drop USE_SYSTEM_CMAKE in favour of BR2_CMAKE_HOST_DEPENDENCY which
   directly contains 'host-cmake' if it is needed;
 - unconditionally add $(BR2_CMAKE_HOST_DEPENDENCY) to dependencies: it
   is empty if host-cmake is not needed;
 - check our minimum version is enough in a post-patch hook.

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
 package/pkg-cmake.mk                     | 45 +++++++++++++++++++++++++++++---
 support/dependencies/check-host-cmake.mk | 19 ++++++++++++++
 support/dependencies/check-host-cmake.sh | 26 ++++++++++++++++++
 3 files changed, 87 insertions(+), 3 deletions(-)
 create mode 100644 support/dependencies/check-host-cmake.mk
 create mode 100755 support/dependencies/check-host-cmake.sh

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 4c6dc62..5cb2b52 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -35,6 +35,38 @@ ifneq ($(QUIET),)
 CMAKE_QUIET = -DCMAKE_RULE_MESSAGES=OFF -DCMAKE_INSTALL_MESSAGE=NEVER
 endif
 
+#
+# Check the package does not require a cmake version more recent than we do.
+#
+# Some packages may use a variable to set the minimum required version. In
+# this case, there is not much we can do, so we just accept it; the configure
+# would fail later anyway in this case.
+#
+define CMAKE_CHECK_MIN_VERSION
+	$(Q)v=$$( grep -hr -i 'cmake_minimum_required.*version' $(@D) \
+		|tr '[:upper:]' '[:lower:]' \
+		|sed -r -e '/.*\(version ([[:digit:]]+\.[[:digit:]]+).+/!d; s//\1/' \
+		|sort -t. -k 1,1nr -k2,2nr \
+		|head -n 1 \
+	 ); \
+	M=$${v%.*}; m=$${v#*.}; \
+	if [ -z "$${v}" ]; then \
+		: Unknown, not much we can do, OK; \
+	elif [ $(BR2_CMAKE_MIN_VERSION_MAJOR) -gt $${M} ]; then \
+		: OK; \
+	elif [    $(BR2_CMAKE_MIN_VERSION_MAJOR) -eq $${M} \
+	       -a $(BR2_CMAKE_MIN_VERSION_MINOR) -ge $${m} ]; then \
+		: OK; \
+	else \
+		printf "*** Error: incorrect minimum cmake version:\n"; \
+		printf "*** Error: Buildroot requires %s.%s\n" \
+			$(BR2_CMAKE_MIN_VERSION_MAJOR) $(BR2_CMAKE_MIN_VERSION_MINOR); \
+		printf "*** Error: %s needs at least %s.%s\n" \
+			$($(PKG)_NAME) $${M} $${m}; \
+		exit 1; \
+	fi
+endef
+
 ################################################################################
 # inner-cmake-package -- defines how the configuration, compilation and
 # installation of a CMake package should be done, implements a few hooks to
@@ -71,6 +103,13 @@ else
 $(2)_BUILDDIR			= $$($(2)_SRCDIR)/buildroot-build
 endif
 
+# Special exception for cmake, which requires cmake up to 3.4, but
+# only to run its tests; all other equirements are on at most 3.0.
+# Just skip the version check for cmake, and only for cmake.
+ifneq ($(1),cmake)
+$(2)_POST_PATCH_HOOKS += CMAKE_CHECK_MIN_VERSION
+endif
+
 #
 # Configure step. Only define it if not already defined by the package
 # .mk file. And take care of the differences between host and target
@@ -85,7 +124,7 @@ define $(2)_CONFIGURE_CMDS
 	cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
-	$$($$(PKG)_CONF_ENV) $$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
+	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
 		-DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),RelWithDebInfo,Release) \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
@@ -110,7 +149,7 @@ define $(2)_CONFIGURE_CMDS
 	cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
-	$$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
+	$$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
 		-DCMAKE_INSTALL_SO_NO_EXE=0 \
 		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
 		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
@@ -146,7 +185,7 @@ endif
 # primitives to find {C,LD}FLAGS, add it to the dependency list.
 $(2)_DEPENDENCIES += host-pkgconf
 
-$(2)_DEPENDENCIES += host-cmake
+$(2)_DEPENDENCIES += $(BR2_CMAKE_HOST_DEPENDENCY)
 
 #
 # Build step. Only define it if not already defined by the package .mk
diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
new file mode 100644
index 0000000..8680ec9
--- /dev/null
+++ b/support/dependencies/check-host-cmake.mk
@@ -0,0 +1,19 @@
+# Versions before 3.0 are affected by the bug described in
+# https://git.busybox.net/buildroot/commit/?id=ef2c1970e4bff3be3992014070392b0e6bc28bd2
+# and fixed in upstream CMake in version 3.0:
+# https://cmake.org/gitweb?p=cmake.git;h=e8b8b37ef6fef094940d3384df5a1d421b9fa568
+#
+# Set this to either 3.0 or higher, depending on the highest minimum
+# version required by any of the packages bundled in Buildroot. If a
+# package is bumped or a new one added, and it requires a higher
+# version, our cmake infra will catch it and whine.
+#
+BR2_CMAKE_MIN_VERSION_MAJOR = 3
+BR2_CMAKE_MIN_VERSION_MINOR = 1
+
+BR2_CMAKE ?= cmake
+ifeq ($(call suitable-host-package,cmake,\
+	$(BR2_CMAKE) $(BR2_CMAKE_MIN_VERSION_MAJOR) $(BR2_CMAKE_MIN_VERSION_MINOR)),)
+BR2_CMAKE = $(HOST_DIR)/usr/bin/cmake
+BR2_CMAKE_HOST_DEPENDENCY = host-cmake
+endif
diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
new file mode 100755
index 0000000..4951a05
--- /dev/null
+++ b/support/dependencies/check-host-cmake.sh
@@ -0,0 +1,26 @@
+#!/bin/sh
+
+candidate="${1}"
+major_min="${2}"
+minor_min="${3}"
+
+cmake=`which ${candidate}`
+if [ ! -x "${cmake}" ]; then
+	# echo nothing: no suitable cmake found
+	exit 1
+fi
+
+version=`${cmake} --version | head -n1 | cut -d\  -f3`
+major=`echo "${version}" | cut -d. -f1`
+minor=`echo "${version}" | cut -d. -f2`
+
+if [ ${major} -gt ${major_min} ]; then
+	echo "${cmake}"
+else
+	if [ ${major} -eq ${major_min} -a ${minor} -ge ${minor_min} ]; then
+		echo "${cmake}"
+	else
+		# echo nothing: no suitable cmake found
+		exit 1
+	fi
+fi
-- 
2.7.4
