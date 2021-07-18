From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 23:30:47 +0200
Subject: [Buildroot] [git commit] package/usbguard: enforce the right
 permissions on the configuration file
Message-ID: <20210718205713.C07778830E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=f0b1b5a7954566730a43ef6e3b687be5a9c4c3e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Only 0600 rights are allowed for the rules.conf. This file is read when the
usbguard daemon starts and will prevent it to run otherwise.

As Git only tracks the executable bit, setting the right permissions in the
package makefile is the cleanest solution, in particular when providing this
file from a rootfs overlay.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/usbguard/usbguard.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/usbguard/usbguard.mk b/package/usbguard/usbguard.mk
index 53d103346e..1518f92fc5 100644
--- a/package/usbguard/usbguard.mk
+++ b/package/usbguard/usbguard.mk
@@ -59,4 +59,8 @@ define USBGUARD_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S20usbguard
 endef
 
+define USBGUARD_PERMISSIONS
+	/etc/usbguard/rules.conf f 0600 0 0 - - - - -
+endef
+
 $(eval $(autotools-package))
