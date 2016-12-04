From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 4 Dec 2016 18:39:24 +0100
Subject: [Buildroot] [PATCH] berkeleydb: fix static linking issues
Message-ID: <20161204173924.GA1647@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libtool by default drops -static, so force libtool with -all-static
to do static linking.

Fixes:
 http://autobuild.buildroot.net/results/f0a96f671644d9f9efcf245b354affdc84f7d7da

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/berkeleydb/berkeleydb.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index e5c11bd..d09bece 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -44,6 +44,10 @@ define BERKELEYDB_CONFIGURE_CMDS
 	)
 endef
 
+ifeq ($(BR2_STATIC_LIBS),y)
+BERKELEYDB_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -all-static"
+endif
+
 ifneq ($(BR2_PACKAGE_BERKELEYDB_TOOLS),y)
 
 define BERKELEYDB_REMOVE_TOOLS
@@ -60,4 +64,8 @@ endef
 
 BERKELEYDB_POST_INSTALL_TARGET_HOOKS += BERKELEYDB_REMOVE_DOCS
 
+define BERKELEYDB_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_ARGS) $(MAKE) $(BERKELEYDB_CONF_ENV) -C $(@D)/build_unix
+endef
+
 $(eval $(autotools-package))
-- 
2.1.4
