From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  3 Jun 2018 21:29:07 +0200
Subject: [Buildroot] [PATCH 1/1] libserial: bump to version 0.6rc3
Message-ID: <20180603192907.7490-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Move site to github
- Remove first patch and use --without-python instead
- Remove second patch (patch has been merged in 2015:
  https://github.com/crayzeewulf/libserial/commit/47ca0621ccd2100e4ba0d7f4e2a861d14f05f63c)
- Add new patch to disable tests
- Update license to LGPL-2.0+ and add COPYING.LESSER and LICENSE.txt:
  https://github.com/crayzeewulf/libserial/commit/6f716c4d79bb31a0c21f3ee9680111c633ac4840
- Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../libserial/0001-Make-tests-conditional.patch    | 54 ++++++++++++++++++
 .../libserial/0001-disable-python-bindings.patch   | 26 ---------
 ...n-t-use-high-baudrates-when-not-available.patch | 65 ----------------------
 package/libserial/libserial.hash                   |  8 +--
 package/libserial/libserial.mk                     | 13 +++--
 5 files changed, 67 insertions(+), 99 deletions(-)
 create mode 100644 package/libserial/0001-Make-tests-conditional.patch
 delete mode 100644 package/libserial/0001-disable-python-bindings.patch
 delete mode 100644 package/libserial/0002-Don-t-use-high-baudrates-when-not-available.patch

diff --git a/package/libserial/0001-Make-tests-conditional.patch b/package/libserial/0001-Make-tests-conditional.patch
new file mode 100644
index 0000000000..35928daf7f
--- /dev/null
+++ b/package/libserial/0001-Make-tests-conditional.patch
@@ -0,0 +1,54 @@
+From 3d1e73409d26fa22fbd6c124dc38169ebd9fb1b2 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 3 Jun 2018 11:45:27 +0200
+Subject: [PATCH] Make tests conditional
+
+test uses gtest so allow the user to disable tests to avoid adding a
+unneeded dependency
+
+[Upstream status: https://github.com/crayzeewulf/libserial/pull/105]
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile.am  | 6 +++++-
+ configure.ac | 5 +++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index b270aed..ad4ab1d 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,9 +1,13 @@
+-SUBDIRS =  src test examples docs
++SUBDIRS =  src examples docs
+ 
+ if PYTHON
+ SUBDIRS += sip
+ endif
+ 
++if TESTS
++SUBDIRS += test
++endif
++
+ ACLOCAL_AMFLAGS = -I m4
+ 
+ EXTRA_DIST = doxygen.conf.in Makefile.dist libserial.spec libserial.pc
+diff --git a/configure.ac b/configure.ac
+index d2df292..47b87fb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -48,6 +48,11 @@ AC_ARG_WITH([python],
+ 	[], [with_python=yes])
+ AM_CONDITIONAL([PYTHON], [test "${with_python}" != "no"])
+ 
++AC_ARG_ENABLE([tests],
++	AS_HELP_STRING([--disable-tests], [Disable tests]),
++	[], [enable_tests=yes])
++AM_CONDITIONAL([TESTS], [test "${enable_tests}" != "no"])
++
+ AC_OUTPUT([Makefile
+ doxygen.conf
+ libserial.spec
+-- 
+2.14.1
+
diff --git a/package/libserial/0001-disable-python-bindings.patch b/package/libserial/0001-disable-python-bindings.patch
deleted file mode 100644
index 1f2f5ed7df..0000000000
--- a/package/libserial/0001-disable-python-bindings.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Disable build of Python bindings, which requires the sipconfig module.
-
-Signed-off-by: Simon Dawson <spdawson@gmail.com>
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
-
-diff -purN libserial-0.6.0rc2.orig/Makefile.am libserial-0.6.0rc2/Makefile.am
---- libserial-0.6.0rc2.orig/Makefile.am	2014-06-05 18:37:25.000000000 +0200
-+++ libserial-0.6.0rc2/Makefile.am	2015-07-30 20:59:28.828429011 +0200
-@@ -1,4 +1,4 @@
--SUBDIRS=src doc examples sip
-+SUBDIRS=src doc examples
- ACLOCAL_AMFLAGS=-I m4
- 
- EXTRA_DIST = doxygen.conf.in Makefile.dist libserial.spec libserial.pc
-diff -purN libserial-0.6.0rc2.orig/Makefile.in libserial-0.6.0rc2/Makefile.in
---- libserial-0.6.0rc2.orig/Makefile.in	2014-06-05 18:40:09.000000000 +0200
-+++ libserial-0.6.0rc2/Makefile.in	2015-07-30 21:00:09.215188376 +0200
-@@ -348,7 +348,7 @@ target_alias = @target_alias@
- top_build_prefix = @top_build_prefix@
- top_builddir = @top_builddir@
- top_srcdir = @top_srcdir@
--SUBDIRS = src doc examples sip
-+SUBDIRS = src doc examples
- ACLOCAL_AMFLAGS = -I m4
- EXTRA_DIST = doxygen.conf.in Makefile.dist libserial.spec libserial.pc
- pkgconfigdir = $(libdir)/pkgconfig
diff --git a/package/libserial/0002-Don-t-use-high-baudrates-when-not-available.patch b/package/libserial/0002-Don-t-use-high-baudrates-when-not-available.patch
deleted file mode 100644
index f2ad61ae7d..0000000000
--- a/package/libserial/0002-Don-t-use-high-baudrates-when-not-available.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 47ca0621ccd2100e4ba0d7f4e2a861d14f05f63c Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 17 Nov 2015 23:50:14 +0100
-Subject: [PATCH] Don't use high baudrates when not available
-
-On certain architectures (namely Sparc), the maximum baud rate exposed
-by the kernel headers is B2000000. Therefore, the current libserial
-code doesn't build for the Sparc and Sparc64 architectures due to
-this.
-
-In order to address this problem, this patch tests the value of
-__MAX_BAUD. If it's higher than B2000000 then we assume we're on an
-architecture that supports all baud rates up to B4000000. Otherwise,
-we simply don't support the baud rates above B2000000.
-
-Fixes build failures such as:
-
-./SerialPort.h:88:24: error: 'B2500000' was not declared in this scope
-         BAUD_2500000 = B2500000,
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/SerialPort.h      | 2 ++
- src/SerialStreamBuf.h | 2 ++
- 2 files changed, 4 insertions(+)
-
-diff --git a/src/SerialPort.h b/src/SerialPort.h
-index 6c0baaa..0b1af4c 100644
---- a/src/SerialPort.h
-+++ b/src/SerialPort.h
-@@ -85,11 +85,13 @@ public:
-         BAUD_1152000 = B1152000, 
-         BAUD_1500000 = B1500000,
-         BAUD_2000000 = B2000000,
-+#if __MAX_BAUD > B2000000
-         BAUD_2500000 = B2500000,
-         BAUD_3000000 = B3000000,
-         BAUD_3500000 = B3500000,
-         BAUD_4000000 = B4000000,
- #endif
-+#endif /* __linux__ */
-         BAUD_DEFAULT = BAUD_57600
-     } ;
- 
-diff --git a/src/SerialStreamBuf.h b/src/SerialStreamBuf.h
-index ccbb996..174f31c 100644
---- a/src/SerialStreamBuf.h
-+++ b/src/SerialStreamBuf.h
-@@ -85,11 +85,13 @@ extern "C++"
-                 BAUD_1152000 = SerialPort::BAUD_1152000, 
-                 BAUD_1500000 = SerialPort::BAUD_1500000, 
-                 BAUD_2000000 = SerialPort::BAUD_2000000, 
-+#if __MAX_BAUD > B2000000
-                 BAUD_2500000 = SerialPort::BAUD_2500000, 
-                 BAUD_3000000 = SerialPort::BAUD_3000000, 
-                 BAUD_3500000 = SerialPort::BAUD_3500000, 
-                 BAUD_4000000 = SerialPort::BAUD_4000000, 
- #endif
-+#endif /* __linux__ */
-                 BAUD_DEFAULT = SerialPort::BAUD_DEFAULT,
-                 BAUD_INVALID = -1
-             } ;
--- 
-2.6.3
-
diff --git a/package/libserial/libserial.hash b/package/libserial/libserial.hash
index bca647ae3f..8c39880723 100644
--- a/package/libserial/libserial.hash
+++ b/package/libserial/libserial.hash
@@ -1,5 +1,5 @@
-# From http://sourceforge.net/projects/libserial/files/libserial/0.6.0rc2/
-sha1  e09113be3ba595135e95e853003ff96feea0da63  libserial-0.6.0rc2.tar.gz
-md5  7787679b22901e4810bc53ecccdf8266  libserial-0.6.0rc2.tar.gz
 # Locally calculated
-sha256 35ee29eb1369d52ffb8658237577692f991eb508320d0abbb71c53e6494a1c23 libserial-0.6.0rc2.tar.gz
+sha256 e5b220a87d6dc588edfcf86485a07559fef3a4b8c87e49921557605614f75042 libserial-v0.6.0rc3.tar.gz
+sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670 COPYING
+sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768 COPYING.LESSER
+sha256 afc92516ca79f4d7b78b4d1863ea76cdc05c8c7e2ddba7acb52bacc925ec650e LICENSE.txt
diff --git a/package/libserial/libserial.mk b/package/libserial/libserial.mk
index b73d4c76cd..e58f59b138 100644
--- a/package/libserial/libserial.mk
+++ b/package/libserial/libserial.mk
@@ -4,13 +4,18 @@
 #
 ################################################################################
 
-LIBSERIAL_VERSION = 0.6.0rc2
-LIBSERIAL_SITE = http://downloads.sourceforge.net/libserial
+LIBSERIAL_VERSION = v0.6.0rc3
+LIBSERIAL_SITE = $(call github,crayzeewulf,libserial,$(LIBSERIAL_VERSION))
 LIBSERIAL_INSTALL_STAGING = YES
-LIBSERIAL_LICENSE = GPL-2.0+
-LIBSERIAL_LICENSE_FILES = COPYING
+LIBSERIAL_LICENSE = LGPL-2.0+
+LIBSERIAL_LICENSE_FILES = COPYING COPYING.LESSER LICENSE.txt
 LIBSERIAL_DEPENDENCIES = boost
+# From git and we're patching configure.ac
+LIBSERIAL_AUTORECONF = YES
 
 LIBSERIAL_CONF_ENV = ac_cv_prog_DOCBOOK2PDF=no
+LIBSERIAL_CONF_OPTS = \
+	--disable-tests \
+	--without-python
 
 $(eval $(autotools-package))
-- 
2.14.1
