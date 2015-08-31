From: James Knight <james.knight@rockwellcollins.com>
Date: Mon, 31 Aug 2015 13:26:15 -0400
Subject: [Buildroot] [PATCH v2 2/4] package/berkeleydb: add host variant
In-Reply-To: <1441041977-9160-1-git-send-email-james.knight@rockwellcollins.com>
References: <1441041977-9160-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <1441041977-9160-2-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Required by an upcoming host variant of the `rpm` package.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
Changes v1 -> v2:
  - Package changed introduced in change set 2.
---
 package/berkeleydb/berkeleydb.mk | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index e5c11bd..e9ab760 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -44,6 +44,26 @@ define BERKELEYDB_CONFIGURE_CMDS
 	)
 endef
 
+define HOST_BERKELEYDB_CONFIGURE_CMDS
+	(cd $(@D)/build_unix; rm -rf config.cache; \
+		$(HOST_CONFIGURE_OPTS) \
+		$(HOST_CONFIGURE_ARGS) \
+		../dist/configure $(QUIET) \
+		--prefix=/usr \
+		--exec-prefix=/usr \
+		--sysconfdir=/etc \
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
+HOST_BERKELEYDB_INSTALL_OPTS += DESTDIR="$(HOST_DIR)" install
+
 ifneq ($(BR2_PACKAGE_BERKELEYDB_TOOLS),y)
 
 define BERKELEYDB_REMOVE_TOOLS
@@ -61,3 +81,4 @@ endef
 BERKELEYDB_POST_INSTALL_TARGET_HOOKS += BERKELEYDB_REMOVE_DOCS
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.9.5.msysgit.1
