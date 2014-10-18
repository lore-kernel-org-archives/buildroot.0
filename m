From: Maarten ter Huurne <maarten@treewalker.org>
Date: Sat, 18 Oct 2014 19:58:37 +0200
Subject: [Buildroot] [PATCH v4] rpi-userland: bump revision and add patch to
	fix compile with musl
In-Reply-To: <1739784.babPHSSYPS@hyperion>
References: <1739784.babPHSSYPS@hyperion>
Message-ID: <1413655117-28464-1-git-send-email-maarten@treewalker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
---
 .../rpi-userland-003-fix-musl-compile.patch        | 113 +++++++++++++++++++++
 package/rpi-userland/rpi-userland.mk               |   2 +-
 2 files changed, 114 insertions(+), 1 deletion(-)
 create mode 100644 package/rpi-userland/rpi-userland-003-fix-musl-compile.patch

diff --git a/package/rpi-userland/rpi-userland-003-fix-musl-compile.patch b/package/rpi-userland/rpi-userland-003-fix-musl-compile.patch
new file mode 100644
index 0000000..f960482
--- /dev/null
+++ b/package/rpi-userland/rpi-userland-003-fix-musl-compile.patch
@@ -0,0 +1,113 @@
+From 198d93fab0659f7a548329d742de8b3e27cfd977 Mon Sep 17 00:00:00 2001
+From: Maarten ter Huurne <maarten@treewalker.org>
+Date: Fri, 12 Sep 2014 18:28:51 +0200
+Subject: [PATCH] Combined musl compile fixes
+
+The individual patches and their descriptions can be found here:
+https://github.com/raspberrypi/userland/pull/201
+
+Upstream status: accepted (4333d6d)
+However, bumping to that revision is currently not an option since that
+also pulls in 66338d3 which breaks Weston:
+http://lists.busybox.net/pipermail/buildroot/2014-October/109309.html
+
+Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+---
+ containers/CMakeLists.txt                                  | 2 +-
+ host_applications/linux/apps/hello_pi/CMakeLists.txt       | 2 +-
+ host_applications/linux/apps/hello_pi/libs/vgfont/Makefile | 1 -
+ interface/vcos/pthreads/vcos_platform.h                    | 3 ---
+ interface/vcos/pthreads/vcos_pthreads.c                    | 2 +-
+ interface/vmcs_host/linux/vcfilesys.c                      | 4 ++--
+ 6 files changed, 5 insertions(+), 9 deletions(-)
+
+diff --git a/containers/CMakeLists.txt b/containers/CMakeLists.txt
+index 721f74f..a29a885 100644
+--- a/containers/CMakeLists.txt
++++ b/containers/CMakeLists.txt
+@@ -13,7 +13,7 @@ add_definitions(-DDL_PATH_PREFIX="${VMCS_PLUGIN_DIR}/")
+ 
+ SET( GCC_COMPILER_FLAGS -Wall -g -O2 -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wcast-qual -Wwrite-strings -Wundef )
+ SET( GCC_COMPILER_FLAGS ${GCC_COMPILER_FLAGS} -Wextra )#-Wno-missing-field-initializers )
+-SET( GCC_COMPILER_FLAGS ${GCC_COMPILER_FLAGS} -D__STDC_VERSION__=199901L )
++SET( GCC_COMPILER_FLAGS ${GCC_COMPILER_FLAGS} -std=c99 -D_POSIX_C_SOURCE=199309L )
+ SET( GCC_COMPILER_FLAGS ${GCC_COMPILER_FLAGS} -Wno-missing-field-initializers )
+ SET( GCC_COMPILER_FLAGS ${GCC_COMPILER_FLAGS} -Wno-unused-value )
+ 
+diff --git a/host_applications/linux/apps/hello_pi/CMakeLists.txt b/host_applications/linux/apps/hello_pi/CMakeLists.txt
+index ab4dae3..f2c6aef 100644
+--- a/host_applications/linux/apps/hello_pi/CMakeLists.txt
++++ b/host_applications/linux/apps/hello_pi/CMakeLists.txt
+@@ -24,7 +24,7 @@ add_subdirectory(hello_teapot)
+ 
+ if(BUILD_FONT)
+ set(VGFONT_SRCS libs/vgfont/font.c libs/vgfont/vgft.c libs/vgfont/graphics.c)
+-set_source_files_properties(${VGFONT_SRCS} PROPERTIES COMPILE_DEFINITIONS "_HAVE_TIMER_T")
++set_source_files_properties(${VGFONT_SRCS} PROPERTIES COMPILE_DEFINITIONS)
+ add_library(vgfont ${VGFONT_SRCS})
+ 
+ add_subdirectory(hello_font)
+diff --git a/host_applications/linux/apps/hello_pi/libs/vgfont/Makefile b/host_applications/linux/apps/hello_pi/libs/vgfont/Makefile
+index d04fb08..1e2a22b 100755
+--- a/host_applications/linux/apps/hello_pi/libs/vgfont/Makefile
++++ b/host_applications/linux/apps/hello_pi/libs/vgfont/Makefile
+@@ -2,7 +2,6 @@ OBJS=font.o vgft.o graphics.o
+ LIB=libvgfont.a
+ 
+ INCLUDES+=-I$(SDKSTAGE)/usr/include/freetype2 -I$(SDKSTAGE)/usr/include -I$(SDKSTAGE)/usr/include/arm-linux-gnueabi
+-CFLAGS+=-D_HAVE_TIMER_T
+ 
+ include ../../Makefile.include
+ 
+diff --git a/interface/vcos/pthreads/vcos_platform.h b/interface/vcos/pthreads/vcos_platform.h
+index 468098b..2095e25 100755
+--- a/interface/vcos/pthreads/vcos_platform.h
++++ b/interface/vcos/pthreads/vcos_platform.h
+@@ -120,9 +120,6 @@ typedef struct
+ 
+ #define VCOS_ONCE_INIT        PTHREAD_ONCE_INIT
+ 
+-#if defined(__arm__) && !defined(_HAVE_TIMER_T) && !defined(ANDROID)
+-typedef __timer_t timer_t;
+-#endif
+ typedef struct VCOS_TIMER_T
+ {
+    pthread_t thread;                      /**< id of the timer thread */
+diff --git a/interface/vcos/pthreads/vcos_pthreads.c b/interface/vcos/pthreads/vcos_pthreads.c
+index 668f647..fdc8bc4 100644
+--- a/interface/vcos/pthreads/vcos_pthreads.c
++++ b/interface/vcos/pthreads/vcos_pthreads.c
+@@ -33,7 +33,7 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <sys/time.h>
+-#include <sys/param.h>
++#include <linux/param.h>
+ 
+ /* Cygwin doesn't always have prctl.h and it doesn't have PR_SET_NAME */
+ #if defined( __linux__ )
+diff --git a/interface/vmcs_host/linux/vcfilesys.c b/interface/vmcs_host/linux/vcfilesys.c
+index ab65e3e..53c7486 100644
+--- a/interface/vmcs_host/linux/vcfilesys.c
++++ b/interface/vmcs_host/linux/vcfilesys.c
+@@ -49,7 +49,7 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ #include <ctype.h>
+ #include <limits.h>
+ 
+-#if !defined(ANDROID) && !defined( __USE_FILE_OFFSET64 )
++#if defined(__GLIBC__) && !defined( __USE_FILE_OFFSET64 )
+ #error   "__USE_FILE_OFFSET64 isn't defined"
+ #endif
+ 
+@@ -916,7 +916,7 @@ int vc_hostfs_set_attr(const char *path, fattributes_t attr)
+ 
+    if (pathbuf)
+    {
+-      __mode_t mode = 0;
++      mode_t mode = 0;
+       struct stat sb;
+ 
+       backslash_to_slash(pathbuf);
+-- 
+1.8.4.5
+
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index c738b62..feac277 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = ffcc4bd7c4875b71376c4240116e251652c9bec0
+RPI_USERLAND_VERSION = ba753c1a7f68d7a2e00edaf03364eef001e233ef
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
1.8.4.5
