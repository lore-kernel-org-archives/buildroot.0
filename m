From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Apr 2020 15:01:29 +0200
Subject: [Buildroot] [git commit] package/libfuse3: new package
Message-ID: <20200419124714.40E8983BA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45bce2575d8dd3f08fbf0870f7cfc2fbd3c7a3e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package is separated from the regular libfuse package, as it
contains new API (and can co-exist with libfuse).

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/libfuse3/Config.in     | 14 ++++++++++++++
 package/libfuse3/libfuse3.hash |  3 +++
 package/libfuse3/libfuse3.mk   | 26 ++++++++++++++++++++++++++
 5 files changed, 45 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a13a1694ea..68b3f6a5c4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -259,6 +259,7 @@ F:	configs/raspberrypi4_64_defconfig
 
 N:	Asaf Kahlon <asafka7@gmail.com>
 F:	package/collectd/
+F:	package/libfuse3/
 F:	package/libuv/
 F:	package/python*
 F:	package/snmpclitools/
diff --git a/package/Config.in b/package/Config.in
index 55634e9479..46d3c75ee2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1359,6 +1359,7 @@ menu "Filesystem"
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
index 0000000000..bc09da4cf8
--- /dev/null
+++ b/package/libfuse3/libfuse3.hash
@@ -0,0 +1,3 @@
+# Locally calculated sha256 checksums
+sha256  4f3dea4979c30fbd85f46b8812bee5945bd6bb4487165eb01ecde57bbfbb332f  libfuse3-3.9.1.tar.gz
+sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
new file mode 100644
index 0000000000..d23d8d9a43
--- /dev/null
+++ b/package/libfuse3/libfuse3.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# libfuse3
+#
+################################################################################
+
+LIBFUSE3_VERSION = 3.9.1
+LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
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
