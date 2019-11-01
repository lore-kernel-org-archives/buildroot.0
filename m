From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri,  1 Nov 2019 00:18:02 -0600
Subject: [Buildroot] [PATCH v2 1/1] package/iputils: enable systemd services
Message-ID: <20191101061802.106261-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These are normally enabled by systemctl preset-all.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

---
Changes v1 -> v2:
  - simplify IPUTILS_CONF_OPTS
---
 package/iputils/iputils.mk | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 4a06581790..7a5357270a 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -46,12 +46,21 @@ IPUTILS_DEPENDENCIES += linux-headers
 else
 IPUTILS_CONF_OPTS += -DUSE_CRYPTO=none
 # BUILD_NINFOD=true and USE_CRYPTO=none cannot be combined
-IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
+IPUTILS_NO_NINFOD = y
 endif
 
 # ninfod requires <pthread.h>
 ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+IPUTILS_NO_NINFOD = y
+endif
+
+ifneq ($(IPUTILS_NO_NINFOD),y)
 IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
+define IPUTILS_INSTALL_SERVICE_NINFOD
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../lib/systemd/system/ninfod.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ninfod.service
+endef
 endif
 
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
@@ -103,4 +112,15 @@ define IPUTILS_PERMISSIONS
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
