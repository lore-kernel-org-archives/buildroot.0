From: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Date: Tue,  5 Jan 2016 21:11:40 +0100
Subject: [Buildroot] [PATCH v2] mraa: new package
In-Reply-To: <1451936760-1654-1-git-send-email-pieterjan.camerlynck@gmail.com>
References: <1451936760-1654-1-git-send-email-pieterjan.camerlynck@gmail.com>
Message-ID: <1452024700-24200-1-git-send-email-pieterjan.camerlynck@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mraa provides a unified interface for IO on Galileo, Edison,
Raspberry Pi and others
---
Changes v1->v2:
- rename libmraa to mraa
- remove C++ compiler dependency
- depend on BR2_arm instead of BR2_ARM_CPU_ARMV7A

Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
---
 package/Config.in                                  |  1 +
 .../mraa/0001-do-not-require-cpp-compiler.patch    | 28 ++++++++++++++++++++++
 package/mraa/Config.in                             | 15 ++++++++++++
 package/mraa/mraa.mk                               | 22 +++++++++++++++++
 4 files changed, 66 insertions(+)
 create mode 100644 package/mraa/0001-do-not-require-cpp-compiler.patch
 create mode 100644 package/mraa/Config.in
 create mode 100644 package/mraa/mraa.mk

diff --git a/package/Config.in b/package/Config.in
index 442021f..06ed4a8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -946,6 +946,7 @@ menu "Hardware handling"
 	source "package/libusb-compat/Config.in"
 	source "package/libv4l/Config.in"
 	source "package/libxkbcommon/Config.in"
+	source "package/mraa/Config.in"
 	source "package/mtdev/Config.in"
 	source "package/ne10/Config.in"
 	source "package/neardal/Config.in"
diff --git a/package/mraa/0001-do-not-require-cpp-compiler.patch b/package/mraa/0001-do-not-require-cpp-compiler.patch
new file mode 100644
index 0000000..fe58a26
--- /dev/null
+++ b/package/mraa/0001-do-not-require-cpp-compiler.patch
@@ -0,0 +1,28 @@
+From f490cf66dbbbdb80de20d8bb5c8cf5d663feb3c5 Mon Sep 17 00:00:00 2001
+From: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
+Date: Tue, 5 Jan 2016 19:36:55 +0100
+Subject: [PATCH 1/1] do not require a C++ compiler
+
+By default, CMake assumes both a C and C++ compiler are required.
+This is not needed for mraa because it only provides C++ header
+files.
+
+Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9860556..34d8e16 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ cmake_minimum_required (VERSION 2.8)
+-project (mraa)
++project (mraa C)
+ 
+ FIND_PACKAGE (Threads REQUIRED)
+ 
+-- 
+1.9.1
+
diff --git a/package/mraa/Config.in b/package/mraa/Config.in
new file mode 100644
index 0000000..9e8918a
--- /dev/null
+++ b/package/mraa/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_MRAA
+	bool "mraa"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_arm || BR2_i386 || BR2_x86_64
+	help
+	  mraa is a C/C++ library with bindings to javascript & python
+	  to interface with the IO on Galileo, Edison & other platforms,
+	  with a structured and sane API where port names/numbering matches
+	  the board that you are on.
+
+	  http://iotdk.intel.com/docs/master/mraa
+
+comment "mraa needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/mraa/mraa.mk b/package/mraa/mraa.mk
new file mode 100644
index 0000000..9f3b953
--- /dev/null
+++ b/package/mraa/mraa.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# mraa
+#
+################################################################################
+
+MRAA_VERSION = v0.9.0
+MRAA_SITE = $(call github,intel-iot-devkit,mraa,$(MRAA_VERSION))
+MRAA_LICENSE = MIT
+MRAA_LICENSE_FILES = COPYING
+MRAA_INSTALL_STAGING = YES
+
+MRAA_CONF_OPTS += \
+	-DBUILDSWIG=OFF \
+	-DUSBPLAT=OFF \
+	-DFTDI4222=OFF \
+	-DIPK=OFF \
+	-DRPM=OFF \
+	-DENABLEEXAMPLES=OFF \
+	-DTESTS=OFF
+
+$(eval $(cmake-package))
-- 
1.9.1
