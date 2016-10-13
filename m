From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Oct 2016 22:13:59 -0300
Subject: [Buildroot] [PATCH 8/8] evince: new package
In-Reply-To: <1476321239-13894-1-git-send-email-gustavo@zacarias.com.ar>
References: <1476321239-13894-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1476321239-13894-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To see nice PDFs and other documents.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in          |  1 +
 package/evince/Config.in   | 20 ++++++++++++
 package/evince/evince.hash |  2 ++
 package/evince/evince.mk   | 76 ++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 99 insertions(+)
 create mode 100644 package/evince/Config.in
 create mode 100644 package/evince/evince.hash
 create mode 100644 package/evince/evince.mk

diff --git a/package/Config.in b/package/Config.in
index cf8552e..5871f50 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -233,6 +233,7 @@ endmenu
 menu "Graphic libraries and applications (graphic/text)"
 
 comment "Graphic applications"
+	source "package/evince/Config.in"
 	source "package/expedite/Config.in"
 	source "package/fswebcam/Config.in"
 	source "package/glmark2/Config.in"
diff --git a/package/evince/Config.in b/package/evince/Config.in
new file mode 100644
index 0000000..b0a7351
--- /dev/null
+++ b/package/evince/Config.in
@@ -0,0 +1,20 @@
+comment "evince needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_EVINCE
+	bool "evince"
+	select BR2_PACKAGE_ADWAITA_ICON_THEME
+	select BR2_PACKAGE_GSETTINGS_DESKTOP_SCHEMAS
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_SHARED_MIME_INFO
+	select BR2_PACKAGE_ZLIB
+	depends on BR2_USE_WCHAR # gettext
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_LIBGTK3
+	help
+	  Evince is a document viewer for multiple document formats.
+
+	  https://wiki.gnome.org/Apps/Evince
diff --git a/package/evince/evince.hash b/package/evince/evince.hash
new file mode 100644
index 0000000..5dc103d
--- /dev/null
+++ b/package/evince/evince.hash
@@ -0,0 +1,2 @@
+# From http://ftp.acc.umu.se/pub/gnome/sources/evince/3.22/evince-3.22.1.sha256sum
+sha256	f3d439db3b5a5745d26175d615a71dffa1535235b1e3aa0b85d397ea33ab231c	evince-3.22.1.tar.xz
diff --git a/package/evince/evince.mk b/package/evince/evince.mk
new file mode 100644
index 0000000..571182e
--- /dev/null
+++ b/package/evince/evince.mk
@@ -0,0 +1,76 @@
+################################################################################
+#
+# evince
+#
+################################################################################
+
+
+EVINCE_VERSION_MAJOR = 3.22
+EVINCE_VERSION = $(EVINCE_VERSION_MAJOR).1
+EVINCE_SOURCE = evince-$(EVINCE_VERSION).tar.xz
+EVINCE_SITE = http://ftp.gnome.org/pub/gnome/sources/evince/$(EVINCE_VERSION_MAJOR)
+# Required for gschema build
+EVINCE_INSTALL_STAGING = YES
+EVINCE_DEPENDENCIES = \
+	host-intltool \
+	host-itstool \
+	host-pkgconf \
+	adwaita-icon-theme \
+	gsettings-desktop-schemas \
+	libglib2 \
+	libgtk3 \
+	shared-mime-info \
+	zlib
+
+# previewer and thumbnailer can be built but aren't very useful
+# without nautilus or a similarly-capable desktop/file manager
+EVINCE_CONF_OPTS = \
+	--disable-browser-plugin \
+	--disable-djvu \
+	--disable-dvi \
+	--disable-libgnome-desktop \
+	--disable-nautilus \
+	--disable-previewer \
+	--disable-ps \
+	--disable-thumbnailer \
+	--disable-xps \
+	--enable-introspection=no
+EVINCE_LICENSE = GPLv2+
+EVINCE_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_PACKAGE_DBUS),y)
+EVINCE_CONF_OPTS += --enable-dbus
+EVINCE_DEPENDENCIES += dbus
+else
+EVINCE_CONF_OPTS += --disable-dbus
+endif
+
+ifeq ($(BR2_PACKAGE_GSTREAMER1)$(BR2_PACKAGE_GST1_PLUGINS_BASE),yy)
+EVINCE_CONF_OPTS += --enable-multimedia
+EVINCE_DEPENDENCIES += gstreamer1 gst1-plugins-base
+else
+EVINCE_CONF_OPTS += --disable-multimedia
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSECRET),y)
+EVINCE_CONF_OPTS += --with-keyring
+EVINCE_DEPENDENCIES += libsecret
+else
+EVINCE_CONF_OPTS += --without-keyring
+endif
+
+ifeq ($(BR2_PACKAGE_TIFF),y)
+EVINCE_CONF_OPTS += --enable-tiff
+EVINCE_DEPENDENCIES += tiff
+else
+EVINCE_CONF_OPTS += --disable-tiff
+endif
+
+ifeq ($(BR2_PACKAGE_POPPLER),y)
+EVINCE_CONF_OPTS += --enable-pdf
+EVINCE_DEPENDENCIES += poppler
+else
+EVINCE_CONF_OPTS += --disable-pdf
+endif
+
+$(eval $(autotools-package))
-- 
2.7.3
