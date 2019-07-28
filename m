From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Jul 2019 10:50:46 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/berkeleydb: add host variant
Message-ID: <20190728085047.18591-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for the upcoming Exim security version bump.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: no changes, re-sent http://patchwork.ozlabs.org/patch/866788/

 package/berkeleydb/berkeleydb.mk | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index e5c11bddcf..e077eb4640 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -44,6 +44,22 @@ define BERKELEYDB_CONFIGURE_CMDS
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
@@ -61,3 +77,4 @@ endef
 BERKELEYDB_POST_INSTALL_TARGET_HOOKS += BERKELEYDB_REMOVE_DOCS
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.20.1
