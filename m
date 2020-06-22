From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Jun 2020 11:06:16 +0200
Subject: [Buildroot] [git commit] package/libxmlrpc: add openssl optional
 dependency
Message-ID: <20200622091030.350B584034@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32844dfd99e021e9c24b4dbc726d39ffae291b50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Without this patch, openssl_abyss is enabled if openssl is built before
libxmlrpc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
