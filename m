From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 28 Jun 2015 21:42:47 +0200
Subject: [Buildroot] [RFC v4 13/16] package/pkgconf: use GCC_SYSROOT to
	support pps feature
In-Reply-To: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1435520570-20332-14-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to support the per-package staging feature, use the GCC_SYSROOT
environment variable to find *.pc files in the per-package staging
directory.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/aiccu/aiccu.mk                 |  2 +-
 package/fbv/fbv.mk                     |  2 +-
 package/gdk-pixbuf/gdk-pixbuf.mk       |  2 +-
 package/libmicrohttpd/libmicrohttpd.mk |  2 +-
 package/libupnpp/libupnpp.mk           |  2 +-
 package/lmbench/lmbench.mk             |  4 ++--
 package/logrotate/logrotate.mk         |  2 +-
 package/madplay/madplay.mk             |  2 +-
 package/mpg123/mpg123.mk               |  2 +-
 package/neardal/neardal.mk             |  2 +-
 package/nmap/nmap.mk                   |  2 +-
 package/openldap/openldap.mk           |  2 +-
 package/php/php.mk                     |  4 ++--
 package/pkgconf/pkg-config.in          |  4 +++-
 package/pkgconf/pkgconf.mk             |  5 ++---
 package/poppler/poppler.mk             |  2 +-
 package/qt/qt.mk                       | 12 ++++++------
 package/ti-utils/ti-utils.mk           |  4 ++--
 package/upmpdcli/upmpdcli.mk           |  2 +-
 package/vsftpd/vsftpd.mk               |  2 +-
 20 files changed, 31 insertions(+), 30 deletions(-)

diff --git a/package/aiccu/aiccu.mk b/package/aiccu/aiccu.mk
index f2cd3de..b906b63 100644
--- a/package/aiccu/aiccu.mk
+++ b/package/aiccu/aiccu.mk
@@ -16,7 +16,7 @@ AICCU_LFDLAGS = $(TARGET_LDFLAGS)
 # aiccu forgets to link with gnutls' dependencies breaking the build when
 # linking statically
 ifeq ($(BR2_STATIC_LIBS),y)
-AICCU_LDFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --static --libs gnutls)
+AICCU_LDFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY_GCC_SYSROOT) --static --libs gnutls)
 endif
 
 # dummy RPM_OPT_FLAGS to disable stripping
diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
index 8788b0e..993125d 100644
--- a/package/fbv/fbv.mk
+++ b/package/fbv/fbv.mk
@@ -18,7 +18,7 @@ FBV_DEPENDENCIES += libpng
 
 # libpng in turn depends on other libraries
 ifeq ($(BR2_STATIC_LIBS),y)
-FBV_CONFIGURE_OPTS += "--libs=$(shell $(PKG_CONFIG_HOST_BINARY) --libs libpng --static)"
+FBV_CONFIGURE_OPTS += "--libs=$(shell $(PKG_CONFIG_HOST_BINARY_GCC_SYSROOT) --libs libpng --static)"
 endif
 
 else
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index eb30215..c408170 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -35,7 +35,7 @@ GDK_PIXBUF_CONF_OPTS += --without-libtiff
 else
 GDK_PIXBUF_DEPENDENCIES += tiff host-pkgconf
 GDK_PIXBUF_CONF_ENV += \
-	LIBS='$(shell $(PKG_CONFIG_HOST_BINARY) --libs libtiff-4)'
+	LIBS='$(shell $(PKG_CONFIG_HOST_BINARY_GCC_SYSROOT) --libs libtiff-4)'
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index a6662a7..ebaf248 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -13,7 +13,7 @@ LIBMICROHTTPD_CONF_OPTS = --disable-curl --disable-spdy --disable-examples
 ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
 LIBMICROHTTPD_LICENSE = LGPLv2.1+
 LIBMICROHTTPD_DEPENDENCIES += host-pkgconf gnutls libgcrypt
-LIBMICROHTTPD_CONF_ENV += LIBS="$(shell $(PKG_CONFIG_HOST_BINARY) --libs gnutls)"
+LIBMICROHTTPD_CONF_ENV += LIBS="$(shell $(PKG_CONFIG_HOST_BINARY_GCC_SYSROOT) --libs gnutls)"
 LIBMICROHTTPD_CONF_OPTS += --enable-https --with-gnutls=$(STAGING_DIR)/usr \
 	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
 else
diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index defc16a..3960c2b 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -16,7 +16,7 @@ LIBUPNPP_DEPENDENCIES = expat libcurl libupnp
 ifeq ($(BR2_STATIC_LIBS),y)
 LIBUPNPP_DEPENDENCIES += host-pkgconf
 LIBUPNPP_CONF_ENV += \
-	LIBS='$(shell $(PKG_CONFIG_HOST_BINARY) --libs libupnp libcurl)'
+	LIBS='$(shell $(PKG_CONFIG_HOST_BINARY_GCC_SYSROOT) --libs libupnp libcurl)'
 endif
 
 $(eval $(autotools-package))
diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index d4be8d4..92ea257 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -14,8 +14,8 @@ LMBENCH_CFLAGS = $(TARGET_CFLAGS)
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 LMBENCH_DEPENDENCIES += host-pkgconf libtirpc
-LMBENCH_CFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags libtirpc)
-LMBENCH_LDLIBS = $(shell $(PKG_CONFIG_HOST_BINARY) --libs libtirpc)
+LMBENCH_CFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY_GCC_SYSROOT) --cflags libtirpc)
+LMBENCH_LDLIBS = $(shell $(PKG_CONFIG_HOST_BINARY_GCC_SYSROOT) --libs libtirpc)
 endif
 
 define LMBENCH_CONFIGURE_CMDS
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index 0af7f4a..7cfb7a1 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -11,7 +11,7 @@ LOGROTATE_LICENSE_FILES = COPYING
 LOGROTATE_DEPENDENCIES = popt host-pkgconf
 # tarball does not have a generated configure script
 LOGROTATE_AUTORECONF = YES
-LOGROTATE_CONF_ENV = LIBS="$(shell $(PKG_CONFIG_HOST_BINARY) --libs popt)"
+LOGROTATE_CONF_ENV = LIBS="$(shell $(PKG_CONFIG_HOST_BINARY_GCC_SYSROOT) --libs popt)"
 LOGROTATE_CONF_OPTS = --without-selinux
 
 ifeq ($(BR2_PACKAGE_ACL),y)
diff --git a/package/madplay/madplay.mk b/package/madplay/madplay.mk
index ff12aa1..c39d0e8 100644
--- a/package/madplay/madplay.mk
+++ b/package/madplay/madplay.mk
@@ -16,7 +16,7 @@ MADPLAY_DEPENDENCIES = libmad libid3tag $(if $(BR2_PACKAGE_GETTEXT),gettext)
 ifeq ($(BR2_PACKAGE_MADPLAY_ALSA),y)
 MADPLAY_CONF_OPTS += --with-alsa
 MADPLAY_DEPENDENCIES += host-pkgconf alsa-lib
-MADPLAY_CONF_ENV += LIBS="$(shell $(PKG_CONFIG_HOST_BINARY) --libs alsa)"
+MADPLAY_CONF_ENV += LIBS="$(shell $(PKG_CONFIG_HOST_BINARY_GCC_SYSROOT) --libs alsa)"
 endif
 
 $(eval $(autotools-package))
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index a16e400..f02ba9c 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -54,7 +54,7 @@ MPG123_CONF_OPTS += --with-default-audio=portaudio
 MPG123_DEPENDENCIES += portaudio
 # configure script does NOT use pkg-config to figure out how to link
 # with portaudio, breaking static linking as portaudio uses pthreads
-MPG123_CONF_ENV += LIBS='$(shell $(PKG_CONFIG_HOST_BINARY) --libs portaudio-2.0)'
+MPG123_CONF_ENV += LIBS='$(shell $(PKG_CONFIG_HOST_BINARY_GCC_SYSROOT) --libs portaudio-2.0)'
 endif
 
 ifeq ($(BR2_PACKAGE_SDL),y)
diff --git a/package/neardal/neardal.mk b/package/neardal/neardal.mk
index ddaecbe..1a7ec7f 100644
--- a/package/neardal/neardal.mk
+++ b/package/neardal/neardal.mk
@@ -25,7 +25,7 @@ endif
 # forgets to take that into account, causing the detection to fail
 # when linking statically
 ifeq ($(BR2_STATIC_LIBS),y)
-NEARDAL_CONF_ENV += LIBS='$(shell $(PKG_CONFIG_HOST_BINARY) --libs ncurses)'
+NEARDAL_CONF_ENV += LIBS='$(shell $(PKG_CONFIG_HOST_BINARY_GCC_SYSROOT) --libs ncurses)'
 endif
 
 define NEARDAL_INSTALL_NCL
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index d46d58b..35c6a82 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -30,7 +30,7 @@ NMAP_POST_PATCH_HOOKS += NMAP_WRAPPER_EXEC
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 NMAP_CONF_OPTS += --with-openssl="$(STAGING_DIR)/usr"
 NMAP_DEPENDENCIES += host-pkgconf openssl
-NMAP_LIBS_FOR_STATIC_LINK += $(shell $(PKG_CONFIG_HOST_BINARY) --libs --static openssl)
+NMAP_LIBS_FOR_STATIC_LINK += $(shell $(PKG_CONFIG_HOST_BINARY_GCC_SYSROOT) --libs --static openssl)
 else
 NMAP_CONF_OPTS += --without-openssl
 endif
diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index 68464ab..93facb4 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -31,7 +31,7 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 OPENLDAP_MP = bignum
 OPENLDAP_DEPENDENCIES += openssl
-OPENLDAP_CONF_ENV = LIBS="$(shell $(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto)"
+OPENLDAP_CONF_ENV = LIBS="$(shell $(PKG_CONFIG_HOST_BINARY_GCC_SYSROOT) --libs libssl libcrypto)"
 else ifeq ($(BR2_PACKAGE_GMP),y)
 OPENLDAP_MP = gmp
 OPENLDAP_DEPENDENCIES += gmp
diff --git a/package/php/php.mk b/package/php/php.mk
index c9bcfe3..f7c064c 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -116,7 +116,7 @@ PHP_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += openssl
 # openssl needs zlib, but the configure script forgets to link against
 # it causing detection failures with static linking
-PHP_STATIC_LIBS += $(shell $(PKG_CONFIG_HOST_BINARY) --libs --static openssl)
+PHP_STATIC_LIBS += $(shell $(PKG_CONFIG_HOST_BINARY_GCC_SYSROOT) --libs --static openssl)
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_LIBXML2),y)
@@ -187,7 +187,7 @@ endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE),y)
 PHP_CONF_OPTS += --with-sqlite3=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += sqlite
-PHP_STATIC_LIBS += $(shell $(PKG_CONFIG_HOST_BINARY) --libs --static sqlite3)
+PHP_STATIC_LIBS += $(shell $(PKG_CONFIG_HOST_BINARY_GCC_SYSROOT) --libs --static sqlite3)
 endif
 
 ### PDO
diff --git a/package/pkgconf/pkg-config.in b/package/pkgconf/pkg-config.in
index 4dec487..9e5408f 100644
--- a/package/pkgconf/pkg-config.in
+++ b/package/pkgconf/pkg-config.in
@@ -1,2 +1,4 @@
 #!/bin/sh
-PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:- at PKG_CONFIG_LIBDIR@} PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:- at STAGING_DIR@} $(dirname $0)/pkgconf @STATIC@ $@
+PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:-$GCC_SYSROOT/usr/lib/pkgconfig:$GCC_SYSROOT/usr/share/pkgconfig} \
+    PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:-$GCC_SYSROOT} \
+    $(dirname $0)/pkgconf @STATIC@ $@
diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index 3c93fd5..0c496be 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -11,6 +11,8 @@ PKGCONF_LICENSE = pkgconf license
 PKGCONF_LICENSE_FILES = COPYING
 
 PKG_CONFIG_HOST_BINARY = $(HOST_DIR)/usr/bin/pkg-config
+PKG_CONFIG_HOST_BINARY_GCC_SYSROOT = \
+	GCC_SYSROOT=$(STAGING_DIR) $(HOST_DIR)/usr/bin/pkg-config
 
 define PKGCONF_LINK_PKGCONFIG
 	ln -sf pkgconf $(TARGET_DIR)/usr/bin/pkg-config
@@ -19,9 +21,6 @@ endef
 define HOST_PKGCONF_INSTALL_WRAPPER
 	$(INSTALL) -m 0755 -D package/pkgconf/pkg-config.in \
 		$(HOST_DIR)/usr/bin/pkg-config
-	$(SED) 's, at PKG_CONFIG_LIBDIR@,$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig,' \
-		-e 's, at STAGING_DIR@,$(STAGING_DIR),' \
-		$(HOST_DIR)/usr/bin/pkg-config
 endef
 
 define HOST_PKGCONF_STATIC
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 234b7cc..c5ff161 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -24,7 +24,7 @@ ifeq ($(BR2_PACKAGE_TIFF),y)
 POPPLER_CONF_OPTS += --enable-libtiff
 # Help poppler to find libtiff in static linking scenarios
 POPPLER_CONF_ENV += \
-	LIBTIFF_LIBS="$(shell $(PKG_CONFIG_HOST_BINARY) --libs libtiff-4)"
+	LIBTIFF_LIBS="$(shell $(PKG_CONFIG_HOST_BINARY_GCC_SYSROOT) --libs libtiff-4)"
 POPPLER_DEPENDENCIES += tiff
 else
 POPPLER_CONF_OPTS += --disable-libtiff
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 0644fbe..3a9eda6 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -230,9 +230,9 @@ QT_DEPENDENCIES += fontconfig xlib_libXi xlib_libX11 xlib_libXrender \
                 xlib_libXcursor xlib_libXrandr xlib_libXext xlib_libXv
 # Using pkg-config avoids us some logic to redefine and sed again mkspecs files
 # to add X11 include path and link options
-QT_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags x11`
-QT_CXXFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags x11`
-QT_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --libs x11 xext`
+QT_CFLAGS += `$(PKG_CONFIG_HOST_BINARY_GCC_SYSROOT) --cflags x11`
+QT_CXXFLAGS += `$(PKG_CONFIG_HOST_BINARY_GCC_SYSROOT) --cflags x11`
+QT_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY_GCC_SYSROOT) --libs x11 xext`
 QT_CONFIGURE_OPTS += -arch $(QT_EMB_PLATFORM) \
 		-xplatform qws/linux-$(QT_EMB_PLATFORM)-g++ -x11 -no-gtkstyle -no-sm \
 		-no-openvg
@@ -329,9 +329,9 @@ endif
 ifeq ($(BR2_PACKAGE_QT_OPENGL_ES),y)
 QT_CONFIGURE_OPTS += -opengl es2 -egl
 QT_DEPENDENCIES += libgles libegl
-QT_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags egl`
-QT_CXXFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags egl`
-QT_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --libs egl`
+QT_CFLAGS += `$(PKG_CONFIG_HOST_BINARY_GCC_SYSROOT) --cflags egl`
+QT_CXXFLAGS += `$(PKG_CONFIG_HOST_BINARY_GCC_SYSROOT) --cflags egl`
+QT_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY_GCC_SYSROOT) --libs egl`
 else
 QT_CONFIGURE_OPTS += -no-opengl
 endif
diff --git a/package/ti-utils/ti-utils.mk b/package/ti-utils/ti-utils.mk
index 35ecc19..19d53fd 100644
--- a/package/ti-utils/ti-utils.mk
+++ b/package/ti-utils/ti-utils.mk
@@ -10,8 +10,8 @@ TI_UTILS_DEPENDENCIES = libnl host-pkgconf
 TI_UTILS_LICENSE = BSD-3c
 TI_UTILS_LICENSE_FILES = COPYING
 
-TI_UTILS_CFLAGS = $(shell $(PKG_CONFIG_HOST_BINARY) --cflags libnl-genl-3.0)
-TI_UTILS_LIBS = $(shell $(PKG_CONFIG_HOST_BINARY) --libs libnl-genl-3.0)
+TI_UTILS_CFLAGS = $(shell $(PKG_CONFIG_HOST_BINARY_GCC_SYSROOT) --cflags libnl-genl-3.0)
+TI_UTILS_LIBS = $(shell $(PKG_CONFIG_HOST_BINARY_GCC_SYSROOT) --libs libnl-genl-3.0)
 
 define TI_UTILS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) NFSROOT="$(STAGING_DIR)" \
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index a5c6370..1587a85 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -19,7 +19,7 @@ ifeq ($(BR2_STATIC_LIBS),y)
 # manually pass it to make.
 UPMPDCLI_DEPENDENCIES += host-pkgconf
 UPMPDCLI_MAKE_OPTS = \
-	LIBS='$(shell $(PKG_CONFIG_HOST_BINARY) --libs expat libcurl libupnp)'
+	LIBS='$(shell $(PKG_CONFIG_HOST_BINARY_GCC_SYSROOT) --libs expat libcurl libupnp)'
 endif
 
 # Upmpdcli only runs if user upmpdcli exists
diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index db85015..b6517d4 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -24,7 +24,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 VSFTPD_DEPENDENCIES += openssl host-pkgconf
-VSFTPD_LIBS += $(shell $(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto)
+VSFTPD_LIBS += $(shell $(PKG_CONFIG_HOST_BINARY_GCC_SYSROOT) --libs libssl libcrypto)
 VSFTPD_POST_CONFIGURE_HOOKS += VSFTPD_ENABLE_SSL
 endif
 
-- 
2.4.3
