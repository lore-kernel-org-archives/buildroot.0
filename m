From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Jul 2021 07:32:25 -0600
Subject: [Buildroot] [PATCH 1/1] package/libtirpc: fix rpc.h install path
Message-ID: <20210717133225.470326-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When libtirpc installs rpc.h with autoconf it installs it to:
$(HOST_DIR)/include/tirpc/rpc/rpc.h

As this is the expected path we need to do the same.

This should fix the previous attempt at fixing host-nfs-utils:
b991962993357092625e5b18d8203acd1e9b8b1f

Fixes:
http://autobuild.buildroot.net/results/990/990b5e59bacea855c8fce4abb0902bc72422c067

Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libtirpc/libtirpc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index 8cdc453cd4..fd62ab1f85 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -21,7 +21,7 @@ LIBTIRPC_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DGQ"
 LIBTIRPC_CONF_OPTS = --disable-gssapi
 
 define HOST_LIBTIRPC_INSTALL_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/tirpc/rpc/rpc.h $(HOST_DIR)/include/rpc/rpc.h
+	$(INSTALL) -D -m 0644 $(@D)/tirpc/rpc/rpc.h $(HOST_DIR)/include/tirpc/rpc/rpc.h
 	$(INSTALL) -D -m 0644 $(@D)/tirpc/rpc/types.h $(HOST_DIR)/include/rpc/types.h
 	$(INSTALL) -D -m 0644 $(@D)/tirpc/netconfig.h $(HOST_DIR)/include/netconfig.h
 endef
-- 
2.25.1
