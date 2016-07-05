From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 5 Jul 2016 08:43:39 +0000
Subject: [Buildroot] hostapd: default hostapd.conf on target
Message-ID: <1467708149.3144.46.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm wondering if there's a reason default/example hostapd.conf is not installed on target?
IMHO it would be pretty convenient to have that config as a starting point.
Otherwise user has to create it manually from scratch.

Technically this is just a matter of:
------------------------>8-------------------------
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index dca07c1..40a21ff 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -85,7 +85,9 @@ define HOSTAPD_INSTALL_TARGET_CMDS
????????$(INSTALL) -m 0755 -D $(@D)/$(HOSTAPD_SUBDIR)/hostapd \
????????????????$(TARGET_DIR)/usr/sbin/hostapd
????????$(INSTALL) -m 0755 -D $(@D)/$(HOSTAPD_SUBDIR)/hostapd_cli \
-???????????????$(TARGET_DIR)/usr/bin/hostapd_cli
+???????????????$(TARGET_DIR)/usr/bin/hostapd_cli \
+???????$(INSTALL) -m 0644 -D $(@D)/$(HOSTAPD_SUBDIR)/hostapd/hostapd.conf \
+???????????????$(TARGET_DIR)/etc/hostapd.conf
?endef
?
?$(eval $(generic-package))
------------------------>8-------------------------

If there's no real reason to not have this I'll send a patch happily.

-Alexey
