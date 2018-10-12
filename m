From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 12 Oct 2018 23:09:39 +0200
Subject: [Buildroot] [PATCH v1 3/5] rpi-userland: bump version to 8f0abfb07b
In-Reply-To: <20181012210941.21515-1-ps.report@gmx.net>
References: <20181012210941.21515-1-ps.report@gmx.net>
Message-ID: <20181012210941.21515-4-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- rebased 0003-Disable-Werror-everywhere.patch

- deleted 0006-host-apps-dtoverlay-don-t-install-script-in-random-l.patch
  (upstream applied [1])

[1] https://github.com/raspberrypi/userland/commit/2fe51001dbd421ac35a55af443ac080b50128266

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../0003-Disable-Werror-everywhere.patch      | 29 ++++++------
 ...lay-don-t-install-script-in-random-l.patch | 45 -------------------
 package/rpi-userland/rpi-userland.hash        |  2 +-
 package/rpi-userland/rpi-userland.mk          |  2 +-
 4 files changed, 18 insertions(+), 60 deletions(-)
 delete mode 100644 package/rpi-userland/0006-host-apps-dtoverlay-don-t-install-script-in-random-l.patch

diff --git a/package/rpi-userland/0003-Disable-Werror-everywhere.patch b/package/rpi-userland/0003-Disable-Werror-everywhere.patch
index 64ae8ed254..7fb2f97978 100644
--- a/package/rpi-userland/0003-Disable-Werror-everywhere.patch
+++ b/package/rpi-userland/0003-Disable-Werror-everywhere.patch
@@ -1,4 +1,4 @@
-From 67924a43d52862a7b4c9076d49071449313fea85 Mon Sep 17 00:00:00 2001
+From 8275a380658070336df0c404f0ff585d27681836 Mon Sep 17 00:00:00 2001
 From: Peter Seiderer <ps.report@gmx.net>
 Date: Thu, 22 Sep 2016 22:59:11 +0200
 Subject: [PATCH] Disable Werror everywhere
@@ -12,6 +12,9 @@ Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 
 [Rebased for rpi-userland-a1b89e91f393c7134b4cdc36431f863bb3333163]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+
+[Rebased for rpi-userland-8f0abfb07b96e7ee85f46e59d895014ec5e25f5e]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
  host_applications/android/apps/vidtex/CMakeLists.txt | 2 +-
  host_applications/linux/apps/gencmd/CMakeLists.txt   | 2 +-
@@ -27,17 +30,17 @@ Signed-off-by: Peter Seiderer <ps.report@gmx.net>
  11 files changed, 11 insertions(+), 11 deletions(-)
 
 diff --git a/host_applications/android/apps/vidtex/CMakeLists.txt b/host_applications/android/apps/vidtex/CMakeLists.txt
-index 1f705ef..37d037d 100644
+index 6d66d69..06a3192 100644
 --- a/host_applications/android/apps/vidtex/CMakeLists.txt
 +++ b/host_applications/android/apps/vidtex/CMakeLists.txt
 @@ -1,6 +1,6 @@
  cmake_minimum_required(VERSION 2.8)
  
 -SET(COMPILE_DEFINITIONS -Werror -Wall)
-+SET(COMPILE_DEFINITIONS  -Wall)
- include_directories(${PROJECT_SOURCE_DIR}/host_applications/linux/libs/bcm_host/include)
++SET(COMPILE_DEFINITIONS -Wall)
  
- set (VIDTEX_SOURCES
+ # Set --no-as-needed to stop the linker discarding mmal_vc_client
+ # as it can't see that the constructor registers a load of functionality
 diff --git a/host_applications/linux/apps/gencmd/CMakeLists.txt b/host_applications/linux/apps/gencmd/CMakeLists.txt
 index f95d1a1..034bf20 100644
 --- a/host_applications/linux/apps/gencmd/CMakeLists.txt
@@ -52,7 +55,7 @@ index f95d1a1..034bf20 100644
  
  include_directories( ../../../.. 
 diff --git a/host_applications/linux/apps/raspicam/CMakeLists.txt b/host_applications/linux/apps/raspicam/CMakeLists.txt
-index 2afc145..04e446f 100644
+index 42636e8..d778f09 100644
 --- a/host_applications/linux/apps/raspicam/CMakeLists.txt
 +++ b/host_applications/linux/apps/raspicam/CMakeLists.txt
 @@ -1,7 +1,7 @@
@@ -62,8 +65,8 @@ index 2afc145..04e446f 100644
 -SET(COMPILE_DEFINITIONS -Werror)
 +SET(COMPILE_DEFINITIONS )
  
- include_directories(${PROJECT_SOURCE_DIR}/host_applications/linux/libs/bcm_host/include)
- include_directories(${PROJECT_SOURCE_DIR}/host_applications/linux/apps/raspicam/)
+ # Set --no-as-needed to stop the linker discarding mmal_vc_client
+ # as it can't see that the constructor registers a load of functionality
 diff --git a/host_applications/linux/apps/smem/CMakeLists.txt b/host_applications/linux/apps/smem/CMakeLists.txt
 index 0fa8328..f0d1e77 100644
 --- a/host_applications/linux/apps/smem/CMakeLists.txt
@@ -78,7 +81,7 @@ index 0fa8328..f0d1e77 100644
  
  include_directories (
 diff --git a/host_applications/linux/libs/bcm_host/CMakeLists.txt b/host_applications/linux/libs/bcm_host/CMakeLists.txt
-index 1f29ead..fb78cea 100644
+index 2154e53..c23779b 100644
 --- a/host_applications/linux/libs/bcm_host/CMakeLists.txt
 +++ b/host_applications/linux/libs/bcm_host/CMakeLists.txt
 @@ -3,7 +3,7 @@ if (WIN32)
@@ -89,9 +92,9 @@ index 1f29ead..fb78cea 100644
 +   add_definitions(-Wall )
  endif ()
  
- include_directories( ../../../.. 
+ # set this as we want all the source of vchostif to be available in libbcm_host
 diff --git a/host_applications/linux/libs/sm/CMakeLists.txt b/host_applications/linux/libs/sm/CMakeLists.txt
-index c6bf764..4bca0b0 100644
+index 5ce5aca..02aea7c 100644
 --- a/host_applications/linux/libs/sm/CMakeLists.txt
 +++ b/host_applications/linux/libs/sm/CMakeLists.txt
 @@ -3,7 +3,7 @@ if (WIN32)
@@ -143,7 +146,7 @@ index 1d81ca3..b35cd8e 100644
  endif ()
  
 diff --git a/interface/vmcs_host/CMakeLists.txt b/interface/vmcs_host/CMakeLists.txt
-index 0b3adc9..c5156d8 100755
+index fde18da..802c158 100755
 --- a/interface/vmcs_host/CMakeLists.txt
 +++ b/interface/vmcs_host/CMakeLists.txt
 @@ -2,7 +2,7 @@
@@ -167,5 +170,5 @@ index aed0e83..d834b3f 100644
  # vcfiled - serves files to videocore. used for media handlers from
  # OpenMAX/IL and loading VLLs.
 -- 
-2.8.1
+2.19.0
 
diff --git a/package/rpi-userland/0006-host-apps-dtoverlay-don-t-install-script-in-random-l.patch b/package/rpi-userland/0006-host-apps-dtoverlay-don-t-install-script-in-random-l.patch
deleted file mode 100644
index 2900eb74fd..0000000000
--- a/package/rpi-userland/0006-host-apps-dtoverlay-don-t-install-script-in-random-l.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From a5a4e361c8116ca9228a896f672102c02be56bb7 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Tue, 7 Mar 2017 22:01:39 +0100
-Subject: [PATCH] host-apps/dtoverlay: don't install script in random location
-
-Currently, we add a custom command that installs the dtoverlay pre/post
-scripts in ${CMAKE_BINARY_DIR}/../../bin
-
-However:
-
-  - this points outside of the package directory.; it even points two
-    directories higher;
-
-  - when doing cross-compilation, this is definitely not the place where
-    the /bin directory really is;
-
-  - the scripts are already properly installed without this code.
-
-Remove that code, it serves no purpose and breaks for cross-compilation.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- host_applications/linux/apps/dtoverlay/CMakeLists.txt | 8 --------
- 1 file changed, 8 deletions(-)
-
-diff --git a/host_applications/linux/apps/dtoverlay/CMakeLists.txt b/host_applications/linux/apps/dtoverlay/CMakeLists.txt
-index 9009200..dd48d83 100755
---- a/host_applications/linux/apps/dtoverlay/CMakeLists.txt
-+++ b/host_applications/linux/apps/dtoverlay/CMakeLists.txt
-@@ -22,12 +22,4 @@ add_custom_command(TARGET dtoverlay POST_BUILD COMMAND ln;-sf;dtoverlay;dtparam)
- install(FILES ${CMAKE_CURRENT_BINARY_DIR}/dtparam DESTINATION bin)
- 
- set(DTOVERLAY_SCRIPTS dtoverlay-pre dtoverlay-post)
--foreach(_script ${DTOVERLAY_SCRIPTS})
--   add_custom_command(
--     TARGET dtoverlay
--     COMMAND ${CMAKE_COMMAND}
--     -E copy ${CMAKE_CURRENT_SOURCE_DIR}/${_script}
--     ${CMAKE_BINARY_DIR}/../../bin/${_script}
--   )
--endforeach()
- install(PROGRAMS ${DTOVERLAY_SCRIPTS} DESTINATION bin)
--- 
-2.7.4
-
diff --git a/package/rpi-userland/rpi-userland.hash b/package/rpi-userland/rpi-userland.hash
index f1bb5e678c..fc135e475f 100644
--- a/package/rpi-userland/rpi-userland.hash
+++ b/package/rpi-userland/rpi-userland.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 8ed745ea28ef9d5e6d2e5534acabe1ea1a6c6be9bab7f683527ce5da5a3f77cb rpi-userland-a7976021a89451de0d008aa48f16c4e88872899b.tar.gz
+sha256 01ece7088e38864bb20a165746a43e8ceeb4fb71f7b0e6974aa5ba587b4a76b2 rpi-userland-8f0abfb07b96e7ee85f46e59d895014ec5e25f5e.tar.gz
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index a798795bae..ede8c242eb 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = a7976021a89451de0d008aa48f16c4e88872899b
+RPI_USERLAND_VERSION = 8f0abfb07b96e7ee85f46e59d895014ec5e25f5e
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3-Clause
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
2.19.0
