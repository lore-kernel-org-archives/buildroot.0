From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Jul 2021 10:01:23 +0200
Subject: [Buildroot] [git commit] package/libtirpc: install rpc.h
Message-ID: <20210717072813.653BF91089@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=b991962993357092625e5b18d8203acd1e9b8b1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install rpc.h to avoid the following build failure with host-nfs-utils
in version 2.5.4 raised since commit
0ce30de72fb303768c5865949b8ce9260d0c43f5:

checking rpc/rpc.h usability... no
checking rpc/rpc.h presence... no
checking for rpc/rpc.h... no
configure: error: Header file rpc/rpc.h not found - maybe try building with --enable-tirpc

This build failure is raised by
http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=be7365239abf8556773b063730621967b9971708

Fixes:
 - http://autobuild.buildroot.org/results/a5eaf19f58729c4c00a2131b6a0c378c0fc0effb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libtirpc/libtirpc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index 2678c144e9..8cdc453cd4 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -21,6 +21,7 @@ LIBTIRPC_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DGQ"
 LIBTIRPC_CONF_OPTS = --disable-gssapi
 
 define HOST_LIBTIRPC_INSTALL_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/tirpc/rpc/rpc.h $(HOST_DIR)/include/rpc/rpc.h
 	$(INSTALL) -D -m 0644 $(@D)/tirpc/rpc/types.h $(HOST_DIR)/include/rpc/types.h
 	$(INSTALL) -D -m 0644 $(@D)/tirpc/netconfig.h $(HOST_DIR)/include/netconfig.h
 endef
