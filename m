From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun,  4 Apr 2021 20:41:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/modem-manager: enable qcom-soc if
 libqrtr-glib enabled
Message-ID: <20210404184126.974098-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This plugin makes sense only for Qualcomm MSM phone.
Although there is currently no such device defconfig in Buildroot yet,
it makes sense to prepare modem-manager for it.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/modem-manager/modem-manager.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 2cc45d266b..d62d13cf45 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -34,6 +34,12 @@ else
 MODEM_MANAGER_CONF_OPTS += --without-mbim
 endif
 
+ifeq ($(BR2_PACKAGE_LIBQRTR_GLIB),y)
+MODEM_MANAGER_CONF_OPTS += --enable-plugin-qcom-soc
+else
+MODEM_MANAGER_CONF_OPTS += --disable-plugin-qcom-soc
+endif
+
 define MODEM_MANAGER_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/modem-manager/S44modem-manager \
 		$(TARGET_DIR)/etc/init.d/S44modem-manager
-- 
2.31.0
