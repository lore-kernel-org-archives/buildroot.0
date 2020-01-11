From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 11 Jan 2020 12:25:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/libfuse3: new package
Message-ID: <20200111102523.22026-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The package is separated from the regular libfuse package, as it
contains new API (and can co-exist with libfuse).

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/libfuse3/Config.in     | 14 ++++++++++++++
 package/libfuse3/libfuse3.hash |  3 +++
 package/libfuse3/libfuse3.mk   | 27 +++++++++++++++++++++++++++
 5 files changed, 46 insertions(+)
 create mode 100644 package/libfuse3/Config.in
 create mode 100644 package/libfuse3/libfuse3.hash
 create mode 100644 package/libfuse3/libfuse3.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 80843dd1a1..00d38bb8e4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -248,6 +248,7 @@ F:	configs/raspberrypi4_64_defconfig
 
 N:	Asaf Kahlon <asafka7@gmail.com>
 F:	package/collectd/
+F:	package/libfuse3/
 F:	package/libuv/
 F:	package/python*
 F:	package/snmpclitools/
diff --git a/package/Config.in b/package/Config.in
index 873a592d64..96ba677816 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1328,6 +1328,7 @@ menu "Filesystem"
 	source "package/libconfig/Config.in"
 	source "package/libconfuse/Config.in"
 	source "package/libfuse/Config.in"
+	source "package/libfuse3/Config.in"
 	source "package/liblockfile/Config.in"
 	source "package/libnfs/Config.in"
 	source "package/libsysfs/Config.in"
diff --git a/package/libfuse3/Config.in b/package/libfuse3/Config.in
new file mode 100644
index 0000000000..584d3bf132
--- /dev/null
+++ b/package/libfuse3/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LIBFUSE3
+	bool "libfuse3"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
+	help
+	  The reference implementation of the Linux FUSE
+	  (Filesystem in Userspace) interface.
+
+	  https://github.com/libfuse/libfuse
+
+comment "libfuse3 needs a toolchain w/ threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
new file mode 100644
index 0000000000..5ce518e984
--- /dev/null
+++ b/package/libfuse3/libfuse3.hash
@@ -0,0 +1,3 @@
+# Locally calculated sha256 checksums
+sha256	fcb7079a1bb4e510377b427d1c5c37c349281d498e249ae0c2379b4cf50059c2	fuse-3.9.0.tar.xz
+sha256	b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad	LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
new file mode 100644
index 0000000000..4345c16d8a
--- /dev/null
+++ b/package/libfuse3/libfuse3.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# libfuse3
+#
+################################################################################
+
+LIBFUSE3_VERSION = 3.9.0
+LIBFUSE3_SOURCE = fuse-$(LIBFUSE3_VERSION).tar.xz
+LIBFUSE3_SITE = https://github.com/libfuse/libfuse/releases/download/fuse-$(LIBFUSE3_VERSION)
+LIBFUSE3_LICENSE = LGPL-2.1
+LIBFUSE3_LICENSE_FILES = LICENSE
+LIBFUSE3_INSTALL_STAGING = YES
+LIBFUSE3_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+LIBFUSE3_CONF_OPTS = \
+	-Dexamples=false \
+	-Dudevrulesdir=/lib/udev/rules.d \
+	-Duseroot=false
+
+define LIBFUSE3_DEVICES
+	/dev/fuse  c  666  0  0  10  229  0  0  -
+endef
+
+define LIBFUSE3_PERMISSIONS
+	/usr/bin/fusermount3 f 4755 0 0 - - - - -
+endef
+
+$(eval $(meson-package))
-- 
2.20.1
