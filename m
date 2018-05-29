From: Min Xu <xuminready@gmail.com>
Date: Mon, 28 May 2018 23:55:39 -0700
Subject: [Buildroot] [PATCH] shadowsocks-libev: new package
Message-ID: <20180529065539.7263-1-xuminready@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Min Xu <xuminready@gmail.com>
---
 package/Config.in                                |  1 +
 package/shadowsocks-libev/Config.in              | 12 ++++++++++++
 package/shadowsocks-libev/shadowsocks-libev.hash |  2 ++
 package/shadowsocks-libev/shadowsocks-libev.mk   | 16 ++++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/shadowsocks-libev/Config.in
 create mode 100644 package/shadowsocks-libev/shadowsocks-libev.hash
 create mode 100644 package/shadowsocks-libev/shadowsocks-libev.mk

diff --git a/package/Config.in b/package/Config.in
index ecee493..9bfb2cf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1846,6 +1846,7 @@ endif
 	source "package/samba4/Config.in"
 	source "package/sconeserver/Config.in"
 	source "package/ser2net/Config.in"
+	source "package/shadowsocks-libev/Config.in"
 	source "package/shairport-sync/Config.in"
 	source "package/shellinabox/Config.in"
 	source "package/smcroute/Config.in"
diff --git a/package/shadowsocks-libev/Config.in b/package/shadowsocks-libev/Config.in
new file mode 100644
index 0000000..7c3c037
--- /dev/null
+++ b/package/shadowsocks-libev/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_SHADOWSOCKS_LIBEV
+	bool "shadowsocks-libev"
+	select BR2_PACKAGE_C_ARES
+	select BR2_PACKAGE_LIBEV
+	select BR2_PACKAGE_LIBSODIUM
+	select BR2_PACKAGE_MBEDTLS
+	select BR2_PACKAGE_PCRE
+	help
+	  Shadowsocks-libev is a lightweight secured SOCKS5 proxy for
+	  embedded devices and low-end boxes.
+
+	  https://github.com/shadowsocks/shadowsocks-libev
diff --git a/package/shadowsocks-libev/shadowsocks-libev.hash b/package/shadowsocks-libev/shadowsocks-libev.hash
new file mode 100644
index 0000000..07f10f4
--- /dev/null
+++ b/package/shadowsocks-libev/shadowsocks-libev.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 58fb438d2cfe33cfa6ac8c50e587e2138c50e59a4b943f88d22883bf2e192a96  shadowsocks-libev-3.1.3.tar.gz
diff --git a/package/shadowsocks-libev/shadowsocks-libev.mk b/package/shadowsocks-libev/shadowsocks-libev.mk
new file mode 100644
index 0000000..b711754
--- /dev/null
+++ b/package/shadowsocks-libev/shadowsocks-libev.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# shadowsocks-libev
+#
+################################################################################
+
+SHADOWSOCKS_LIBEV_VERSION = 3.1.3
+SHADOWSOCKS_LIBEV_SITE = https://github.com/shadowsocks/shadowsocks-libev/releases/download/v$(SHADOWSOCKS_LIBEV_VERSION)
+SHADOWSOCKS_LIBEV_LICENSE = GPL-3.0+, MIT(c-ares), BSD-2-Clause or GPL-2.0+(libev), ISC(libsodium), Apache-2.0(mbedtls), BSD-3-Clause(pcre)
+SHADOWSOCKS_LIBEV_LICENSE_FILES = COPYING c-ares/COPYING libev/COPYING libsodium/COPYING mbedtls/COPYING pcre/COPYING
+SHADOWSOCKS_LIBEV_DEPENDENCIES = host-pkgconf c-ares libev libsodium mbedtls pcre
+SHADOWSOCKS_LIBEV_INSTALL_STAGING = YES
+SHADOWSOCKS_LIBEV_CONF_ENV = PCRECONFIG=$(STAGING_DIR)/usr/bin/pcre-config
+SHADOWSOCKS_LIBEV_CONF_OPTS = --disable-documentation --with-pcre=$(STAGING_DIR)/usr/bin/
+
+$(eval $(autotools-package))
-- 
2.11.0
