From: Maarten ter Huurne <maarten@treewalker.org>
Date: Fri, 12 Sep 2014 03:45:39 +0200
Subject: [Buildroot] [PATCH] rpi-userland: Add patches to fix compilation
	with musl libc
Message-ID: <1410486339-2001-1-git-send-email-maarten@treewalker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
---
 .../rpi-userland-003-disable-timer_t-typedef.patch | 22 ++++++++++++++++++++++
 .../rpi-userland-004-include-for-HZ.patch          | 19 +++++++++++++++++++
 ...land-005-do-not-check-__USE_FILE_OFFSET64.patch | 16 ++++++++++++++++
 package/rpi-userland/rpi-userland-006-mode_t.patch | 13 +++++++++++++
 4 files changed, 70 insertions(+)
 create mode 100644 package/rpi-userland/rpi-userland-003-disable-timer_t-typedef.patch
 create mode 100644 package/rpi-userland/rpi-userland-004-include-for-HZ.patch
 create mode 100644 package/rpi-userland/rpi-userland-005-do-not-check-__USE_FILE_OFFSET64.patch
 create mode 100644 package/rpi-userland/rpi-userland-006-mode_t.patch

diff --git a/package/rpi-userland/rpi-userland-003-disable-timer_t-typedef.patch b/package/rpi-userland/rpi-userland-003-disable-timer_t-typedef.patch
new file mode 100644
index 0000000..e51a93f
--- /dev/null
+++ b/package/rpi-userland/rpi-userland-003-disable-timer_t-typedef.patch
@@ -0,0 +1,22 @@
+I don't know which platform is missing the timer_t definition, but it would
+be better to check for that platform specifically instead of explicitly
+excluding platforms that do have it.
+
+This fixes compilation with musl libc, which does define timer_t but does
+not define __timer_t.
+
+Note that _HAVE_TIMER_T suggests it would prevent breakage, but it is
+unrealistic to expect every application to set that macro. Not even all CMake
+files in the userland package itself set it...
+
+--- userland-f9e6f9f3def8dc18dc0092cd695ccf53b8ba3efe.org/interface/vcos/pthreads/vcos_platform.h	2014-08-05 19:43:53.000000000 +0200
++++ rpi-userland-f9e6f9f3def8dc18dc0092cd695ccf53b8ba3efe/interface/vcos/pthreads/vcos_platform.h	2014-09-11 21:04:36.418943953 +0200
+@@ -120,7 +120,7 @@
+ 
+ #define VCOS_ONCE_INIT        PTHREAD_ONCE_INIT
+ 
+-#if defined(__arm__) && !defined(_HAVE_TIMER_T) && !defined(ANDROID)
++#if 0
+ typedef __timer_t timer_t;
+ #endif
+ typedef struct VCOS_TIMER_T
diff --git a/package/rpi-userland/rpi-userland-004-include-for-HZ.patch b/package/rpi-userland/rpi-userland-004-include-for-HZ.patch
new file mode 100644
index 0000000..484aebe
--- /dev/null
+++ b/package/rpi-userland/rpi-userland-004-include-for-HZ.patch
@@ -0,0 +1,19 @@
+There is no guarantee that <sys/param.h> defines HZ. And in musl libc, it
+doesn't. Since this is a Linux-specific constant, include the Linux-specific
+header for it.
+
+Note that HZ as defined by the system headers is the default value of HZ (100),
+which might differ from the actual value of HZ in the kernel config. Ideally
+userland would not use HZ at all and do all timing in milliseconds instead.
+
+--- userland-f9e6f9f3def8dc18dc0092cd695ccf53b8ba3efe.org/interface/vcos/pthreads/vcos_pthreads.c	2014-08-05 19:43:53.000000000 +0200
++++ rpi-userland-f9e6f9f3def8dc18dc0092cd695ccf53b8ba3efe/interface/vcos/pthreads/vcos_pthreads.c	2014-09-11 21:49:48.497827644 +0200
+@@ -33,7 +33,7 @@
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <sys/time.h>
+-#include <sys/param.h>
++#include <linux/param.h>
+ 
+ /* Cygwin doesn't always have prctl.h and it doesn't have PR_SET_NAME */
+ #if defined( __linux__ )
diff --git a/package/rpi-userland/rpi-userland-005-do-not-check-__USE_FILE_OFFSET64.patch b/package/rpi-userland/rpi-userland-005-do-not-check-__USE_FILE_OFFSET64.patch
new file mode 100644
index 0000000..6a1ab47
--- /dev/null
+++ b/package/rpi-userland/rpi-userland-005-do-not-check-__USE_FILE_OFFSET64.patch
@@ -0,0 +1,16 @@
+This looks like a sanity check that 64-bit file offset definitions were indeed
+provided by the included headers. But __USE_FILE_OFFSET64 is an internal
+define of glibc, so don't perform this check when compiling with a different
+libc.
+
+--- userland-f9e6f9f3def8dc18dc0092cd695ccf53b8ba3efe.org/interface/vmcs_host/linux/vcfilesys.c	2014-08-05 19:43:53.000000000 +0200
++++ rpi-userland-f9e6f9f3def8dc18dc0092cd695ccf53b8ba3efe/interface/vmcs_host/linux/vcfilesys.c	2014-09-11 22:01:51.016328294 +0200
+@@ -49,7 +49,7 @@
+ #include <ctype.h>
+ #include <limits.h>
+ 
+-#if !defined(ANDROID) && !defined( __USE_FILE_OFFSET64 )
++#if defined(__GLIBC__) && !defined( __USE_FILE_OFFSET64 )
+ #error   "__USE_FILE_OFFSET64 isn't defined"
+ #endif
+ 
diff --git a/package/rpi-userland/rpi-userland-006-mode_t.patch b/package/rpi-userland/rpi-userland-006-mode_t.patch
new file mode 100644
index 0000000..6045ade
--- /dev/null
+++ b/package/rpi-userland/rpi-userland-006-mode_t.patch
@@ -0,0 +1,13 @@
+The type of "st_mode" in "struct stat" is just "mode_t", not "__mode_t".
+
+--- userland-f9e6f9f3def8dc18dc0092cd695ccf53b8ba3efe.org/interface/vmcs_host/linux/vcfilesys.c	2014-08-05 19:43:53.000000000 +0200
++++ rpi-userland-f9e6f9f3def8dc18dc0092cd695ccf53b8ba3efe/interface/vmcs_host/linux/vcfilesys.c	2014-09-12 00:28:46.553861915 +0200
+@@ -916,7 +916,7 @@
+ 
+    if (pathbuf)
+    {
+-      __mode_t mode = 0;
++      mode_t mode = 0;
+       struct stat sb;
+ 
+       backslash_to_slash(pathbuf);
-- 
1.8.4.5
