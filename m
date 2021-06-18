From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 18 Jun 2021 11:47:10 +0200
Subject: [Buildroot] [PATCH] package/usbguard: enforce the right permissions
 on the configuration file
Message-ID: <20210618094710.2248743-1-miquel.raynal@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Only 0600 rights are allowed for the rules.conf. This file is read when the
usbguard daemon starts and will prevent it to run otherwise.

As Git only tracks the executable bit, setting the right permissions in the
package makefile is the cleanest solution, in particular when providing this
file from a rootfs overlay.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 package/usbguard/usbguard.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/usbguard/usbguard.mk b/package/usbguard/usbguard.mk
index 0626a7cc88..ea1be0dc48 100644
--- a/package/usbguard/usbguard.mk
+++ b/package/usbguard/usbguard.mk
@@ -47,5 +47,8 @@ define USBGUARD_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S20usbguard
 endef
 
+define USBGUARD_PERMISSIONS
+	/etc/usbguard/rules.conf f 0600 0 0 - - - - -
+endef
 
 $(eval $(autotools-package))
-- 
2.27.0
