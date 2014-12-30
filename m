From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 31 Dec 2014 00:51:14 +0100
Subject: [Buildroot] [PATCH v3] dnsmasq: install DBus configuration file
Message-ID: <1419983474-3153-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes:
	v3: change file permissions
	v2: fix indentation

 package/dnsmasq/dnsmasq.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 9b1092e..f848a94 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -101,9 +101,17 @@ define DNSMASQ_BUILD_CMDS
 	$(DNSMASQ_MAKE_ENV) $(MAKE1) -C $(@D) $(DNSMASQ_MAKE_OPTS) all$(DNSMASQ_I18N)
 endef
 
+ifeq ($(BR2_PACKAGE_DBUS),y)
+define DNSMASQ_INSTALL_DBUS
+	$(INSTALL) -m 0644 -D $(@D)/dbus/dnsmasq.conf \
+		$(TARGET_DIR)/etc/dbus-1/system.d/dnsmasq.conf
+endef
+endif
+
 define DNSMASQ_INSTALL_TARGET_CMDS
 	$(DNSMASQ_MAKE_ENV) $(MAKE) -C $(@D) $(DNSMASQ_MAKE_OPTS) install$(DNSMASQ_I18N)
 	mkdir -p $(TARGET_DIR)/var/lib/misc/
+	$(DNSMASQ_INSTALL_DBUS)
 endef
 
 define DNSMASQ_INSTALL_INIT_SYSV
-- 
1.8.3.2
