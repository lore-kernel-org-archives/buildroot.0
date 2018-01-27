From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 Jan 2018 23:51:22 +0100
Subject: [Buildroot] [PATCH 1/2] package/berkeleydb: add host variant
Message-ID: <20180127225123.28166-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for the upcoming Exim version bump.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/berkeleydb/berkeleydb.mk | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index a315943ee6..b12ebbc209 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -51,6 +51,22 @@ define BERKELEYDB_CONFIGURE_CMDS
 	)
 endef
 
+define HOST_BERKELEYDB_CONFIGURE_CMDS
+	(cd $(@D)/build_unix; rm -rf config.cache; \
+		$(HOST_CONFIGURE_OPTS) \
+		../dist/configure $(QUIET) \
+		--prefix=$(HOST_DIR) \
+		--with-gnu-ld \
+		--disable-cxx \
+		--disable-java \
+		--disable-tcl \
+		--disable-compat185 \
+		--with-pic \
+		--enable-o_direct \
+		--disable-mutexsupport \
+	)
+endef
+
 ifneq ($(BR2_PACKAGE_BERKELEYDB_TOOLS),y)
 
 define BERKELEYDB_REMOVE_TOOLS
@@ -68,3 +84,4 @@ endef
 BERKELEYDB_POST_INSTALL_TARGET_HOOKS += BERKELEYDB_REMOVE_DOCS
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.11.0
