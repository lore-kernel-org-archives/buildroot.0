From: Mike Williams <mike@mikebwilliams.com>
Date: Thu, 19 Mar 2015 13:56:47 -0400
Subject: [Buildroot] [PATCH 15/15] systemd: change install path to /usr/lib
In-Reply-To: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
References: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1426787807-29510-16-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

/usr/lib is the default path for upstream systemd.

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/systemd/systemd.mk | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 98bda02..3ec124c 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -27,8 +27,6 @@ SYSTEMD_DEPENDENCIES += busybox
 endif
 
 SYSTEMD_CONF_OPTS += \
-	--with-rootprefix= \
-	--with-rootlibdir=/lib \
 	--enable-static=no \
 	--disable-manpages \
 	--disable-selinux \
@@ -100,16 +98,16 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
-	ln -sf ../run/systemd/resolve/resolv.conf \
+	ln -sf /run/systemd/resolve/resolv.conf \
 		$(TARGET_DIR)/etc/resolv.conf
 endef
 else
 SYSTEMD_CONF_OPTS += --disable-networkd
 define SYSTEMD_INSTALL_SERVICE_NETWORK
 	$(INSTALL) -D -m 644 package/systemd/network.service \
-		$(TARGET_DIR)/etc/systemd/system/network.service
+		$(TARGET_DIR)/usr/lib/systemd/system/network.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../network.service \
+	ln -fs /usr/lib/systemd/system/network.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/network.service
 endef
 endif
@@ -118,7 +116,7 @@ ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
 SYSTEMD_CONF_OPTS += --enable-timesyncd
 define SYSTEMD_INSTALL_SERVICE_TIMESYNC
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants
-	ln -sf ../../../../lib/systemd/system/systemd-timesyncd.service \
+	ln -sf /usr/lib/systemd/system/systemd-timesyncd.service \
 		$(TARGET_DIR)/etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service
 endef
 else
@@ -144,12 +142,12 @@ SYSTEMD_MAKE_OPTS += LIBS=-lrt
 SYSTEMD_MAKE_OPTS += LDFLAGS+=-ldl
 
 define SYSTEMD_INSTALL_INIT_HOOK
-	ln -fs ../lib/systemd/systemd $(TARGET_DIR)/sbin/init
-	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/halt
-	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/poweroff
-	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/reboot
+	ln -fs /usr/lib/systemd/systemd $(TARGET_DIR)/sbin/init
+	ln -fs /usr/bin/systemctl $(TARGET_DIR)/sbin/halt
+	ln -fs /usr/bin/systemctl $(TARGET_DIR)/sbin/poweroff
+	ln -fs /usr/bin/systemctl $(TARGET_DIR)/sbin/reboot
 
-	ln -fs ../../../lib/systemd/system/multi-user.target $(TARGET_DIR)/etc/systemd/system/default.target
+	ln -fs /usr/lib/systemd/system/multi-user.target $(TARGET_DIR)/etc/systemd/system/default.target
 endef
 
 define SYSTEMD_INSTALL_MACHINEID_HOOK
@@ -157,14 +155,14 @@ define SYSTEMD_INSTALL_MACHINEID_HOOK
 endef
 
 define SYSTEMD_SANITIZE_PATH_IN_UNITS
-	find $(TARGET_DIR)/lib/systemd/system -name '*.service' \
+	find $(TARGET_DIR)/usr/lib/systemd/system -name '*.service' \
 		-exec $(SED) 's,$(HOST_DIR),,g' {} \;
 endef
 
 # Disable ldconfig.service, as /sbin/ldconfig is not available when the
 # target is built with a glibc-based toolchain.
 define SYSTEMD_DISABLE_LDCONFIG_SERVICE_HOOK
-	rm -f $(TARGET_DIR)/lib/systemd/system/sysinit.target.wants/ldconfig.service
+	rm -f $(TARGET_DIR)/usr/lib/systemd/system/sysinit.target.wants/ldconfig.service
 endef
 
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
@@ -199,7 +197,7 @@ define SYSTEMD_INSTALL_SERVICE_TTY
 	else \
 		SERVICE="serial-getty"; \
 	fi; \
-	ln -fs ../../../../lib/systemd/system/$${SERVICE}@.service \
+	ln -fs /usr/lib/systemd/system/$${SERVICE}@.service \
 		$(TARGET_DIR)/etc/systemd/system/getty.target.wants/$${SERVICE}@$(BR2_TARGET_GENERIC_GETTY_PORT).service
 endef
 endif
-- 
2.1.0
