From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 18 Jan 2021 21:37:52 +0100
Subject: [Buildroot] [PATCH] package/zstd: build multithreaded host-zstd
Message-ID: <20210118203753.30241-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Under the assumption that all Buildroot build hosts nowadays are
multithreaded, we can boost performance of host-zstd by enabling
multithreaded operation.

See also commit 52154e52069d20105f62191e6c9f903f188a5129.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/zstd/zstd.mk | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index c3af9bd58c..a4f0632fcf 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -76,18 +76,20 @@ define ZSTD_INSTALL_TARGET_CMDS
 		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/lib $(ZSTD_INSTALL_LIBS)
 endef
 
-# note: no 'HAVE_...' options for host library build only
+# note: only limited 'HAVE_...' options for host library build only
+HOST_ZSTD_OPTS = HAVE_THREAD=1
+
 define HOST_ZSTD_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
-		-C $(@D)/lib libzstd.a libzstd
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) $(HOST_ZSTD_OPTS) \
+		-C $(@D)/lib libzstd.a-mt libzstd-mt
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) $(HOST_ZSTD_OPTS) \
 		-C $(@D) zstd
 endef
 
 define HOST_ZSTD_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) $(HOST_ZSTD_OPTS) \
 		DESTDIR=$(HOST_DIR) PREFIX=/usr -C $(@D)/lib install
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) $(HOST_ZSTD_OPTS) \
 		DESTDIR=$(HOST_DIR) PREFIX=/usr -C $(@D)/programs install
 endef
 
-- 
2.26.2
