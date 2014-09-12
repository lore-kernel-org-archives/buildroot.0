From: Maarten ter Huurne <maarten@treewalker.org>
Date: Fri, 12 Sep 2014 19:01:09 +0200
Subject: [Buildroot] [PATCH] rpi-userland: Add patches to fix compilation
	with musl libc
In-Reply-To: <20140912171106.246cfd12@free-electrons.com>
References: <20140912171106.246cfd12@free-electrons.com>
Message-ID: <1410541269-32529-1-git-send-email-maarten@treewalker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also submitted upstream:
https://github.com/raspberrypi/userland/pull/201

Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
---
 .../rpi-userland-003-remove-timer_t-typedef.patch  | 58 ++++++++++++++++++++++
 .../rpi-userland-004-include-for-HZ.patch          | 35 +++++++++++++
 ...land-005-do-not-check-__USE_FILE_OFFSET64.patch | 32 ++++++++++++
 package/rpi-userland/rpi-userland-006-mode_t.patch | 28 +++++++++++
 4 files changed, 153 insertions(+)
 create mode 100644 package/rpi-userland/rpi-userland-003-remove-timer_t-typedef.patch
 create mode 100644 package/rpi-userland/rpi-userland-004-include-for-HZ.patch
 create mode 100644 package/rpi-userland/rpi-userland-005-do-not-check-__USE_FILE_OFFSET64.patch
 create mode 100644 package/rpi-userland/rpi-userland-006-mode_t.patch

diff --git a/package/rpi-userland/rpi-userland-003-remove-timer_t-typedef.patch b/package/rpi-userland/rpi-userland-003-remove-timer_t-typedef.patch
new file mode 100644
index 0000000..a6f8458
--- /dev/null
+++ b/package/rpi-userland/rpi-userland-003-remove-timer_t-typedef.patch
@@ -0,0 +1,58 @@
+From c8a01064bdd1fc923b1da1a72f1fca5bb20130b6 Mon Sep 17 00:00:00 2001
+From: Maarten ter Huurne <maarten@treewalker.org>
+Date: Fri, 12 Sep 2014 18:28:51 +0200
+Subject: [PATCH] vcos: Remove timer_t fallback definition
+
+The timer_t type is not used anywhere in the code. The fallback typedef
+can break builds though on systems where timer_t exists but is not an
+alias for __timer_t, such as systems using the musl libc.
+
+Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+---
+ host_applications/linux/apps/hello_pi/CMakeLists.txt       | 2 +-
+ host_applications/linux/apps/hello_pi/libs/vgfont/Makefile | 1 -
+ interface/vcos/pthreads/vcos_platform.h                    | 3 ---
+ 3 files changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/host_applications/linux/apps/hello_pi/CMakeLists.txt b/host_applications/linux/apps/hello_pi/CMakeLists.txt
+index efb0bf4..d9b0eaf 100644
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
+-- 
+1.8.4.5
+
diff --git a/package/rpi-userland/rpi-userland-004-include-for-HZ.patch b/package/rpi-userland/rpi-userland-004-include-for-HZ.patch
new file mode 100644
index 0000000..5001780
--- /dev/null
+++ b/package/rpi-userland/rpi-userland-004-include-for-HZ.patch
@@ -0,0 +1,35 @@
+From 16ff117cc92067990ccedeba1f59797aa10669b2 Mon Sep 17 00:00:00 2001
+From: Maarten ter Huurne <maarten@treewalker.org>
+Date: Fri, 12 Sep 2014 04:24:30 +0200
+Subject: [PATCH] vcos: Fixed include for "HZ"
+
+There is no guarantee that <sys/param.h> defines HZ. And in musl libc,
+it doesn't. Since this is a Linux-specific constant, include the
+Linux-specific header for it.
+
+Note that HZ as defined by the system headers is the default value of
+HZ (100), which might differ from the actual value of HZ in the kernel
+config. Ideally userland would not use HZ at all and do all timing in
+milliseconds instead.
+
+Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+---
+ interface/vcos/pthreads/vcos_pthreads.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
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
+-- 
+1.8.4.5
+
diff --git a/package/rpi-userland/rpi-userland-005-do-not-check-__USE_FILE_OFFSET64.patch b/package/rpi-userland/rpi-userland-005-do-not-check-__USE_FILE_OFFSET64.patch
new file mode 100644
index 0000000..2c8e93e
--- /dev/null
+++ b/package/rpi-userland/rpi-userland-005-do-not-check-__USE_FILE_OFFSET64.patch
@@ -0,0 +1,32 @@
+From a54f5fd6fab5a968636e8efc12820a65c58d00e0 Mon Sep 17 00:00:00 2001
+From: Maarten ter Huurne <maarten@treewalker.org>
+Date: Fri, 12 Sep 2014 04:27:06 +0200
+Subject: [PATCH] vmcs_host: Only check __USE_FILE_OFFSET64 when compiling
+ against glibc
+
+This looks like a sanity check that 64-bit file offset definitions were
+indeed provided by the included headers. But __USE_FILE_OFFSET64 is an
+internal define of glibc, so don't perform this check when compiling
+with a different libc.
+
+Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+---
+ interface/vmcs_host/linux/vcfilesys.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/interface/vmcs_host/linux/vcfilesys.c b/interface/vmcs_host/linux/vcfilesys.c
+index ab65e3e..5f31f6c 100644
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
+-- 
+1.8.4.5
+
diff --git a/package/rpi-userland/rpi-userland-006-mode_t.patch b/package/rpi-userland/rpi-userland-006-mode_t.patch
new file mode 100644
index 0000000..b6199f3
--- /dev/null
+++ b/package/rpi-userland/rpi-userland-006-mode_t.patch
@@ -0,0 +1,28 @@
+From 8cdd8539d1074ab70bf904986fc38761320de563 Mon Sep 17 00:00:00 2001
+From: Maarten ter Huurne <maarten@treewalker.org>
+Date: Fri, 12 Sep 2014 04:28:41 +0200
+Subject: [PATCH] vmcs_host: Correct type name for file mode
+
+The type of "st_mode" in "struct stat" is "mode_t", not "__mode_t".
+
+Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+---
+ interface/vmcs_host/linux/vcfilesys.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/interface/vmcs_host/linux/vcfilesys.c b/interface/vmcs_host/linux/vcfilesys.c
+index 5f31f6c..53c7486 100644
+--- a/interface/vmcs_host/linux/vcfilesys.c
++++ b/interface/vmcs_host/linux/vcfilesys.c
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
-- 
1.8.4.5
