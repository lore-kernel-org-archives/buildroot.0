From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Jul 2021 16:02:44 +0200
Subject: [Buildroot] [git commit] package/libtirpc: install full host package
Message-ID: <20210717133254.47252912AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=0a5a9741e03e666204d577f82d29d93ba610381b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install full host package for rpc.h and all other headers to avoid the
following build failure with host-nfs-utils in version 2.5.4 raised
since commit 0ce30de72fb303768c5865949b8ce9260d0c43f5:

checking rpc/rpc.h usability... no
checking rpc/rpc.h presence... no
checking for rpc/rpc.h... no
configure: error: Header file rpc/rpc.h not found - maybe try building with --enable-tirpc

This build failure is raised by
http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=be7365239abf8556773b063730621967b9971708

Fixes:
 - http://autobuild.buildroot.org/results/a5eaf19f58729c4c00a2131b6a0c378c0fc0effb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libtirpc/libtirpc.mk | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index 2678c144e9..31be113965 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -19,12 +19,7 @@ LIBTIRPC_AUTORECONF = YES
 LIBTIRPC_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DGQ"
 
 LIBTIRPC_CONF_OPTS = --disable-gssapi
-
-define HOST_LIBTIRPC_INSTALL_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/tirpc/rpc/types.h $(HOST_DIR)/include/rpc/types.h
-	$(INSTALL) -D -m 0644 $(@D)/tirpc/netconfig.h $(HOST_DIR)/include/netconfig.h
-endef
+HOST_LIBTIRPC_CONF_OPTS = --disable-gssapi
 
 $(eval $(autotools-package))
-# We are only copying headers; no need for the autotools infrastructure
-$(eval $(host-generic-package))
+$(eval $(host-autotools-package))
