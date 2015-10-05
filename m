From: James Knight <james.knight@rockwellcollins.com>
Date: Mon,  5 Oct 2015 16:26:57 -0400
Subject: [Buildroot] [PATCH v4 2/4] package/berkeleydb: add host variant
In-Reply-To: <1444076819-10228-1-git-send-email-james.knight@rockwellcollins.com>
References: <1444076819-10228-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <1444076819-10228-2-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Required by an upcoming host variant of the `rpm` package.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
Changes v3 -> v4:
  - Correcting a series of host configuration options which were
     incorrectly set (pointed out by Yann E. MORIN).

Changes v2 -> v3:
  - None.

Changes v1 -> v2:
  - Package change introduced in change set 2.
---
 package/berkeleydb/berkeleydb.mk | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index e5c11bd..24f2bdf 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -44,6 +44,23 @@ define BERKELEYDB_CONFIGURE_CMDS
 	)
 endef
 
+define HOST_BERKELEYDB_CONFIGURE_CMDS
+	(cd $(@D)/build_unix; rm -rf config.cache; \
+		$(HOST_CONFIGURE_OPTS) \
+		$(HOST_CONFIGURE_ARGS) \
+		../dist/configure $(QUIET) \
+		--prefix=$(HOST_DIR)/usr \
+		--sysconfdir=$(HOST_DIR)/etc \
+		--with-gnu-ld \
+		--disable-java \
+		--disable-tcl \
+		--enable-compat185 \
+		--enable-cxx \
+		--enable-o_direct \
+		--with-pic \
+	)
+endef
+
 ifneq ($(BR2_PACKAGE_BERKELEYDB_TOOLS),y)
 
 define BERKELEYDB_REMOVE_TOOLS
@@ -61,3 +78,4 @@ endef
 BERKELEYDB_POST_INSTALL_TARGET_HOOKS += BERKELEYDB_REMOVE_DOCS
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.9.5.msysgit.1
