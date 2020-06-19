From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Fri, 19 Jun 2020 16:57:17 +0200
Subject: [Buildroot] [PATCH v2 5/7] package/cups: Add udev rules to assign
 usb printers group to lp
In-Reply-To: <20200619145719.2352019-1-angelo@amarulasolutions.com>
References: <20200619145719.2352019-1-angelo@amarulasolutions.com>
Message-ID: <20200619145719.2352019-6-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is based on patch from the rockchip tree:

commit c8a337593660f27379c30248a11bf08dc8712113
Author: Jeffy Chen <jeffy.chen@rock-chips.com>
Date:   Tue Nov 13 18:59:43 2018 +0800

    package: cups: Add udev rules to assign usb printers' group to lp

    Change-Id: Ieae17deaa7d3623e1f0e1cc826871f1719d98d88
    Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/cups/70-usb-printers.rules | 4 ++++
 package/cups/cups.mk               | 9 +++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 package/cups/70-usb-printers.rules

diff --git a/package/cups/70-usb-printers.rules b/package/cups/70-usb-printers.rules
new file mode 100644
index 0000000000..537645523d
--- /dev/null
+++ b/package/cups/70-usb-printers.rules
@@ -0,0 +1,4 @@
+# Allow USB printers in the lp group
+# Match rules converted from usblp.c driver's usblp_ids
+ACTION=="add", SUBSYSTEM=="usb", ATTR{bInterfaceClass}=="07", ATTR{bInterfaceSubClass}=="01", GROUP="lp"
+ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="04b8", ATTRS{idProduct}=="0202", GROUP="lp"
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 40fe210c94..617b402969 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -75,6 +75,15 @@ else
 CUPS_CONF_OPTS += --disable-avahi
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+define CUPS_INSTALL_UDEV_RULES
+	$(INSTALL) -D -m 0644 package/cups/70-usb-printers.rules \
+		$(TARGET_DIR)/lib/udev/rules.d/70-usb-printers.rules
+endef
+
+CUPS_POST_INSTALL_TARGET_HOOKS += CUPS_INSTALL_UDEV_RULES
+endif
+
 define CUPS_INSTALL_INIT_SYSV
 	@$(RM) $(TARGET_DIR)/etc/init.d/cups
 	$(INSTALL) -D -m 0755 package/cups/S81cupsd \
-- 
2.25.1
