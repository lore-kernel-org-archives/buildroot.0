From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 13 Jun 2016 08:07:17 +0200
Subject: [Buildroot] [PATCH] dmalloc: fix static build
Message-ID: <20160613060717.GA8502@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For example coldfire uses FLAT binaries, which are statically
build. Fixes following autobuild failure:
http://autobuild.buildroot.net/results/cc4233a4c3f92275a4071c172330c920c35219ca/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/dmalloc/dmalloc.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index 6eb87c6..18a6fa0 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -58,11 +58,15 @@ define DMALLOC_INSTALL_STAGING_CMDS
 		-C $(@D) install
 endef
 
-define DMALLOC_INSTALL_TARGET_CMDS
 ifeq ($(BR2_STATIC_LIBS),)
+define DMALLOC_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libdmalloc*.so $(TARGET_DIR)/usr/lib
-endif
 	cp -dpf $(STAGING_DIR)/usr/bin/dmalloc $(TARGET_DIR)/usr/bin/dmalloc
 endef
+else
+define DMALLOC_INSTALL_TARGET_CMDS
+	cp -dpf $(STAGING_DIR)/usr/bin/dmalloc $(TARGET_DIR)/usr/bin/dmalloc
+endef
+endif
 
 $(eval $(autotools-package))
-- 
2.1.4
