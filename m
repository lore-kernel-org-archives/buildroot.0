From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2016 22:21:07 +0100
Subject: [Buildroot] [git commit] jamvm: fix build with uClibc on i386/x86_64
Message-ID: <20161106212135.2A25A8172F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1ca3dcb590852880770fe879ea59b6d8222b010
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 0b6b67f34d6d4aeb340bbca579dbf85363c3f4ea ("jamvm: add patch to
fix musl build") introduced a patch to fix the jamvm build with the
musl C library. While the commit log pretends that the build was still
working with uClibc, it is not correct: it no longer builds fine with
uClibc on i386/x86_64, because the Buildroot default configuration for
uClibc doesn't enable <fenv.h> support.

Therefore this commit adapts the patch to use <fenv.h> if available
(which is the case with musl), and otherwise fall back to
<fpu_control.h>, which is available in uClibc.

Thanks to Waldemar for the investigation.

Fixes:

  http://autobuild.buildroot.net/results/325a50d15e1836b31df4e84ba83b296abfb73041/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-when-available-instead-of-fpu_control.h.patch} | 86 ++++++++++++++--------
 package/jamvm/jamvm.mk                             |  9 +++
 2 files changed, 63 insertions(+), 32 deletions(-)

diff --git a/package/jamvm/0001-Use-fenv.h-instead-of-fpu_control.h.patch b/package/jamvm/0001-Use-fenv.h-when-available-instead-of-fpu_control.h.patch
similarity index 50%
rename from package/jamvm/0001-Use-fenv.h-instead-of-fpu_control.h.patch
rename to package/jamvm/0001-Use-fenv.h-when-available-instead-of-fpu_control.h.patch
index 50f95cd..78ee9b7 100644
--- a/package/jamvm/0001-Use-fenv.h-instead-of-fpu_control.h.patch
+++ b/package/jamvm/0001-Use-fenv.h-when-available-instead-of-fpu_control.h.patch
@@ -1,86 +1,108 @@
-From 7152ded5219453c9ff1cd062cecbeaf4d77e4cab Mon Sep 17 00:00:00 2001
+From ecd4eceae98cfb1c83133bdeaa9095546ca8b7c6 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Thu, 26 May 2016 15:05:48 +0200
-Subject: [PATCH] Use <fenv.h> instead of <fpu_control.h>
+Subject: [PATCH] Use <fenv.h> when available instead of <fpu_control.h>
 
 musl libc (http://musl-libc.org lack the non-standard <fpu_control.h>
 header, which is used in src/os/linux/{i386,x86_64}/init.c files to
 setup the floating point precision. This patch makes it use the
-standard C <fenv.h> header instead.
+standard C <fenv.h> header instead when available.
 
 Original patch at Felix Janda at
-https://sourceforge.net/p/jamvm/patches/6/.
+https://sourceforge.net/p/jamvm/patches/6/, adapted to still use
+<fpu_control.h> if <fenv.h> is not provided.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
- src/os/linux/i386/init.c   | 12 ++++++------
- src/os/linux/x86_64/init.c | 16 ++++++----------
- 2 files changed, 12 insertions(+), 16 deletions(-)
+ configure.ac               |  2 +-
+ src/os/linux/i386/init.c   | 15 +++++++++++++++
+ src/os/linux/x86_64/init.c | 15 +++++++++++++--
+ 3 files changed, 29 insertions(+), 3 deletions(-)
 
+diff --git a/configure.ac b/configure.ac
+index 19f77e6..ce59a3e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -279,7 +279,7 @@ fi
+ 
+ dnl Checks for header files.
+ AC_HEADER_STDC
+-AC_CHECK_HEADERS(sys/time.h unistd.h endian.h sys/param.h locale.h alloca.h)
++AC_CHECK_HEADERS(sys/time.h unistd.h endian.h sys/param.h locale.h alloca.h fenv.h)
+ 
+ if test "$enable_zip" != no; then
+     AC_CHECK_HEADER(zlib.h,,AC_MSG_ERROR(zlib.h is missing))
 diff --git a/src/os/linux/i386/init.c b/src/os/linux/i386/init.c
-index d9c6648..94a733e 100644
+index d9c6648..8fefe7d 100644
 --- a/src/os/linux/i386/init.c
 +++ b/src/os/linux/i386/init.c
-@@ -19,18 +19,18 @@
+@@ -19,18 +19,33 @@
   * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
   */
  
--#include <fpu_control.h>
++#include "config.h"
++
++#if defined(HAVE_FENV_H)
 +#include <fenv.h>
++#else
+ #include <fpu_control.h>
++#endif
  
  /* Change floating point precision to double (64-bit) from
   * the extended (80-bit) Linux default. */
  
  void setDoublePrecision() {
--    fpu_control_t cw;
++#if defined(HAVE_FENV_H)
 +    fenv_t fenv;
- 
--    _FPU_GETCW(cw);
--    cw &= ~_FPU_EXTENDED;
--    cw |= _FPU_DOUBLE;
--    _FPU_SETCW(cw);
++
 +    fegetenv(&fenv);
 +    fenv.__control_word &= ~0x300; /* _FPU_EXTENDED */
 +    fenv.__control_word |= 0x200; /* _FPU_DOUBLE */
 +    fesetenv(&fenv);
++#else
+     fpu_control_t cw;
+ 
+     _FPU_GETCW(cw);
+     cw &= ~_FPU_EXTENDED;
+     cw |= _FPU_DOUBLE;
+     _FPU_SETCW(cw);
++#endif
  }
  
  void initialisePlatform() {
 diff --git a/src/os/linux/x86_64/init.c b/src/os/linux/x86_64/init.c
-index 9d55229..a76a923 100644
+index 9d55229..b42b14e 100644
 --- a/src/os/linux/x86_64/init.c
 +++ b/src/os/linux/x86_64/init.c
-@@ -19,9 +19,7 @@
+@@ -19,7 +19,11 @@
   * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
   */
  
 -#ifdef __linux__
--#include <fpu_control.h>
--#endif
++#include "config.h"
++
++#if defined(HAVE_FENV_H)
 +#include <fenv.h>
++#else
+ #include <fpu_control.h>
+ #endif
  
- /* Change the x87 FPU precision to double (64-bit) from the extended
-    (80-bit) Linux default.  Note, unlike on i386, my testcases pass
-@@ -30,14 +28,12 @@
+@@ -30,7 +34,14 @@
  */
  
  void setDoublePrecision() {
 -#ifdef __linux__
--    fpu_control_t cw;
++#if defined(HAVE_FENV_H)
 +    fenv_t fenv;
- 
--    _FPU_GETCW(cw);
--    cw &= ~_FPU_EXTENDED;
--    cw |= _FPU_DOUBLE;
--    _FPU_SETCW(cw);
--#endif
++
 +    fegetenv(&fenv);
 +    fenv.__control_word &= ~0x300; /*_FPU_EXTENDED */
 +    fenv.__control_word |= 0x200; /*_FPU_DOUBLE */
 +    fesetenv(&fenv);
- }
++#else
+     fpu_control_t cw;
  
- void initialisePlatform() {
+     _FPU_GETCW(cw);
 -- 
 2.7.4
 
diff --git a/package/jamvm/jamvm.mk b/package/jamvm/jamvm.mk
index b1520ad..ee80c80 100644
--- a/package/jamvm/jamvm.mk
+++ b/package/jamvm/jamvm.mk
@@ -9,6 +9,8 @@ JAMVM_SITE = http://downloads.sourceforge.net/project/jamvm/jamvm/JamVM%20$(JAMV
 JAMVM_LICENSE = GPLv2+
 JAMVM_LICENSE_FILES = COPYING
 JAMVM_DEPENDENCIES = zlib classpath
+# For 0001-Use-fenv.h-when-available-instead-of-fpu_control.h.patch
+JAMVM_AUTORECONF = YES
 # int inlining seems to crash jamvm, don't build shared version of internal lib
 JAMVM_CONF_OPTS = \
 	--with-classpath-install-dir=/usr \
@@ -22,4 +24,11 @@ ifeq ($(BR2_arm),y)
 JAMVM_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -marm"
 endif
 
+# Needed for autoreconf
+define JAMVM_CREATE_M4_DIR
+	mkdir -p $(@D)/m4
+endef
+
+JAMVM_POST_PATCH_HOOKS += JAMVM_CREATE_M4_DIR
+
 $(eval $(autotools-package))
