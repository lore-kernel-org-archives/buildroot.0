From: Min Xu <xuminready@gmail.com>
Date: Thu, 24 May 2018 10:12:04 -0700
Subject: [Buildroot] [PATCH] Add new packge Shadowsocks-libev v3.1.3
Message-ID: <20180524171204.5959-1-xuminready@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Min Xu <xuminready@gmail.com>
---
 package/Config.in                              |  1 +
 package/shadowsocks-libev/Config.in            | 12 ++++++++++++
 package/shadowsocks-libev/shadowsocks-libev.mk | 20 ++++++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 package/shadowsocks-libev/Config.in
 create mode 100644 package/shadowsocks-libev/shadowsocks-libev.mk

diff --git a/package/Config.in b/package/Config.in
index ecee493..1427665 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1846,6 +1846,7 @@ endif
 	source "package/samba4/Config.in"
 	source "package/sconeserver/Config.in"
 	source "package/ser2net/Config.in"
+        source "package/shadowsocks-libev/Config.in"
 	source "package/shairport-sync/Config.in"
 	source "package/shellinabox/Config.in"
 	source "package/smcroute/Config.in"
diff --git a/package/shadowsocks-libev/Config.in b/package/shadowsocks-libev/Config.in
new file mode 100644
index 0000000..78fd35a
--- /dev/null
+++ b/package/shadowsocks-libev/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_SHADOWSOCKS_LIBEV
+        bool "shadowsocks-libev"
+        select BR2_PACKAGE_LIBSODIUM
+        select BR2_PACKAGE_MBEDTLS
+        select BR2_PACKAGE_PCRE
+        select BR2_PACKAGE_C_ARES
+        select BR2_PACKAGE_LIBEV
+        help
+          Shadowsocks-libev is a lightweight secured SOCKS5 proxy for
+          embedded devices and low-end boxes.
+
+          https://github.com/shadowsocks/shadowsocks-libev
diff --git a/package/shadowsocks-libev/shadowsocks-libev.mk b/package/shadowsocks-libev/shadowsocks-libev.mk
new file mode 100644
index 0000000..1c7f76a
--- /dev/null
+++ b/package/shadowsocks-libev/shadowsocks-libev.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# SHADOWSOCKS_LIBEV
+#
+################################################################################
+
+SHADOWSOCKS_LIBEV_VERSION = 3.1.3
+SHADOWSOCKS_LIBEV_SOURCE = shadowsocks-libev-$(SHADOWSOCKS_LIBEV_VERSION).tar.gz
+SHADOWSOCKS_LIBEV_SITE = https://github.com/shadowsocks/shadowsocks-libev/releases/download/v$(SHADOWSOCKS_LIBEV_VERSION)
+SHADOWSOCKS_LIBEV_LICENSE = GPLv3
+SHADOWSOCKS_LIBEV_DEPENDENCIES = host-pkgconf
+SHADOWSOCKS_LIBEV_LICENSE_FILES = COPYING
+SHADOWSOCKS_LIBEV_INSTALL_STAGING = YES
+SHADOWSOCKS_LIBEV_CONF_ENV = PCRECONFIG=$(STAGING_DIR)/usr/bin/pcre-config
+SHADOWSOCKS_LIBEV_DEPENDENCIES += pcre
+SHADOWSOCKS_LIBEV_CONF_OPTS = --disable-documentation --with-pcre=$(STAGING_DIR)/usr/bin/
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
+
-- 
2.11.0
