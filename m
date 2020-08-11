From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Aug 2020 23:50:15 +0200
Subject: [Buildroot] [git commit] package/librtlsdr: fix version fetching
 when code is extracted from tarball
Message-ID: <20200811214414.23E7882646@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ea2c8e90805b007560d8b039dff4e3e2275fc55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

librtlsdr currently fails to build on the autobuilders, as it fails
for out of tree builds. Indeed, there is some CMake logic in librtlsdr
that determines the version using Git. This works fine when librtlsdr
is fetched from Git of course. But in the context of Buildroot,
librtlsdr is extracted from a tarball.

For an in-tree build, the "git describe" invocation goes all the way
up to the Buildroot .git/ metadata, and uses that as the librtlsdr
version (it's of course wrong, but the build works). In an out-of-tree
build, there is no parent directory with .git/ metadata, so Git fails,
the VERSION variable is empty and later CMake aborts the build because
of that.

We fix that by adjusting the version retrieving logic to only use Git
if a .git/ metadata folder is found at the root of the librtlsdr
source tree. The patch has been submitted upstream.

Fixes:

  http://autobuild.buildroot.net/results/ea52be1da8ed03272db06679d5a0a441ffe6ea0c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...es-Version.cmake-don-t-use-Git-version-if.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/librtlsdr/0002-cmake-Modules-Version.cmake-don-t-use-Git-version-if.patch b/package/librtlsdr/0002-cmake-Modules-Version.cmake-don-t-use-Git-version-if.patch
new file mode 100644
index 0000000000..9c808edd41
--- /dev/null
+++ b/package/librtlsdr/0002-cmake-Modules-Version.cmake-don-t-use-Git-version-if.patch
@@ -0,0 +1,47 @@
+From feb5d9c6b7bcec788f9b01781c205e31fff260e7 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 11 Aug 2020 23:07:08 +0200
+Subject: [PATCH] cmake/Modules/Version.cmake: don't use Git version if not in
+ a Git repo
+
+If the librtlsdr code comes from a tarball, it doesn't have any .git/
+metadata, and therefore even if Git (as a tool) is found, the logic in
+cmake/Modules/Version.cmake fails finding a version through Git:
+
+-- Extracting version information from git describe...
+fatal: Not a git repository (or any of the parent directories): .git
+
+As a consequence, the VERSION variable is empty, which later causes
+cmake to bail out with:
+
+CMake Error at /home/test/autobuild/run/instance-1/output-1/host/share/cmake-3.15/Modules/WriteBasicConfigVersionFile.cmake:43 (message):
+  No VERSION specified for WRITE_BASIC_CONFIG_VERSION_FILE()
+Call Stack (most recent call first):
+  /home/test/autobuild/run/instance-1/output-1/host/share/cmake-3.15/Modules/CMakePackageConfigHelpers.cmake:225 (write_basic_config_version_file)
+  CMakeLists.txt:173 (write_basic_package_version_file)
+
+To avoid this, we only use Git to determine the version if the cmake
+project top-level source directory has a .git/ folder.
+
+Upstream: https://github.com/librtlsdr/librtlsdr/pull/75
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ cmake/Modules/Version.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cmake/Modules/Version.cmake b/cmake/Modules/Version.cmake
+index 2d4e76d..6f67fa4 100644
+--- a/cmake/Modules/Version.cmake
++++ b/cmake/Modules/Version.cmake
+@@ -32,7 +32,7 @@ set(PATCH_VERSION ${VERSION_INFO_PATCH_VERSION})
+ ########################################################################
+ find_package(Git QUIET)
+ 
+-if(GIT_FOUND)
++if(GIT_FOUND AND EXISTS ${CMAKE_SOURCE_DIR}/.git)
+     message(STATUS "Extracting version information from git describe...")
+     execute_process(
+         COMMAND ${GIT_EXECUTABLE} describe --always --abbrev=4 --long
+-- 
+2.26.2
+
