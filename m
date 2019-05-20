From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 May 2019 21:26:28 +0200
Subject: [Buildroot] [git commit] package/libepoxy: update to version 1.5.3,
 convert to Meson
Message-ID: <20190602201235.26E5C8EDA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e1976e8760d7421cc10b506aeb19eedc202baf0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This release fixes building with uClibc and symbol lookups for
drivers which have GLES 3.x support.

Tarballs do not include a generated "configure" script any more,
so use Meson to configure the build instead.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libepoxy/libepoxy.hash |  4 ++--
 package/libepoxy/libepoxy.mk   | 13 +++++++------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/libepoxy/libepoxy.hash b/package/libepoxy/libepoxy.hash
index dd1b13487b..d574a04455 100644
--- a/package/libepoxy/libepoxy.hash
+++ b/package/libepoxy/libepoxy.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/libepoxy/1.5/libepoxy-1.5.2.sha256sum
-sha256 a9562386519eb3fd7f03209f279f697a8cba520d3c155d6e253c3e138beca7d8  libepoxy-1.5.2.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/libepoxy/1.5/libepoxy-1.5.3.sha256sum
+sha256 002958c5528321edd53440235d3c44e71b5b1e09b9177e8daf677450b6c4433d  libepoxy-1.5.3.tar.xz
 
 # Hashes for license files:
 sha256 8d5144666f9c4df9bbd69b8900086d5979259152a1060421cdcc0fb9061a1c12  COPYING
diff --git a/package/libepoxy/libepoxy.mk b/package/libepoxy/libepoxy.mk
index b1731a22c5..deb3c1ecbb 100644
--- a/package/libepoxy/libepoxy.mk
+++ b/package/libepoxy/libepoxy.mk
@@ -5,26 +5,27 @@
 ################################################################################
 
 LIBEPOXY_VERSION_MAJOR = 1.5
-LIBEPOXY_VERSION = $(LIBEPOXY_VERSION_MAJOR).2
+LIBEPOXY_VERSION = $(LIBEPOXY_VERSION_MAJOR).3
 LIBEPOXY_SITE = http://ftp.gnome.org/pub/gnome/sources/libepoxy/$(LIBEPOXY_VERSION_MAJOR)
 LIBEPOXY_SOURCE = libepoxy-$(LIBEPOXY_VERSION).tar.xz
 LIBEPOXY_INSTALL_STAGING = YES
 LIBEPOXY_DEPENDENCIES = host-pkgconf xutil_util-macros
 LIBEPOXY_LICENSE = MIT
 LIBEPOXY_LICENSE_FILES = COPYING
+LIBEPOXY_CONF_OPTS += -Ddocs=false -Dtests=false
 
 ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
-LIBEPOXY_CONF_OPTS += --enable-egl
+LIBEPOXY_CONF_OPTS += -Degl=yes
 LIBEPOXY_DEPENDENCIES += libegl
 else
-LIBEPOXY_CONF_OPTS += --disable-egl
+LIBEPOXY_CONF_OPTS += -Degl=no
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_XLIB_LIBX11),yy)
-LIBEPOXY_CONF_OPTS += --enable-glx
+LIBEPOXY_CONF_OPTS += -Dglx=yes -Dx11=true
 LIBEPOXY_DEPENDENCIES += libgl xlib_libX11
 else
-LIBEPOXY_CONF_OPTS += --disable-glx
+LIBEPOXY_CONF_OPTS += -Dglx=no -Dx11=false
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
