From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Sat, 18 Oct 2014 00:36:33 +0200
Subject: [Buildroot] [PATCH 2/2] package/.mk files: remove
	--localstatedir=/var from autotools packages
In-Reply-To: <1413585393-8349-1-git-send-email-jkrause@posteo.de>
References: <1413585393-8349-1-git-send-email-jkrause@posteo.de>
Message-ID: <1413585393-8349-2-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove --localstatedir=/var from all autotools packages where it is no longer
needed.

Also remove --localstatedir=/var/lib/dhcp from package dhcp. localstatedir is
used by dhcp to set the default directory for the leases files. This can also 
be done by setting --with-*-lease-file=/var/lib/dhcp/*, which is done in
dhcp.mk.

A custom --localstatedir is left in:
* proftpd.mk
* mysql.mk

This is safe to do:
One of the good thing with autoconf is that if you pass:
        --localstatedir=/var ... --localstatedir=/var/something
Then /var/something will be used. So, we can set --localstatedir=/var
by default in the infrastructure, and still have certain packages doing
weird things override it. [Thanks to Thomas Petazzoni]

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/avahi/avahi.mk                                   | 2 +-
 package/bind/bind.mk                                     | 2 +-
 package/collectd/collectd.mk                             | 2 +-
 package/connman/connman.mk                               | 2 +-
 package/cups/cups.mk                                     | 3 +--
 package/dbus-glib/dbus-glib.mk                           | 2 +-
 package/dbus/dbus.mk                                     | 1 -
 package/dhcp/dhcp.mk                                     | 1 -
 package/directfb/directfb.mk                             | 1 -
 package/lighttpd/lighttpd.mk                             | 1 -
 package/ndisc6/ndisc6.mk                                 | 2 +-
 package/network-manager/network-manager.mk               | 1 -
 package/nss-mdns/nss-mdns.mk                             | 1 -
 package/oprofile/oprofile.mk                             | 1 -
 package/php/php.mk                                       | 1 -
 package/pulseaudio/pulseaudio.mk                         | 1 -
 package/samba/samba.mk                                   | 1 -
 package/sdl_net/sdl_net.mk                               | 2 +-
 package/sed/sed.mk                                       | 1 -
 package/sqlcipher/sqlcipher.mk                           | 3 +--
 package/sqlite/sqlite.mk                                 | 3 ---
 package/systemd/systemd.mk                               | 1 -
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 +-
 23 files changed, 10 insertions(+), 27 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 706561f..93d093c 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -67,7 +67,7 @@ AVAHI_CONF_ENV = ac_cv_func_strtod=yes \
 		avahi_cv_sys_cxx_works=yes \
 		DATADIRNAME=share
 
-AVAHI_CONF_OPTS = --localstatedir=/var \
+AVAHI_CONF_OPTS = \
 		--disable-qt3 \
 		--disable-qt4 \
 		--disable-gdbm \
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 88b6c9f..0dcfb40 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -20,7 +20,7 @@ BIND_TARGET_SERVER_SBIN += dnssec-keyfromlabel dnssec-signzone
 BIND_TARGET_TOOLS_BIN = dig host nslookup nsupdate
 BIND_CONF_ENV = BUILD_CC="$(TARGET_CC)" \
 		BUILD_CFLAGS="$(TARGET_CFLAGS)"
-BIND_CONF_OPTS = --localstatedir=/var \
+BIND_CONF_OPTS = \
 		--with-randomdev=/dev/urandom \
 		--enable-epoll --with-libtool \
 		--with-gssapi=no --enable-rrl
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 27a7dfe..2dc27f5 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -24,7 +24,7 @@ COLLECTD_PLUGINS_DISABLE = amqp apple_sensors aquaero ascent dbi email \
 COLLECTD_CONF_ENV += LIBS="-lm"
 
 COLLECTD_CONF_OPTS += --with-nan-emulation --with-fp-layout=nothing \
-	--localstatedir=/var --with-perl-bindings=no \
+	--with-perl-bindings=no \
 	$(foreach p, $(COLLECTD_PLUGINS_DISABLE), --disable-$(p)) \
 	$(if $(BR2_PACKAGE_COLLECTD_AGGREGATION),--enable-aggregation,--disable-aggregation) \
 	$(if $(BR2_PACKAGE_COLLECTD_APACHE),--enable-apache,--disable-apache) \
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index fc1bb2c..8efc010 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -11,7 +11,7 @@ CONNMAN_DEPENDENCIES = libglib2 dbus iptables
 CONNMAN_INSTALL_STAGING = YES
 CONNMAN_LICENSE = GPLv2
 CONNMAN_LICENSE_FILES = COPYING
-CONNMAN_CONF_OPTS += --localstatedir=/var \
+CONNMAN_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_CONNMAN_DEBUG),--enable-debug,--disable-debug)		\
 	$(if $(BR2_PACKAGE_CONNMAN_ETHERNET),--enable-ethernet,--disable-ethernet)	\
 	$(if $(BR2_PACKAGE_CONNMAN_WIFI),--enable-wifi,--disable-wifi)			\
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index ff74577..318571d 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -17,8 +17,7 @@ CUPS_CONF_OPTS = --without-perl \
 		--without-php \
 		--disable-gnutls \
 		--disable-gssapi \
-		--libdir=/usr/lib \
-		--localstatedir=/var
+		--libdir=/usr/lib
 CUPS_CONFIG_SCRIPTS = cups-config
 
 CUPS_DEPENDENCIES = $(if $(BR2_PACKAGE_ZLIB),zlib) \
diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index 231c558..369bac9 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -14,7 +14,7 @@ DBUS_GLIB_CONF_ENV = ac_cv_have_abstract_sockets=yes \
 		ac_cv_func_posix_getpwnam_r=yes \
 		have_abstract_sockets=yes
 
-DBUS_GLIB_CONF_OPTS = --localstatedir=/var \
+DBUS_GLIB_CONF_OPTS = \
 		--disable-tests \
 		--disable-xml-docs \
 		--with-introspect-xml=$(DBUS_HOST_INTROSPECT) \
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 7cb6d43..28d3dd8 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -25,7 +25,6 @@ DBUS_CONF_OPTS = --with-dbus-user=dbus \
 		--disable-xml-docs \
 		--disable-doxygen-docs \
 		--disable-dnotify \
-		--localstatedir=/var \
 		--with-xml=expat \
 		--with-system-socket=/var/run/dbus/system_bus_socket \
 		--with-system-pid-file=/var/run/messagebus.pid
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 0bcd469..25c9e76 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -14,7 +14,6 @@ DHCP_CONF_ENV = \
 		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
 	ac_cv_file__dev_random=yes
 DHCP_CONF_OPTS = \
-	--localstatedir=/var/lib/dhcp \
 	--with-srv-lease-file=/var/lib/dhcp/dhcpd.leases \
 	--with-srv6-lease-file=/var/lib/dhcp/dhcpd6.leases \
 	--with-cli-lease-file=/var/lib/dhcp/dhclient.leases \
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 5b72c7a..eb0328c 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -14,7 +14,6 @@ DIRECTFB_INSTALL_STAGING = YES
 DIRECTFB_AUTORECONF = YES
 
 DIRECTFB_CONF_OPTS = \
-	--localstatedir=/var \
 	--disable-explicit-deps \
 	--enable-zlib \
 	--enable-freetype \
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index ab0a4e0..ef98298 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -14,7 +14,6 @@ LIGHTTPD_DEPENDENCIES = host-pkgconf
 LIGHTTPD_CONF_OPTS = \
 	--libdir=/usr/lib/lighttpd \
 	--libexecdir=/usr/lib \
-	--localstatedir=/var \
 	$(if $(BR2_LARGEFILE),,--disable-lfs)
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_OPENSSL),y)
diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
index 4e98fe2..ef48cd2 100644
--- a/package/ndisc6/ndisc6.mk
+++ b/package/ndisc6/ndisc6.mk
@@ -8,7 +8,7 @@ NDISC6_VERSION = 1.0.2
 NDISC6_SOURCE = ndisc6-$(NDISC6_VERSION).tar.bz2
 NDISC6_SITE = http://www.remlab.net/files/ndisc6
 NDISC6_CONF_ENV = CC="$(TARGET_CC) -std=gnu99"
-NDISC6_CONF_OPTS = --localstatedir=/var --disable-rpath --disable-suid-install
+NDISC6_CONF_OPTS = --disable-rpath --disable-suid-install
 NDISC6_LICENSE = GPLv2 or GPLv3
 NDISC6_LICENSE_FILES = COPYING
 
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 9699eea..b217781 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -30,7 +30,6 @@ NETWORK_MANAGER_CONF_OPTS = \
 		--disable-more-warnings \
 		--without-docs \
 		--disable-gtk-doc \
-		--localstatedir=/var \
 		--with-crypto=gnutls \
 		--with-iptables=/usr/sbin/iptables \
 		--disable-ifupdown \
diff --git a/package/nss-mdns/nss-mdns.mk b/package/nss-mdns/nss-mdns.mk
index 62f9907..8d23f89 100644
--- a/package/nss-mdns/nss-mdns.mk
+++ b/package/nss-mdns/nss-mdns.mk
@@ -6,7 +6,6 @@
 
 NSS_MDNS_VERSION = 0.10
 NSS_MDNS_SITE = http://0pointer.de/lennart/projects/nss-mdns
-NSS_MDNS_CONF_OPTS = --localstatedir=/var
 NSS_MDNS_LICENSE = LGPLv2.1+
 NSS_MDNS_LICENSE_FILES = LICENSE
 
diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index ec0209f..ee2f212 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -9,7 +9,6 @@ OPROFILE_SITE = http://downloads.sourceforge.net/project/oprofile/oprofile/oprof
 OPROFILE_LICENSE = GPLv2+
 OPROFILE_LICENSE_FILES = COPYING
 OPROFILE_CONF_OPTS = \
-	--localstatedir=/var \
 	--disable-account-check \
 	--enable-gui=no \
 	--with-kernel=$(STAGING_DIR)/usr
diff --git a/package/php/php.mk b/package/php/php.mk
index 26ec67d..afb55b4 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -18,7 +18,6 @@ PHP_CONF_OPTS = --mandir=/usr/share/man \
 		--disable-all \
 		--without-pear \
 		--with-config-file-path=/etc \
-		--localstatedir=/var \
 		--disable-rpath
 PHP_CONF_ENV = EXTRA_LIBS="$(PHP_EXTRA_LIBS)"
 
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 44c7602..8d3d0f7 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -11,7 +11,6 @@ PULSEAUDIO_INSTALL_STAGING = YES
 PULSEAUDIO_LICENSE = LGPLv2.1+ (specific license for modules, see LICENSE file)
 PULSEAUDIO_LICENSE_FILES = LICENSE GPL LGPL
 PULSEAUDIO_CONF_OPTS = \
-	--localstatedir=/var \
 	--disable-default-build-tests \
 	--disable-legacy-runtime-dir \
 	--disable-legacy-database-entry-format \
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 5472edd..1957997 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -33,7 +33,6 @@ SAMBA_CONF_ENV = \
 	$(if $(BR2_PACKAGE_SAMBA_AVAHI),AVAHI_LIBS=-pthread)
 
 SAMBA_CONF_OPTS = \
-	--localstatedir=/var \
 	--with-piddir=/var/run \
 	--with-lockdir=/var/lock \
 	--with-logfilebase=/var/log \
diff --git a/package/sdl_net/sdl_net.mk b/package/sdl_net/sdl_net.mk
index d7bc78b..0800a9e 100644
--- a/package/sdl_net/sdl_net.mk
+++ b/package/sdl_net/sdl_net.mk
@@ -10,7 +10,7 @@ SDL_NET_SOURCE = SDL_net-$(SDL_NET_VERSION).tar.gz
 SDL_NET_LICENSE = zlib
 SDL_NET_LICENSE_FILES = COPYING
 
-SDL_NET_CONF_OPTS = --localstatedir=/var \
+SDL_NET_CONF_OPTS = \
 		--with-sdl-prefix=$(STAGING_DIR)/usr \
 		--with-sdl-exec-prefix=$(STAGING_DIR)/usr
 
diff --git a/package/sed/sed.mk b/package/sed/sed.mk
index 34ed355..f72b8b1 100644
--- a/package/sed/sed.mk
+++ b/package/sed/sed.mk
@@ -14,7 +14,6 @@ SED_CONF_OPTS = --bindir=/usr/bin \
 		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
-		--localstatedir=/var \
 		--mandir=/usr/share/man \
 		--infodir=/usr/share/info \
 		--include=$(STAGING_DIR)/usr/include
diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index 253e311..a118718 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -15,8 +15,7 @@ SQLCIPHER_CONF_ENV = \
 	TCLSH_CMD=$(HOST_DIR)/usr/bin/tclsh$(TCL_VERSION_MAJOR)
 
 SQLCIPHER_CONF_OPTS = \
-	--enable-threadsafe \
-	--localstatedir=/var
+	--enable-threadsafe
 
 SQLCIPHER_CFLAGS += -DSQLITE_HAS_CODEC # Required according to the README
 SQLCIPHER_LDFLAGS += -lcrypto -lz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index ebf60a8..e579ae8 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -39,9 +39,6 @@ endif
 
 SQLITE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) $(SQLITE_CFLAGS)"
 
-SQLITE_CONF_OPTS = \
-	--localstatedir=/var
-
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 SQLITE_CONF_OPTS += --enable-dynamic-extensions=no
 endif
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 94407ab..1ca3fd8 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -29,7 +29,6 @@ endif
 SYSTEMD_CONF_OPTS += \
 	--with-rootprefix= \
 	--with-rootlibdir=/lib \
-	--localstatedir=/var \
 	--enable-static=no \
 	--disable-manpages \
 	--disable-selinux \
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index c27dd80..b269985 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -58,7 +58,7 @@ XSERVER_XORG_SERVER_CONF_OPTS = --disable-config-hal \
 		--disable-xnest --disable-xephyr --disable-dmx \
 		--with-builder-addr=buildroot at buildroot.org \
 		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/pixman-1" \
-		--with-fontrootdir=/usr/share/fonts/X11/ --localstatedir=/var \
+		--with-fontrootdir=/usr/share/fonts/X11/ \
 		--$(if $(BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB),en,dis)able-xvfb
 
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR),y)
-- 
2.1.2
