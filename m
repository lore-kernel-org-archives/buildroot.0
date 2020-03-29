From: Stefan Ott <stefan@ott.net>
Date: Sun, 29 Mar 2020 20:00:16 +0200
Subject: [Buildroot] [PATCH v2] unbound: new package
Message-ID: <20200329180016.9292-1-stefan@ott.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unbound: validating, recursive & caching DNS resolver with
DNSSEC, QNAME minimisation, DNSCrypt and DNS-over-TLS support.

Signed-off-by: Stefan Ott <stefan@ott.net>
---
Changes v1 -> v2:
  - Fix intentation in Config.in
  - Fix spelling in Config.in sub-option
  - Remodel init script based on busybox/S01syslogd
  - Fix syntax in unbound.mk
  - Remove explicit --enable-relro-now, --with-pic and --enable-pie options
  - Exclude package from systems with static libraries (it won't compile there)
  - Only enable threads on systems with support for NPTL

 DEVELOPERS                   |  3 ++
 package/Config.in            |  1 +
 package/unbound/Config.in    | 35 ++++++++++++++++++++++++
 package/unbound/S70unbound   | 52 +++++++++++++++++++++++++++++++++++
 package/unbound/unbound.hash |  3 ++
 package/unbound/unbound.mk   | 53 ++++++++++++++++++++++++++++++++++++
 6 files changed, 147 insertions(+)
 create mode 100644 package/unbound/Config.in
 create mode 100644 package/unbound/S70unbound
 create mode 100644 package/unbound/unbound.hash
 create mode 100644 package/unbound/unbound.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4a43ca420d..f81ef07456 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2354,6 +2354,9 @@ F:	package/libvpx/
 F:	package/mesa3d-demos/
 F:	package/ti-gfx/
 
+N:	Stefan Ott <stefan@ott.net>
+F:	package/unbound/
+
 N:	Stefan S?rensen <stefan.sorensen@spectralink.com>
 F:	package/cracklib/
 F:	package/libpwquality/
diff --git a/package/Config.in b/package/Config.in
index 7b73198d50..8eb71ec5c3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2195,6 +2195,7 @@ endif
 	source "package/uftp/Config.in"
 	source "package/uhttpd/Config.in"
 	source "package/ulogd/Config.in"
+	source "package/unbound/Config.in"
 	source "package/ushare/Config.in"
 	source "package/ussp-push/Config.in"
 	source "package/vde2/Config.in"
diff --git a/package/unbound/Config.in b/package/unbound/Config.in
new file mode 100644
index 0000000000..2d4ebed257
--- /dev/null
+++ b/package/unbound/Config.in
@@ -0,0 +1,35 @@
+config BR2_PACKAGE_UNBOUND
+	bool "unbound"
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_LIBEVENT
+	select BR2_PACKAGE_OPENSSL
+	depends on !BR2_STATIC_LIBS
+	help
+	  Unbound is a validating, recursive, and caching DNS resolver.
+	  It supports DNSSEC, QNAME minimisation, DNS-over-TLS and
+	  DNSCrypt.
+
+	  https://www.unbound.net
+
+if BR2_PACKAGE_UNBOUND
+config BR2_PACKAGE_UNBOUND_DNSCRYPT
+	bool "enable DNSCrypt"
+	select BR2_PACKAGE_LIBSODIUM
+	help
+	  DNSCrypt wraps unmodified DNS queries between a client and
+	  a DNS resolver. Default port used is 443 and like with
+	  normal unencrypted DNS, it uses UDP first and falling back
+	  to TCP if response too large.
+
+	  There is also DNS-over-TLS, a TCP only version
+	  of proposed standard for DNS encryption (RFC 7858).
+	  Default port for DNS-over-TLS is 853 and Unbound has
+	  built-in support for it.
+
+	  https://tools.ietf.org/html/rfc7858
+
+	  Note: Neither DNSCrypt or DNS-over-TLS encrypt the SNI.
+	  Here is some suggestions how to handle SNI encryption:
+
+	  https://tools.ietf.org/html/draft-ietf-tls-sni-encryption-00
+endif
diff --git a/package/unbound/S70unbound b/package/unbound/S70unbound
new file mode 100644
index 0000000000..cb722ce283
--- /dev/null
+++ b/package/unbound/S70unbound
@@ -0,0 +1,52 @@
+#!/bin/sh
+
+DAEMON="unbound"
+PIDFILE="/var/run/$DAEMON.pid"
+
+UNBOUND_ARGS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	start-stop-daemon -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
+		-- $UNBOUND_ARGS
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon -K -q -p "$PIDFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		rm -f "$PIDFILE"
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+restart() {
+	stop
+	sleep 1
+	start
+}
+
+case "$1" in
+	start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
new file mode 100644
index 0000000000..11626d0b6f
--- /dev/null
+++ b/package/unbound/unbound.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 152f486578242fe5c36e89995d0440b78d64c05123990aae16246b7f776ce955  unbound-1.10.0.tar.gz
+sha256 8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
new file mode 100644
index 0000000000..937165eca7
--- /dev/null
+++ b/package/unbound/unbound.mk
@@ -0,0 +1,53 @@
+################################################################################
+#
+# unbound
+#
+################################################################################
+
+UNBOUND_VERSION = 1.10.0
+UNBOUND_SITE = https://www.unbound.net/downloads
+UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
+UNBOUND_LICENSE = BSD-3-Clause
+UNBOUND_LICENSE_FILES = LICENSE
+UNBOUND_CONF_OPTS = \
+	--disable-rpath \
+	--disable-debug \
+	--with-conf-file=/etc/unbound/unbound.conf \
+	--with-pidfile=/var/run/unbound.pid \
+	--with-rootkey-file=/etc/unbound/root.key \
+	--enable-tfo-server \
+	--with-ssl=$(STAGING_DIR)/usr
+
+# uClibc-ng does not have MSG_FASTOPEN
+# so TCP Fast Open client mode disabled for it
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+UNBOUND_CONF_OPTS += --disable-tfo-client
+else
+UNBOUND_CONF_OPTS += --enable-tfo-client
+endif
+
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
+UNBOUND_CONF_OPTS += --with-pthreads
+else
+UNBOUND_CONF_OPTS += --without-pthreads
+endif
+
+ifeq ($(BR2_GCC_ENABLE_LTO),y)
+UNBOUND_CONF_OPTS += --enable-flto
+else
+UNBOUND_CONF_OPTS += --disable-flto
+endif
+
+ifeq ($(BR2_PACKAGE_UNBOUND_DNSCRYPT),y)
+UNBOUND_CONF_OPTS += --enable-dnscrypt
+UNBOUND_DEPENDENCIES += libsodium
+else
+UNBOUND_CONF_OPTS += --disable-dnscrypt
+endif
+
+define UNBOUND_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/unbound/S70unbound \
+		$(TARGET_DIR)/etc/init.d/S70unbound
+endef
+
+$(eval $(autotools-package))
-- 
2.26.0
