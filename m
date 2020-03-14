From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 18:54:50 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/openrc: remove
 keymaps units if kbd package is not selected
Message-ID: <20200314174231.7D87683978@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c53a26d866cd628c835a48056fb074aaf651bd57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

keymaps and save-keymaps require kbd_mode and dumpkeys, respectively, so
remove them if the kbd package is not selected (e.g. devices with serial
console, only).

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Tested-by: Adam Duskett <aduskett@gmail.com>
[yann.morin.1998 at free.fr:
  - expand to three commands to match the existing hook
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0acd05423d0631827ce50ef21f0754246c406f0c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openrc/openrc.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index 289bde4d03..1f8516f5ee 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -39,6 +39,18 @@ define OPENRC_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/etc/init.d/sysv-rcs
 endef
 
+ifeq ($(BR2_PACKAGE_KBD),)
+# keymaps and save-keymaps require kbd_mode and dumpkeys, respectively, so
+# remove them if the kbd package is not selected (e.g. devices with serial
+# console, only).
+define OPENRC_NO_KBD
+	$(RM) $(TARGET_DIR)/etc/runlevels/boot/{keymaps,save-keymaps}
+	$(RM) $(TARGET_DIR)/etc/init.d/{keymaps,save-keymaps}
+	$(RM) $(TARGET_DIR)/etc/conf.d/keymaps
+endef
+OPENRC_POST_INSTALL_TARGET_HOOKS += OPENRC_NO_KBD
+endif
+
 ifeq ($(BR2_PACKAGE_NETIFRC),y)
 # netifrc replaces network, staticroute and loopback services which are
 # installed by openrc
