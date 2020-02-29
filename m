From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sat, 29 Feb 2020 15:26:21 -0300
Subject: [Buildroot] [PATCH] package/openrc: remove keymaps units if kbd
 package is not selected
Message-ID: <20200229182621.14431-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

keymaps and save-keymaps require kbd_mode and dumpkeys, respectively, so
remove them if the kbd package is not selected (e.g. devices with serial
console, only).

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/openrc/openrc.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index 289bde4d03..dd56d72a1a 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -39,6 +39,16 @@ define OPENRC_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/etc/init.d/sysv-rcs
 endef
 
+ifeq ($(BR2_PACKAGE_KBD),)
+# keymaps and save-keymaps require kbd_mode and dumpkeys, respectively, so
+# remove them if the kbd package is not selected (e.g. devices with serial
+# console, only).
+define OPENRC_NO_KBD
+	$(RM) $(TARGET_DIR)/etc/{conf.d,init.d,runlevels/boot}/{keymaps,save-keymaps}
+endef
+OPENRC_POST_INSTALL_TARGET_HOOKS += OPENRC_NO_KBD
+endif
+
 ifeq ($(BR2_PACKAGE_NETIFRC),y)
 # netifrc replaces network, staticroute and loopback services which are
 # installed by openrc
-- 
2.18.2
