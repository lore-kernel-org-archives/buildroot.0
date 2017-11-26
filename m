From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Nov 2017 16:35:50 +0100
Subject: [Buildroot] [PATCHv2] package/hackrf: new package
Message-ID: <20171126153550.13871-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jason Pruitt <jrspruitt@gmail.com>

This patch adds hackrf/host tools and lib for the HackRF SDR.

Signed-off-by: Jason Pruitt <jrspruitt@gmail.com>
[yann.morin.1998 at free.fr:
  - rename hackrf-host -> hackrf
  - update to recent git sha1
  - add dependency on !static lib because shared lib always built
  - add dependency on host-pkgconf
  - add dependency on fftx single precision
  - add patch to fix detection of fftw
  - remove feature patch to disable tools, always build them
  - remove feature patch to disable build of shared lib
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
Jason: I've had your patch pending in my tree for quite a while now, and
I finally had a look. I took the liberty of updating it and fixing it
since you initially sent it in:
http://lists.busybox.net/pipermail/buildroot/2015-October/142686.html
---
 package/Config.in                                  |  1 +
 ...01-host-tools-use-pkg-cnfig-to-find-fftwf.patch | 45 ++++++++++++++++++++++
 package/hackrf/Config.in                           | 17 ++++++++
 package/hackrf/hackrf.mk                           | 22 +++++++++++
 4 files changed, 85 insertions(+)
 create mode 100644 package/hackrf/0001-host-tools-use-pkg-cnfig-to-find-fftwf.patch
 create mode 100644 package/hackrf/Config.in
 create mode 100644 package/hackrf/hackrf.mk

diff --git a/package/Config.in b/package/Config.in
index 207b4b4c4d..9e59045cf0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -420,6 +420,7 @@ endmenu
 	source "package/gpsd/Config.in"
 	source "package/gptfdisk/Config.in"
 	source "package/gvfs/Config.in"
+	source "package/hackrf/Config.in"
 	source "package/hdparm/Config.in"
 	source "package/hwdata/Config.in"
 	source "package/hwloc/Config.in"
diff --git a/package/hackrf/0001-host-tools-use-pkg-cnfig-to-find-fftwf.patch b/package/hackrf/0001-host-tools-use-pkg-cnfig-to-find-fftwf.patch
new file mode 100644
index 0000000000..b676fd8568
--- /dev/null
+++ b/package/hackrf/0001-host-tools-use-pkg-cnfig-to-find-fftwf.patch
@@ -0,0 +1,45 @@
+From ebaacaed5c72aea8af28e22135e6b550bd731826 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 26 Nov 2017 16:20:54 +0100
+Subject: [PATCH] host/tools: use pkg-cnfig to find fftwf
+
+The fftw package is named fftw3. Since we're using the fftwf_*
+functions, we need to look for fftw3f, i.e. the single-precision
+variant of fftw3.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ host/cmake/modules/FindFFTW.cmake    | 3 ++-
+ host/hackrf-tools/src/CMakeLists.txt | 2 +-
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/host/cmake/modules/FindFFTW.cmake b/host/cmake/modules/FindFFTW.cmake
+index b9f3bfb..20e26b2 100644
+--- a/host/cmake/modules/FindFFTW.cmake
++++ b/host/cmake/modules/FindFFTW.cmake
+@@ -16,7 +16,8 @@ IF (WIN32)
+ include_directories(${FFTW_INCLUDES})
+ find_library (FFTW_LIBRARIES NAMES ${FFTW_LIBRARIES})
+ ELSE(WIN32)
+-find_library (FFTW_LIBRARIES NAMES fftw3)
++    find_package(PkgConfig)
++    pkg_check_modules(FFTW fftw3f)
+ ENDIF(WIN32)
+ 
+ 
+diff --git a/host/hackrf-tools/src/CMakeLists.txt b/host/hackrf-tools/src/CMakeLists.txt
+index 40f11dc..ada3a0f 100644
+--- a/host/hackrf-tools/src/CMakeLists.txt
++++ b/host/hackrf-tools/src/CMakeLists.txt
+@@ -42,7 +42,7 @@ if(MSVC)
+ 	)
+ 	LIST(APPEND TOOLS_LINK_LIBS ${FFTW_LIBRARIES})
+ else()
+-    LIST(APPEND TOOLS_LINK_LIBS m fftw3f)
++    LIST(APPEND TOOLS_LINK_LIBS m ${FFTW_LIBRARIES})
+ endif()
+ 
+ if(NOT libhackrf_SOURCE_DIR)
+-- 
+2.11.0
+
diff --git a/package/hackrf/Config.in b/package/hackrf/Config.in
new file mode 100644
index 0000000000..e4d2f2308a
--- /dev/null
+++ b/package/hackrf/Config.in
@@ -0,0 +1,17 @@
+comment "hackrf needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
+comment "hackrf needs fftw w/ single precision"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	depends on !BR2_PACKAGE_FFTW_PRECISION_SINGLE
+
+config BR2_PACKAGE_HACKRF
+	bool "hackrf"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_FFTW_PRECISION_SINGLE
+	help
+	  Library and tools for accessing HackRF SDR boards.
+
+	  https://github.com/mossmann/hackrf/wiki
diff --git a/package/hackrf/hackrf.mk b/package/hackrf/hackrf.mk
new file mode 100644
index 0000000000..af5d9c08f2
--- /dev/null
+++ b/package/hackrf/hackrf.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# hackrf
+#
+################################################################################
+
+HACKRF_VERSION = fb83ad64953bf7f8707bc209968f9e49f894369e
+HACKRF_SITE = $(call github,mossmann,hackrf,$(HACKRF_VERSION))
+HACKRF_LICENSE = GPLv2 GPLv2+ BSD-3c
+HACKRF_LICENSE_FILES = COPYING
+HACKRF_DEPENDENCIES = host-pkgconf libusb fftw
+HACKRF_INSTALL_STAGING = YES
+HACKRF_SUBDIR = host
+HACKRF_SUPPORTS_IN_SOURCE_BUILD = NO
+
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+HACKRF_CONF_OPTS += -DINSTALL_UDEV_RULES=ON
+else
+HACKRF_CONF_OPTS += -DINSTALL_UDEV_RULES=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.11.0
