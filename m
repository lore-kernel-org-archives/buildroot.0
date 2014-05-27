From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 28 May 2014 00:38:27 +0200
Subject: [Buildroot] [PATCH] dillo: new package
Message-ID: <1401230307-17697-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/Config.in       |  1 +
 package/dillo/Config.in | 21 ++++++++++++++++++++
 package/dillo/dillo.mk  | 51 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 package/dillo/Config.in
 create mode 100644 package/dillo/dillo.mk

diff --git a/package/Config.in b/package/Config.in
index 3bc8d24..5a92032 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -224,6 +224,7 @@ source "package/x11r7/Config.in"
 comment "X applications"
 source "package/alsamixergui/Config.in"
 source "package/apitrace/Config.in"
+source "package/dillo/Config.in"
 source "package/docker/Config.in"
 source "package/feh/Config.in"
 source "package/freerdp/Config.in"
diff --git a/package/dillo/Config.in b/package/dillo/Config.in
new file mode 100644
index 0000000..07198f1
--- /dev/null
+++ b/package/dillo/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_DILLO
+	bool "dillo"
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fltk fork()
+	select BR2_PACKAGE_FLTK
+
+	help
+	  Dillo is a multi-platform graphical web browser known
+	  for its speed and small footprint. 
+
+	  Enable jpeg and png packages to gain full feature image
+	  support.
+
+	  Enable openssl package to gain https support.
+
+	  http://www.dillo.org
+
+comment "dillo needs a toolchain w/ C++"
+        depends on BR2_PACKAGE_XORG7 && BR2_USE_MMU
+        depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/dillo/dillo.mk b/package/dillo/dillo.mk
new file mode 100644
index 0000000..f15a02a
--- /dev/null
+++ b/package/dillo/dillo.mk
@@ -0,0 +1,51 @@
+################################################################################
+#
+# dillo
+#
+################################################################################
+
+DILLO_VERSION = 3.0.4
+DILLO_SOURCE = dillo-$(DILLO_VERSION).tar.bz2
+DILLO_SITE = http://www.dillo.org/download
+DILLO_LICENSE = GPLv3+
+DILLO_LICENSE_FILES = COPYING
+
+DILLO_DEPENDENCIES = fltk
+
+# set additional path for fltk-config and libpng-config
+DILLO_CONF_ENV = PATH=$(STAGING_DIR)/usr/bin:$(BR_PATH)
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+	DILLO_CONF_OPT += --enable-ssl
+	DILLO_DEPENDENCIES += openssl
+else
+	DILLO_CONF_OPT += --disable-ssl
+endif
+
+ifeq ($(BR2_INET_IPV6),y)
+	DILLO_CONF_OPT += --enable-ipv6
+else
+	DILLO_CONF_OPT += --disable-ipv6
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+	DILLO_CONF_OPT += --enable-png
+	DILLO_DEPENDENCIES += libpng
+else
+	DILLO_CONF_OPT += --disable-png
+endif
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+	DILLO_CONF_OPT += --enable-jpeg
+	DILLO_DEPENDENCIES += libjpeg
+else
+	DILLO_CONF_OPT += --disable-jpeg
+endif
+
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+	DILLO_CONF_OPT += --enable-threaded-dns
+else
+	DILLO_CONF_OPT += --disable-threaded-dns
+endif
+
+$(eval $(autotools-package))
-- 
1.8.1.4
