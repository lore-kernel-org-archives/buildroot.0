From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Dec 2012 22:39:36 +0100
Subject: [Buildroot] =?utf-8?q?=5BPATCH=5D_metacity=3A_fix_link_issue_agai?=
	=?utf-8?q?nst_libm?=
Message-ID: <1355866776-20197-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/metacity/metacity-add-libm-reference.patch |   51 ++++++++++++++++++++
 .../metacity/metacity-mag-add-libm-reference.patch |   45 +++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 package/metacity/metacity-add-libm-reference.patch
 create mode 100644 package/metacity/metacity-mag-add-libm-reference.patch

diff --git a/package/metacity/metacity-add-libm-reference.patch b/package/metacity/metacity-add-libm-reference.patch
new file mode 100644
index 0000000..6285017
--- /dev/null
+++ b/package/metacity/metacity-add-libm-reference.patch
@@ -0,0 +1,51 @@
+Upstream fix to link metacity itself against libm
+
+The upstream fix is modified to also include the changes on the
+configure script directly, so that autoreconfiguring is not
+needed. Autoreconfiguring cannot be done easily on metacity, due to
+missing AM_GCONF_SOURCE_2 and AM_NLS macros.
+
+http://git.gnome.org/browse/metacity/commit/configure.in?id=9cb0b6ff520ea69bdff6c328a21787202aee1bcc
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+From 9cb0b6ff520ea69bdff6c328a21787202aee1bcc Mon Sep 17 00:00:00 2001
+From: G?tz Waschk <waschk@mandriva.org>
+Date: Wed, 22 Oct 2008 12:08:48 +0000
+Subject: add libm reference. Closes #557357.
+
+2008-10-22  G?tz Waschk  <waschk@mandriva.org>
+
+        * configure.in: add libm reference.  Closes #557357.
+
+
+svn path=/trunk/; revision=3984
+---
+(limited to 'configure.in')
+
+Index: b/configure.in
+===================================================================
+--- a/configure.in
++++ b/configure.in
+@@ -413,7 +413,7 @@
+    AC_DEFINE(HAVE_XSYNC, , [Have the Xsync extension library])
+ fi
+ 
+-METACITY_LIBS="$METACITY_LIBS $XSYNC_LIBS $RANDR_LIBS $SHAPE_LIBS $X_LIBS $X_PRE_LIBS -lX11 $X_EXTRA_LIBS"
++METACITY_LIBS="$METACITY_LIBS $XSYNC_LIBS $RANDR_LIBS $SHAPE_LIBS $X_LIBS $X_PRE_LIBS -lX11 $X_EXTRA_LIBS -lm"
+ METACITY_MESSAGE_LIBS="$METACITY_MESSAGE_LIBS $X_LIBS $X_PRE_LIBS -lX11 $X_EXTRA_LIBS"
+ METACITY_WINDOW_DEMO_LIBS="$METACITY_WINDOW_DEMO_LIBS $X_LIBS $X_PRE_LIBS -lX11 $X_EXTRA_LIBS"
+ METACITY_PROPS_LIBS="$METACITY_PROPS_LIBS $X_LIBS $X_PRE_LIBS -lX11 $X_EXTRA_LIBS"
+Index: b/configure
+===================================================================
+--- a/configure
++++ b/configure
+@@ -29509,7 +29509,7 @@
+ 
+ fi
+ 
+-METACITY_LIBS="$METACITY_LIBS $XSYNC_LIBS $RANDR_LIBS $SHAPE_LIBS $X_LIBS $X_PRE_LIBS -lX11 $X_EXTRA_LIBS"
++METACITY_LIBS="$METACITY_LIBS $XSYNC_LIBS $RANDR_LIBS $SHAPE_LIBS $X_LIBS $X_PRE_LIBS -lX11 $X_EXTRA_LIBS -lm"
+ METACITY_MESSAGE_LIBS="$METACITY_MESSAGE_LIBS $X_LIBS $X_PRE_LIBS -lX11 $X_EXTRA_LIBS"
+ METACITY_WINDOW_DEMO_LIBS="$METACITY_WINDOW_DEMO_LIBS $X_LIBS $X_PRE_LIBS -lX11 $X_EXTRA_LIBS"
+ METACITY_PROPS_LIBS="$METACITY_PROPS_LIBS $X_LIBS $X_PRE_LIBS -lX11 $X_EXTRA_LIBS"
diff --git a/package/metacity/metacity-mag-add-libm-reference.patch b/package/metacity/metacity-mag-add-libm-reference.patch
new file mode 100644
index 0000000..d47d807
--- /dev/null
+++ b/package/metacity/metacity-mag-add-libm-reference.patch
@@ -0,0 +1,45 @@
+Upstream patch to fix link against libm
+
+The upstream patch is modified to also include the necessary
+Makefile.in, which avoids the need for autoreconfiguring the
+package. Autoreconfiguring the package unfortunately doesn't work, due
+to AM_GCONF_SOURCE_2 and AM_NLS macros being missing.
+
+http://git.gnome.org/browse/metacity/commit/src/tools/Makefile.am?id=13d0d52eb885598885b6ff4b73c795c8f29c2a6b
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+From 13d0d52eb885598885b6ff4b73c795c8f29c2a6b Mon Sep 17 00:00:00 2001
+From: Matthias Clasen <mclasen@redhat.com>
+Date: Sun, 02 May 2010 14:50:42 +0000
+Subject: fails to link with pedantic linkers
+
+---
+(limited to 'src/tools/Makefile.am')
+
+Index: b/src/tools/Makefile.am
+===================================================================
+--- a/src/tools/Makefile.am
++++ b/src/tools/Makefile.am
+@@ -26,7 +26,7 @@
+ 
+ metacity_message_LDADD= @METACITY_MESSAGE_LIBS@
+ metacity_window_demo_LDADD= @METACITY_WINDOW_DEMO_LIBS@
+-metacity_mag_LDADD= @METACITY_WINDOW_DEMO_LIBS@
++metacity_mag_LDADD= @METACITY_WINDOW_DEMO_LIBS@ -lm
+ metacity_grayscale_LDADD = @METACITY_WINDOW_DEMO_LIBS@
+ 
+ EXTRA_DIST=$(icon_DATA)
+Index: b/src/tools/Makefile.in
+===================================================================
+--- a/src/tools/Makefile.in
++++ b/src/tools/Makefile.in
+@@ -281,7 +281,7 @@
+ 
+ metacity_message_LDADD = @METACITY_MESSAGE_LIBS@
+ metacity_window_demo_LDADD = @METACITY_WINDOW_DEMO_LIBS@
+-metacity_mag_LDADD = @METACITY_WINDOW_DEMO_LIBS@
++metacity_mag_LDADD = @METACITY_WINDOW_DEMO_LIBS@ -lm
+ metacity_grayscale_LDADD = @METACITY_WINDOW_DEMO_LIBS@
+ EXTRA_DIST = $(icon_DATA)
+ all: all-am
-- 
1.7.9.5
