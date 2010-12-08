From: Jomas Nash <jomasnash@gmail.com>
Date: Wed, 8 Dec 2010 18:28:25 +0100
Subject: [Buildroot] problem with new package partimage
Message-ID: <AANLkTimc0c=FW=2Zv4jT9WWV7bc903J2VkOoZ0L9a+Af@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everybody,

I tried to create a buildroot package of partimage (http://www.partimage.org
).
It is a backup/restore program for partitions.
After some patches I got it to compile under buildroot ( Latest 2010-11 ).

However, when I run partimage on my selfmade litle linux (intel i686) system
(kernel, buildroot, busybox, partimage (and dependencies))
the backup part works ok. But the restore fails.

When I run dmesg it gives:
[  276.515102] partimage[1997]: segfault at 0 ip b77123ee sp bf928384 error
6 in libuClibc-0.9.31.so[b76e8000+3b000]

Has someone an idea how to solve this problem ?
Is it partimage related or uClibc related?
Any help will be apreciated.


Here's some background information:

1. When I restore the backup with a static version of partimage (Compiled on
a "normal" system with libc ) the restore works.
2. With the buildroot version of partimage at the point where a popup should
apear (just before the restore starts), the system freezes for a few minutes
and then crashes.
3. partimage needs slang. The buildroot has an old slang-mini. Can this
cause the problem?
4. I had to patch partimage to comile it under buildroot. Here is the patch
that make it
possible to compile partimage under buildroot. ( Large file and WChar should
be enabled in buildroot )


Here is the patch:


diff -rupN old/package/Config.in new/package/Config.in
--- old/package/Config.in    2010-12-03 21:19:04.000000000 +0100
+++ new/package/Config.in    2010-12-03 21:16:55.000000000 +0100
@@ -349,6 +349,7 @@ endmenu
 endmenu

 menu "Miscellaneous"
+source "package/partimage/Config.in"
 source "package/ng-spice-rework/Config.in"
 source "package/shared-mime-info/Config.in"
 endmenu
diff -rupN old/package/partimage/Config.in new/package/partimage/Config.in
--- old/package/partimage/Config.in    1970-01-01 01:00:00.000000000 +0100
+++ new/package/partimage/Config.in    2010-12-03 21:16:55.000000000 +0100
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_PARTIMAGE
+    bool "partimage"
+    help
+        Backup program
+
diff -rupN old/package/partimage/partimage-0.6.9-john.patch
new/package/partimage/partimage-0.6.9-john.patch
--- old/package/partimage/partimage-0.6.9-john.patch    1970-01-01
01:00:00.000000000 +0100
+++ new/package/partimage/partimage-0.6.9-john.patch    2010-12-03
21:16:55.000000000 +0100
@@ -0,0 +1,90 @@
+diff -rupN partimage-0.6.9/configure partimage-0.6.9-patched/configure
+--- partimage-0.6.9/configure    2010-07-25 17:31:49.000000000 +0200
++++ partimage-0.6.9-patched/configure    2010-11-21 12:37:11.000000000
+0100
+@@ -18771,7 +18771,7 @@ if test "${ac_cv_func_setpgrp_void+set}"
+   $as_echo_n "(cached) " >&6
+ else
+   if test "$cross_compiling" = yes; then :
+-  as_fn_error "cannot check setpgrp when cross compiling" "$LINENO" 5
++  echo "cannot check setpgrp when cross compiling" "$LINENO" 5
+ else
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+diff -rupN partimage-0.6.9/src/client/gui_text.cpp
partimage-0.6.9-patched/src/client/gui_text.cpp
+--- partimage-0.6.9/src/client/gui_text.cpp    2010-07-25
17:30:31.000000000 +0200
++++ partimage-0.6.9-patched/src/client/gui_text.cpp    2010-11-21
12:38:57.000000000 +0100
+@@ -497,7 +497,7 @@ int CSavingWindow::create(const char *sz
+   m_labelStatsSpeed = newtLabel(1, 11, "");
+   m_labelStatsSpace = newtLabel(1, 12, "");
+
+-  m_progressSaving = newtScale(1, 18, 70, 100);
++  m_progressSaving = newtScale(1, 18, 70, 100, 0);
+   m_labelPercent = newtLabel(72, 18, "");
+
+   m_formMain = newtForm(NULL, NULL, 0);
+@@ -760,7 +760,7 @@ int CRestoringWindow::create(char *szDev
+   m_labelStatsSpeed = newtLabel(1, 11, "");
+   m_labelStatsSpace = newtLabel(1, 12, "");
+
+-  m_progressRestoring = newtScale(1, 18, 70, 100);
++  m_progressRestoring = newtScale(1, 18, 70, 100, 0);
+   m_labelPercent = newtLabel(72, 18, "");
+
+   m_formMain = newtForm(NULL, NULL, 0);
+diff -rupN partimage-0.6.9/src/client/interface_newt.cpp
partimage-0.6.9-patched/src/client/interface_newt.cpp
+--- partimage-0.6.9/src/client/interface_newt.cpp    2010-07-25
17:30:31.000000000 +0200
++++ partimage-0.6.9-patched/src/client/interface_newt.cpp    2010-11-21
12:54:02.000000000 +0100
+@@ -611,7 +611,7 @@ static void set_lb_cursor(newtComponent
+ char *filesel(char *dr)
+ {
+     newtComponent    lb, b1, b2, b3, l1, l2, f, f1;
+-    const char    *enr2, *enr3;
++    char    *enr2, *enr3;
+     char        *curv;
+     char        curvv[PATH_MAX]; // stupid, but who cares...
+     int        i, cnt;
+diff -rupN partimage-0.6.9/src/client/main.cpp
partimage-0.6.9-patched/src/client/main.cpp
+--- partimage-0.6.9/src/client/main.cpp    2010-07-25 17:30:31.000000000
+0200
++++ partimage-0.6.9-patched/src/client/main.cpp    2010-11-21
12:41:17.000000000 +0100
+@@ -198,8 +198,7 @@ int main(int argc, char *argv[])
+
+   // initialize language for i18n
+   setlocale(LC_ALL, "");
+-  bindtextdomain (PACKAGE, LOCALEDIR);
+-  textdomain (PACKAGE);
++
+
+   // Very important: do not remove (else, uncompatible image will be
produced)
+   if (checkStructSizes() == -1)
+diff -rupN partimage-0.6.9/src/client/partimage.h
partimage-0.6.9-patched/src/client/partimage.h
+--- partimage-0.6.9/src/client/partimage.h    2010-07-25 17:30:31.000000000
+0200
++++ partimage-0.6.9-patched/src/client/partimage.h    2010-11-21
12:40:31.000000000 +0100
+@@ -19,7 +19,6 @@
+ #define PARTIMAGE_H
+
+ #include <errno.h>
+-#include <libintl.h> // intl translation
+ #include <stdio.h>
+ #include <stdint.h>
+ #include <time.h>
+@@ -77,7 +76,7 @@ extern bool g_bSigInt;
+ extern bool g_bSigKill;
+
+ #ifdef OS_LINUX
+-  #define i18n(X)    gettext(X)
++  #define i18n(X) (X)
+ #else
+   #define i18n(X) (X)
+ #endif
+diff -rupN partimage-0.6.9/src/server/partimaged-main.cpp
partimage-0.6.9-patched/src/server/partimaged-main.cpp
+--- partimage-0.6.9/src/server/partimaged-main.cpp    2010-07-25
17:30:31.000000000 +0200
++++ partimage-0.6.9-patched/src/server/partimaged-main.cpp    2010-11-21
12:42:52.000000000 +0100
+@@ -231,8 +231,6 @@ int main(int argc, char *argv[])
+
+   // initialize language for i18n
+   setlocale(LC_ALL, "");
+-  bindtextdomain (PACKAGE, LOCALEDIR);
+-  textdomain (PACKAGE);
+
+   g_dwDebugLevel = DEFAULT_DEBUG_LEVEL;
+   g_nDebugThreadMain = getpid();
diff -rupN old/package/partimage/partimage.mk new/package/partimage/
partimage.mk
--- old/package/partimage/partimage.mk    1970-01-01 01:00:00.000000000
+0100
+++ new/package/partimage/partimage.mk    2010-12-03 21:16:55.000000000
+0100
@@ -0,0 +1,12 @@
+PARTIMAGE_VERSION:=0.6.9
+PARTIMAGE_SOURCE:=partimage-$(PARTIMAGE_VERSION).tar.bz2
+PARTIMAGE_SITE:=
http://sourceforge.net/projects/partimage/files/stable/0.6.9
+PARTIMAGE_CONF_OPT:= --disable-ssl
+PARTIMAGE_DEPENDENCIES = bzip2 newt zlib lzo
+
+define PARTIMAGE_INSTALL_TARGET_CMDS
+    $(INSTALL) -m 0755 $(@D)/src/client/partimage
$(TARGET_DIR)/usr/bin/partimage
+    $(INSTALL) -m 0755 $(@D)/src/server/partimaged
$(TARGET_DIR)/usr/bin/partimaged
+endef
+
+$(eval $(call AUTOTARGETS,package,partimage))
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101208/60f8b9e9/attachment.html>
