From: Steve Kenton <skenton@ou.edu>
Date: Sat, 10 Jan 2015 13:37:43 -0600
Subject: [Buildroot] [PATCH] xorriso: new package
Message-ID: <54B17F87.4020002@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xorriso cd/dvd/bd iso 9660 manipulation and disc burner.

libburnia is a project for reading, mastering and writing
optical discs. Currently it is comprised of libraries named
libisofs, libburn, libisoburn, a cdrecord emulator named cdrskin,
and an integrated multi-session tool named xorriso.
The software runs on GNU/Linux, FreeBSD, Solaris, NetBSD.
It is base of the  GNU xorriso package and is actively maintained.

Signed-off-by Stephen M. Kenton <skenton@ou.edu>
---
Thank you Thomas for all the helpful comments.
I believe I have done what you asked me to do,
except that I have no git fu - it's on my list
of things to learn, but not today :-(
Patch against today's snapshot.
Build tested with both uClibc and glibc.

diff -pruN buildroot.ori/package/Config.in buildroot/package/Config.in
--- buildroot.ori/package/Config.in	2015-01-09 15:52:22.000000000 -0600
+++ buildroot/package/Config.in	2015-01-10 12:50:22.491446657 -0600
@@ -391,6 +391,7 @@ endif
 	source "package/usbutils/Config.in"
 	source "package/w_scan/Config.in"
 	source "package/wipe/Config.in"
+	source "package/xorriso/Config.in"
 endmenu

 menu "Interpreter languages and scripting"
diff -pruN buildroot.ori/package/xorriso/Config.in buildroot/package/xorriso/Config.in
--- buildroot.ori/package/xorriso/Config.in	1969-12-31 18:00:00.000000000 -0600
+++ buildroot/package/xorriso/Config.in	2015-01-10 12:49:55.531446140 -0600
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_XORRISO
+	bool "xorriso"
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	depends on BR2_USE_WCHAR && BR2_LARGEFILE
+	help
+	  xorriso cd/dvd/bd iso 9660 manipulation and disc burner.
+
+	  libburnia is a project for reading, mastering and writing
+	  optical discs. Currently it is comprised of libraries named
+	  libisofs, libburn, libisoburn, a cdrecord emulator named cdrskin,
+	  and an integrated multi-session tool named xorriso.
+	  The software runs on GNU/Linux, FreeBSD, Solaris, NetBSD.
+	  It is base of the  GNU xorriso package and is actively maintained.
+	
+	  http://libburnia-project.org/
+	  http://www.gnu.org/software/xorriso
+
+comment "xorriso needs a toolchain w/ wchar, largefile"
+	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE
diff -pruN buildroot.ori/package/xorriso/xorriso.mk buildroot/package/xorriso/xorriso.mk
--- buildroot.ori/package/xorriso/xorriso.mk	1969-12-31 18:00:00.000000000 -0600
+++ buildroot/package/xorriso/xorriso.mk	2015-01-10 12:49:55.531446140 -0600
@@ -0,0 +1,13 @@
+###############################################################################
+#
+# xorriso
+#
+###############################################################################
+
+XORRISO_VERSION = 1.3.8
+XORRISO_SITE = $(BR2_GNU_MIRROR)/xorriso
+XORRISO_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+XORRISO_LICENSE = GPLv3+
+XORRISO_LICENSE_FILES = COPYING COPYRIGHT
+
+$(eval $(autotools-package))
