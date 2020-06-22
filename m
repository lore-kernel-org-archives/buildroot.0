From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 22 Jun 2020 07:47:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/libxmlrpc: add openssl optional
 dependency
Message-ID: <20200622054708.1885805-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without this patch, openssl_abyss is enabled if openssl is built before
libxmlrpc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libxmlrpc/libxmlrpc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
index 54db9f1f89..f9925b74ca 100644
--- a/package/libxmlrpc/libxmlrpc.mk
+++ b/package/libxmlrpc/libxmlrpc.mk
@@ -39,6 +39,13 @@ ifeq ($(BR2_STATIC_LIBS),y)
 LIBXMLRPC_STATIC_OPTS = SHARED_LIB_TYPE=NONE MUST_BUILD_SHLIB=N
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBXMLRPC_DEPENDENCIES = host-pkgconf openssl
+LIBXMLRPC_CONF_OPTS = --enable-abyss-openssl
+else
+LIBXMLRPC_CONF_OPTS = --disable-abyss-openssl
+endif
+
 LIBXMLRPC_MAKE_OPTS += $(LIBXMLRPC_STATIC_OPTS)
 LIBXMLRPC_INSTALL_STAGING_OPTS = $(LIBXMLRPC_STATIC_OPTS) \
 	DESTDIR=$(STAGING_DIR) install
-- 
2.26.2
