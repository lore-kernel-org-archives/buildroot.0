From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 22 Sep 2016 23:47:12 +0200
Subject: [Buildroot] [PATCH v1] rpi-userland: bump version
In-Reply-To: <1474580832-22406-1-git-send-email-ps.report@gmx.net>
References: <1474580832-22406-1-git-send-email-ps.report@gmx.net>
Message-ID: <1474580832-22406-7-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- rebased patches (using git) to fix patch conflicts

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...es-for-the-OpenGLESv2-EGL-and-bcm_host-li.patch |  17 +-
 ...emove-faulty-assert-to-make-weston-happy-.patch |  35 +++++
 .../0003-Disable-Werror-everywhere.patch           | 171 +++++++++++++++++++++
 ...emove-faulty-assert-to-make-weston-happy-.patch |  33 ----
 ...pplications-disable-missing-applications.patch} |  18 ++-
 package/rpi-userland/0004-no-Werror.patch          | 138 -----------------
 ...-dtmerge-add-missing-include-for-va_list.patch} |   0
 package/rpi-userland/rpi-userland.hash             |   2 +-
 package/rpi-userland/rpi-userland.mk               |   2 +-
 9 files changed, 230 insertions(+), 186 deletions(-)
 create mode 100644 package/rpi-userland/0002-interface-remove-faulty-assert-to-make-weston-happy-.patch
 create mode 100644 package/rpi-userland/0003-Disable-Werror-everywhere.patch
 delete mode 100644 package/rpi-userland/0003-interface-remove-faulty-assert-to-make-weston-happy-.patch
 rename package/rpi-userland/{0005-disable-missing-all-apps.patch => 0004-host-applications-disable-missing-applications.patch} (61%)
 delete mode 100644 package/rpi-userland/0004-no-Werror.patch
 rename package/rpi-userland/{0006-dtmerge-add-missing-include-for-va_list.patch => 0005-dtmerge-add-missing-include-for-va_list.patch} (100%)

diff --git a/package/rpi-userland/0001-Add-.pc-files-for-the-OpenGLESv2-EGL-and-bcm_host-li.patch b/package/rpi-userland/0001-Add-.pc-files-for-the-OpenGLESv2-EGL-and-bcm_host-li.patch
index 352f95d..fb87337 100644
--- a/package/rpi-userland/0001-Add-.pc-files-for-the-OpenGLESv2-EGL-and-bcm_host-li.patch
+++ b/package/rpi-userland/0001-Add-.pc-files-for-the-OpenGLESv2-EGL-and-bcm_host-li.patch
@@ -1,14 +1,16 @@
-From 853d7486a98e38eb78d48b2dcb1dda36610575b4 Mon Sep 17 00:00:00 2001
+From 4824be8986c2b6ef0b0bd2b32bc99c4ba6406640 Mon Sep 17 00:00:00 2001
 From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Date: Sat, 24 Jan 2015 19:44:14 +0100
-Subject: [PATCH] Add .pc files for the OpenGLESv2, EGL and bcm_host
- libraries
+Subject: [PATCH] Add .pc files for the OpenGLESv2, EGL and bcm_host libraries
 
 Those pkg-config files make it easier for Qt5 to find those libraries
 and the appropriate link flags.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+[Rebased for rpi-userland-a1b89e91f393c7134b4cdc36431f863bb3333163]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
  host_applications/linux/libs/bcm_host/CMakeLists.txt |  4 ++++
  host_applications/linux/libs/bcm_host/bcm_host.pc.in | 10 ++++++++++
@@ -49,10 +51,10 @@ index 0000000..d40d350
 +Libs: -L${libdir} -lbcm_host -lvcos -lvchiq_arm
 +Cflags: -I${includedir} -I${includedir}/interface/vmcs_host/linux -I${includedir}/interface/vcos/pthreads -DUSE_VCHIQ_ARM
 diff --git a/interface/khronos/CMakeLists.txt b/interface/khronos/CMakeLists.txt
-index c437291..ec5a605 100644
+index 4231af4..2844ebd 100644
 --- a/interface/khronos/CMakeLists.txt
 +++ b/interface/khronos/CMakeLists.txt
-@@ -74,3 +74,11 @@ target_link_libraries(OpenVG EGL)
+@@ -74,6 +74,14 @@ target_link_libraries(OpenVG EGL)
  
  install(TARGETS EGL GLESv2 OpenVG WFC khrn_client DESTINATION lib)
  install(TARGETS EGL_static GLESv2_static khrn_static DESTINATION lib)
@@ -64,6 +66,9 @@ index c437291..ec5a605 100644
 +  "${CMAKE_CURRENT_BINARY_DIR}/glxx/glesv2.pc" @ONLY)
 +install(FILES "${CMAKE_CURRENT_BINARY_DIR}/glxx/glesv2.pc"
 +  DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig")
+ 
+ # recommended names to use to avoid conflicts with mesa libs
+ add_library(brcmEGL ${SHARED} ${EGL_SOURCE})
 diff --git a/interface/khronos/egl/egl.pc.in b/interface/khronos/egl/egl.pc.in
 new file mode 100644
 index 0000000..5868706
@@ -98,5 +103,5 @@ index 0000000..2f58eed
 +Libs: -L${libdir} -lGLESv2
 +Cflags: -I${includedir}/
 -- 
-1.9.1
+2.8.1
 
diff --git a/package/rpi-userland/0002-interface-remove-faulty-assert-to-make-weston-happy-.patch b/package/rpi-userland/0002-interface-remove-faulty-assert-to-make-weston-happy-.patch
new file mode 100644
index 0000000..0e9dede
--- /dev/null
+++ b/package/rpi-userland/0002-interface-remove-faulty-assert-to-make-weston-happy-.patch
@@ -0,0 +1,35 @@
+From a126ee5a3235792abb58daffd9d4b3e1012f675b Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sat, 24 Jan 2015 22:07:19 +0100
+Subject: [PATCH] interface: remove faulty assert() to make weston happy at
+ runtime
+
+This was removed after a discussion on IRC with the weston guys
+('daniels' on irc.freenode.net/#wayland).
+
+Upstream status: no, will be pushed by weston guys later.
+If not, I'll do it.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+[Rebased for rpi-userland-a1b89e91f393c7134b4cdc36431f863bb3333163]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ interface/vmcs_host/vc_vchi_dispmanx.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/interface/vmcs_host/vc_vchi_dispmanx.c b/interface/vmcs_host/vc_vchi_dispmanx.c
+index 133e86d..0c7873c 100755
+--- a/interface/vmcs_host/vc_vchi_dispmanx.c
++++ b/interface/vmcs_host/vc_vchi_dispmanx.c
+@@ -1306,7 +1306,6 @@ static void *dispmanx_notify_func( void *arg ) {
+             // Decrement the use count - the corresponding "use" is in vc_dispmanx_update_submit.
+             vchi_service_release(dispmanx_client.notify_handle[0]);
+             if (dispmanx_client.update_callback ) {
+-               vcos_assert( dispmanx_client.pending_update_handle == handle);
+                dispmanx_client.update_callback(handle, dispmanx_client.update_callback_param);
+             }
+          } else {
+-- 
+2.8.1
+
diff --git a/package/rpi-userland/0003-Disable-Werror-everywhere.patch b/package/rpi-userland/0003-Disable-Werror-everywhere.patch
new file mode 100644
index 0000000..64ae8ed
--- /dev/null
+++ b/package/rpi-userland/0003-Disable-Werror-everywhere.patch
@@ -0,0 +1,171 @@
+From 67924a43d52862a7b4c9076d49071449313fea85 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 22 Sep 2016 22:59:11 +0200
+Subject: [PATCH] Disable Werror everywhere
+
+With gcc-5.1, some constructs that were previously accepted (but wrong)
+are now considered warnings, and thus -Werror makes them errors.
+
+Ditch -Werror altoghether.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+[Rebased for rpi-userland-a1b89e91f393c7134b4cdc36431f863bb3333163]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ host_applications/android/apps/vidtex/CMakeLists.txt | 2 +-
+ host_applications/linux/apps/gencmd/CMakeLists.txt   | 2 +-
+ host_applications/linux/apps/raspicam/CMakeLists.txt | 2 +-
+ host_applications/linux/apps/smem/CMakeLists.txt     | 2 +-
+ host_applications/linux/libs/bcm_host/CMakeLists.txt | 2 +-
+ host_applications/linux/libs/sm/CMakeLists.txt       | 2 +-
+ interface/mmal/CMakeLists.txt                        | 2 +-
+ interface/vcos/CMakeLists.txt                        | 2 +-
+ interface/vcos/pthreads/CMakeLists.txt               | 2 +-
+ interface/vmcs_host/CMakeLists.txt                   | 2 +-
+ interface/vmcs_host/linux/vcfiled/CMakeLists.txt     | 2 +-
+ 11 files changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/host_applications/android/apps/vidtex/CMakeLists.txt b/host_applications/android/apps/vidtex/CMakeLists.txt
+index 1f705ef..37d037d 100644
+--- a/host_applications/android/apps/vidtex/CMakeLists.txt
++++ b/host_applications/android/apps/vidtex/CMakeLists.txt
+@@ -1,6 +1,6 @@
+ cmake_minimum_required(VERSION 2.8)
+ 
+-SET(COMPILE_DEFINITIONS -Werror -Wall)
++SET(COMPILE_DEFINITIONS  -Wall)
+ include_directories(${PROJECT_SOURCE_DIR}/host_applications/linux/libs/bcm_host/include)
+ 
+ set (VIDTEX_SOURCES
+diff --git a/host_applications/linux/apps/gencmd/CMakeLists.txt b/host_applications/linux/apps/gencmd/CMakeLists.txt
+index f95d1a1..034bf20 100644
+--- a/host_applications/linux/apps/gencmd/CMakeLists.txt
++++ b/host_applications/linux/apps/gencmd/CMakeLists.txt
+@@ -4,7 +4,7 @@ if (WIN32)
+    set(VCOS_PLATFORM win32)
+ else ()
+    set(VCOS_PLATFORM pthreads)
+-   add_definitions(-Wall -Werror)
++   add_definitions(-Wall )
+ endif ()
+ 
+ include_directories( ../../../.. 
+diff --git a/host_applications/linux/apps/raspicam/CMakeLists.txt b/host_applications/linux/apps/raspicam/CMakeLists.txt
+index 2afc145..04e446f 100644
+--- a/host_applications/linux/apps/raspicam/CMakeLists.txt
++++ b/host_applications/linux/apps/raspicam/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ 
+ # raspistill/raspivid/raspiyuv
+ 
+-SET(COMPILE_DEFINITIONS -Werror)
++SET(COMPILE_DEFINITIONS )
+ 
+ include_directories(${PROJECT_SOURCE_DIR}/host_applications/linux/libs/bcm_host/include)
+ include_directories(${PROJECT_SOURCE_DIR}/host_applications/linux/apps/raspicam/)
+diff --git a/host_applications/linux/apps/smem/CMakeLists.txt b/host_applications/linux/apps/smem/CMakeLists.txt
+index 0fa8328..f0d1e77 100644
+--- a/host_applications/linux/apps/smem/CMakeLists.txt
++++ b/host_applications/linux/apps/smem/CMakeLists.txt
+@@ -4,7 +4,7 @@ get_filename_component (VIDEOCORE_ROOT ../../../.. ABSOLUTE)
+ include (${VIDEOCORE_ROOT}/makefiles/cmake/global_settings.cmake)
+ 
+ if (NOT WIN32)
+-   add_definitions(-Wall -Werror)
++   add_definitions(-Wall )
+ endif ()
+ 
+ include_directories (
+diff --git a/host_applications/linux/libs/bcm_host/CMakeLists.txt b/host_applications/linux/libs/bcm_host/CMakeLists.txt
+index 1f29ead..fb78cea 100644
+--- a/host_applications/linux/libs/bcm_host/CMakeLists.txt
++++ b/host_applications/linux/libs/bcm_host/CMakeLists.txt
+@@ -3,7 +3,7 @@ if (WIN32)
+    set(VCOS_PLATFORM win32)
+ else ()
+    set(VCOS_PLATFORM pthreads)
+-   add_definitions(-Wall -Werror)
++   add_definitions(-Wall )
+ endif ()
+ 
+ include_directories( ../../../.. 
+diff --git a/host_applications/linux/libs/sm/CMakeLists.txt b/host_applications/linux/libs/sm/CMakeLists.txt
+index c6bf764..4bca0b0 100644
+--- a/host_applications/linux/libs/sm/CMakeLists.txt
++++ b/host_applications/linux/libs/sm/CMakeLists.txt
+@@ -3,7 +3,7 @@ if (WIN32)
+    set(VCOS_PLATFORM win32)
+ else ()
+    set(VCOS_PLATFORM pthreads)
+-   add_definitions(-Wall -Werror)
++   add_definitions(-Wall )
+ endif ()
+ 
+ include_directories( ../../../..
+diff --git a/interface/mmal/CMakeLists.txt b/interface/mmal/CMakeLists.txt
+index 37ae757..78b24a9 100644
+--- a/interface/mmal/CMakeLists.txt
++++ b/interface/mmal/CMakeLists.txt
+@@ -3,7 +3,7 @@ if (NOT DEFINED LIBRARY_TYPE)
+ set(LIBRARY_TYPE SHARED)
+ endif (NOT DEFINED LIBRARY_TYPE)
+ 
+-add_definitions(-Wall -Werror)
++add_definitions(-Wall )
+ 
+ add_library(mmal SHARED util/mmal_util.c)
+ 
+diff --git a/interface/vcos/CMakeLists.txt b/interface/vcos/CMakeLists.txt
+index 23a8d72..988b104 100644
+--- a/interface/vcos/CMakeLists.txt
++++ b/interface/vcos/CMakeLists.txt
+@@ -43,7 +43,7 @@ foreach (header ${HEADERS})
+ endforeach ()
+ 
+ if (CMAKE_COMPILER_IS_GNUCC)
+-   add_definitions (-ggdb -Werror -Wall)
++   add_definitions (-ggdb  -Wall)
+ endif ()
+ 
+ if (CMAKE_COMPILER_2005)
+diff --git a/interface/vcos/pthreads/CMakeLists.txt b/interface/vcos/pthreads/CMakeLists.txt
+index 1d81ca3..b35cd8e 100644
+--- a/interface/vcos/pthreads/CMakeLists.txt
++++ b/interface/vcos/pthreads/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ # MSVC5 does not fully support C99, enabling declaration-after-statement
+ # warnings allows a common MSVC5 build error to be detected in Linux builds.
+ if (CMAKE_COMPILER_IS_GNUCC)
+-   set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Werror -Wdeclaration-after-statement")
++   set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall  -Wdeclaration-after-statement")
+    add_definitions (-D_GNU_SOURCE)
+ endif ()
+ 
+diff --git a/interface/vmcs_host/CMakeLists.txt b/interface/vmcs_host/CMakeLists.txt
+index 0b3adc9..c5156d8 100755
+--- a/interface/vmcs_host/CMakeLists.txt
++++ b/interface/vmcs_host/CMakeLists.txt
+@@ -2,7 +2,7 @@
+ # interface/vmcs_host
+ 
+ # not working in release build
+-# add_definitions(-Werror)
++# add_definitions()
+ 
+ # vc_vchi_gencmd.c has a type-punning problem in vc_gencmd_read_response
+ add_definitions(-fno-strict-aliasing)
+diff --git a/interface/vmcs_host/linux/vcfiled/CMakeLists.txt b/interface/vmcs_host/linux/vcfiled/CMakeLists.txt
+index aed0e83..d834b3f 100644
+--- a/interface/vmcs_host/linux/vcfiled/CMakeLists.txt
++++ b/interface/vmcs_host/linux/vcfiled/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ 
+-add_definitions(-Werror)
++add_definitions()
+ 
+ # vcfiled - serves files to videocore. used for media handlers from
+ # OpenMAX/IL and loading VLLs.
+-- 
+2.8.1
+
diff --git a/package/rpi-userland/0003-interface-remove-faulty-assert-to-make-weston-happy-.patch b/package/rpi-userland/0003-interface-remove-faulty-assert-to-make-weston-happy-.patch
deleted file mode 100644
index 16a5f52..0000000
--- a/package/rpi-userland/0003-interface-remove-faulty-assert-to-make-weston-happy-.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From e0df1a4f1d9737935165f420d0d0f685efc63f49 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sat, 24 Jan 2015 22:07:19 +0100
-Subject: [PATCH] interface: remove faulty assert() to make weston happy at
- runtime
-
-This was removed after a discussion on IRC with the weston guys
-('daniels' on irc.freenode.net/#wayland).
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
----
-Upstream status: no, will be pushed by weston guys later.
-If not, I'll do it.
----
- interface/vmcs_host/vc_vchi_dispmanx.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/interface/vmcs_host/vc_vchi_dispmanx.c b/interface/vmcs_host/vc_vchi_dispmanx.c
-index 85b373c..59a01f8 100755
---- a/interface/vmcs_host/vc_vchi_dispmanx.c
-+++ b/interface/vmcs_host/vc_vchi_dispmanx.c
-@@ -1296,7 +1296,6 @@ static void *dispmanx_notify_func( void *arg ) {
-          // Decrement the use count - the corresponding "use" is in vc_dispmanx_update_submit.
-          vchi_service_release(dispmanx_client.notify_handle[0]);
-          if (dispmanx_client.update_callback ) {
--            vcos_assert( dispmanx_client.pending_update_handle == handle);
-             dispmanx_client.update_callback(handle, dispmanx_client.update_callback_param);
-          }
-       } else {
--- 
-1.9.1
-
diff --git a/package/rpi-userland/0005-disable-missing-all-apps.patch b/package/rpi-userland/0004-host-applications-disable-missing-applications.patch
similarity index 61%
rename from package/rpi-userland/0005-disable-missing-all-apps.patch
rename to package/rpi-userland/0004-host-applications-disable-missing-applications.patch
index 520c7be..0803912 100644
--- a/package/rpi-userland/0005-disable-missing-all-apps.patch
+++ b/package/rpi-userland/0004-host-applications-disable-missing-applications.patch
@@ -1,4 +1,4 @@
-From 249f6c8b44581083dfb16ebf66bfe94f7c9fb163 Mon Sep 17 00:00:00 2001
+From c8d2c332da2a03ed80d62628bbf54187a66f49b6 Mon Sep 17 00:00:00 2001
 From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Date: Fri, 24 Jul 2015 20:20:33 +0200
 Subject: [PATCH] host-applications: disable missing applications
@@ -7,24 +7,28 @@ Those applications are missing from the public rpi-firmware package, so
 do not even try to build them.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+[Rebased for rpi-userland-a1b89e91f393c7134b4cdc36431f863bb3333163]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
- host_applications/linux/CMakeLists.txt | 2 --
- 1 file changed, 2 deletions(-)
+ host_applications/linux/CMakeLists.txt | 3 ---
+ 1 file changed, 3 deletions(-)
 
 diff --git a/host_applications/linux/CMakeLists.txt b/host_applications/linux/CMakeLists.txt
-index ea4e016..4a87862 100644
+index 5a648e7..83bb66e 100644
 --- a/host_applications/linux/CMakeLists.txt
 +++ b/host_applications/linux/CMakeLists.txt
-@@ -10,9 +10,7 @@ add_subdirectory(apps/smem)
- add_subdirectory(libs/debug_sym)
+@@ -12,10 +12,7 @@ add_subdirectory(apps/dtoverlay)
+ add_subdirectory(apps/dtmerge)
  
  if(ALL_APPS)
 - add_subdirectory(apps/vcdbg)
+- add_subdirectory(libs/elftoolchain)
   # add_subdirectory(apps/smct)
 - add_subdirectory(apps/edid_parser)
   add_subdirectory(apps/hello_pi)
  endif()
  
 -- 
-1.9.1
+2.8.1
 
diff --git a/package/rpi-userland/0004-no-Werror.patch b/package/rpi-userland/0004-no-Werror.patch
deleted file mode 100644
index 18a23b3..0000000
--- a/package/rpi-userland/0004-no-Werror.patch
+++ /dev/null
@@ -1,138 +0,0 @@
-Disable Werror everywhere
-
-With gcc-5.1, some constructs that were previously accepted (but wrong)
-are now considered warnings, and thus -Werror makes them errors.
-
-Ditch -Werror altoghether.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990.orig/host_applications/android/apps/vidtex/CMakeLists.txt rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990/host_applications/android/apps/vidtex/CMakeLists.txt
---- rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990.orig/host_applications/android/apps/vidtex/CMakeLists.txt	2015-05-30 15:53:53.000000000 +0200
-+++ rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990/host_applications/android/apps/vidtex/CMakeLists.txt	2015-07-12 16:53:29.528491231 +0200
-@@ -1,6 +1,6 @@
- cmake_minimum_required(VERSION 2.8)
- 
--SET(COMPILE_DEFINITIONS -Werror -Wall)
-+SET(COMPILE_DEFINITIONS  -Wall)
- include_directories(${PROJECT_SOURCE_DIR}/host_applications/linux/libs/bcm_host/include)
- 
- set (VIDTEX_SOURCES
-diff -durN rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990.orig/host_applications/linux/apps/gencmd/CMakeLists.txt rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990/host_applications/linux/apps/gencmd/CMakeLists.txt
---- rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990.orig/host_applications/linux/apps/gencmd/CMakeLists.txt	2015-05-30 15:53:53.000000000 +0200
-+++ rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990/host_applications/linux/apps/gencmd/CMakeLists.txt	2015-07-12 16:53:29.512491038 +0200
-@@ -4,7 +4,7 @@
-    set(VCOS_PLATFORM win32)
- else ()
-    set(VCOS_PLATFORM pthreads)
--   add_definitions(-Wall -Werror)
-+   add_definitions(-Wall )
- endif ()
- 
- include_directories( ../../../.. 
-diff -durN rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990.orig/host_applications/linux/apps/raspicam/CMakeLists.txt rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990/host_applications/linux/apps/raspicam/CMakeLists.txt
---- rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990.orig/host_applications/linux/apps/raspicam/CMakeLists.txt	2015-05-30 15:53:53.000000000 +0200
-+++ rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990/host_applications/linux/apps/raspicam/CMakeLists.txt	2015-07-12 16:50:54.422624640 +0200
-@@ -1,7 +1,7 @@
- 
- # raspistill/raspivid/raspiyuv
- 
--SET(COMPILE_DEFINITIONS -Werror)
-+SET(COMPILE_DEFINITIONS )
- 
- include_directories(${PROJECT_SOURCE_DIR}/host_applications/linux/libs/bcm_host/include)
- include_directories(${PROJECT_SOURCE_DIR}/host_applications/linux/apps/raspicam/)
-diff -durN rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990.orig/host_applications/linux/apps/smem/CMakeLists.txt rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990/host_applications/linux/apps/smem/CMakeLists.txt
---- rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990.orig/host_applications/linux/apps/smem/CMakeLists.txt	2015-05-30 15:53:53.000000000 +0200
-+++ rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990/host_applications/linux/apps/smem/CMakeLists.txt	2015-07-12 16:53:29.516491086 +0200
-@@ -4,7 +4,7 @@
- include (${VIDEOCORE_ROOT}/makefiles/cmake/global_settings.cmake)
- 
- if (NOT WIN32)
--   add_definitions(-Wall -Werror)
-+   add_definitions(-Wall )
- endif ()
- 
- include_directories (
-diff -durN rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990.orig/host_applications/linux/libs/bcm_host/CMakeLists.txt rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990/host_applications/linux/libs/bcm_host/CMakeLists.txt
---- rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990.orig/host_applications/linux/libs/bcm_host/CMakeLists.txt	2015-07-12 16:48:03.768570937 +0200
-+++ rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990/host_applications/linux/libs/bcm_host/CMakeLists.txt	2015-07-12 16:53:29.520491135 +0200
-@@ -3,7 +3,7 @@
-    set(VCOS_PLATFORM win32)
- else ()
-    set(VCOS_PLATFORM pthreads)
--   add_definitions(-Wall -Werror)
-+   add_definitions(-Wall )
- endif ()
- 
- include_directories( ../../../.. 
-diff -durN rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990.orig/host_applications/linux/libs/sm/CMakeLists.txt rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990/host_applications/linux/libs/sm/CMakeLists.txt
---- rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990.orig/host_applications/linux/libs/sm/CMakeLists.txt	2015-05-30 15:53:53.000000000 +0200
-+++ rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990/host_applications/linux/libs/sm/CMakeLists.txt	2015-07-12 16:53:29.524491183 +0200
-@@ -3,7 +3,7 @@
-    set(VCOS_PLATFORM win32)
- else ()
-    set(VCOS_PLATFORM pthreads)
--   add_definitions(-Wall -Werror)
-+   add_definitions(-Wall )
- endif ()
- 
- include_directories( ../../../..
-diff -durN rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990.orig/interface/mmal/CMakeLists.txt rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990/interface/mmal/CMakeLists.txt
---- rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990.orig/interface/mmal/CMakeLists.txt	2015-05-30 15:53:53.000000000 +0200
-+++ rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990/interface/mmal/CMakeLists.txt	2015-07-12 16:53:29.536491327 +0200
-@@ -3,7 +3,7 @@
- set(LIBRARY_TYPE SHARED)
- endif (NOT DEFINED LIBRARY_TYPE)
- 
--add_definitions(-Wall -Werror)
-+add_definitions(-Wall )
- 
- add_library(mmal SHARED util/mmal_util.c)
- 
-diff -durN rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990.orig/interface/vcos/CMakeLists.txt rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990/interface/vcos/CMakeLists.txt
---- rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990.orig/interface/vcos/CMakeLists.txt	2015-05-30 15:53:53.000000000 +0200
-+++ rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990/interface/vcos/CMakeLists.txt	2015-07-12 16:53:29.540491375 +0200
-@@ -43,7 +43,7 @@
- endforeach ()
- 
- if (CMAKE_COMPILER_IS_GNUCC)
--   add_definitions (-ggdb -Werror -Wall)
-+   add_definitions (-ggdb  -Wall)
- endif ()
- 
- if (CMAKE_COMPILER_2005)
-diff -durN rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990.orig/interface/vcos/pthreads/CMakeLists.txt rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990/interface/vcos/pthreads/CMakeLists.txt
---- rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990.orig/interface/vcos/pthreads/CMakeLists.txt	2015-05-30 15:53:53.000000000 +0200
-+++ rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990/interface/vcos/pthreads/CMakeLists.txt	2015-07-12 16:53:29.540491375 +0200
-@@ -1,7 +1,7 @@
- # MSVC5 does not fully support C99, enabling declaration-after-statement
- # warnings allows a common MSVC5 build error to be detected in Linux builds.
- if (CMAKE_COMPILER_IS_GNUCC)
--   set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Werror -Wdeclaration-after-statement")
-+   set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall  -Wdeclaration-after-statement")
-    add_definitions (-D_GNU_SOURCE)
- endif ()
- 
-diff -durN rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990.orig/interface/vmcs_host/CMakeLists.txt rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990/interface/vmcs_host/CMakeLists.txt
---- rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990.orig/interface/vmcs_host/CMakeLists.txt	2015-05-30 15:53:53.000000000 +0200
-+++ rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990/interface/vmcs_host/CMakeLists.txt	2015-07-12 16:53:29.528491231 +0200
-@@ -2,7 +2,7 @@
- # interface/vmcs_host
- 
- # not working in release build
--# add_definitions(-Werror)
-+# add_definitions()
- 
- # vc_vchi_gencmd.c has a type-punning problem in vc_gencmd_read_response
- add_definitions(-fno-strict-aliasing)
-diff -durN rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990.orig/interface/vmcs_host/linux/vcfiled/CMakeLists.txt rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990/interface/vmcs_host/linux/vcfiled/CMakeLists.txt
---- rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990.orig/interface/vmcs_host/linux/vcfiled/CMakeLists.txt	2015-05-30 15:53:53.000000000 +0200
-+++ rpi-userland-b834074d0c0d9d7e64c133ab14ed691999cee990/interface/vmcs_host/linux/vcfiled/CMakeLists.txt	2015-07-12 16:53:29.532491279 +0200
-@@ -1,5 +1,5 @@
- 
--add_definitions(-Werror)
-+add_definitions()
- 
- # vcfiled - serves files to videocore. used for media handlers from
- # OpenMAX/IL and loading VLLs.
diff --git a/package/rpi-userland/0006-dtmerge-add-missing-include-for-va_list.patch b/package/rpi-userland/0005-dtmerge-add-missing-include-for-va_list.patch
similarity index 100%
rename from package/rpi-userland/0006-dtmerge-add-missing-include-for-va_list.patch
rename to package/rpi-userland/0005-dtmerge-add-missing-include-for-va_list.patch
diff --git a/package/rpi-userland/rpi-userland.hash b/package/rpi-userland/rpi-userland.hash
index 0c6f4fd..389c1ae 100644
--- a/package/rpi-userland/rpi-userland.hash
+++ b/package/rpi-userland/rpi-userland.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 b83878c487814d7736de83dc3ede1c39fa1c84bc2da2bea00312544eff64f1dc rpi-userland-7c026fa7a4ded2c525916cc853a32731c072ed1e.tar.gz
+sha256 bb79667d23743769dde120d35e6a4b69c633eb66e445b5bb2c06cd3e065750a2 rpi-userland-a1b89e91f393c7134b4cdc36431f863bb3333163.tar.gz
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 2ebd95b..86cde87 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 7c026fa7a4ded2c525916cc853a32731c072ed1e
+RPI_USERLAND_VERSION = a1b89e91f393c7134b4cdc36431f863bb3333163
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
2.8.1
