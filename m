From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 22 May 2018 13:30:12 +0300
Subject: [Buildroot] [PATCH v2 1/6] libtirpc: add host package
Message-ID: <176e048d628384df6d3b2d82f2b9c7e4cf58892e.1526985017.git.baruch@tkos.co.il>
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
v2: New patch in this series
---
 package/libtirpc/libtirpc.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index d9bf22b83eda..703a87725394 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -18,4 +18,14 @@ LIBTIRPC_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DGQ"
 
 LIBTIRPC_CONF_OPTS = --disable-gssapi
 
+# Don't build anything for host; we only need the headers
+HOST_LIBTIRPC_CONFIGURE_CMDS = true
+HOST_LIBTIRPC_BUILD_CMDS = true
+
+define HOST_LIBTIRPC_INSTALL_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/tirpc/rpc/types.h $(HOST_DIR)/include/rpc/types.h
+	$(INSTALL) -D -m 0644 $(@D)/tirpc/netconfig.h $(HOST_DIR)/include/netconfig.h
+endef
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.17.0
