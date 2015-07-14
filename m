From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jul 2015 00:42:01 +0200
Subject: [Buildroot] [git commit] packages: use backtick instead of $(shell
	...) make function
Message-ID: <20150714225134.59B0680076@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7d69a79624b1f338950cd6cc650e029dd4d4b91a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is often difficult to know exactly when make will expand the
variable, and usually it can only be expanded after the dependencies
have been built (e.g. pkg-config or the .pc file). Using a backtick
instead makes it very clear that it will be expanded only while
executing the command.

This change is useful for two cases:

1. The per-package staging (and host) directory will be created as part
   of the configure step, so any $(shell ...) variable that is used in
   the configure step will fail because the directory doesn't exist
   yet.

2. 'make printvars' evaluates the variables it prints. It will therefore
   trigger a lot of errors from missing .pc files and others. The
   backticks, on the other hand, are not expanded, so with this change
   the output of 'make printvars' becomes clean again.

This commit contains only the easy changes: replace $(shell ...) with
`...`, and also replace ' with " where needed. Follow-up commits will
tackle the more complicated cases that need additional explanation.

After this change, the following instances of $(shell ...) will remain:

- All assignments that use :=
- All variables that are used in make conditionals (which don't expand
  the backticks).
- All variables that only refer to system executables and make
  variables that don't change.
- The calls to check-host-* in dependencies.mk, because it is eval'ed.

[Original patch by Fabio Porcedda, but extended quite a bit by Arnout.]

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/aiccu/aiccu.mk                             |    2 +-
 package/aircrack-ng/aircrack-ng.mk                 |    2 +-
 package/bustle/bustle.mk                           |    2 +-
 package/dbus-python/dbus-python.mk                 |    8 ++++----
 package/dhcpdump/dhcpdump.mk                       |    2 +-
 package/ejabberd/ejabberd.mk                       |    2 +-
 package/fbv/fbv.mk                                 |    2 +-
 package/gdk-pixbuf/gdk-pixbuf.mk                   |    2 +-
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |    4 ++--
 package/iftop/iftop.mk                             |    2 +-
 package/knock/knock.mk                             |    2 +-
 package/kodi/kodi.mk                               |    2 +-
 package/libgtk3/libgtk3.mk                         |    3 +--
 package/libmicrohttpd/libmicrohttpd.mk             |    2 +-
 package/libssh2/libssh2.mk                         |    2 +-
 package/libupnpp/libupnpp.mk                       |    2 +-
 package/lmbench/lmbench.mk                         |    4 ++--
 package/logrotate/logrotate.mk                     |    2 +-
 package/madplay/madplay.mk                         |    2 +-
 package/mpg123/mpg123.mk                           |    2 +-
 package/neardal/neardal.mk                         |    2 +-
 package/ngrep/ngrep.mk                             |    2 +-
 package/nmap/nmap.mk                               |    4 ++--
 package/openldap/openldap.mk                       |    2 +-
 package/php/php.mk                                 |    4 ++--
 package/poppler/poppler.mk                         |    2 +-
 package/prboom/prboom.mk                           |    2 +-
 package/ptpd2/ptpd2.mk                             |    2 +-
 package/python-gobject/python-gobject.mk           |    4 ++--
 package/python-pygame/python-pygame.mk             |    6 +++---
 package/qt/qt.mk                                   |   14 +++++++-------
 package/tcpdump/tcpdump.mk                         |    2 +-
 package/tcpreplay/tcpreplay.mk                     |    6 +++---
 package/ti-utils/ti-utils.mk                       |    4 ++--
 package/upmpdcli/upmpdcli.mk                       |    2 +-
 package/vsftpd/vsftpd.mk                           |    2 +-
 package/xl2tp/xl2tp.mk                             |    2 +-
 37 files changed, 56 insertions(+), 57 deletions(-)

diff --git a/package/aiccu/aiccu.mk b/package/aiccu/aiccu.mk
index f2cd3de..fc328fd 100644
--- a/package/aiccu/aiccu.mk
+++ b/package/aiccu/aiccu.mk
@@ -16,7 +16,7 @@ AICCU_LFDLAGS = $(TARGET_LDFLAGS)
 # aiccu forgets to link with gnutls' dependencies breaking the build when
 # linking statically
 ifeq ($(BR2_STATIC_LIBS),y)
-AICCU_LDFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --static --libs gnutls)
+AICCU_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --static --libs gnutls`
 endif
 
 # dummy RPM_OPT_FLAGS to disable stripping
diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index fc72c3b..7e5464d 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -27,7 +27,7 @@ endif
 ifeq ($(BR2_PACKAGE_LIBPCAP),y)
 AIRCRACK_NG_DEPENDENCIES += libpcap
 AIRCRACK_NG_MAKE_OPTS += HAVE_PCAP=yes \
-	$(if $(BR2_STATIC_LIBS),LIBPCAP="-lpcap $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)")
+	$(if $(BR2_STATIC_LIBS),LIBPCAP="-lpcap `$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`")
 else
 AIRCRACK_NG_MAKE_OPTS += HAVE_PCAP=no
 endif
diff --git a/package/bustle/bustle.mk b/package/bustle/bustle.mk
index 1ba36e0..0b85536 100644
--- a/package/bustle/bustle.mk
+++ b/package/bustle/bustle.mk
@@ -12,7 +12,7 @@ BUSTLE_DEPENDENCIES = libglib2 libpcap host-pkgconf
 
 BUSTLE_PCAP_FLAGS = "-lpcap"
 ifeq ($(BR2_STATIC_LIBS),y)
-BUSTLE_PCAP_FLAGS += $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)
+BUSTLE_PCAP_FLAGS += `$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`
 endif
 
 define BUSTLE_BUILD_CMDS
diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index 9bda018..4079967 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -17,15 +17,15 @@ DBUS_PYTHON_DEPENDENCIES += python host-python
 
 DBUS_PYTHON_CONF_ENV += \
 	PYTHON=$(HOST_DIR)/usr/bin/python2 \
-	PYTHON_INCLUDES="$(shell $(STAGING_DIR)/usr/bin/python2-config --includes)" \
-	PYTHON_LIBS="$(shell $(STAGING_DIR)/usr/bin/python2-config --ldflags)"
+	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python2-config --includes`" \
+	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python2-config --ldflags`"
 else
 DBUS_PYTHON_DEPENDENCIES += python3 host-python3
 
 DBUS_PYTHON_CONF_ENV += \
 	PYTHON=$(HOST_DIR)/usr/bin/python3 \
-	PYTHON_INCLUDES="$(shell $(STAGING_DIR)/usr/bin/python3-config --includes)" \
-	PYTHON_LIBS="$(shell $(STAGING_DIR)/usr/bin/python3-config --ldflags)"
+	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python3-config --includes`" \
+	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --ldflags`"
 endif
 
 $(eval $(autotools-package))
diff --git a/package/dhcpdump/dhcpdump.mk b/package/dhcpdump/dhcpdump.mk
index 0756319..15fc02f 100644
--- a/package/dhcpdump/dhcpdump.mk
+++ b/package/dhcpdump/dhcpdump.mk
@@ -12,7 +12,7 @@ DHCPDUMP_LICENSE_FILES = LICENSE
 
 DHCPDUMP_LIBS = -lpcap
 ifeq ($(BR2_STATIC_LIBS),y)
-DHCPDUMP_LIBS += $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)
+DHCPDUMP_LIBS += `$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`
 endif
 
 define DHCPDUMP_BUILD_CMDS
diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index b413c8b..7e22e0c 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -26,7 +26,7 @@ EJABBERD_ERLANG_LIBS = sasl crypto public_key ssl mnesia inets compiler
 EJABBERD_CONF_ENV = \
 	ac_cv_erlang_root_dir="$(HOST_DIR)/usr/lib/erlang" \
 	$(foreach lib,$(EJABBERD_ERLANG_LIBS), \
-		ac_cv_erlang_lib_dir_$(lib)="$(shell package/ejabberd/check-erlang-lib $(lib))")
+		ac_cv_erlang_lib_dir_$(lib)="`package/ejabberd/check-erlang-lib $(lib)`")
 
 define EJABBERD_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) install -C $(@D)
diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
index 8788b0e..5f7dc8c 100644
--- a/package/fbv/fbv.mk
+++ b/package/fbv/fbv.mk
@@ -18,7 +18,7 @@ FBV_DEPENDENCIES += libpng
 
 # libpng in turn depends on other libraries
 ifeq ($(BR2_STATIC_LIBS),y)
-FBV_CONFIGURE_OPTS += "--libs=$(shell $(PKG_CONFIG_HOST_BINARY) --libs libpng --static)"
+FBV_CONFIGURE_OPTS += "--libs=`$(PKG_CONFIG_HOST_BINARY) --libs libpng --static`"
 endif
 
 else
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index eb30215..3a66e61 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -35,7 +35,7 @@ GDK_PIXBUF_CONF_OPTS += --without-libtiff
 else
 GDK_PIXBUF_DEPENDENCIES += tiff host-pkgconf
 GDK_PIXBUF_CONF_ENV += \
-	LIBS='$(shell $(PKG_CONFIG_HOST_BINARY) --libs libtiff-4)'
+	LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libtiff-4`"
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index faf0e2a..ee936fe 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -119,8 +119,8 @@ ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-egl
 GST1_PLUGINS_BAD_DEPENDENCIES += libegl
 GST1_PLUGINS_BAD_CONF_ENV += \
-	CPPFLAGS="$(TARGET_CPPFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)" \
-	LIBS="$(shell $(PKG_CONFIG_HOST_BINARY) --libs egl)"
+	CPPFLAGS="$(TARGET_CPPFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags egl`" \
+	LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs egl`"
 else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-egl
 endif
diff --git a/package/iftop/iftop.mk b/package/iftop/iftop.mk
index bea05ba..042f2b2 100644
--- a/package/iftop/iftop.mk
+++ b/package/iftop/iftop.mk
@@ -12,7 +12,7 @@ IFTOP_LICENSE_FILES = COPYING
 
 IFTOP_LIBS = -lpcap
 ifeq ($(BR2_STATIC_LIBS),y)
-IFTOP_LIBS += $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)
+IFTOP_LIBS += `$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`
 endif
 IFTOP_CONF_ENV += LIBS+="$(IFTOP_LIBS)"
 
diff --git a/package/knock/knock.mk b/package/knock/knock.mk
index 2c0adb1..28db1eb 100644
--- a/package/knock/knock.mk
+++ b/package/knock/knock.mk
@@ -11,7 +11,7 @@ KNOCK_LICENSE_FILES = COPYING
 KNOCK_DEPENDENCIES = libpcap
 
 ifeq ($(BR2_STATIC_LIBS),y)
-KNOCK_CONF_OPTS = LIBS="$(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)"
+KNOCK_CONF_OPTS = LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
 endif
 
 $(eval $(autotools-package))
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index cc42df4..ad61f0d 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -112,7 +112,7 @@ else
 KODI_CONF_OPTS += --disable-gl --disable-rsxs --disable-sdl --disable-x11 --disable-xrandr
 ifeq ($(BR2_PACKAGE_KODI_EGL_GLES),y)
 KODI_DEPENDENCIES += libegl libgles
-KODI_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)"
+KODI_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags egl`"
 KODI_CONF_OPTS += --enable-gles
 else
 KODI_CONF_OPTS += --disable-gles
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index ee73291..80dbf94 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -149,8 +149,7 @@ HOST_LIBGTK3_DEPENDENCIES = \
 	host-pkgconf
 
 HOST_LIBGTK3_CFLAGS = \
-	$(shell $(HOST_DIR)/usr/bin/pkgconf \
-	--cflags --libs gdk-pixbuf-2.0)
+	`$(HOST_DIR)/usr/bin/pkgconf --cflags --libs gdk-pixbuf-2.0`
 
 define HOST_LIBGTK3_CONFIGURE_CMDS
 	echo "#define GETTEXT_PACKAGE \"gtk30\"" >> $(@D)/gtk/config.h
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index a6662a7..f8a9d22 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -13,7 +13,7 @@ LIBMICROHTTPD_CONF_OPTS = --disable-curl --disable-spdy --disable-examples
 ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
 LIBMICROHTTPD_LICENSE = LGPLv2.1+
 LIBMICROHTTPD_DEPENDENCIES += host-pkgconf gnutls libgcrypt
-LIBMICROHTTPD_CONF_ENV += LIBS="$(shell $(PKG_CONFIG_HOST_BINARY) --libs gnutls)"
+LIBMICROHTTPD_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs gnutls`"
 LIBMICROHTTPD_CONF_OPTS += --enable-https --with-gnutls=$(STAGING_DIR)/usr \
 	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
 else
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 3b4df37..bf040a8 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -20,7 +20,7 @@ LIBSSH2_CONF_OPTS += --with-libgcrypt \
 	--without-openssl
 # configure.ac forgets to link to dependent libraries of gcrypt breaking static
 # linking
-LIBSSH2_CONF_ENV += LIBS="$(shell $(STAGING_DIR)/usr/bin/libgcrypt-config --libs)"
+LIBSSH2_CONF_ENV += LIBS="`$(STAGING_DIR)/usr/bin/libgcrypt-config --libs`"
 else
 LIBSSH2_DEPENDENCIES += openssl
 LIBSSH2_CONF_OPTS += --with-openssl \
diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index caf61af..1075ff9 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -16,7 +16,7 @@ LIBUPNPP_DEPENDENCIES = expat libcurl libupnp
 ifeq ($(BR2_STATIC_LIBS),y)
 LIBUPNPP_DEPENDENCIES += host-pkgconf
 LIBUPNPP_CONF_ENV += \
-	LIBS='$(shell $(PKG_CONFIG_HOST_BINARY) --libs libupnp libcurl)'
+	LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libupnp libcurl`"
 endif
 
 $(eval $(autotools-package))
diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index f593428..dc758c6 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -14,8 +14,8 @@ LMBENCH_CFLAGS = $(TARGET_CFLAGS)
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 LMBENCH_DEPENDENCIES += host-pkgconf libtirpc
-LMBENCH_CFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags libtirpc)
-LMBENCH_LDLIBS = $(shell $(PKG_CONFIG_HOST_BINARY) --libs libtirpc)
+LMBENCH_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
+LMBENCH_LDLIBS = `$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`
 endif
 
 define LMBENCH_CONFIGURE_CMDS
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index 0af7f4a..4a70040 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -11,7 +11,7 @@ LOGROTATE_LICENSE_FILES = COPYING
 LOGROTATE_DEPENDENCIES = popt host-pkgconf
 # tarball does not have a generated configure script
 LOGROTATE_AUTORECONF = YES
-LOGROTATE_CONF_ENV = LIBS="$(shell $(PKG_CONFIG_HOST_BINARY) --libs popt)"
+LOGROTATE_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs popt`"
 LOGROTATE_CONF_OPTS = --without-selinux
 
 ifeq ($(BR2_PACKAGE_ACL),y)
diff --git a/package/madplay/madplay.mk b/package/madplay/madplay.mk
index ff12aa1..2606ac8 100644
--- a/package/madplay/madplay.mk
+++ b/package/madplay/madplay.mk
@@ -16,7 +16,7 @@ MADPLAY_DEPENDENCIES = libmad libid3tag $(if $(BR2_PACKAGE_GETTEXT),gettext)
 ifeq ($(BR2_PACKAGE_MADPLAY_ALSA),y)
 MADPLAY_CONF_OPTS += --with-alsa
 MADPLAY_DEPENDENCIES += host-pkgconf alsa-lib
-MADPLAY_CONF_ENV += LIBS="$(shell $(PKG_CONFIG_HOST_BINARY) --libs alsa)"
+MADPLAY_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs alsa`"
 endif
 
 $(eval $(autotools-package))
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index a16e400..4c534e2 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -54,7 +54,7 @@ MPG123_CONF_OPTS += --with-default-audio=portaudio
 MPG123_DEPENDENCIES += portaudio
 # configure script does NOT use pkg-config to figure out how to link
 # with portaudio, breaking static linking as portaudio uses pthreads
-MPG123_CONF_ENV += LIBS='$(shell $(PKG_CONFIG_HOST_BINARY) --libs portaudio-2.0)'
+MPG123_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs portaudio-2.0`"
 endif
 
 ifeq ($(BR2_PACKAGE_SDL),y)
diff --git a/package/neardal/neardal.mk b/package/neardal/neardal.mk
index ddaecbe..c3164ef 100644
--- a/package/neardal/neardal.mk
+++ b/package/neardal/neardal.mk
@@ -25,7 +25,7 @@ endif
 # forgets to take that into account, causing the detection to fail
 # when linking statically
 ifeq ($(BR2_STATIC_LIBS),y)
-NEARDAL_CONF_ENV += LIBS='$(shell $(PKG_CONFIG_HOST_BINARY) --libs ncurses)'
+NEARDAL_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs ncurses`"
 endif
 
 define NEARDAL_INSTALL_NCL
diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
index f2fcb73..c4ad528 100644
--- a/package/ngrep/ngrep.mk
+++ b/package/ngrep/ngrep.mk
@@ -13,7 +13,7 @@ NGREP_INSTALL_STAGING = YES
 
 NGREP_LIBS = -lpcap -lpcre
 ifeq ($(BR2_STATIC_LIBS),y)
-NGREP_LIBS += $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)
+NGREP_LIBS += `$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`
 endif
 NGREP_CONF_ENV += LIBS+="$(NGREP_LIBS)"
 
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index d46d58b..d450f5e 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -15,10 +15,10 @@ NMAP_LICENSE = GPLv2
 NMAP_LICENSE_FILES = COPYING
 
 # needed by libpcap
-NMAP_LIBS_FOR_STATIC_LINK += $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)
+NMAP_LIBS_FOR_STATIC_LINK += `$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`
 
 ifeq ($(BR2_STATIC_LIBS),y)
-NMAP_CONF_ENV += LIBS='$(NMAP_LIBS_FOR_STATIC_LINK)'
+NMAP_CONF_ENV += LIBS="$(NMAP_LIBS_FOR_STATIC_LINK)"
 endif
 
 # for 0001-libdnet-wrapper-configure.patch
diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index ecb1bce..4c3a71a 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -31,7 +31,7 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 OPENLDAP_MP = bignum
 OPENLDAP_DEPENDENCIES += openssl
-OPENLDAP_CONF_ENV = LIBS="$(shell $(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto)"
+OPENLDAP_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto`"
 else ifeq ($(BR2_PACKAGE_GMP),y)
 OPENLDAP_MP = gmp
 OPENLDAP_DEPENDENCIES += gmp
diff --git a/package/php/php.mk b/package/php/php.mk
index 53aaecf..39f4e2a 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -116,7 +116,7 @@ PHP_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += openssl
 # openssl needs zlib, but the configure script forgets to link against
 # it causing detection failures with static linking
-PHP_STATIC_LIBS += $(shell $(PKG_CONFIG_HOST_BINARY) --libs --static openssl)
+PHP_STATIC_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs --static openssl`
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_LIBXML2),y)
@@ -187,7 +187,7 @@ endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE),y)
 PHP_CONF_OPTS += --with-sqlite3=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += sqlite
-PHP_STATIC_LIBS += $(shell $(PKG_CONFIG_HOST_BINARY) --libs --static sqlite3)
+PHP_STATIC_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs --static sqlite3`
 endif
 
 ### PDO
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 234b7cc..6142cba 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -24,7 +24,7 @@ ifeq ($(BR2_PACKAGE_TIFF),y)
 POPPLER_CONF_OPTS += --enable-libtiff
 # Help poppler to find libtiff in static linking scenarios
 POPPLER_CONF_ENV += \
-	LIBTIFF_LIBS="$(shell $(PKG_CONFIG_HOST_BINARY) --libs libtiff-4)"
+	LIBTIFF_LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libtiff-4`"
 POPPLER_DEPENDENCIES += tiff
 else
 POPPLER_CONF_OPTS += --disable-libtiff
diff --git a/package/prboom/prboom.mk b/package/prboom/prboom.mk
index 3d131cd..5f5e7fb 100644
--- a/package/prboom/prboom.mk
+++ b/package/prboom/prboom.mk
@@ -18,7 +18,7 @@ endif
 ifeq ($(BR2_STATIC_LIBS),y)
 # SDL_mixer uses symbols from SDL, but ends up after it on the link
 # cmdline. Fix it by forcing the SDL libs at the very end
-PRBOOM_CONF_ENV += LIBS="$(shell $(STAGING_DIR)/usr/bin/sdl-config --static-libs)"
+PRBOOM_CONF_ENV += LIBS="`$(STAGING_DIR)/usr/bin/sdl-config --static-libs`"
 endif
 
 PRBOOM_CONF_OPTS = \
diff --git a/package/ptpd2/ptpd2.mk b/package/ptpd2/ptpd2.mk
index 6b2e6bc..cd49fe5 100644
--- a/package/ptpd2/ptpd2.mk
+++ b/package/ptpd2/ptpd2.mk
@@ -14,7 +14,7 @@ PTPD2_LICENSE = BSD-2c
 PTPD2_LICENSE_FILES = COPYRIGHT
 
 ifeq ($(BR2_STATIC_LIBS),y)
-PTPD2_CONF_OPTS += LIBS="$(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)"
+PTPD2_CONF_OPTS += LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
 endif
 
 ifeq ($(BR2_PACKAGE_NETSNMP),y)
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index c47954c..74cb054 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -20,13 +20,13 @@ PYTHON_GOBJECT_DEPENDENCIES += python host-python
 
 PYTHON_GOBJECT_CONF_ENV = \
 	PYTHON=$(HOST_DIR)/usr/bin/python2 \
-	PYTHON_INCLUDES="$(shell $(STAGING_DIR)/usr/bin/python2-config --includes)"
+	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python2-config --includes`"
 else
 PYTHON_GOBJECT_DEPENDENCIES += python3 host-python3
 
 PYTHON_GOBJECT_CONF_ENV = \
 	PYTHON=$(HOST_DIR)/usr/bin/python3 \
-	PYTHON_INCLUDES="$(shell $(STAGING_DIR)/usr/bin/python3-config --includes)"
+	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python3-config --includes`"
 endif
 
 ifeq ($(BR2_PACKAGE_LIBFFI),y)
diff --git a/package/python-pygame/python-pygame.mk b/package/python-pygame/python-pygame.mk
index 51f1c20..995f80a 100644
--- a/package/python-pygame/python-pygame.mk
+++ b/package/python-pygame/python-pygame.mk
@@ -66,14 +66,14 @@ define PYTHON_PYGAME_UNCONFIGURE_SCRAP
 endef
 endif
 
-PYTHON_PYGAME_SDL_FLAGS = $(shell $(STAGING_DIR)/usr/bin/sdl-config --cflags)
-PYTHON_PYGAME_SDL_FLAGS += $(shell $(STAGING_DIR)/usr/bin/sdl-config --libs)
+PYTHON_PYGAME_SDL_FLAGS = `$(STAGING_DIR)/usr/bin/sdl-config --cflags`
+PYTHON_PYGAME_SDL_FLAGS += `$(STAGING_DIR)/usr/bin/sdl-config --libs`
 
 # Pygame needs a Setup file where options should be commented out if
 # dependencies are not available
 define PYTHON_PYGAME_CONFIGURE_CMDS
 	cp -f $(@D)/Setup.in $(@D)/Setup
-	$(SED) 's~^SDL = ~SDL = $(PYTHON_PYGAME_SDL_FLAGS) \n#~' $(@D)/Setup
+	$(SED) "s~^SDL = ~SDL = $(PYTHON_PYGAME_SDL_FLAGS) \n#~" $(@D)/Setup
 	$(SED) 's/^pypm/#pypm/' $(@D)/Setup
 	$(PYTHON_PYGAME_UNCONFIGURE_IMAGE)
 	$(PYTHON_PYGAME_UNCONFIGURE_FONT)
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 02b6db7..e0e5d22 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -230,9 +230,9 @@ QT_DEPENDENCIES += fontconfig xlib_libXi xlib_libX11 xlib_libXrender \
 	xlib_libXcursor xlib_libXrandr xlib_libXext xlib_libXv
 # Using pkg-config avoids us some logic to redefine and sed again mkspecs files
 # to add X11 include path and link options
-QT_CFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags x11)
-QT_CXXFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags x11)
-QT_LDFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --libs x11 xext)
+QT_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags x11`
+QT_CXXFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags x11`
+QT_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --libs x11 xext`
 QT_CONFIGURE_OPTS += -arch $(QT_EMB_PLATFORM) \
 		-xplatform qws/linux-$(QT_EMB_PLATFORM)-g++ -x11 -no-gtkstyle -no-sm \
 		-no-openvg
@@ -329,9 +329,9 @@ endif
 ifeq ($(BR2_PACKAGE_QT_OPENGL_ES),y)
 QT_CONFIGURE_OPTS += -opengl es2 -egl
 QT_DEPENDENCIES += libgles libegl
-QT_CFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)
-QT_CXXFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)
-QT_LDFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --libs egl)
+QT_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags egl`
+QT_CXXFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags egl`
+QT_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --libs egl`
 else
 QT_CONFIGURE_OPTS += -no-opengl
 endif
@@ -473,7 +473,7 @@ QT_QMAKE = $(HOST_DIR)/usr/bin/qmake -spec qws/linux-$(QT_EMB_PLATFORM)-g++
 ################################################################################
 define QT_QMAKE_SET
 	$(SED) '/$(1)/d' $(3)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
-	$(SED) '/include.*qws.conf/a$(1) = $(2)' $(3)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
+	$(SED) "/include.*qws.conf/a$(1) = $(2)" $(3)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
 endef
 
 ifneq ($(QT_CONFIG_FILE),)
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index 6a88305..14b3503 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -19,7 +19,7 @@ TCPDUMP_CONF_OPTS = \
 TCPDUMP_DEPENDENCIES = zlib libpcap
 
 ifeq ($(BR2_STATIC_LIBS),y)
-TCPDUMP_CONF_OPTS += LIBS="$(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)"
+TCPDUMP_CONF_OPTS += LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
 endif
 
 # make install installs an unneeded extra copy of the tcpdump binary
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index 1dbe453..f6bd08f 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -16,9 +16,9 @@ TCPREPLAY_CONF_OPTS = --with-libpcap=$(STAGING_DIR)/usr
 TCPREPLAY_DEPENDENCIES = libpcap
 
 # libpcap may depend on symbols in other libs
-TCPREPLAY_LIBS = $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --libs)
-TCPREPLAY_CONF_ENV += ac_cv_search_pcap_close='$(TCPREPLAY_LIBS)' \
-	LIBS="$(TCPREPLAY_LIBS)"
+TCPREPLAY_LIBS = $(STAGING_DIR)/usr/bin/pcap-config --static --libs
+TCPREPLAY_CONF_ENV += ac_cv_search_pcap_close="`$(TCPREPLAY_LIBS)`" \
+	LIBS="`$(TCPREPLAY_LIBS)`"
 
 ifeq ($(BR2_PACKAGE_TCPDUMP),y)
 TCPREPLAY_CONF_ENV += ac_cv_path_tcpdump_path=/usr/sbin/tcpdump
diff --git a/package/ti-utils/ti-utils.mk b/package/ti-utils/ti-utils.mk
index 3141219..06aca6d 100644
--- a/package/ti-utils/ti-utils.mk
+++ b/package/ti-utils/ti-utils.mk
@@ -10,8 +10,8 @@ TI_UTILS_DEPENDENCIES = libnl host-pkgconf
 TI_UTILS_LICENSE = BSD-3c
 TI_UTILS_LICENSE_FILES = COPYING
 
-TI_UTILS_CFLAGS = $(shell $(PKG_CONFIG_HOST_BINARY) --cflags libnl-genl-3.0)
-TI_UTILS_LIBS = $(shell $(PKG_CONFIG_HOST_BINARY) --libs libnl-genl-3.0)
+TI_UTILS_CFLAGS = `$(PKG_CONFIG_HOST_BINARY) --cflags libnl-genl-3.0`
+TI_UTILS_LIBS = `$(PKG_CONFIG_HOST_BINARY) --libs libnl-genl-3.0`
 
 define TI_UTILS_BUILD_CMDS
 	$(MAKE1) NFSROOT="$(STAGING_DIR)" \
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index 9531b61..8dde87d 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -19,7 +19,7 @@ ifeq ($(BR2_STATIC_LIBS),y)
 # manually pass it to make.
 UPMPDCLI_DEPENDENCIES += host-pkgconf
 UPMPDCLI_MAKE_OPTS = \
-	LIBS='$(shell $(PKG_CONFIG_HOST_BINARY) --libs expat libcurl libupnp)'
+	LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs expat libcurl libupnp`"
 endif
 
 # Upmpdcli only runs if user upmpdcli exists
diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 3091f06..e5b505d 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -24,7 +24,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 VSFTPD_DEPENDENCIES += openssl host-pkgconf
-VSFTPD_LIBS += $(shell $(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto)
+VSFTPD_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto`
 VSFTPD_POST_CONFIGURE_HOOKS += VSFTPD_ENABLE_SSL
 endif
 
diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index d6b849a..a823716 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -11,7 +11,7 @@ XL2TP_LICENSE = GPLv2
 XL2TP_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_STATIC_LIBS),y)
-XL2TP_LDLIBS = LDLIBS="$(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)"
+XL2TP_LDLIBS = LDLIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
 endif
 
 define XL2TP_BUILD_CMDS
