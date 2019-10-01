From: Stephen Bos <mailist@logilin.fr>
Date: Tue,  1 Oct 2019 15:09:48 +0200
Subject: [Buildroot] [PATCH 1/1] busybox: write commented login line in
 /etc/inittab when getty disabled
Message-ID: <20191001130948.17935-1-mailist@logilin.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Stephen Bos <stephen.bos@hagergroup.com>

When the "Run a getty" option is disabled, busybox doesn't remove the
/etc/inittab line from previous builds. With this patch, the line is
correctly commented out.

Signed-off-by: Stephen Bos <stephen.bos@hagergroup.com>
Co-authored-by: Stephen Bos <stephen.bos@hagergroup.com>
Co-authored-by: Christophe Blaess <christophe.blaess@logilin.fr>
---
 package/busybox/busybox.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index a154584592..cc9921dabe 100644
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
 
-- 
2.17.1
