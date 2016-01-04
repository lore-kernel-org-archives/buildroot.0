From: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Date: Mon,  4 Jan 2016 20:46:00 +0100
Subject: [Buildroot] [PATCH 1/1] libmraa: new package
Message-ID: <1451936760-1654-1-git-send-email-pieterjan.camerlynck@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libmraa provides a unified interface for IO on Galileo, Edison,
Raspberry Pi and others

Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
---
 package/Config.in          |  1 +
 package/libmraa/Config.in  | 17 +++++++++++++++++
 package/libmraa/libmraa.mk | 22 ++++++++++++++++++++++
 3 files changed, 40 insertions(+)
 create mode 100644 package/libmraa/Config.in
 create mode 100644 package/libmraa/libmraa.mk

diff --git a/package/Config.in b/package/Config.in
index 442021f..52f6b5b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -930,6 +930,7 @@ menu "Hardware handling"
 	source "package/libiqrf/Config.in"
 	source "package/libllcp/Config.in"
 	source "package/libmbim/Config.in"
+	source "package/libmraa/Config.in"
 	source "package/libnfc/Config.in"
 	source "package/libpciaccess/Config.in"
 	source "package/libphidget/Config.in"
diff --git a/package/libmraa/Config.in b/package/libmraa/Config.in
new file mode 100644
index 0000000..cfbe37c
--- /dev/null
+++ b/package/libmraa/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_LIBMRAA
+	bool "libmraa"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_ARM_CPU_ARMV7A || BR2_i386 || BR2_x86_64
+	help
+	  Libmraa is a C/C++ library with bindings to javascript & python
+	  to interface with the IO on Galileo, Edison & other platforms,
+	  with a structured and sane API where port names/numbering matches
+	  the board that you are on.
+
+	  http://iotdk.intel.com/docs/master/mraa
+
+comment "libmraa needs a toolchain w/ C++, threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
+		|| BR2_STATIC_LIBS
diff --git a/package/libmraa/libmraa.mk b/package/libmraa/libmraa.mk
new file mode 100644
index 0000000..099e883
--- /dev/null
+++ b/package/libmraa/libmraa.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# libmraa
+#
+################################################################################
+
+LIBMRAA_VERSION = v0.9.0
+LIBMRAA_SITE = $(call github,intel-iot-devkit,mraa,$(LIBMRAA_VERSION))
+LIBMRAA_LICENSE = MIT
+LIBMRAA_LICENSE_FILES = COPYING
+LIBMRAA_INSTALL_STAGING = YES
+
+LIBMRAA_CONF_OPTS += \
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
