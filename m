From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sun, 27 Oct 2019 10:00:07 -0300
Subject: [Buildroot] [PATCH] package/sysvinit: comment out login line in
 inittab if getty is disabled
Message-ID: <20191027130007.3006-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

When the "Run a getty" option is disabled, sysvinit doesn't remove the
/etc/inittab line from previous builds. With this patch, the line is
correctly commented out.

Based on similar change made by Stephen Bos <stephen.bos@hagergroup.com>
and Christophe Blaess <christophe.blaess@logilin.fr> for busybox.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/sysvinit/sysvinit.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index 98a37fc760..c778a9cde5 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -36,8 +36,13 @@ define SYSVINIT_SET_GETTY
 	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(SYSTEM_GETTY_PORT) | tail -c+4)::respawn:/sbin/getty -L $(SYSTEM_GETTY_OPTIONS) $(SYSTEM_GETTY_PORT) $(SYSTEM_GETTY_BAUDRATE) $(SYSTEM_GETTY_TERM) #~' \
 		$(TARGET_DIR)/etc/inittab
 endef
-SYSVINIT_TARGET_FINALIZE_HOOKS += SYSVINIT_SET_GETTY
+else
+define SYSVINIT_SET_GETTY
+	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~# S0:1:respawn:/sbin/getty -L ttyS0 115200 vt100 #~' \
+		$(TARGET_DIR)/etc/inittab
+endef
 endif # BR2_TARGET_GENERIC_GETTY
+SYSVINIT_TARGET_FINALIZE_HOOKS += SYSVINIT_SET_GETTY
 
 SYSVINIT_TARGET_FINALIZE_HOOKS += SYSTEM_REMOUNT_ROOT_INITTAB
 
-- 
2.18.1
