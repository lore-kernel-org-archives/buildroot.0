From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 14 Jan 2019 07:35:29 +0100
Subject: [Buildroot] [PATCH v2,1/1] libserial: bump to version 1.0.0
Message-ID: <20190114063529.12178-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Move site to github
- Add gcc >= 5 dependency for C++14:
  https://github.com/crayzeewulf/libserial/commit/cafeffaa60f23012675d908b1e13b89aad3b56b2
- Remove first patch and use --without-python instead
- Remove second patch (patch has been merged in 2015:
  https://github.com/crayzeewulf/libserial/commit/47ca0621ccd2100e4ba0d7f4e2a861d14f05f63c)
- Add a new patch to fix build when size_t is an unsigned int
- Use new --disable-tests option
- Update license to BSD-3-Clause and replace COPYING by LICENSE.txt:
  https://github.com/crayzeewulf/libserial/commit/3f12abc045aae34a40a6fc9a9b5ed0a1bc6b2049
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Add gcc >= 5 dependency for C++14

 ...cpp-fix-build-when-size_t-is-an-unsigned-.patch | 39 +++++++++++++
 .../libserial/0001-disable-python-bindings.patch   | 26 ---------
 ...n-t-use-high-baudrates-when-not-available.patch | 65 ----------------------
 package/libserial/Config.in                        |  7 ++-
 package/libserial/libserial.hash                   |  6 +-
 package/libserial/libserial.mk                     | 13 +++--
 6 files changed, 55 insertions(+), 101 deletions(-)
 create mode 100644 package/libserial/0001-SerialPort.cpp-fix-build-when-size_t-is-an-unsigned-.patch
 delete mode 100644 package/libserial/0001-disable-python-bindings.patch
 delete mode 100644 package/libserial/0002-Don-t-use-high-baudrates-when-not-available.patch

diff --git a/package/libserial/0001-SerialPort.cpp-fix-build-when-size_t-is-an-unsigned-.patch b/package/libserial/0001-SerialPort.cpp-fix-build-when-size_t-is-an-unsigned-.patch
new file mode 100644
index 0000000000..a01da53adb
--- /dev/null
+++ b/package/libserial/0001-SerialPort.cpp-fix-build-when-size_t-is-an-unsigned-.patch
@@ -0,0 +1,39 @@
+From 2e4cf095afdcf843e93d1bdea9dbd961558f09bd Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 13 Jan 2019 21:01:19 +0100
+Subject: [PATCH] SerialPort.cpp: fix build when size_t is an unsigned int
+
+size_t can be defined as an unsigned int instead of long unsigned int so
+replace 1UL to (size_t)1 when calling max function
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/crayzeewulf/libserial/pull/126]
+---
+ src/SerialPort.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/SerialPort.cpp b/src/SerialPort.cpp
+index e354fcb..75e762e 100644
+--- a/src/SerialPort.cpp
++++ b/src/SerialPort.cpp
+@@ -2208,7 +2208,7 @@ namespace LibSerial
+ 
+         // Local variables.
+         size_t number_of_bytes_read = 0 ;
+-        size_t number_of_bytes_remaining = std::max(numberOfBytes, 1UL) ;
++        size_t number_of_bytes_remaining = std::max(numberOfBytes, (size_t)1) ;
+         size_t maximum_number_of_bytes = dataBuffer.max_size() ;
+         
+         // Clear the data buffer and reserve enough space in the buffer to store the incoming data.
+@@ -2302,7 +2302,7 @@ namespace LibSerial
+ 
+         // Local variables.
+         size_t number_of_bytes_read = 0 ;
+-        size_t number_of_bytes_remaining = std::max(numberOfBytes, 1UL) ;
++        size_t number_of_bytes_remaining = std::max(numberOfBytes, (size_t)1) ;
+         size_t maximum_number_of_bytes = dataString.max_size() ;
+         
+         // Clear the data buffer and reserve enough space in the buffer to store the incoming data.
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
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
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
diff --git a/package/libserial/Config.in b/package/libserial/Config.in
index d492f6b71b..d54ae4d8ac 100644
--- a/package/libserial/Config.in
+++ b/package/libserial/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBSERIAL
 	bool "libserial"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	depends on BR2_USE_WCHAR # boost
 	select BR2_PACKAGE_BOOST
@@ -10,5 +11,7 @@ config BR2_PACKAGE_LIBSERIAL
 
 	  http://libserial.sourceforge.net/
 
-comment "libserial needs a toolchain w/ C++, threads, wchar"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+comment "libserial needs a toolchain w/ C++, gcc >= 5, threads, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/libserial/libserial.hash b/package/libserial/libserial.hash
index bca647ae3f..e82809c71b 100644
--- a/package/libserial/libserial.hash
+++ b/package/libserial/libserial.hash
@@ -1,5 +1,3 @@
-# From http://sourceforge.net/projects/libserial/files/libserial/0.6.0rc2/
-sha1  e09113be3ba595135e95e853003ff96feea0da63  libserial-0.6.0rc2.tar.gz
-md5  7787679b22901e4810bc53ecccdf8266  libserial-0.6.0rc2.tar.gz
 # Locally calculated
-sha256 35ee29eb1369d52ffb8658237577692f991eb508320d0abbb71c53e6494a1c23 libserial-0.6.0rc2.tar.gz
+sha256 063142d6bfe08898316e9a6055f2ddeedef56de06f7cfc8dcdfecc6efabf4bdd libserial-v1.0.0.tar.gz
+sha256 c42fdfe17c192cfdb900e22d40ef246db1b473f99165e405eda62b41be27f4bf LICENSE.txt
diff --git a/package/libserial/libserial.mk b/package/libserial/libserial.mk
index b73d4c76cd..8da7d1cddd 100644
--- a/package/libserial/libserial.mk
+++ b/package/libserial/libserial.mk
@@ -4,13 +4,18 @@
 #
 ################################################################################
 
-LIBSERIAL_VERSION = 0.6.0rc2
-LIBSERIAL_SITE = http://downloads.sourceforge.net/libserial
+LIBSERIAL_VERSION = v1.0.0
+LIBSERIAL_SITE = $(call github,crayzeewulf,libserial,$(LIBSERIAL_VERSION))
 LIBSERIAL_INSTALL_STAGING = YES
-LIBSERIAL_LICENSE = GPL-2.0+
-LIBSERIAL_LICENSE_FILES = COPYING
+LIBSERIAL_LICENSE = BSD-3-Clause
+LIBSERIAL_LICENSE_FILES = LICENSE.txt
 LIBSERIAL_DEPENDENCIES = boost
+# From git
+LIBSERIAL_AUTORECONF = YES
 
 LIBSERIAL_CONF_ENV = ac_cv_prog_DOCBOOK2PDF=no
+LIBSERIAL_CONF_OPTS = \
+	--disable-tests \
+	--without-python
 
 $(eval $(autotools-package))
-- 
2.14.1
