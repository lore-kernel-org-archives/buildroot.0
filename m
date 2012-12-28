From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Dec 2012 20:42:11 +0100
Subject: [Buildroot] [PATCH 18/20] efl/libevas-generic-loaders: new package
In-Reply-To: <cover.1356723702.git.thomas.petazzoni@free-electrons.com>
References: <cover.1356723702.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4d62ce0cef37f3a2b4a9e8f445c7e231016b245e.1356723702.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/Config.in                              |    1 +
 package/efl/libevas-generic-loaders/Config.in      |   21 +++++++++++++
 .../libevas-generic-loaders.mk                     |   31 ++++++++++++++++++++
 3 files changed, 53 insertions(+)
 create mode 100644 package/efl/libevas-generic-loaders/Config.in
 create mode 100644 package/efl/libevas-generic-loaders/libevas-generic-loaders.mk

diff --git a/package/efl/Config.in b/package/efl/Config.in
index a526d87..bb1a986 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -15,6 +15,7 @@ source "package/efl/libeet/Config.in"
 source "package/efl/libefreet/Config.in"
 source "package/efl/libeio/Config.in"
 source "package/efl/libevas/Config.in"
+source "package/efl/libevas-generic-loaders/Config.in"
 source "package/efl/libembryo/Config.in"
 source "package/efl/libedje/Config.in"
 source "package/efl/libethumb/Config.in"
diff --git a/package/efl/libevas-generic-loaders/Config.in b/package/efl/libevas-generic-loaders/Config.in
new file mode 100644
index 0000000..44bc37d
--- /dev/null
+++ b/package/efl/libevas-generic-loaders/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
+	bool "libevas generic loaders"
+	select BR2_PACKAGE_LIBEINA
+	help
+	  These are additional "generic" loaders for Evas that are
+	  stand-alone executables that evas may run from its generic
+	  loader module.
+
+	  http://trac.enlightenment.org/e/wiki/Evas_Generic_Loaders
+
+if BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
+
+config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
+	bool "SVG loader"
+	select BR2_PACKAGE_LIBRSVG
+	select BR2_PACKAGE_CAIRO
+	depends on BR2_USE_WCHAR # librsvg -> glib2
+	help
+	  This option enables the Evas generic SVG loader
+
+endif
diff --git a/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk b/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
new file mode 100644
index 0000000..76236b1
--- /dev/null
+++ b/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
@@ -0,0 +1,31 @@
+#############################################################
+#
+# libevas-generic-loaders
+#
+#############################################################
+
+LIBEVAS_GENERIC_LOADERS_VERSION = 1.7.4
+LIBEVAS_GENERIC_LOADERS_SOURCE = evas_generic_loaders-$(LIBEVAS_GENERIC_LOADERS_VERSION).tar.bz2
+LIBEVAS_GENERIC_LOADERS_SITE = http://download.enlightenment.org/releases/
+LIBEVAS_GENERIC_LOADERS_LICENSE = GPLv2
+LIBEVAS_GENERIC_LOADERS_LICENSE_FILES = COPYING
+
+LIBEVAS_GENERIC_LOADERS_INSTALL_STAGING = YES
+
+LIBEVAS_GENERIC_LOADERS_DEPENDENCIES = libeina
+
+# For now, we only support the SVG loader
+LIBEVAS_GENERIC_LOADERS_CONF_OPT += \
+	--disable-poppler \
+	--disable-spectre \
+	--disable-libraw \
+	--disable-gstreamer
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG),y)
+LIBEVAS_GENERIC_LOADERS_DEPENDENCIES += librsvg cairo
+LIBEVAS_GENERIC_LOADERS_CONF_OPT += --enable-svg
+else
+LIBEVAS_GENERIC_LOADERS_CONF_OPT += --disable-svg
+endif
+
+$(eval $(autotools-package))
-- 
1.7.9.5
