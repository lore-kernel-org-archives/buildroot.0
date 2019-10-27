From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 12:50:27 +0100
Subject: [Buildroot] [git commit] package/busybox: write commented login
 line in /etc/inittab when getty disabled
Message-ID: <20191027114412.5DFB4890AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef6b272959222aa052616c0c57751fb3de5d35b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the "Run a getty" option is disabled, busybox doesn't remove the
/etc/inittab line from previous builds. With this patch, the line is
correctly commented out.

Signed-off-by: Stephen Bos <stephen.bos@hagergroup.com>
Co-authored-by: Stephen Bos <stephen.bos@hagergroup.com>
Co-authored-by: Christophe Blaess <christophe.blaess@logilin.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/busybox/busybox.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 680d3bc17f..301e72bdd2 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -218,8 +218,12 @@ define BUSYBOX_SET_GETTY
 	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(SYSTEM_GETTY_PORT)::respawn:/sbin/getty -L $(SYSTEM_GETTY_OPTIONS) $(SYSTEM_GETTY_PORT) $(SYSTEM_GETTY_BAUDRATE) $(SYSTEM_GETTY_TERM) #~' \
 		$(TARGET_DIR)/etc/inittab
 endef
-BUSYBOX_TARGET_FINALIZE_HOOKS += BUSYBOX_SET_GETTY
+else
+define BUSYBOX_SET_GETTY
+	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~#ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 #~' $(TARGET_DIR)/etc/inittab
+endef
 endif # BR2_TARGET_GENERIC_GETTY
+BUSYBOX_TARGET_FINALIZE_HOOKS += BUSYBOX_SET_GETTY
 
 BUSYBOX_TARGET_FINALIZE_HOOKS += SYSTEM_REMOUNT_ROOT_INITTAB
 
