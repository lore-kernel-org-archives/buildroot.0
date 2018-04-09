From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  9 Apr 2018 22:04:25 +0200
Subject: [Buildroot] [PATCH v2 2/6] zstd: add host libzstd support
In-Reply-To: <20180409200429.22650-1-ps.report@gmx.net>
References: <20180409200429.22650-1-ps.report@gmx.net>
Message-ID: <20180409200429.22650-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - split off host libzstd support (suggested by Yann E. MORIN)
  - no ZSTD_OPTS for host libarary build
---
 package/zstd/zstd.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index c0fa88026c..1b76b0164c 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -46,4 +46,16 @@ define ZSTD_INSTALL_TARGET_CMDS
 		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/programs install
 endef
 
+# note: no 'HAVE_...' options for host library build only 
+define HOST_ZSTD_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
+		-C $(@D) lib
+endef
+
+define HOST_ZSTD_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
+		DESTDIR=$(HOST_DIR) PREFIX=/usr -C $(@D)/lib install
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.16.3
