From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 May 2021 11:01:33 +0200
Subject: [Buildroot] [PATCH/next 2/2] package/intel-mediadriver: bump
 version to 21.1.3
In-Reply-To: <20210529090133.287390-1-bernd.kuhls@t-online.de>
References: <20210529090133.287390-1-bernd.kuhls@t-online.de>
Message-ID: <20210529090133.287390-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rebased patch 0001.
Removed patch 0002 which was backported from upstream commit.
Reformatted hashes.

Reworked X11 support as it is an optional dependency:
https://github.com/intel/media-driver/pull/494

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-Drop-hardening-related-flags.patch   |  36 ++--
 ...-Werror=format-overflow-under-gcc-10.patch | 162 ------------------
 package/intel-mediadriver/Config.in           |   6 -
 .../intel-mediadriver/intel-mediadriver.hash  |   4 +-
 .../intel-mediadriver/intel-mediadriver.mk    |   9 +-
 5 files changed, 29 insertions(+), 188 deletions(-)
 delete mode 100644 package/intel-mediadriver/0002-build-fix-Werror=format-overflow-under-gcc-10.patch

diff --git a/package/intel-mediadriver/0001-Drop-hardening-related-flags.patch b/package/intel-mediadriver/0001-Drop-hardening-related-flags.patch
index bc29203317..df750d49a8 100644
--- a/package/intel-mediadriver/0001-Drop-hardening-related-flags.patch
+++ b/package/intel-mediadriver/0001-Drop-hardening-related-flags.patch
@@ -17,27 +17,33 @@ diff --git a/cmrtlib/linux/CMakeLists.txt b/cmrtlib/linux/CMakeLists.txt
 index 44ce4f08..b462fbea 100644
 --- a/cmrtlib/linux/CMakeLists.txt
 +++ b/cmrtlib/linux/CMakeLists.txt
-@@ -26,11 +26,11 @@ set(LIBRARY_OUTPUT_PATH    ${MDF_OPTION__OUTPUT_DIR})
+@@ -32,17 +32,17 @@
+ endif()
  
  # Set up compile options that will be used for the Linux build
- if(CMAKE_COMPILER_IS_GNUCC)
--    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -msse4.1 -std=c++11 -fPIC -fpermissive -fstack-protector-all -Werror")
--    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -fno-strict-aliasing -D_FORTIFY_SOURCE=2")
-+    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -msse4.1 -std=c++11 -fPIC -fpermissive -Werror")
-+    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -fno-strict-aliasing ")
-     set(CMAKE_CXX_FLAGS_DEBUG   "${CMAKE_CXX_FLAGS_DEBUG} -D_DEBUG -D__DEBUG -O0")
--    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -msse4.1 -std=c++11 -fPIC -fpermissive -fstack-protector-all -Werror")
--    set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -fno-strict-aliasing -D_FORTIFY_SOURCE=2")
-+    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -msse4.1 -std=c++11 -fPIC -fpermissive -Werror")
-+    set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -fno-strict-aliasing")
-     set(CMAKE_C_FLAGS_DEBUG   "${CMAKE_C_FLAGS_DEBUG} -D_DEBUG -D__DEBUG -O0")
+-set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive -fstack-protector-all -Werror")
++set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive -Werror")
+ if(CMAKE_SIZEOF_VOID_P EQUAL 8)
+    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -msse4.1")
+ endif()
+-set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -fno-strict-aliasing -D_FORTIFY_SOURCE=2")
++set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -fno-strict-aliasing")
+ set(CMAKE_CXX_FLAGS_DEBUG   "${CMAKE_CXX_FLAGS_DEBUG} -D_DEBUG -D__DEBUG -O0")
+-set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive -fstack-protector-all -Werror")
++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive -Werror")
+ if(CMAKE_SIZEOF_VOID_P EQUAL 8)
+    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -msse4.1")
+ endif()
+-set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -fno-strict-aliasing -D_FORTIFY_SOURCE=2")
++set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -fno-strict-aliasing")
+ set(CMAKE_C_FLAGS_DEBUG   "${CMAKE_C_FLAGS_DEBUG} -D_DEBUG -D__DEBUG -O0")
  
-     set(GCC_SECURE_LINK_FLAGS "-z relro -z now")
+ set(GCC_SECURE_LINK_FLAGS "-z relro -z now")
 diff --git a/media_driver/cmake/linux/media_compile_flags_linux.cmake b/media_driver/cmake/linux/media_compile_flags_linux.cmake
 index 9e85fdb2..c45ce11b 100755
 --- a/media_driver/cmake/linux/media_compile_flags_linux.cmake
 +++ b/media_driver/cmake/linux/media_compile_flags_linux.cmake
-@@ -64,7 +64,6 @@ set(MEDIA_COMPILER_FLAGS_COMMON
+@@ -47,7 +47,6 @@ set(MEDIA_COMPILER_FLAGS_COMMON
      # Other common flags
      -fmessage-length=0
      -fvisibility=hidden
@@ -49,7 +55,7 @@ diff --git a/media_driver/media_top_cmake.cmake b/media_driver/media_top_cmake.c
 index 3491db1e..b30fa04a 100755
 --- a/media_driver/media_top_cmake.cmake
 +++ b/media_driver/media_top_cmake.cmake
-@@ -88,7 +88,7 @@ if(MEDIA_BUILD_FATAL_WARNINGS)
+@@ -105,7 +105,7 @@ if(MEDIA_BUILD_FATAL_WARNINGS)
      set_target_properties(${LIB_NAME_OBJ} PROPERTIES COMPILE_FLAGS "-Werror")
  endif()
  
diff --git a/package/intel-mediadriver/0002-build-fix-Werror=format-overflow-under-gcc-10.patch b/package/intel-mediadriver/0002-build-fix-Werror=format-overflow-under-gcc-10.patch
deleted file mode 100644
index 46775e9347..0000000000
--- a/package/intel-mediadriver/0002-build-fix-Werror=format-overflow-under-gcc-10.patch
+++ /dev/null
@@ -1,162 +0,0 @@
-From da966a2ab1f5161cc0a21a4cd7e07edf732ebee9 Mon Sep 17 00:00:00 2001
-From: Dmitry Rogozhkin <dmitry.v.rogozhkin@intel.com>
-Date: Thu, 19 Mar 2020 20:59:12 -0700
-Subject: [PATCH] build: fix Werror=format-overflow under gcc-10
-
-Fixes: #870
-
-With upcoming gcc-10 we start to see Werror=format-overflow reporting
-that we attempt to printf %s null strings.
-
-Change-Id: I7a62bc98bf7dd6bcd61d475d7650a06aa1a70932
-Signed-off-by: Dmitry Rogozhkin <dmitry.v.rogozhkin@intel.com>
-[Retrieved from:
-https://github.com/intel/media-driver/commit/da966a2ab1f5161cc0a21a4cd7e07edf732ebee9]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- media_driver/linux/common/os/i915/xf86drm.c   | 57 ++++++++++---------
- .../linux/ult/libdrm_mock/xf86drm_mock.c      | 57 ++++++++++---------
- 2 files changed, 58 insertions(+), 56 deletions(-)
-
-diff --git a/media_driver/linux/common/os/i915/xf86drm.c b/media_driver/linux/common/os/i915/xf86drm.c
-index 7594bde99..d0fc1b7ac 100644
---- a/media_driver/linux/common/os/i915/xf86drm.c
-+++ b/media_driver/linux/common/os/i915/xf86drm.c
-@@ -581,37 +581,38 @@ static int drmOpenByBusid(const char *busid, int type)
- 
-     drmMsg("drmOpenByBusid: Searching for BusID %s\n", busid);
-     for (i = base; i < base + DRM_MAX_MINOR; i++) {
--    fd = drmOpenMinor(i, 1, type);
--    drmMsg("drmOpenByBusid: drmOpenMinor returns %d\n", fd);
--    if (fd >= 0) {
--        /* We need to try for 1.4 first for proper PCI domain support
--         * and if that fails, we know the kernel is busted
--         */
--        sv.drm_di_major = 1;
--        sv.drm_di_minor = 4;
--        sv.drm_dd_major = -1;    /* Don't care */
--        sv.drm_dd_minor = -1;    /* Don't care */
--        if (drmSetInterfaceVersion(fd, &sv)) {
-+        fd = drmOpenMinor(i, 1, type);
-+        drmMsg("drmOpenByBusid: drmOpenMinor returns %d\n", fd);
-+        if (fd >= 0) {
-+            /* We need to try for 1.4 first for proper PCI domain support
-+             * and if that fails, we know the kernel is busted
-+             */
-+            sv.drm_di_major = 1;
-+            sv.drm_di_minor = 4;
-+            sv.drm_dd_major = -1;    /* Don't care */
-+            sv.drm_dd_minor = -1;    /* Don't care */
-+            if (drmSetInterfaceVersion(fd, &sv)) {
- #ifndef __alpha__
--        pci_domain_ok = 0;
-+                pci_domain_ok = 0;
- #endif
--        sv.drm_di_major = 1;
--        sv.drm_di_minor = 1;
--        sv.drm_dd_major = -1;       /* Don't care */
--        sv.drm_dd_minor = -1;       /* Don't care */
--        drmMsg("drmOpenByBusid: Interface 1.4 failed, trying 1.1\n");
--        drmSetInterfaceVersion(fd, &sv);
--        }
--        buf = drmGetBusid(fd);
--        drmMsg("drmOpenByBusid: drmGetBusid reports %s\n", buf);
--        if (buf && drmMatchBusID(buf, busid, pci_domain_ok)) {
--        drmFreeBusid(buf);
--        return fd;
-+                sv.drm_di_major = 1;
-+                sv.drm_di_minor = 1;
-+                sv.drm_dd_major = -1;       /* Don't care */
-+                sv.drm_dd_minor = -1;       /* Don't care */
-+                drmMsg("drmOpenByBusid: Interface 1.4 failed, trying 1.1\n");
-+                drmSetInterfaceVersion(fd, &sv);
-+            }
-+            buf = drmGetBusid(fd);
-+            if (buf) {
-+                drmMsg("drmOpenByBusid: drmGetBusid reports %s\n", buf);
-+                if (drmMatchBusID(buf, busid, pci_domain_ok)) {
-+                    drmFreeBusid(buf);
-+                    return fd;
-+                }
-+                drmFreeBusid(buf);
-+            }
-+            close(fd);
-         }
--        if (buf)
--        drmFreeBusid(buf);
--        close(fd);
--    }
-     }
-     return -1;
- }
-diff --git a/media_driver/linux/ult/libdrm_mock/xf86drm_mock.c b/media_driver/linux/ult/libdrm_mock/xf86drm_mock.c
-index 7e5246295..2e5863798 100644
---- a/media_driver/linux/ult/libdrm_mock/xf86drm_mock.c
-+++ b/media_driver/linux/ult/libdrm_mock/xf86drm_mock.c
-@@ -790,37 +790,38 @@ static int drmOpenByBusid(const char *busid, int type)
- 
-     drmMsg("drmOpenByBusid: Searching for BusID %s\n", busid);
-     for (i = base; i < base + DRM_MAX_MINOR; i++) {
--    fd = drmOpenMinor(i, 1, type);
--    drmMsg("drmOpenByBusid: drmOpenMinor returns %d\n", fd);
--    if (fd >= 0) {
--        /* We need to try for 1.4 first for proper PCI domain support
--         * and if that fails, we know the kernel is busted
--         */
--        sv.drm_di_major = 1;
--        sv.drm_di_minor = 4;
--        sv.drm_dd_major = -1;    /* Don't care */
--        sv.drm_dd_minor = -1;    /* Don't care */
--        if (drmSetInterfaceVersion(fd, &sv)) {
-+        fd = drmOpenMinor(i, 1, type);
-+        drmMsg("drmOpenByBusid: drmOpenMinor returns %d\n", fd);
-+        if (fd >= 0) {
-+            /* We need to try for 1.4 first for proper PCI domain support
-+             * and if that fails, we know the kernel is busted
-+             */
-+            sv.drm_di_major = 1;
-+            sv.drm_di_minor = 4;
-+            sv.drm_dd_major = -1;    /* Don't care */
-+            sv.drm_dd_minor = -1;    /* Don't care */
-+            if (drmSetInterfaceVersion(fd, &sv)) {
- #ifndef __alpha__
--        pci_domain_ok = 0;
-+                pci_domain_ok = 0;
- #endif
--        sv.drm_di_major = 1;
--        sv.drm_di_minor = 1;
--        sv.drm_dd_major = -1;       /* Don't care */
--        sv.drm_dd_minor = -1;       /* Don't care */
--        drmMsg("drmOpenByBusid: Interface 1.4 failed, trying 1.1\n");
--        drmSetInterfaceVersion(fd, &sv);
--        }
--        buf = drmGetBusid(fd);
--        drmMsg("drmOpenByBusid: drmGetBusid reports %s\n", buf);
--        if (buf && drmMatchBusID(buf, busid, pci_domain_ok)) {
--        drmFreeBusid(buf);
--        return fd;
-+                sv.drm_di_major = 1;
-+                sv.drm_di_minor = 1;
-+                sv.drm_dd_major = -1;       /* Don't care */
-+                sv.drm_dd_minor = -1;       /* Don't care */
-+                drmMsg("drmOpenByBusid: Interface 1.4 failed, trying 1.1\n");
-+                drmSetInterfaceVersion(fd, &sv);
-+            }
-+            buf = drmGetBusid(fd);
-+            if (buf) {
-+                drmMsg("drmOpenByBusid: drmGetBusid reports %s\n", buf);
-+                if (drmMatchBusID(buf, busid, pci_domain_ok)) {
-+                    drmFreeBusid(buf);
-+                    return fd;
-+                }
-+                drmFreeBusid(buf);
-+            }
-+            close(fd);
-         }
--        if (buf)
--        drmFreeBusid(buf);
--        close(fd);
--    }
-     }
-     return -1;
- }
diff --git a/package/intel-mediadriver/Config.in b/package/intel-mediadriver/Config.in
index 35117f7712..2d5adbcf59 100644
--- a/package/intel-mediadriver/Config.in
+++ b/package/intel-mediadriver/Config.in
@@ -6,12 +6,10 @@ config BR2_PACKAGE_INTEL_MEDIADRIVER
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # mesa3d
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libva
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mesa3d
-	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_INTEL_GMMLIB
 	select BR2_PACKAGE_LIBPCIACCESS
 	select BR2_PACKAGE_LIBVA
 	select BR2_PACKAGE_MESA3D
-	select BR2_PACKAGE_XLIB_LIBX11
 	help
 	  The Intel(R) Media Driver for VAAPI is a new VA-API (Video
 	  Acceleration API) user mode driver supporting hardware
@@ -20,10 +18,6 @@ config BR2_PACKAGE_INTEL_MEDIADRIVER
 
 	  https://github.com/intel/media-driver
 
-comment "intel-mediadriver needs X.org"
-	depends on BR2_x86_64 && BR2_TOOLCHAIN_HAS_SYNC_1
-	depends on !BR2_PACKAGE_XORG7
-
 comment "intel-mediadriver needs a toolchain w/ dynamic library, C++, NPTL"
 	depends on BR2_x86_64 && BR2_TOOLCHAIN_HAS_SYNC_1
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 5d016695ae..56f3e8fb6d 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 a03bd75eefe9cb0245e3aab2723b3fef555d9f180a180b2c29d7b12d483d9ec2  intel-media-19.4.0r.tar.gz
-sha256 74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
+sha256  219ce6b08a84bdce311160dc694d866249fd4e390391c2ac7be55f13a2fb928c  intel-media-21.1.3.tar.gz
+sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 963e4b8f9c..66c4570f04 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 19.4.0r
+INTEL_MEDIADRIVER_VERSION = 21.1.3
 INTEL_MEDIADRIVER_SITE = http://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
@@ -16,8 +16,11 @@ INTEL_MEDIADRIVER_DEPENDENCIES = \
 	intel-gmmlib \
 	libpciaccess \
 	libva \
-	mesa3d \
-	xlib_libX11
+	mesa3d
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
+INTEL_MEDIADRIVER_DEPENDENCIES += xlib_libX11
+endif
 
 INTEL_MEDIADRIVER_SUPPORTS_IN_SOURCE_BUILD = NO
 
-- 
2.29.2
