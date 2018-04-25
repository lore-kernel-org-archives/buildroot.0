From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 23:36:48 +0200
Subject: [Buildroot] [git commit] zstd: add host libzstd support
Message-ID: <20180425213654.7A40C88E11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce2a065afe7cfab68f802f540258047069ef609a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For the host only the libzstd library is built (no need for host-lz4
host-xz host-zlib dependencies because they affect only the cmdline
tool).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas: use '-C $(@D)/lib' instead of '-C $(@D) lib' at build time,
to be consistent with what is done at install time, as suggested by
Yann E. Morin.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zstd/zstd.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index c0fa88026c..5376e86c43 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -46,4 +46,16 @@ define ZSTD_INSTALL_TARGET_CMDS
 		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/programs install
 endef
 
+# note: no 'HAVE_...' options for host library build only
+define HOST_ZSTD_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
+		-C $(@D)/lib
+endef
+
+define HOST_ZSTD_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
+		DESTDIR=$(HOST_DIR) PREFIX=/usr -C $(@D)/lib install
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
