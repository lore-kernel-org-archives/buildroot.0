From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:19 +0200
Subject: [Buildroot] [RFC 09/37] package/efl: new host-package
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-10-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new host-package provide edje_cc, embryo_cc and eet binaries
that will be used by efl packages which will be updated later.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/efl/efl.hash |  2 ++
 package/efl/efl.mk   | 74 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 package/efl/efl.hash
 create mode 100644 package/efl/efl.mk

diff --git a/package/efl/efl.hash b/package/efl/efl.hash
new file mode 100644
index 0000000..93398fe
--- /dev/null
+++ b/package/efl/efl.hash
@@ -0,0 +1,2 @@
+# From https://download.enlightenment.org/rel/libs/efl/efl-1.14.2.tar.xz.sha256
+sha256	b95955ab82d144b6b88ba37448e87ca4608855f75115231bf9014b3acc0ee54d	efl-1.14.2.tar.xz
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
new file mode 100644
index 0000000..9e6ea2a
--- /dev/null
+++ b/package/efl/efl.mk
@@ -0,0 +1,74 @@
+################################################################################
+#
+# efl
+#
+################################################################################
+
+EFL_VERSION = 1.14.2
+EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
+EFL_SITE = http://download.enlightenment.org/rel/libs/efl/
+EFL_LICENSE = BSD-2c, LGPLv2.1+, GPLv2+
+EFL_LICENSE_FILES = COPYING
+
+################################################################################
+#
+# host-efl
+#
+################################################################################
+
+# We want to build only some host tools used later in the build.
+# Actually we want: edje_cc, embryo_cc and eet.
+
+# Host dependencies:
+# * host-dbus: for Eldbus
+# * host-freetype: for libevas
+# * host-libglib2: for libecore
+# * host-libjpeg, host-libpng: for libevas image loader
+# * host-lua: disable luajit dependency
+HOST_EFL_DEPENDENCIES = \
+	host-pkgconf \
+	host-dbus \
+	host-freetype \
+	host-libglib2 \
+	host-libjpeg \
+	host-libpng \
+	host-lua \
+	host-zlib
+
+# Configure options:
+# --disable-audio, --disable-multisense remove libsndfile dependency.
+# --disable-cxx-bindings: disable C++11 bindings.
+# --disable-fontconfig: remove dependency on fontconfig.
+# --disable-fribidi: remove dependency on libfribidi.
+# --disable-gstreamer1: remove dependency on gtreamer 1.0.
+# --disable-libeeze: remove libudev dependency.
+# --disable-libmount: remove dependency on host-util-linux libmount.
+# --disable-physics: remove Bullet dependency.
+# --enable-image-loader-gif=no: disable Gif dependency.
+# --enable-image-loader-tiff=no: disable Tiff dependency.
+# --enable-lua-old: disable Elua and remove luajit dependency.
+# --with-crypto=none: remove dependencies on openssl or gnutls.
+# --with-x11=none: remove dependency on X.org.
+#   Yes I really know what I am doing.
+HOST_EFL_CONF_OPTS += \
+	--disable-audio \
+	--disable-cxx-bindings \
+	--disable-fontconfig \
+	--disable-fribidi \
+	--disable-gstreamer1 \
+	--disable-libeeze \
+	--disable-libmount \
+	--disable-multisense \
+	--disable-physics \
+	--enable-image-loader-gif=no \
+	--enable-image-loader-jpeg=yes \
+	--enable-image-loader-png=yes \
+	--enable-image-loader-tiff=no \
+	--enable-lua-old \
+	--with-crypto=none \
+	--with-glib=yes \
+	--with-opengl=none \
+	--with-x11=none \
+	--enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-aba
+
+$(eval $(host-autotools-package))
-- 
2.4.3
