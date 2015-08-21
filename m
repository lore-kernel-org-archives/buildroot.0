From: universe II <universeii@gmx.de>
Date: Fri, 21 Aug 2015 14:15:18 +0200
Subject: [Buildroot] Add cpio package to make rpm work
Message-ID: <55D71656.7040704@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,
I configured buildroot to add the rpm package to my target system, but I 
ran into a problem when executing rpm on the target system. Reason is, 
that a lot of rpms a packaged using the binary format of cpio. But the 
busybox builtin cpio only supports "newc" and "crc" format. Therefore 
the cpio package is necessary when rpm should be able to handle rpms in 
binary format. The following patch add the cpio package to buildroot.

Regards,
Andreas

diff -Naur a/package/Config.in b/package/Config.in
--- a/package/Config.in 2015-03-01 22:26:12.000000000 +0100
+++ b/package/Config.in 2015-08-21 13:27:27.000000000 +0200
@@ -105,6 +105,9 @@
         source "package/binutils/Config.in"
         source "package/bsdiff/Config.in"
         source "package/bustle/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+       source "package/cpio/Config.in"
+endif
         source "package/cppunit/Config.in"
         source "package/cvs/Config.in"
  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff -Naur a/package/cpio/Config.in b/package/cpio/Config.in
--- a/package/cpio/Config.in    1970-01-01 01:00:00.000000000 +0100
+++ b/package/cpio/Config.in    2015-08-21 12:59:36.000000000 +0200
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_CPIO
+       bool "cpio"
+       help
+         cpio copies files into or out of a cpio or tar archive.
+         This cpio version supports more formats (especially the
+         binary format) than the version provided bybusybox.
+         Note: Make sure to disable cpio in busybox because the
+               busybox cpio version will be found first according
+               to PATH variable.
diff -Naur a/package/cpio/cpio.mk b/package/cpio/cpio.mk
--- a/package/cpio/cpio.mk      1970-01-01 01:00:00.000000000 +0100
+++ b/package/cpio/cpio.mk      2015-08-21 13:15:22.000000000 +0200
@@ -0,0 +1,11 @@
+################################################################################
+#
+# cpio
+#
+################################################################################
+
+CPIO_VERSION = 2.11
+CPIO_SOURCE = cpio-$(CPIO_VERSION).tar.bz2
+CPIO_SITE =http://www.gnu.org/software/cpio
+
+$(eval $(autotools-package))
