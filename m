From: Steve Kenton <skenton@ou.edu>
Date: Fri, 09 Jan 2015 19:59:46 -0600
Subject: [Buildroot] [RFC] xorriso: new package
Message-ID: <54B08792.4070309@ou.edu>
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

The source code for the libburnia project is distributed under
the terms of the  GNU General Public License version 2 or later
(GPLv2+). Be aware that linking libisoburn with GPLv3+ library
libreadline-6 will automatically change the license of the resulting
libisoburn.so and xorriso binary to GPLv3+.

Signed-off-by Stephen M. Kenton <skenton@ou.edu>
---
I added xorriso to "Target packages > Hardware handling"
since that is where cdrkit resides

Test builds run with both uClibc and glibc

config BR2_PACKAGE_XORRISO
	bool "xorriso"
	select BR2_LIBICONV
	depends on BR2_USE_WCHAR && BR2_LARGEFILE

I don't understand why "select BR2_LIBICONV" is needed because I thought
that libiconv was implied by "depends on BR2_USE_WCHAR && BR2_LARGEFILE"
but without it the uClibc build ends with the error below
.
.
.
checking for _FILE_OFFSET_BITS value needed for large files... no
checking for _LARGE_FILES value needed for large files... no
checking for _LARGEFILE_SOURCE value needed for large files... no
checking for fseeko... yes
checking for fseeko... (cached) yes
checking for iconv() in separate -liconv ... no
checking for libiconv in -liconv... no
checking for const qualifier with iconv() ... const
checking for iconv() to be accessible now ... no

Cannot get function iconv() to work. Configuration aborted.
Check whether your system needs a separate libiconv installed.
If it is installed but not found, try something like
  export LDFLAGS="$LDFLAGS -L/usr/local/lib"
  export CPPFLAGS="$CPPFLAGS -I/usr/local/include"
  export LIBS="$LIBS -liconv"
You may override this test by exporting variable
  XORRISO_ASSUME_ICONV=yes

make: *** [/home/steve/test/buildroot.uClibc/output/build/xorriso-1.3.8/.stamp_configured] Error 1

diff -pruN buildroot.ori/package/Config.in buildroot/package/Config.in
--- buildroot.ori/package/Config.in	2015-01-09 15:52:22.000000000 -0600
+++ buildroot/package/Config.in	2015-01-09 18:59:47.030390893 -0600
@@ -391,6 +391,7 @@ endif
 	source "package/usbutils/Config.in"
 	source "package/w_scan/Config.in"
 	source "package/wipe/Config.in"
+	source "package/xorriso/Config.in"
 endmenu

 menu "Interpreter languages and scripting"
diff -pruN buildroot.ori/package/xorriso/Config.in buildroot/package/xorriso/Config.in
--- buildroot.ori/package/xorriso/Config.in	1969-12-31 18:00:00.000000000 -0600
+++ buildroot/package/xorriso/Config.in	2015-01-09 19:19:29.758413581 -0600
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_XORRISO
+	bool "xorriso"
+	select BR2_LIBICONV
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
+	  The source code for the libburnia project is distributed under
+	  the terms of the  GNU General Public License version 2 or later
+	  (GPLv2+). Be aware that linking libisoburn with GPLv3+ library
+	  libreadline-6 will automatically change the license of the resulting
+	  libisoburn.so and xorriso binary to GPLv3+.
+	
+	  http://libburnia-project.org/
+	  http://www.gnu.org/software/xorriso
diff -pruN buildroot.ori/package/xorriso/xorriso.mk buildroot/package/xorriso/xorriso.mk
--- buildroot.ori/package/xorriso/xorriso.mk	1969-12-31 18:00:00.000000000 -0600
+++ buildroot/package/xorriso/xorriso.mk	2015-01-09 19:03:27.778395128 -0600
@@ -0,0 +1,13 @@
+#############################################################
+#
+# XORRISO
+#
+#############################################################
+XORRISO_VERSION = 1.3.8
+XORRISO_SOURCE = xorriso-$(XORRISO_VERSION).tar.gz
+XORRISO_SITE = http://www.gnu.org/software/xorriso
+XORRISO_INSTALL_STAGING = NO
+XORRISO_INSTALL_TARGET = YES
+XORRISO_LICENSE = GPLv3+
+
+$(eval $(autotools-package))
