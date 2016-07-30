From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 15:36:22 +0200
Subject: [Buildroot] [git commit] gupnp-dlna: new package
Message-ID: <20160730133642.F27488181F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=095153bf76c0632d32374838f5ae4f3170a6fcf7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GUPnP DLNA is a small utility library that aims to ease the
DLNA-related tasks such as media profile guessing, transcoding
to a given profile, etc.

http://www.gupnp.org/

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                  |  1 +
 package/gupnp-dlna/Config.in       | 17 +++++++++++++++++
 package/gupnp-dlna/gupnp-dlna.hash |  2 ++
 package/gupnp-dlna/gupnp-dlna.mk   | 32 ++++++++++++++++++++++++++++++++
 4 files changed, 52 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 27b934a..f11ea9f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1165,6 +1165,7 @@ menu "Networking"
 	source "package/gssdp/Config.in"
 	source "package/gupnp/Config.in"
 	source "package/gupnp-av/Config.in"
+	source "package/gupnp-dlna/Config.in"
 	source "package/ibrcommon/Config.in"
 	source "package/ibrdtn/Config.in"
 	source "package/libcgi/Config.in"
diff --git a/package/gupnp-dlna/Config.in b/package/gupnp-dlna/Config.in
new file mode 100644
index 0000000..a0ecdb3
--- /dev/null
+++ b/package/gupnp-dlna/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_GUPNP_DLNA
+	bool "gupnp-dlna"
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBXML2
+	help
+	  GUPnP DLNA is a small utility library that aims to ease the
+	  DLNA-related tasks such as media profile guessing, transcoding
+	  to a given profile, etc.
+
+	  http://www.gupnp.org/
+
+comment "gupnp-dlna needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gupnp-dlna/gupnp-dlna.hash b/package/gupnp-dlna/gupnp-dlna.hash
new file mode 100644
index 0000000..c28a06f
--- /dev/null
+++ b/package/gupnp-dlna/gupnp-dlna.hash
@@ -0,0 +1,2 @@
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-dlna/0.10/gupnp-dlna-0.10.5.sha256sum:
+sha256	123e368227c11d5c17fc1aa76cbdaffa345355eb51d172cd39fc74a5b468ff6a	gupnp-dlna-0.10.5.tar.xz
diff --git a/package/gupnp-dlna/gupnp-dlna.mk b/package/gupnp-dlna/gupnp-dlna.mk
new file mode 100644
index 0000000..58b5735
--- /dev/null
+++ b/package/gupnp-dlna/gupnp-dlna.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# gupnp-dlna
+#
+################################################################################
+
+GUPNP_DLNA_VERSION_MAJOR = 0.10
+GUPNP_DLNA_VERSION = $(GUPNP_DLNA_VERSION_MAJOR).5
+GUPNP_DLNA_SOURCE = gupnp-dlna-$(GUPNP_DLNA_VERSION).tar.xz
+GUPNP_DLNA_SITE = \
+	http://ftp.gnome.org/pub/gnome/sources/gupnp-dlna/$(GUPNP_DLNA_VERSION_MAJOR)
+# COPYING contains LGPLv2.1 but all source files contain LPGLv2+
+GUPNP_DLNA_LICENSE = LGPLv2+
+GUPNP_DLNA_LICENSE_FILES = COPYING
+GUPNP_DLNA_INSTALL_STAGING = YES
+GUPNP_DLNA_DEPENDENCIES = host-pkgconf libglib2 libxml2
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
+GUPNP_DLNA_CONF_OPTS += --enable-legacy-gstreamer-metadata-backend
+GUPNP_DLNA_DEPENDENCIES += gstreamer gst-plugins-base
+else
+GUPNP_DLNA_CONF_OPTS += --disable-legacy-gstreamer-metadata-backend
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
+GUPNP_DLNA_CONF_OPTS += --enable-gstreamer-metadata-backend
+GUPNP_DLNA_DEPENDENCIES += gstreamer1 gst1-plugins-base
+else
+GUPNP_DLNA_CONF_OPTS += --disable-gstreamer-metadata-backend
+endif
+
+$(eval $(autotools-package))
