From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Jul 2021 18:55:51 -0600
Subject: [Buildroot] [PATCH v3 1/2] package/libtirpc: Add optional GSSAPI
 support
Message-ID: <20210716005552.3295142-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - use krb5-config instead of -lgssapi_krb5
---
 package/libtirpc/Config.in   | 8 ++++++++
 package/libtirpc/libtirpc.mk | 8 +++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
index 2e9c939fa8..1899edefbf 100644
--- a/package/libtirpc/Config.in
+++ b/package/libtirpc/Config.in
@@ -7,5 +7,13 @@ config BR2_PACKAGE_LIBTIRPC
 
 	  http://sourceforge.net/projects/libtirpc/
 
+config BR2_PACKAGE_LIBTIRPC_GSS
+	bool "gss"
+	depends on BR2_USE_MMU # libkrb5
+	depends on BR2_PACKAGE_LIBTIRPC
+	select BR2_PACKAGE_LIBKRB5
+	help
+	  Enable GSSAPI support
+
 comment "libtirpc needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index 2678c144e9..fa14636e63 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -18,7 +18,13 @@ LIBTIRPC_AUTORECONF = YES
 # getrpcby{number,name} are only provided if 'GQ' is defined
 LIBTIRPC_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DGQ"
 
-LIBTIRPC_CONF_OPTS = --disable-gssapi
+ifeq ($(BR2_PACKAGE_LIBTIRPC_GSS),y)
+LIBTIRPC_CONF_ENV += KRB5_CONFIG=$(STAGING_DIR)/usr/bin/krb5-config
+LIBTIRPC_CONF_OPTS += --enable-gssapi
+LIBTIRPC_DEPENDENCIES += libkrb5
+else
+LIBTIRPC_CONF_OPTS += --disable-gssapi
+endif
 
 define HOST_LIBTIRPC_INSTALL_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/tirpc/rpc/types.h $(HOST_DIR)/include/rpc/types.h
-- 
2.25.1
