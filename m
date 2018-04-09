From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  9 Apr 2018 22:04:28 +0200
Subject: [Buildroot] [PATCH v2 5/6] zstd: add libzstd support
In-Reply-To: <20180409200429.22650-1-ps.report@gmx.net>
References: <20180409200429.22650-1-ps.report@gmx.net>
Message-ID: <20180409200429.22650-5-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - split off target libzstd support (suggested by Yann E. MORIN)
---
 package/zstd/zstd.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 1b76b0164c..cccec3a313 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -6,6 +6,7 @@
 
 ZSTD_VERSION = v1.3.3
 ZSTD_SITE = $(call github,facebook,zstd,$(ZSTD_VERSION))
+ZSTD_INSTALL_STAGING = YES
 ZSTD_LICENSE = BSD-3-Clause or GPL-2.0
 ZSTD_LICENSE_FILES = LICENSE COPYING
 
@@ -38,10 +39,17 @@ endif
 
 define ZSTD_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
-		-C $(@D) zstd
+		-C $(@D) lib zstd
+endef
+
+define ZSTD_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
+		DESTDIR=$(STAGING_DIR) PREFIX=/usr -C $(@D)/lib install
 endef
 
 define ZSTD_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
+		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/lib install
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
 		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/programs install
 endef
-- 
2.16.3
