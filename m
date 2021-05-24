From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 19:31:40 +0200
Subject: [Buildroot] [git commit branch/next] package/libsoup: bump to
 version 2.72.0
Message-ID: <20210524170355.45267815C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e5f7f1cfc8fd7a9d5270f6a9707eb9eecfd21da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Among other fixes, switching to the current stable version plugs a few
memory leaks; solves many WebSocket bugs; makes NTLM authentication work;
allows building gobject-introspection data when cross-building (to be
enabled in a separate patch); fixes message cancellation; adds support
for HTTP 308 permanent redirects, same-site cookies, secure cookies,
HSTS, and Brotli compression.

This also removes the unneeded LIBSOUP_CONF_ENV which defined an
autoconf variable, and updates the Meson build configuration options
to follow the changes done by upstream.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
[yann.morin.1998 at free.fr:
  - reorder options and move them one per line
  - while at it, do the same for dependencies
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libsoup/libsoup.hash |  4 ++--
 package/libsoup/libsoup.mk   | 35 +++++++++++++++++++++++++++--------
 2 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/package/libsoup/libsoup.hash b/package/libsoup/libsoup.hash
index 3b9009884d..01bf419563 100644
--- a/package/libsoup/libsoup.hash
+++ b/package/libsoup/libsoup.hash
@@ -1,4 +1,4 @@
-# From https://ftp.gnome.org/pub/GNOME/sources/libsoup/2.66/libsoup-2.66.5.sha256sum
-sha256  ee43be1485bd95b686236b1e0043ec6edb761a538616c9c63004d7d1979bb139  libsoup-2.66.5.tar.xz
+# From https://ftp.gnome.org/pub/GNOME/sources/libsoup/2.72/libsoup-2.72.0.sha256sum
+sha256  170c3f8446b0f65f8e4b93603349172b1085fb8917c181d10962f02bb85f5387  libsoup-2.72.0.tar.xz
 # Locally calculated
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 1617940c8f..6711326711 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -4,24 +4,43 @@
 #
 ################################################################################
 
-LIBSOUP_VERSION_MAJOR = 2.66
-LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).5
+LIBSOUP_VERSION_MAJOR = 2.72
+LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).0
 LIBSOUP_SOURCE = libsoup-$(LIBSOUP_VERSION).tar.xz
 LIBSOUP_SITE = http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_VERSION_MAJOR)
 LIBSOUP_LICENSE = LGPL-2.0+
 LIBSOUP_LICENSE_FILES = COPYING
 LIBSOUP_CPE_ID_VENDOR = gnome
 LIBSOUP_INSTALL_STAGING = YES
-LIBSOUP_CONF_ENV = ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY)
-LIBSOUP_CONF_OPTS = -Dtests=false -Dvapi=false -Dgssapi=false
-LIBSOUP_DEPENDENCIES = host-pkgconf host-libglib2 \
-	libglib2 libpsl libxml2 sqlite host-intltool
+LIBSOUP_DEPENDENCIES = \
+	host-intltool \
+	host-libglib2 \
+	host-pkgconf \
+	libglib2 \
+	libpsl \
+	libxml2 \
+	sqlite
+
+LIBSOUP_CONF_OPTS = \
+	-Dgssapi=disabled \
+	-Dgtk_doc=false \
+	-Dntlm=disabled \
+	-Dsysprof=disabled \
+	-Dtests=false \
+	-Dvapi=disabled
+
+ifeq ($(BR2_PACKAGE_BROTLI),y)
+LIBSOUP_CONF_OPTS += -Dbrotli=enabled
+LIBSOUP_DEPENDENCIES += brotli
+else
+LIBSOUP_CONF_OPTS += -Dbrotli=disabled
+endif
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-LIBSOUP_CONF_OPTS += -Dintrospection=true
+LIBSOUP_CONF_OPTS += -Dintrospection=enabled
 LIBSOUP_DEPENDENCIES += gobject-introspection
 else
-LIBSOUP_CONF_OPTS += -Dintrospection=false
+LIBSOUP_CONF_OPTS += -Dintrospection=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSOUP_GNOME),y)
