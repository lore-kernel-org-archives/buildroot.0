From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 24 Jul 2017 20:25:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/joe: bump version to 4.4
Message-ID: <20170724182544.31732-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream sha1 & md5 hashes.

Removed patch 0001 after bessel functions in uClibc were enabled by
default:
https://git.buildroot.net/buildroot/commit/package/uclibc?id=de56d58e5d26d78161ca3b7a1a2a4decfe4e89db

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Tested with test-pkg using this defconfig

BR2_PACKAGE_JOE=y
BR2_PACKAGE_JOE_FULL=y

                armv5-ctng-linux-gnueabi [ 1/47]: OK
              armv7-ctng-linux-gnueabihf [ 2/47]: OK
                        br-aarch64-glibc [ 3/47]: OK
                           br-arcle-hs38 [ 4/47]: OK
                            br-arm-basic [ 5/47]: OK
                  br-arm-cortex-a9-glibc [ 6/47]: OK
                   br-arm-cortex-a9-musl [ 7/47]: OK
                   br-arm-cortex-m4-full [ 8/47]: SKIPPED
                             br-arm-full [ 9/47]: OK
                    br-arm-full-nothread [10/47]: OK
                      br-arm-full-static [11/47]: OK
                            br-bfin-full [12/47]: SKIPPED
                   br-i386-pentium4-full [13/47]: OK
                br-i386-pentium-mmx-musl [14/47]: OK
                       br-m68k-5208-full [15/47]: SKIPPED
                      br-m68k-68040-full [16/47]: OK
                    br-microblazeel-full [17/47]: OK
                 br-mips32r6-el-hf-glibc [18/47]: OK
                      br-mips64-n64-full [19/47]: OK
                 br-mips64r6-el-hf-glibc [20/47]: OK
                      br-mipsel-o32-full [21/47]: OK
                          br-nios2-glibc [22/47]: OK
                      br-openrisc-uclibc [23/47]: OK
               br-powerpc-603e-basic-cpp [24/47]: OK
             br-powerpc64le-power8-glibc [25/47]: OK
               br-powerpc64-power7-glibc [26/47]: OK
                  br-powerpc-e500mc-full [27/47]: OK
                             br-sh4-full [28/47]: OK
                        br-sparc64-glibc [29/47]: OK
                         br-sparc-uclibc [30/47]: OK
                    br-x86-64-core2-full [31/47]: OK
                          br-x86-64-musl [32/47]: OK
                          br-xtensa-full [33/47]: OK
                     i686-ctng-linux-gnu [34/47]: OK
                          linaro-aarch64 [35/47]: OK
                              linaro-arm [36/47]: OK
             mips64el-ctng_n32-linux-gnu [37/47]: OK
             mips64el-ctng_n64-linux-gnu [38/47]: OK
        powerpc-ctng_e500v2-linux-gnuspe [39/47]: OK
                     sourcery-arm-armv4t [40/47]: OK
                            sourcery-arm [41/47]: OK
                     sourcery-arm-thumb2 [42/47]: OK
                         sourcery-mips64 [43/47]: OK
                           sourcery-mips [44/47]: OK
                          sourcery-nios2 [45/47]: OK
                         sourcery-x86-64 [46/47]: OK
           x86_64-ctng_locales-linux-gnu [47/47]: OK
47 builds, 3 skipped, 0 build failed, 0 legal-info failed


 .../0001-disable-bessel-functions-on-uclibc.patch  | 50 ----------------------
 package/joe/joe.hash                               |  5 ++-
 package/joe/joe.mk                                 |  2 +-
 3 files changed, 5 insertions(+), 52 deletions(-)
 delete mode 100644 package/joe/0001-disable-bessel-functions-on-uclibc.patch

diff --git a/package/joe/0001-disable-bessel-functions-on-uclibc.patch b/package/joe/0001-disable-bessel-functions-on-uclibc.patch
deleted file mode 100644
index 9f7b72c17..000000000
--- a/package/joe/0001-disable-bessel-functions-on-uclibc.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-[PATCH] uClibc can be (and by default is) configured without bessel functions
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- umath.c |   10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-Index: joe-3.7/umath.c
-===================================================================
---- joe-3.7.orig/umath.c
-+++ joe-3.7/umath.c
-@@ -7,6 +7,12 @@
-  */
- #include "types.h"
- 
-+/* uClibc can be configured without bessel functions */
-+#include <features.h>
-+#if defined (__UCLIBC__) && !defined(__DO_XSI_MATH__)
-+#define NO_BESSEL
-+#endif
-+
- unsigned char *merr;
- 
- int mode_hex;
-@@ -396,10 +402,12 @@
- double m_fabs(double n) { return fabs(n); }
- double m_erf(double n) { return erf(n); }
- double m_erfc(double n) { return erfc(n); }
-+#ifndef NO_BESSEL
- double m_j0(double n) { return j0(n); }
- double m_j1(double n) { return j1(n); }
- double m_y0(double n) { return y0(n); }
- double m_y1(double n) { return y1(n); }
-+#endif
- 
- double calc(BW *bw, unsigned char *s)
- {
-@@ -434,10 +442,12 @@
- 		v = get(USTR "abs"); v->func = m_fabs;
- 		v = get(USTR "erf"); v->func = m_erf;
- 		v = get(USTR "erfc"); v->func = m_erfc;
-+#ifndef NO_BESSEL
- 		v = get(USTR "j0"); v->func = m_j0;
- 		v = get(USTR "j1"); v->func = m_j1;
- 		v = get(USTR "y0"); v->func = m_y0;
- 		v = get(USTR "y1"); v->func = m_y1;
-+#endif
- 	}
- 
- 	v = get(USTR "top");
diff --git a/package/joe/joe.hash b/package/joe/joe.hash
index 664410d19..0a9c1fb8d 100644
--- a/package/joe/joe.hash
+++ b/package/joe/joe.hash
@@ -1,2 +1,5 @@
+# From https://sourceforge.net/projects/joe-editor/files/JOE%20sources/joe-4.4/
+sha1 aedf1ac9e6b91053aa26c70e7bba5bbd8136f033  joe-4.4.tar.gz
+md5 59e63debe60b456a6ee5c0c27a756a47  joe-4.4.tar.gz
 # Locally computed:
-sha256  cae456e1ad5a8c1d3c94920a3416c2347277739b260e3494d3bc0f2b9b73106f  joe-3.7.tar.gz
+sha256 a5704828bbca29acb9e200414fef522c66cdf9ce28150f402d6767da43460979  joe-4.4.tar.gz
diff --git a/package/joe/joe.mk b/package/joe/joe.mk
index e19cae121..934018aad 100644
--- a/package/joe/joe.mk
+++ b/package/joe/joe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JOE_VERSION = 3.7
+JOE_VERSION = 4.4
 JOE_SITE = http://downloads.sourceforge.net/project/joe-editor/JOE%20sources/joe-$(JOE_VERSION)
 JOE_LICENSE = GPL-1.0+
 JOE_LICENSE_FILES = COPYING
-- 
2.11.0
