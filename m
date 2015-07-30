From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 30 Jul 2015 21:21:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/libserial: bump to version 0.6.0rc2
Message-ID: <1438284088-20483-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also:
  * Update patch #1
  * Remove patch #2, fixed upstream
  * add new dependency to boost
  * use hashes from sourceforge

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 .../libserial/0001-disable-python-bindings.patch    | 21 +++++++++++----------
 .../libserial/0002-add-missing-header-include.patch | 15 ---------------
 package/libserial/Config.in                         |  8 ++++++--
 package/libserial/libserial.hash                    |  5 +++--
 package/libserial/libserial.mk                      |  3 ++-
 5 files changed, 22 insertions(+), 30 deletions(-)
 delete mode 100644 package/libserial/0002-add-missing-header-include.patch

diff --git a/package/libserial/0001-disable-python-bindings.patch b/package/libserial/0001-disable-python-bindings.patch
index 54b5cb6..1f2f5ed 100644
--- a/package/libserial/0001-disable-python-bindings.patch
+++ b/package/libserial/0001-disable-python-bindings.patch
@@ -1,25 +1,26 @@
 Disable build of Python bindings, which requires the sipconfig module.
 
 Signed-off-by: Simon Dawson <spdawson@gmail.com>
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
 
-diff -Nurp a/Makefile.am b/Makefile.am
---- a/Makefile.am	2008-11-12 01:27:31.000000000 +0000
-+++ b/Makefile.am	2013-04-16 09:41:13.476002178 +0100
+diff -purN libserial-0.6.0rc2.orig/Makefile.am libserial-0.6.0rc2/Makefile.am
+--- libserial-0.6.0rc2.orig/Makefile.am	2014-06-05 18:37:25.000000000 +0200
++++ libserial-0.6.0rc2/Makefile.am	2015-07-30 20:59:28.828429011 +0200
 @@ -1,4 +1,4 @@
 -SUBDIRS=src doc examples sip
 +SUBDIRS=src doc examples
+ ACLOCAL_AMFLAGS=-I m4
  
  EXTRA_DIST = doxygen.conf.in Makefile.dist libserial.spec libserial.pc
- 
-diff -Nurp a/Makefile.in b/Makefile.in
---- a/Makefile.in	2008-11-12 01:28:14.000000000 +0000
-+++ b/Makefile.in	2013-04-16 09:41:05.628013626 +0100
-@@ -197,7 +197,7 @@ sysconfdir = @sysconfdir@
- target_alias = @target_alias@
+diff -purN libserial-0.6.0rc2.orig/Makefile.in libserial-0.6.0rc2/Makefile.in
+--- libserial-0.6.0rc2.orig/Makefile.in	2014-06-05 18:40:09.000000000 +0200
++++ libserial-0.6.0rc2/Makefile.in	2015-07-30 21:00:09.215188376 +0200
+@@ -348,7 +348,7 @@ target_alias = @target_alias@
+ top_build_prefix = @top_build_prefix@
  top_builddir = @top_builddir@
  top_srcdir = @top_srcdir@
 -SUBDIRS = src doc examples sip
 +SUBDIRS = src doc examples
+ ACLOCAL_AMFLAGS = -I m4
  EXTRA_DIST = doxygen.conf.in Makefile.dist libserial.spec libserial.pc
  pkgconfigdir = $(libdir)/pkgconfig
- pkgconfig_DATA = libserial.pc
diff --git a/package/libserial/0002-add-missing-header-include.patch b/package/libserial/0002-add-missing-header-include.patch
deleted file mode 100644
index a022637..0000000
--- a/package/libserial/0002-add-missing-header-include.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Add a missing header include, to fix a build error.
-
-Signed-off-by: Simon Dawson <spdawson@gmail.com>
-
-diff -Nurp a/src/SerialPort.cpp b/src/SerialPort.cpp
---- a/src/SerialPort.cpp	2008-11-12 01:27:30.000000000 +0000
-+++ b/src/SerialPort.cpp	2013-04-23 15:43:41.537495852 +0100
-@@ -27,6 +27,7 @@
- #include <cassert>
- #include <termios.h>
- #include <fcntl.h>
-+#include <unistd.h>
- #include <sys/ioctl.h>
- #include <sys/time.h>
- #include <signal.h>
diff --git a/package/libserial/Config.in b/package/libserial/Config.in
index 22adb72..4fb1acb 100644
--- a/package/libserial/Config.in
+++ b/package/libserial/Config.in
@@ -1,11 +1,15 @@
 config BR2_PACKAGE_LIBSERIAL
 	bool "libserial"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS # boost
+	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
+	depends on BR2_USE_WCHAR # boost
+	select boost
 	help
 	  Simplified serial port programming in C++ under POSIX operating
 	  systems.
 
 	  http://libserial.sourceforge.net/
 
-comment "libserial needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "libserial needs a toolchain w/ C++, threads, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/libserial/libserial.hash b/package/libserial/libserial.hash
index 26f65e5..024d657 100644
--- a/package/libserial/libserial.hash
+++ b/package/libserial/libserial.hash
@@ -1,2 +1,3 @@
-# Locally computed:
-sha256  60d8aebf5f262c12baf94ce61d61198fc9b79da2432c735c200decd08ead1fb4  libserial-0.6.0rc1.tar.gz
+# From http://sourceforge.net/projects/libserial/files/libserial/0.6.0rc2/
+sha1  e09113be3ba595135e95e853003ff96feea0da63  libserial-0.6.0rc2.tar.gz
+md5  7787679b22901e4810bc53ecccdf8266  libserial-0.6.0rc2.tar.gz
diff --git a/package/libserial/libserial.mk b/package/libserial/libserial.mk
index d2c928b..11f1874 100644
--- a/package/libserial/libserial.mk
+++ b/package/libserial/libserial.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-LIBSERIAL_VERSION = 0.6.0rc1
+LIBSERIAL_VERSION = 0.6.0rc2
 LIBSERIAL_SITE = http://downloads.sourceforge.net/libserial
 LIBSERIAL_INSTALL_STAGING = YES
 LIBSERIAL_LICENSE = GPLv2+
 LIBSERIAL_LICENSE_FILES = COPYING
+LIBSERIAL_DEPENDENCIES = boost
 
 LIBSERIAL_CONF_ENV = ac_cv_prog_DOCBOOK2PDF=no
 
-- 
2.5.0
