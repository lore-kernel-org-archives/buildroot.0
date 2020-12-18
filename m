From: Tian Yuanhao <tianyuanhao@aliyun.com>
Date: Fri, 18 Dec 2020 13:58:56 +0800
Subject: [Buildroot] [PATCH 1/1] package/pkg-golang.mk: postpone evaluation
 of TARGET_DIR and HOST_DIR
Message-ID: <20201218055856.3489177-1-tianyuanhao@aliyun.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When BR2_PER_PACKAGE_DIRECTORIES=y, $(TARGET_DIR) is evaluated as
$(BASE_DIR)/target, but $$(TARGET_DIR) is evaluated as
$(BASE_DIR)/per-package/$(PKG)_NAME/target.

Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
---
 package/pkg-golang.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 3813e1c406..d07242310d 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -121,7 +121,7 @@ endif
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	$$(foreach d,$$($(2)_INSTALL_BINS),\
-		$(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $(TARGET_DIR)/usr/bin/$$(d)
+		$(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $$(TARGET_DIR)/usr/bin/$$(d)
 	)
 endef
 endif
@@ -130,7 +130,7 @@ endif
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
 	$$(foreach d,$$($(2)_INSTALL_BINS),\
-		$(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $(HOST_DIR)/bin/$$(d)
+		$(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $$(HOST_DIR)/bin/$$(d)
 	)
 endef
 endif
-- 
2.25.1
