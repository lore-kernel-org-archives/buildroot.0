From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Sep 2020 10:02:34 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/cups: Add udev
 rules to assign usb printers group to lp
Message-ID: <20200905082712.9783B80FA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e300866d13014bff6bf9c95c1179b53fd1ee8aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

This patch is based on patch from the rockchip tree:

commit c8a337593660f27379c30248a11bf08dc8712113
Author: Jeffy Chen <jeffy.chen@rock-chips.com>
Date:   Tue Nov 13 18:59:43 2018 +0800

    package: cups: Add udev rules to assign usb printers' group to lp

    Change-Id: Ieae17deaa7d3623e1f0e1cc826871f1719d98d88
    Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>

but removes a hardcoded device usb vendor/id and keps only the usb
printer class.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 9c47056c0cb25be7bc23db82ae90ea879f320cc9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cups/70-usb-printers.rules | 3 +++
 package/cups/cups.mk               | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/package/cups/70-usb-printers.rules b/package/cups/70-usb-printers.rules
new file mode 100644
index 0000000000..67e7f5e938
--- /dev/null
+++ b/package/cups/70-usb-printers.rules
@@ -0,0 +1,3 @@
+# Allow USB printers in the lp group
+# Match rules converted from usblp.c driver's usblp_ids
+ACTION=="add", SUBSYSTEM=="usb", ATTR{bInterfaceClass}=="07", ATTR{bInterfaceSubClass}=="01", GROUP="lp"
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index abf59fc599..2f4385671c 100644
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
 	$(INSTALL) -D -m 0755 package/cups/S81cupsd \
 		$(TARGET_DIR)/etc/init.d/S81cupsd
