From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Fri, 12 Jan 2018 01:20:39 +0200
Subject: [Buildroot] [PATCH 1/1] unbound: new package
Message-ID: <20180111232039.24270-1-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/unbound/Config.in    | 37 ++++++++++++++++++++++++++++++++
 package/unbound/unbound.hash |  3 +++
 package/unbound/unbound.mk   | 50 ++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 92 insertions(+)
 create mode 100644 package/unbound/Config.in
 create mode 100644 package/unbound/unbound.hash
 create mode 100644 package/unbound/unbound.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 2f7d051e8a..184ce82cec 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1642,6 +1642,7 @@ N:	Stefan Fr?berg <stefan.froberg@petroprogram.com>
 F:	package/elfutils/
 F:	package/libtasn1/
 F:	package/proxychains-ng/
+F:	package/unbound/
 F:	package/yasm/
 F:	package/zlib-ng/
 
diff --git a/package/Config.in b/package/Config.in
index 01f4095be5..f810445e27 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1827,6 +1827,7 @@ endif
 	source "package/udpcast/Config.in"
 	source "package/uhttpd/Config.in"
 	source "package/ulogd/Config.in"
+	source "package/unbound/Config.in"
 	source "package/ushare/Config.in"
 	source "package/ussp-push/Config.in"
 	source "package/vde2/Config.in"
diff --git a/package/unbound/Config.in b/package/unbound/Config.in
new file mode 100644
index 0000000000..07e4fa39f2
--- /dev/null
+++ b/package/unbound/Config.in
@@ -0,0 +1,37 @@
+config BR2_PACKAGE_UNBOUND
+	bool "unbound"
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_LIBEVENT
+	select BR2_PACKAGE_LIBSODIUM if BR2_PACKAGE_UNBOUND_DNSCRYPT
+	depends on BR2_PACKAGE_OPENSSL
+	help
+	  Unbound is a validating, recursive, and caching DNS resolver.
+	  It supports DNSSEC, QNAME minimisation, DNS-over-TLS and
+	  DNSCrypt.
+
+	  https://www.unbound.net
+
+if BR2_PACKAGE_UNBOUND
+
+config BR2_PACKAGE_UNBOUND_DNSCRYPT
+	bool "Enable DNSCrypt"
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
+
+endif
+
diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
new file mode 100644
index 0000000000..5f2183897e
--- /dev/null
+++ b/package/unbound/unbound.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256	4e7bd43d827004c6d51bef73adf941798e4588bdb40de5e79d89034d69751c9f  unbound-1.6.7.tar.gz
+sha256	8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
new file mode 100644
index 0000000000..3c6f4ac895
--- /dev/null
+++ b/package/unbound/unbound.mk
@@ -0,0 +1,50 @@
+################################################################################
+#
+# unbound
+#
+################################################################################
+
+UNBOUND_VERSION = 1.6.7
+UNBOUND_SOURCE = unbound-$(UNBOUND_VERSION).tar.gz
+UNBOUND_SITE = https://www.unbound.net/downloads
+UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
+UNBOUND_LICENSE = BSD
+UNBOUND_LICENSE_FILES = LICENSE
+UNBOUND_CONF_OPTS += --disable-rpath \
+		     --disable-debug \
+		     --with-conf-file=/etc/unbound/unbound.conf \
+		     --with-pidfile=/var/run/unbound.pid \
+		     --with-rootkey-file=/etc/unbound/root.key \
+		     --enable-tfo-server \
+		     --enable-relro-now \
+		     --with-pic \
+		     --enable-pie
+
+# uClibc-ng does not have MSG_FASTOPEN
+# so TCP Fast Open client mode disabled for it
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_UCLIBC),y)
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
+$(eval $(autotools-package))
-- 
2.13.6
