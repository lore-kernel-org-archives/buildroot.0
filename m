From: Stefan Ott <stefan@ott.net>
Date: Sat, 21 Mar 2020 01:57:06 +0100
Subject: [Buildroot] [PATCH 1/1] unbound: new package
Message-ID: <20200321005706.22235-1-stefan@ott.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unbound: validating, recursive & caching DNS resolver with
DNSSEC, QNAME minimisation, DNSCrypt and DNS-over-TLS support.

Patch based on an earlier patch by Stefan Fr?berg

Signed-off-by: Stefan Ott <stefan@ott.net>
---
 DEVELOPERS                   |  3 ++
 package/Config.in            |  1 +
 package/unbound/Config.in    | 35 ++++++++++++++++++++++
 package/unbound/S70unbound   | 26 ++++++++++++++++
 package/unbound/unbound.hash |  3 ++
 package/unbound/unbound.mk   | 57 ++++++++++++++++++++++++++++++++++++
 6 files changed, 125 insertions(+)
 create mode 100644 package/unbound/Config.in
 create mode 100755 package/unbound/S70unbound
 create mode 100644 package/unbound/unbound.hash
 create mode 100644 package/unbound/unbound.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 8c736efcca..c5790c2a18 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2338,6 +2338,9 @@ F:	package/libvpx/
 F:	package/mesa3d-demos/
 F:	package/ti-gfx/
 
+N:	Stefan Ott <stefan@ott.net>
+F:	package/unbound/
+
 N:	Stefan S?rensen <stefan.sorensen@spectralink.com>
 F:	package/cracklib/
 F:	package/libpwquality/
diff --git a/package/Config.in b/package/Config.in
index cba756d9f1..ff9df32476 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2193,6 +2193,7 @@ endif
 	source "package/uftp/Config.in"
 	source "package/uhttpd/Config.in"
 	source "package/ulogd/Config.in"
+	source "package/unbound/Config.in"
 	source "package/ushare/Config.in"
 	source "package/ussp-push/Config.in"
 	source "package/vde2/Config.in"
diff --git a/package/unbound/Config.in b/package/unbound/Config.in
new file mode 100644
index 0000000000..3533164c03
--- /dev/null
+++ b/package/unbound/Config.in
@@ -0,0 +1,35 @@
+config BR2_PACKAGE_UNBOUND
+	bool "unbound"
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_LIBEVENT
+	select BR2_PACKAGE_OPENSSL
+	help
+		Unbound is a validating, recursive, and caching DNS resolver.
+		It supports DNSSEC, QNAME minimisation, DNS-over-TLS and
+		DNSCrypt.
+
+		https://www.unbound.net
+
+if BR2_PACKAGE_UNBOUND
+	config BR2_PACKAGE_UNBOUND_DNSCRYPT
+	bool "Enable DNSCrypt"
+	select BR2_PACKAGE_LIBSODIUM
+	help
+		DNSCrypt wraps unmodified DNS queries between a client and
+		a DNS resolver. Default port used is 443 and like with
+		normal unencrypted DNS, it uses UDP first and falling back
+		to TCP if response too large.
+
+		There is also DNS-over-TLS, a TCP only version
+		of proposed standard for DNS encryption (RFC 7858).
+		Default port for DNS-over-TLS is 853 and Unbound has
+		built-in support for it.
+
+		https://tools.ietf.org/html/rfc7858
+
+		Note: Neither DNSCrypt or DNS-over-TLS encrypt the SNI.
+		Here is some suggestions how to handle SNI encryption:
+
+		https://tools.ietf.org/html/draft-ietf-tls-sni-encryption-00
+
+endif
diff --git a/package/unbound/S70unbound b/package/unbound/S70unbound
new file mode 100755
index 0000000000..5079f4121f
--- /dev/null
+++ b/package/unbound/S70unbound
@@ -0,0 +1,26 @@
+#!/bin/sh
+
+[ -f /etc/unbound/unbound.conf ] || exit 0
+
+case "$1" in
+	start)
+		printf "Starting unbound DNS server: "
+		start-stop-daemon -S -x /usr/sbin/unbound
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
+		;;
+	stop)
+		printf "Stopping unbound DNS server: "
+		start-stop-daemon -K -q -x /usr/sbin/unbound
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
+		;;
+	restart|reload)
+		$0 stop
+		sleep 1
+		$0 start
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		exit 1
+esac
+
+exit 0
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
index 0000000000..81a620c170
--- /dev/null
+++ b/package/unbound/unbound.mk
@@ -0,0 +1,57 @@
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
+UNBOUND_CONF_OPTS += \
+	--disable-rpath \
+	--disable-debug \
+	--with-conf-file=/etc/unbound/unbound.conf \
+	--with-pidfile=/var/run/unbound.pid \
+	--with-rootkey-file=/etc/unbound/root.key \
+	--enable-tfo-server \
+	--enable-relro-now \
+	--with-pic \
+	--enable-pie \
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
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
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
+
-- 
2.25.2
