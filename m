From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 31 Oct 2019 20:44:22 -0600
Subject: [Buildroot] [PATCH 1/1] package/iputils: enable systemd services
Message-ID: <20191101024422.102466-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These are normally enabled by systemctl preset-all.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/iputils/iputils.mk | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 4a06581790..822c8d8a1b 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -47,11 +47,21 @@ else
 IPUTILS_CONF_OPTS += -DUSE_CRYPTO=none
 # BUILD_NINFOD=true and USE_CRYPTO=none cannot be combined
 IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
+IPUTILS_NO_NINFOD = y
 endif
 
 # ninfod requires <pthread.h>
 ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
+IPUTILS_NO_NINFOD = y
+endif
+
+ifneq ($(IPUTILS_NO_NINFOD),y)
+define IPUTILS_INSTALL_SERVICE_NINFOD
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../lib/systemd/system/ninfod.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ninfod.service
+endef
 endif
 
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
@@ -103,4 +113,15 @@ define IPUTILS_PERMISSIONS
 endef
 endif
 
+define IPUTILS_INSTALL_SERVICE_RDISC
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../lib/systemd/system/rdisc.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/rdisc.service
+endef
+
+define IPUTILS_INSTALL_INIT_SYSTEMD
+	$(IPUTILS_INSTALL_SERVICE_NINFOD)
+	$(IPUTILS_INSTALL_SERVICE_RDISC)
+endef
+
 $(eval $(meson-package))
-- 
2.20.1
