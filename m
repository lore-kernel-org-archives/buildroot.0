From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 23 May 2018 20:44:45 +0300
Subject: [Buildroot] [PATCH v3 1/6] libtirpc: add host package
Message-ID: <7a5dc74171a99cf6723c0fd759b8306910d3b088.1527097490.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libtirpc host package is only for two headers that the host rpcgen
utility from the nfs-utils package needs to build. glibc used to provide
these headers. In version 2.26 glibc deprecated them with its bundled
Sun RPC. Recently Fedora stopped enabling Sun RPC in glibc. So we can no
longer rely on these headers being present on the host.

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v3: Use host-generic-package since we are not using anything from the
    autotools infrastructure (Arnout).

v2: New patch in this series
---
 package/libtirpc/libtirpc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index d9bf22b83eda..7bc361dc691d 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -18,4 +18,11 @@ LIBTIRPC_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DGQ"
 
 LIBTIRPC_CONF_OPTS = --disable-gssapi
 
+define HOST_LIBTIRPC_INSTALL_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/tirpc/rpc/types.h $(HOST_DIR)/include/rpc/types.h
+	$(INSTALL) -D -m 0644 $(@D)/tirpc/netconfig.h $(HOST_DIR)/include/netconfig.h
+endef
+
 $(eval $(autotools-package))
+# We are only copying headers; no need for the autotools infrastructure
+$(eval $(host-generic-package))
-- 
2.17.0
