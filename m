From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Wed, 30 Sep 2015 23:14:30 +0200
Subject: [Buildroot] [PATCH] libosmesa: New package
Message-ID: <560C50B6.3050409@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/Config.in                |  1 +
 package/libosmesa/Config.in      | 11 +++++++++++
 package/libosmesa/libosmesa.hash |  2 ++
 package/libosmesa/libosmesa.mk   | 30 ++++++++++++++++++++++++++++++
 package/mesa3d/mesa3d.mk         |  2 +-
 5 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 package/libosmesa/Config.in
 create mode 100644 package/libosmesa/libosmesa.hash
 create mode 100644 package/libosmesa/libosmesa.mk

diff --git a/package/Config.in b/package/Config.in
index 0e0c5cd..e53d278 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -827,6 +827,7 @@ menu "Graphics"
 	source "package/libgtk2/Config.in"
 	source "package/libgtk3/Config.in"
 	source "package/libmng/Config.in"
+	source "package/libosmesa/Config.in"
 	source "package/libpng/Config.in"
 	source "package/libqrencode/Config.in"
 	source "package/libraw/Config.in"
diff --git a/package/libosmesa/Config.in b/package/libosmesa/Config.in
new file mode 100644
index 0000000..9d08933
--- /dev/null
+++ b/package/libosmesa/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBOSMESA
+	bool "libosmesa"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	help
+	  The OSMesa API provides functions for making off-screen renderings.
+
+	  http://mesa3d.org
+
+comment "libosmesa needs a toolchain w/ C++, NPTL"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/libosmesa/libosmesa.hash b/package/libosmesa/libosmesa.hash
new file mode 100644
index 0000000..0501314
--- /dev/null
+++ b/package/libosmesa/libosmesa.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/archives/mesa-announce/2015-September/000175.html
+sha256	e36ee5ceeadb3966fb5ce5b4cf18322dbb76a4f075558ae49c3bba94f57d58fd	mesa-10.6.8.tar.xz
diff --git a/package/libosmesa/libosmesa.mk b/package/libosmesa/libosmesa.mk
new file mode 100644
index 0000000..f70fd2a
--- /dev/null
+++ b/package/libosmesa/libosmesa.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# libosmesa
+#
+################################################################################
+
+# When updating the version, please also update mesa3d
+LIBOSMESA_VERSION = 10.6.8
+LIBOSMESA_SOURCE = mesa-$(LIBOSMESA_VERSION).tar.xz
+LIBOSMESA_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(LIBOSMESA_VERSION)
+LIBOSMESA_LICENSE = MIT, SGI, Khronos
+LIBOSMESA_LICENSE_FILES = docs/license.html
+LIBOSMESA_AUTORECONF = YES
+LIBOSMESA_INSTALL_STAGING = YES
+LIBOSMESA_DEPENDENCIES = host-bison host-flex
+
+#--without-dri-drivers
+LIBOSMESA_CONF_OPTS += \
+	--enable-osmesa \
+	--disable-dri \
+	--disable-dri3 \
+	--disable-driglx-direct \
+	--disable-egl \
+	--disable-gles1 \
+	--disable-gles2 \
+	--with-dri-drivers="" \
+	--with-gallium-drivers=""
+
+
+$(eval $(autotools-package))
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index f7feb0f..3e30451 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-# When updating the version, please also update mesa3d-headers
+# When updating the version, please also update mesa3d-headers and libosmesa
 MESA3D_VERSION = 10.6.8
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
-- 
1.9.1
