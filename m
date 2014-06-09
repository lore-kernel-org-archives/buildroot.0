From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 11:38:12 +0200
Subject: [Buildroot] [git commit] cloog: new package
Message-ID: <20140609094816.DCDA09CF77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1e1a078a73dc00a91d5adaceed6046095b278f5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CLooG is a free software and library to generate code for scanning
Z-polyhedra.

cloog is needed for the optional graphite optimisations that are
supported by gcc since version 4.5. Therefore this package is required
for the toolchain to support graphite.

Graphite optimisations primarily involve loop blocking flattening and
interchage so are probably of mimimal use in an embedded system where
small sizes are favoured.

cloog depends on isl.

[Thomas:
 - Add patch to add missing CMake related files to the release
   tarball, preventing the build from succeeding.
 - bump to 0.18.2
 - disable libtool patch, which doesn't apply]

Signed-off-by: Steve Thomas <scjthm@live.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cloog/cloog-0001-add-missing-files.patch |   69 ++++++++++++++++++++++
 package/cloog/cloog.mk                           |   19 ++++++
 2 files changed, 88 insertions(+), 0 deletions(-)

diff --git a/package/cloog/cloog-0001-add-missing-files.patch b/package/cloog/cloog-0001-add-missing-files.patch
new file mode 100644
index 0000000..23743cc
--- /dev/null
+++ b/package/cloog/cloog-0001-add-missing-files.patch
@@ -0,0 +1,69 @@
+Add CMake related files missing from the release tarball
+
+Due to a bug in the cloog release, a few files were missing from the
+release tarball. This patch re-adds those files, which are needed for
+the build to work. This patch can be dropped when cloog is bumped.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/cmake/isl-config.cmake
+===================================================================
+--- /dev/null
++++ b/cmake/isl-config.cmake
+@@ -0,0 +1,25 @@
++# Try to find the isl library
++
++# ISL_FOUND       - System has isl lib
++# ISL_INCLUDE_DIR - The isl include directory
++# ISL_LIBRARY     - Library needed to use isl
++
++
++if (ISL_INCLUDE_DIR AND ISL_LIBRARY)
++	# Already in cache, be silent
++	set(ISL_FIND_QUIETLY TRUE)
++endif()
++
++find_path(ISL_INCLUDE_DIR NAMES isl/version.h)
++find_library(ISL_LIBRARY NAMES isl)
++
++if (ISL_LIBRARY AND ISL_INCLUDE_DIR)
++	message(STATUS "Library isl found =) ${ISL_LIBRARY}")
++else()
++	message(STATUS "Library isl not found =(")
++endif()
++
++include(FindPackageHandleStandardArgs)
++FIND_PACKAGE_HANDLE_STANDARD_ARGS(ISL DEFAULT_MSG ISL_INCLUDE_DIR ISL_LIBRARY)
++
++mark_as_advanced(ISL_INCLUDE_DIR ISL_LIBRARY)
+Index: b/cmake/cloog-isl-config.cmake
+===================================================================
+--- /dev/null
++++ b/cmake/cloog-isl-config.cmake
+@@ -0,0 +1,26 @@
++# Try to find the cloog-isl library
++
++# CLOOG_ISL_FOUND       - System has cloog-isl lib
++# CLOOG_ISL_INCLUDE_DIR - The cloog-isl include directory
++# CLOOG_ISL_LIBRARY     - Library needed to use cloog-isl
++
++
++if (CLOOG_ISL_INCLUDE_DIR AND CLOOG_ISL_LIBRARY)
++	# Already in cache, be silent
++	set(CLOOG_ISL_FIND_QUIETLY TRUE)
++endif()
++
++find_path(CLOOG_ISL_INCLUDE_DIR NAMES cloog/isl/cloog.h)
++find_library(CLOOG_ISL_LIBRARY NAMES cloog-isl)
++
++if (CLOOG_ISL_LIBRARY AND CLOOG_ISL_INCLUDE_DIR)
++	message(STATUS "Library cloog-isl found =) ${CLOOG_ISL_LIBRARY}")
++else()
++	message(STATUS "Library cloog-isl not found =(")
++endif()
++
++
++include(FindPackageHandleStandardArgs)
++FIND_PACKAGE_HANDLE_STANDARD_ARGS(CLOOG_ISL DEFAULT_MSG CLOOG_ISL_INCLUDE_DIR CLOOG_ISL_LIBRARY)
++
++mark_as_advanced(CLOOG_ISL_INCLUDE_DIR CLOOG_ISL_LIBRARY)
diff --git a/package/cloog/cloog.mk b/package/cloog/cloog.mk
new file mode 100644
index 0000000..eb2aa10
--- /dev/null
+++ b/package/cloog/cloog.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# cloog
+#
+################################################################################
+
+CLOOG_VERSION = 0.18.2
+CLOOG_SITE = http://www.bastoul.net/cloog/pages/download/
+CLOOG_INSTALL_STAGING = YES
+CLOOG_LICENSE = LGPLv2.1
+CLOOG_LICENSE_FILES = LICENSE
+CLOOG_DEPENDENCIES = gmp isl
+# Our libtool patch doesn't apply, and since this package is only
+# built for the host, we don't really care about it.
+CLOOG_LIBTOOL_PATCH = NO
+
+HOST_CLOOG_CONF_OPT = --with-isl=system --with-polylib=no
+
+$(eval $(host-autotools-package))
