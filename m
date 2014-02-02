From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Feb 2014 15:42:46 +0100
Subject: [Buildroot] [git commit] package/joe: Add package for the JOE editor
Message-ID: <20140202144314.AB1249C730@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b5502b988c19b4713e839b11d05b94c79a6c3516
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

JOE is an easy-to-use, full-screen, terminal-based text editor.

http://joe-editor.sf.net

[Peter: add uClibc patch, add to package/Config.in, optional ncurses support]
Signed-off-by: Alan Ott <alan@signal11.us>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                                  |    1 +
 package/joe/Config.in                              |   20 ++++++++
 ...e-0001-disable-bessel-functions-on-uclibc.patch |   50 ++++++++++++++++++++
 package/joe/joe.mk                                 |   25 ++++++++++
 4 files changed, 96 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 631d8b2..2a437f7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1044,6 +1044,7 @@ endmenu
 
 menu "Text editors and viewers"
 source "package/ed/Config.in"
+source "package/joe/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/less/Config.in"
 endif
diff --git a/package/joe/Config.in b/package/joe/Config.in
new file mode 100644
index 0000000..e15b0f2
--- /dev/null
+++ b/package/joe/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_JOE
+	bool "joe"
+	help
+	  Joe's Own Editor
+
+	  JOE is an easy-to-use, full featured terminal-based screen editor.
+	  Its behavior is a blending of WordStar and GNU-EMACS (but it does
+	  not use code from either program).  It is a great editor for new
+	  users or as an alternative to vi.
+
+	  http://joe-editor.sf.net
+
+config BR2_PACKAGE_JOE_FULL
+	bool "full install of rc and syntax highlighting files"
+	depends on BR2_PACKAGE_JOE
+	default y
+	help
+	  Install all rc and syntax highlighting files. Without this option
+	  only the joe binary is installed, which contains a default
+	  configuration.
diff --git a/package/joe/joe-0001-disable-bessel-functions-on-uclibc.patch b/package/joe/joe-0001-disable-bessel-functions-on-uclibc.patch
new file mode 100644
index 0000000..9f7b72c
--- /dev/null
+++ b/package/joe/joe-0001-disable-bessel-functions-on-uclibc.patch
@@ -0,0 +1,50 @@
+[PATCH] uClibc can be (and by default is) configured without bessel functions
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ umath.c |   10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+Index: joe-3.7/umath.c
+===================================================================
+--- joe-3.7.orig/umath.c
++++ joe-3.7/umath.c
+@@ -7,6 +7,12 @@
+  */
+ #include "types.h"
+ 
++/* uClibc can be configured without bessel functions */
++#include <features.h>
++#if defined (__UCLIBC__) && !defined(__DO_XSI_MATH__)
++#define NO_BESSEL
++#endif
++
+ unsigned char *merr;
+ 
+ int mode_hex;
+@@ -396,10 +402,12 @@
+ double m_fabs(double n) { return fabs(n); }
+ double m_erf(double n) { return erf(n); }
+ double m_erfc(double n) { return erfc(n); }
++#ifndef NO_BESSEL
+ double m_j0(double n) { return j0(n); }
+ double m_j1(double n) { return j1(n); }
+ double m_y0(double n) { return y0(n); }
+ double m_y1(double n) { return y1(n); }
++#endif
+ 
+ double calc(BW *bw, unsigned char *s)
+ {
+@@ -434,10 +442,12 @@
+ 		v = get(USTR "abs"); v->func = m_fabs;
+ 		v = get(USTR "erf"); v->func = m_erf;
+ 		v = get(USTR "erfc"); v->func = m_erfc;
++#ifndef NO_BESSEL
+ 		v = get(USTR "j0"); v->func = m_j0;
+ 		v = get(USTR "j1"); v->func = m_j1;
+ 		v = get(USTR "y0"); v->func = m_y0;
+ 		v = get(USTR "y1"); v->func = m_y1;
++#endif
+ 	}
+ 
+ 	v = get(USTR "top");
diff --git a/package/joe/joe.mk b/package/joe/joe.mk
new file mode 100644
index 0000000..98db94c
--- /dev/null
+++ b/package/joe/joe.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# joe
+#
+################################################################################
+
+JOE_VERSION = 3.7
+JOE_SITE = http://downloads.sourceforge.net/project/joe-editor/JOE%20sources/joe-$(JOE_VERSION)
+JOE_LICENSE = GPLv1+
+JOE_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+JOE_DEPENDENCIES += ncurses
+JOE_CONF_OPT += --enable-curses
+else
+JOE_CONF_OPT += --disable-curses
+endif
+
+ifneq ($(BR2_PACKAGE_JOE_FULL),y)
+define JOE_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/joe $(TARGET_DIR)/usr/bin/joe
+endef
+endif
+
+$(eval $(autotools-package))
