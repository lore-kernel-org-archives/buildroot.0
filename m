From: Erwan GAUTRON <erwan.gautron@bertin.fr>
Date: Fri, 15 May 2020 16:02:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/gnutls: add options to enable
 features
Message-ID: <20200515140209.1355747-1-erwan.gautron@bertin.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GnuTls implements old, unsafe or unused protocols and cyphers
Secure embedded systems shall disable them in order to be certified.
This patch allows to select/unselect SSLv2 protocol and gost cypher
To ensure backward compatibility, all items are selected by default

Signed-off-by: Erwan GAUTRON <erwan.gautron@bertin.fr>
---
 package/gnutls/Config.in | 12 ++++++++++++
 package/gnutls/gnutls.mk |  4 +++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index 15b930b6bd..56ea558969 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -29,6 +29,18 @@ config BR2_PACKAGE_GNUTLS_TOOLS
 	  Install GnuTLS command line tools for various cryptographic
 	  tasks.
 
+config BR2_PACKAGE_GNUTLS_ENABLE_SSL2
+	bool "enable SSLv2"
+	default y
+	help
+	  Enable SSLv2 protocol.
+
+config BR2_PACKAGE_GNUTLS_ENABLE_GOST
+	bool "enable GOST"
+	default y
+	help
+	  Enable GOST cypher.
+
 endif
 
 comment "gnutls needs a toolchain w/ wchar, dynamic library"
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index a1dfce62a2..59c9a0a7d9 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -36,7 +36,9 @@ GNUTLS_CONF_ENV = gl_cv_socket_ipv6=yes \
 GNUTLS_INSTALL_STAGING = YES
 
 # libpthread autodetection poison the linkpath
-GNUTLS_CONF_OPTS += $(if $(BR2_TOOLCHAIN_HAS_THREADS),--with-libpthread-prefix=$(STAGING_DIR)/usr)
+GNUTLS_CONF_OPTS += $(if $(BR2_TOOLCHAIN_HAS_THREADS),--with-libpthread-prefix=$(STAGING_DIR)/usr) \
+                    $(if $(BR2_PACKAGE_GNUTLS_ENABLE_SSL2),,--disable-ssl2-support) \
+                    $(if $(BR2_PACKAGE_GNUTLS_ENABLE_GOST),,--disable-gost)
 
 # gnutls needs libregex, but pcre can be used too
 # The check isn't cross-compile friendly
-- 
2.25.1
