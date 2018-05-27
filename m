From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 May 2018 23:23:38 +0200
Subject: [Buildroot] [git commit] libtirpc: add host package
Message-ID: <20180527213342.670FB8284A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f50274e38946616eab41288ee037d9f565aeb9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libtirpc host package is only for two headers that the host rpcgen
utility from the nfs-utils package needs to build. glibc used to provide
these headers. In version 2.26 glibc deprecated them with its bundled
Sun RPC. Recently Fedora stopped enabling Sun RPC in glibc. So we can no
longer rely on these headers being present on the host.

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtirpc/libtirpc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index d9bf22b83e..7bc361dc69 100644
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
