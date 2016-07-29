From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 29 Jul 2016 09:51:29 +0200
Subject: [Buildroot] [PATCH 2/2] gupnp-tools: new package
In-Reply-To: <1469778689-31893-1-git-send-email-fabrice.fontaine@orange.com>
References: <1469778689-31893-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <1469778689-31893-2-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GUPnP Tools are free replacements of Intel UPnP tools that use
GUPnP. They provides client and server side tools which enable
one to easily test and debug one's UPnP devices and control
points.

http://www.gupnp.org/

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 package/Config.in                    |  1 +
 package/gupnp-tools/Config.in        | 34 ++++++++++++++++++++++++++++++++++
 package/gupnp-tools/gupnp-tools.hash |  2 ++
 package/gupnp-tools/gupnp-tools.mk   | 35 +++++++++++++++++++++++++++++++++++
 4 files changed, 72 insertions(+)
 create mode 100644 package/gupnp-tools/Config.in
 create mode 100644 package/gupnp-tools/gupnp-tools.hash
 create mode 100644 package/gupnp-tools/gupnp-tools.mk

diff --git a/package/Config.in b/package/Config.in
index cf1d54e..ee7ba39 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -134,6 +134,7 @@ menu "Development tools"
 	source "package/gperf/Config.in"
 	source "package/grep/Config.in"
 	source "package/gtksourceview/Config.in"
+	source "package/gupnp-tools/Config.in"
 	source "package/intltool/Config.in"
 	source "package/jq/Config.in"
 	source "package/libtool/Config.in"
diff --git a/package/gupnp-tools/Config.in b/package/gupnp-tools/Config.in
new file mode 100644
index 0000000..769ab6d
--- /dev/null
+++ b/package/gupnp-tools/Config.in
@@ -0,0 +1,34 @@
+config BR2_PACKAGE_GUPNP_TOOLS
+	bool "gupnp-tools"
+	depends on BR2_USE_WCHAR # glib2, gupnp
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, gupnp
+	depends on BR2_USE_MMU # glib2, gupnp
+	depends on BR2_INSTALL_LIBSTDCPP # libgtk3
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk3
+	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL || \
+		BR2_PACKAGE_HAS_LIBGL # libgtk3
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_GSSDP
+	select BR2_PACKAGE_GUPNP
+	select BR2_PACKAGE_LIBSOUP
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBGTK3
+	help
+	  GUPnP Tools are free replacements of Intel UPnP tools that use
+	  GUPnP. They provides client and server side tools which enable
+	  one to easily test and debug one's UPnP devices and control
+	  points.
+
+	  http://www.gupnp.org/
+
+comment "gupnp-tools needs a toolchain w/ wchar, threads, C++"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP
+
+comment "gupnp-tools needs an OpenGL or OpenGL EGL backend provided by mesa3d"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL && \
+		!BR2_PACKAGE_HAS_LIBGL
diff --git a/package/gupnp-tools/gupnp-tools.hash b/package/gupnp-tools/gupnp-tools.hash
new file mode 100644
index 0000000..0d37a87
--- /dev/null
+++ b/package/gupnp-tools/gupnp-tools.hash
@@ -0,0 +1,2 @@
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/0.8/gupnp-tools-0.8.12.sha256sum:
+sha256	658de96953608c4b1f47578ae563a7066d1f1983565daf22ad52b7b328ef97b1	gupnp-tools-0.8.12.tar.xz
diff --git a/package/gupnp-tools/gupnp-tools.mk b/package/gupnp-tools/gupnp-tools.mk
new file mode 100644
index 0000000..5ce2c81
--- /dev/null
+++ b/package/gupnp-tools/gupnp-tools.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# gupnp-tools
+#
+################################################################################
+
+GUPNP_TOOLS_VERSION_MAJOR = 0.8
+GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).12
+GUPNP_TOOLS_SOURCE = gupnp-tools-$(GUPNP_TOOLS_VERSION).tar.xz
+GUPNP_TOOLS_SITE = \
+	http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/$(GUPNP_TOOLS_VERSION_MAJOR)
+GUPNP_TOOLS_LICENSE = LGPLv2+
+GUPNP_TOOLS_LICENSE_FILES = COPYING
+GUPNP_TOOLS_INSTALL_STAGING = YES
+GUPNP_TOOLS_DEPENDENCIES = \
+	host-pkgconf \
+	libglib2 \
+	libxml2 \
+	gssdp \
+	gupnp \
+	libsoup \
+	libgtk3
+
+ifeq ($(BR2_PACKAGE_GUPNP_AV),y)
+GUPNP_TOOLS_CONF_OPTS += --with-av
+GUPNP_TOOLS_DEPENDENCIES += gupnp-av
+else
+GUPNP_TOOLS_CONF_OPTS += --without-av
+endif
+
+ifeq ($(BR2_PACKAGE_GTKSOURCEVIEW),y)
+GUPNP_TOOLS_DEPENDENCIES += gtksourceview
+endif
+
+$(eval $(autotools-package))
-- 
2.7.4
