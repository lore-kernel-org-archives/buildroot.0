From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 25 Jul 2017 22:02:05 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/joe: bump version to 4.4
Message-ID: <20170725200205.23260-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch 0001 after bessel functions in uClibc were enabled by
default:
https://git.buildroot.net/buildroot/commit/package/uclibc?id=de56d58e5d26d78161ca3b7a1a2a4decfe4e89db

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: updated JOE_INSTALL_TARGET_CMDS (Peter)

 .../0001-disable-bessel-functions-on-uclibc.patch  | 50 ----------------------
 package/joe/joe.hash                               |  5 ++-
 package/joe/joe.mk                                 |  4 +-
 3 files changed, 6 insertions(+), 53 deletions(-)
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
index e19cae121..3d0e9f776 100644
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
@@ -18,7 +18,7 @@ endif
 
 ifneq ($(BR2_PACKAGE_JOE_FULL),y)
 define JOE_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/joe $(TARGET_DIR)/usr/bin/joe
+	$(INSTALL) -m 0755 -D $(@D)/joe/joe $(TARGET_DIR)/usr/bin/joe
 endef
 endif
 
-- 
2.11.0
