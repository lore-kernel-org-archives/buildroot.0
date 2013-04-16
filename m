From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue, 16 Apr 2013 09:49:32 +0100
Subject: [Buildroot] [PATCH v2] libserial: new package
Message-ID: <1366102172-10308-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Note that the Python binding is disabled; we can't build this in Buildroot
without the sipconfig Python module for the host.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 v2: Fix Sourceforge mirror and patch numbering, as suggested by
 Thomas Petazzoni; use upstream version 0.6.0rc1, which requires less
 patching; disable build of Python bindings, which require the sipconfig
 Python module.

 package/Config.in                                  |    1 +
 package/libserial/Config.in                        |   11 +++++++++
 .../libserial-0001-disable-python-bindings.patch   |   25 ++++++++++++++++++++
 package/libserial/libserial.mk                     |   13 ++++++++++
 4 files changed, 50 insertions(+)
 create mode 100644 package/libserial/Config.in
 create mode 100644 package/libserial/libserial-0001-disable-python-bindings.patch
 create mode 100644 package/libserial/libserial.mk

diff --git a/package/Config.in b/package/Config.in
index f28cedd..6f87a6d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -463,6 +463,7 @@ source "package/libhid/Config.in"
 source "package/libiqrf/Config.in"
 source "package/libnfc/Config.in"
 source "package/libnfc-llcp/Config.in"
+source "package/libserial/Config.in"
 source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
 source "package/libv4l/Config.in"
diff --git a/package/libserial/Config.in b/package/libserial/Config.in
new file mode 100644
index 0000000..f098e28
--- /dev/null
+++ b/package/libserial/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBSERIAL
+	bool "libserial"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Simplified serial port programming in C++ under POSIX operating
+	  systems.
+
+	  http://libserial.sourceforge.net/
+
+comment "libserial requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libserial/libserial-0001-disable-python-bindings.patch b/package/libserial/libserial-0001-disable-python-bindings.patch
new file mode 100644
index 0000000..54b5cb6
--- /dev/null
+++ b/package/libserial/libserial-0001-disable-python-bindings.patch
@@ -0,0 +1,25 @@
+Disable build of Python bindings, which requires the sipconfig module.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+
+diff -Nurp a/Makefile.am b/Makefile.am
+--- a/Makefile.am	2008-11-12 01:27:31.000000000 +0000
++++ b/Makefile.am	2013-04-16 09:41:13.476002178 +0100
+@@ -1,4 +1,4 @@
+-SUBDIRS=src doc examples sip
++SUBDIRS=src doc examples
+ 
+ EXTRA_DIST = doxygen.conf.in Makefile.dist libserial.spec libserial.pc
+ 
+diff -Nurp a/Makefile.in b/Makefile.in
+--- a/Makefile.in	2008-11-12 01:28:14.000000000 +0000
++++ b/Makefile.in	2013-04-16 09:41:05.628013626 +0100
+@@ -197,7 +197,7 @@ sysconfdir = @sysconfdir@
+ target_alias = @target_alias@
+ top_builddir = @top_builddir@
+ top_srcdir = @top_srcdir@
+-SUBDIRS = src doc examples sip
++SUBDIRS = src doc examples
+ EXTRA_DIST = doxygen.conf.in Makefile.dist libserial.spec libserial.pc
+ pkgconfigdir = $(libdir)/pkgconfig
+ pkgconfig_DATA = libserial.pc
diff --git a/package/libserial/libserial.mk b/package/libserial/libserial.mk
new file mode 100644
index 0000000..a835439
--- /dev/null
+++ b/package/libserial/libserial.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# libserial
+#
+#############################################################
+
+LIBSERIAL_VERSION = 0.6.0rc1
+LIBSERIAL_SITE = http://downloads.sourceforge.net/libserial
+LIBSERIAL_INSTALL_STAGING = YES
+LIBSERIAL_LICENSE = GPLv2+
+LIBSERIAL_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.7.10.4
