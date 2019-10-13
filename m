From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Oct 2019 11:31:50 -0600
Subject: [Buildroot] [PATCH v5 2/3] package/cmake: add version 3.15.3 and
 move 3.9.6 to cmake-compat
In-Reply-To: <20191013173151.29108-1-james.hilliard1@gmail.com>
References: <20191013173151.29108-1-james.hilliard1@gmail.com>
Message-ID: <20191013173151.29108-2-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Retain cmake 3.9.6 for compatibility with toolchains without c++11 support.

Autodetect and build using latest compatible host-cmake.

Remove FindLibUV patch which is now upstream.

Resync/reformat rename cmake rootfile patch for 3.15.3 with git format-patch.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>

---
Changes v4 -> v5:
  - create separate cmake packages

Changes v3 -> v4:
  - retain support for version 3.8.2 for older toolchains

Changes v2 -> v3:
  - split minimum cmake off from cmake version bump

Changes v1 -> v2:
  - Set cmake version min to 3.10.
---
 package/Config.in.host                        |  1 +
 .../0001-rename_cmake_rootfile.patch          |  0
 ...k-uv-version-h-for-version-detection.patch |  0
 package/cmake-compat/Config.in.host           | 15 +++++
 package/cmake-compat/cmake-compat.hash        |  5 ++
 package/cmake-compat/cmake-compat.mk          | 62 +++++++++++++++++++
 .../cmake/0001-rename-cmake-rootfile.patch    | 43 +++++++++++++
 package/cmake/Config.in.host                  |  1 +
 package/cmake/cmake.hash                      |  6 +-
 package/cmake/cmake.mk                        |  4 +-
 support/dependencies/check-host-cmake.mk      |  4 ++
 11 files changed, 136 insertions(+), 5 deletions(-)
 rename package/{cmake => cmake-compat}/0001-rename_cmake_rootfile.patch (100%)
 rename package/{cmake => cmake-compat}/0002-FindLibUV-Also-check-uv-version-h-for-version-detection.patch (100%)
 create mode 100644 package/cmake-compat/Config.in.host
 create mode 100644 package/cmake-compat/cmake-compat.hash
 create mode 100644 package/cmake-compat/cmake-compat.mk
 create mode 100644 package/cmake/0001-rename-cmake-rootfile.patch

diff --git a/package/Config.in.host b/package/Config.in.host
index 93822304e9..0e0f028554 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -8,6 +8,7 @@ menu "Host utilities"
 	source "package/checkpolicy/Config.in.host"
 	source "package/checksec/Config.in.host"
 	source "package/cmake/Config.in.host"
+	source "package/cmake-compat/Config.in.host"
 	source "package/cramfs/Config.in.host"
 	source "package/cryptsetup/Config.in.host"
 	source "package/dbus-python/Config.in.host"
diff --git a/package/cmake/0001-rename_cmake_rootfile.patch b/package/cmake-compat/0001-rename_cmake_rootfile.patch
similarity index 100%
rename from package/cmake/0001-rename_cmake_rootfile.patch
rename to package/cmake-compat/0001-rename_cmake_rootfile.patch
diff --git a/package/cmake/0002-FindLibUV-Also-check-uv-version-h-for-version-detection.patch b/package/cmake-compat/0002-FindLibUV-Also-check-uv-version-h-for-version-detection.patch
similarity index 100%
rename from package/cmake/0002-FindLibUV-Also-check-uv-version-h-for-version-detection.patch
rename to package/cmake-compat/0002-FindLibUV-Also-check-uv-version-h-for-version-detection.patch
diff --git a/package/cmake-compat/Config.in.host b/package/cmake-compat/Config.in.host
new file mode 100644
index 0000000000..c82dc5b306
--- /dev/null
+++ b/package/cmake-compat/Config.in.host
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_HOST_CMAKE_COMPAT
+	bool "host cmake-compat"
+	depends on !BR2_HOST_GCC_AT_LEAST_4_8
+	help
+	  CMake is an open-source, cross-platform family of tools
+	  designed to build, test and package software. CMake is used
+	  to control the software compilation process using simple
+	  platform and compiler independent configuration files, and
+	  generate native makefiles and workspaces that can be used in
+	  the compiler environment of your choice.
+
+	  This provides compatibility with toolchains that don't
+	  support c++11.
+
+	  http://www.cmake.org/
diff --git a/package/cmake-compat/cmake-compat.hash b/package/cmake-compat/cmake-compat.hash
new file mode 100644
index 0000000000..340c81b9c9
--- /dev/null
+++ b/package/cmake-compat/cmake-compat.hash
@@ -0,0 +1,5 @@
+# From https://cmake.org/files/v3.9/cmake-3.9.6-SHA-256.txt
+sha256 7410851a783a41b521214ad987bb534a7e4a65e059651a2514e6ebfc8f46b218  cmake-3.9.6.tar.gz
+
+# Locally calculated
+sha256 9d8604f7afc5564ceb9705ba121f5fba2782ce18d92902f3c6ed338228372170  Copyright.txt
diff --git a/package/cmake-compat/cmake-compat.mk b/package/cmake-compat/cmake-compat.mk
new file mode 100644
index 0000000000..a238a46a76
--- /dev/null
+++ b/package/cmake-compat/cmake-compat.mk
@@ -0,0 +1,62 @@
+################################################################################
+#
+# cmake-compat
+#
+################################################################################
+
+CMAKE_COMPAT_VERSION_MAJOR = 3.9
+CMAKE_COMPAT_VERSION = $(CMAKE_COMPAT_VERSION_MAJOR).6
+CMAKE_COMPAT_SITE = https://cmake.org/files/v$(CMAKE_COMPAT_VERSION_MAJOR)
+CMAKE_COMPAT_LICENSE = BSD-3-Clause
+CMAKE_COMPAT_LICENSE_FILES = Copyright.txt
+
+# CMake is a particular package:
+# * CMake can be built using the generic infrastructure or the cmake one.
+#   Since Buildroot has no requirement regarding the host system cmake
+#   program presence, it uses the generic infrastructure to build the
+#   host-cmake package, then the (target-)cmake package can be built
+#   using the cmake infrastructure;
+# * CMake bundles its dependencies within its sources. This is the
+#   reason why the host-cmake package has no dependencies:, whereas
+#   the (target-)cmake package has a lot of dependencies, using only
+#   the system-wide libraries instead of rebuilding and statically
+#   linking with the ones bundled into the CMake sources.
+
+CMAKE_COMPAT_DEPENDENCIES = zlib jsoncpp libcurl libarchive expat bzip2 xz libuv rhash
+
+CMAKE_COMPAT_CONF_OPTS = \
+	-DKWSYS_LFS_WORKS=TRUE \
+	-DKWSYS_CHAR_IS_SIGNED=TRUE \
+	-DCMAKE_USE_SYSTEM_LIBRARIES=1 \
+	-DCTEST_USE_XMLRPC=OFF \
+	-DBUILD_CursesDialog=OFF
+
+# Get rid of -I* options from $(HOST_CPPFLAGS) to prevent that a
+# header available in $(HOST_DIR)/include is used instead of a
+# CMake internal header, e.g. lzma* headers of the xz package
+HOST_CMAKE_COMPAT_CFLAGS = $(shell echo $(HOST_CFLAGS) | sed -r "s%$(HOST_CPPFLAGS)%%")
+HOST_CMAKE_COMPAT_CXXFLAGS = $(shell echo $(HOST_CXXFLAGS) | sed -r "s%$(HOST_CPPFLAGS)%%")
+
+define HOST_CMAKE_COMPAT_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CMAKE_COMPAT_CFLAGS)" \
+		./bootstrap --prefix=$(HOST_DIR) \
+			--parallel=$(PARALLEL_JOBS) -- \
+			-DCMAKE_C_FLAGS="$(HOST_CMAKE_COMPAT_CFLAGS)" \
+			-DCMAKE_CXX_FLAGS="$(HOST_CMAKE_COMPAT_CXXFLAGS)" \
+			-DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS)" \
+			-DCMAKE_USE_OPENSSL:BOOL=OFF \
+			-DBUILD_CursesDialog=OFF \
+	)
+endef
+
+define HOST_CMAKE_COMPAT_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_CMAKE_COMPAT_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install/fast
+endef
+
+$(eval $(host-generic-package))
diff --git a/package/cmake/0001-rename-cmake-rootfile.patch b/package/cmake/0001-rename-cmake-rootfile.patch
new file mode 100644
index 0000000000..29d7df2d29
--- /dev/null
+++ b/package/cmake/0001-rename-cmake-rootfile.patch
@@ -0,0 +1,43 @@
+From f7291b1decd24a4e9530f98d7723fb55f38223ea Mon Sep 17 00:00:00 2001
+From: Davide Viti <zinosat@tiscali.it>
+Date: Thu, 14 Jul 2016 10:14:59 +0100
+Subject: [PATCH] rename cmake rootfile
+
+ctest fails on the target, because it cannot find CMake.cmake inside
+CMAKE_DATA_DIR (typically set to "/usr/share/cmake-3.0"): all *.cmake
+files are removed at build time via the target-finalize rule.
+
+This buildroot-specific patch makes sure ctest looks also for
+"Modules/CMake.cmake.ctest" before complaining
+
+[Vincent: tweak patch for 3.6.3]
+[James: tweak patch for 3.15.3]
+
+Signed-off-by: Davide Viti <zinosat@tiscali.it>
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ Source/cmake.cxx | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/Source/cmake.cxx b/Source/cmake.cxx
+index 3772f09985..c317e4af38 100644
+--- a/Source/cmake.cxx
++++ b/Source/cmake.cxx
+@@ -1009,7 +1009,12 @@ int cmake::AddCMakePaths()
+     "Path to cpack program executable.", cmStateEnums::INTERNAL);
+ #endif
+   if (!cmSystemTools::FileExists(
+-        (cmSystemTools::GetCMakeRoot() + "/Modules/CMake.cmake"))) {
++        (cmSystemTools::GetCMakeRoot() + "/Modules/CMake.cmake")) &&
++        !cmSystemTools::FileExists(
++          (cmSystemTools::GetCMakeRoot()+"/Modules/CMake.cmake.ctest")
++        )
++     )
++  {
+     // couldn't find modules
+     cmSystemTools::Error(
+       "Could not find CMAKE_ROOT !!!\n"
+-- 
+2.20.1
+
diff --git a/package/cmake/Config.in.host b/package/cmake/Config.in.host
index b2e210ee2c..0a404493b0 100644
--- a/package/cmake/Config.in.host
+++ b/package/cmake/Config.in.host
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_CMAKE
 	bool "host cmake"
+	depends on BR2_HOST_GCC_AT_LEAST_4_8
 	help
 	  CMake is an open-source, cross-platform family of tools
 	  designed to build, test and package software. CMake is used
diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 340c81b9c9..0fdf12cc93 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.9/cmake-3.9.6-SHA-256.txt
-sha256 7410851a783a41b521214ad987bb534a7e4a65e059651a2514e6ebfc8f46b218  cmake-3.9.6.tar.gz
+# From https://cmake.org/files/v3.15/cmake-3.15.3-SHA-256.txt
+sha256 13958243a01365b05652fa01b21d40fa834f70a9e30efa69c02604e64f58b8f5  cmake-3.15.3.tar.gz
 
 # Locally calculated
-sha256 9d8604f7afc5564ceb9705ba121f5fba2782ce18d92902f3c6ed338228372170  Copyright.txt
+sha256 dc628fb936a5d229296d42083f9a8218aa32204c016919e784404c9ec58776e9  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index e816963089..2302d3f2cb 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CMAKE_VERSION_MAJOR = 3.9
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).6
+CMAKE_VERSION_MAJOR = 3.15
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
index 5604713de6..4a1491d646 100644
--- a/support/dependencies/check-host-cmake.mk
+++ b/support/dependencies/check-host-cmake.mk
@@ -10,5 +10,9 @@ BR2_CMAKE ?= $(call suitable-host-package,cmake,\
 	$(BR2_CMAKE_VERSION_MIN) $(BR2_CMAKE_CANDIDATES))
 ifeq ($(BR2_CMAKE),)
 BR2_CMAKE = $(HOST_DIR)/bin/cmake
+ifeq ($(BR2_HOST_GCC_AT_LEAST_4_8),)
+BR2_CMAKE_HOST_DEPENDENCY = host-cmake-compat
+else
 BR2_CMAKE_HOST_DEPENDENCY = host-cmake
 endif
+endif
-- 
2.20.1
