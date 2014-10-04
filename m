From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Oct 2014 14:39:03 +0200
Subject: [Buildroot] [git commit] ympd: new package
Message-ID: <20141004123938.C774E9D821@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=40aa523af26963321443a2d96c64ce128577ca77
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - Add the package to package/Config.in
 - Add dependency on largefile
 - Add new patch to CMakeLists.txt to remove the unused C++ dependency
 - Change the existing CMakeLists.txt patch to simply remove the
   problematic code, and reword the explanation.]

Signed-off-by: Eric Limpens <limpens@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/ympd/Config.in                             |   11 +++++++++
 .../ympd-0001-CMake-cross-compile-mkdata.patch     |   24 ++++++++++++++++++++
 package/ympd/ympd-0002-only-c-language.patch       |   21 +++++++++++++++++
 package/ympd/ympd.mk                               |   21 +++++++++++++++++
 5 files changed, 78 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 1021d4c..7f8faff 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -35,6 +35,7 @@ menu "Audio and video applications"
 	source "package/wavpack/Config.in"
 	source "package/xbmc/Config.in"
 	source "package/yavta/Config.in"
+	source "package/ympd/Config.in"
 endmenu
 
 menu "Compressors and decompressors"
diff --git a/package/ympd/Config.in b/package/ympd/Config.in
new file mode 100644
index 0000000..0223af7
--- /dev/null
+++ b/package/ympd/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_YMPD
+	bool "ympd"
+	select BR2_PACKAGE_LIBMPDCLIENT
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_LARGEFILE
+	help
+	  ympd, a standalone MPD Web GUI written in C, utilizing
+	  Websockets and Bootstrap/JS
+
+comment "ympd needs a toolchain w/ threads, largefile"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE
diff --git a/package/ympd/ympd-0001-CMake-cross-compile-mkdata.patch b/package/ympd/ympd-0001-CMake-cross-compile-mkdata.patch
new file mode 100644
index 0000000..0bd29c1
--- /dev/null
+++ b/package/ympd/ympd-0001-CMake-cross-compile-mkdata.patch
@@ -0,0 +1,24 @@
+Do not build the mkdata tool
+
+The mkdata tool is needed on the host, during the build, so building
+it for the target does not work when cross-compiling. Buildroot will
+manually build mkdata before starting the ympd build.
+
+Upstream is looking into a proper solution.
+
+Signed-off-by: Eric Limpens <Limpens@Gmail.com>
+
+Index: b/CMakeLists.txt
+===================================================================
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -28,9 +28,6 @@
+ 	htdocs/index.html
+ )
+ 
+-add_executable(mkdata htdocs/mkdata.c)
+-get_target_property(MKDATA_EXE mkdata LOCATION)
+-
+ add_custom_command(OUTPUT ${PROJECT_BINARY_DIR}/assets.c
+     COMMAND ${MKDATA_EXE} ${RESOURCES} > ${PROJECT_BINARY_DIR}/assets.c
+     WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
diff --git a/package/ympd/ympd-0002-only-c-language.patch b/package/ympd/ympd-0002-only-c-language.patch
new file mode 100644
index 0000000..df5734c
--- /dev/null
+++ b/package/ympd/ympd-0002-only-c-language.patch
@@ -0,0 +1,21 @@
+ympd is implemented only in C
+
+By default, CMake assumes that the project is using both C and C++. By
+explicitly passing 'C' as argument of the project() macro, we tell
+CMake that only C is used, which prevents CMake from checking if a C++
+compiler exists.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/CMakeLists.txt
+===================================================================
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,6 +1,6 @@
+ cmake_minimum_required(VERSION 2.6)
+ 
+-project (ympd)
++project (ympd C)
+ set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${PROJECT_SOURCE_DIR}/cmake/")
+ set(CPACK_PACKAGE_VERSION_MAJOR "1")
+ set(CPACK_PACKAGE_VERSION_MINOR "2")
diff --git a/package/ympd/ympd.mk b/package/ympd/ympd.mk
new file mode 100644
index 0000000..fc4be4d
--- /dev/null
+++ b/package/ympd/ympd.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# ympd
+#
+################################################################################
+
+YMPD_VERSION = a98d760dddff4b0dd595d977c9077f34beff05c5
+YMPD_SITE = $(call github,notandy,ympd,$(YMPD_VERSION))
+YMPD_LICENSE = GPLv2
+YMPD_LICENSE_FILE = LICENSE
+YMPD_DEPENDENCIES = libmpdclient
+
+define YMPD_MAKE_HOST_TOOL
+        $(HOSTCC) $(HOST_CFLAGS) $(@D)/htdocs/mkdata.c -o $(@D)/mkdata
+endef
+
+YMPD_PRE_BUILD_HOOKS += YMPD_MAKE_HOST_TOOL
+
+YMPD_CONF_OPT += -DMKDATA_EXE=$(@D)/mkdata
+
+$(eval $(cmake-package))
