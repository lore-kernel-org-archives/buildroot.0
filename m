From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Dec 2014 16:05:42 +0100
Subject: [Buildroot] [PATCH] package/kodi: fix leftover instance of 'xbmc'
Message-ID: <1419779142-22229-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

During the XBMC -> Kodi rename, some instance of 'xbmc' were left out,
which meant our startup script would not run Kodi, and that Kodi would
create its /.kodi directory.

This patch renames the missing bits.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/S50kodi |  2 +-
 package/kodi/kodi.mk | 20 +++++++++++---------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/package/kodi/S50kodi b/package/kodi/S50kodi
index 3b0049f..8468c24 100755
--- a/package/kodi/S50kodi
+++ b/package/kodi/S50kodi
@@ -4,7 +4,7 @@
 #
 
 BIN=/usr/bin/br-kodi
-KODI=/usr/lib/xbmc/xbmc.bin
+KODI=/usr/lib/xbmc/kodi.bin
 KODI_ARGS="--standalone -fs -n"
 PIDFILE=/var/run/kodi.pid
 
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 8a52433..1fb7256 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -203,16 +203,16 @@ endef
 KODI_PRE_CONFIGURE_HOOKS += KODI_BOOTSTRAP
 
 define KODI_CLEAN_UNUSED_ADDONS
-	rm -Rf $(TARGET_DIR)/usr/share/xbmc/addons/screensaver.rsxs.plasma
-	rm -Rf $(TARGET_DIR)/usr/share/xbmc/addons/visualization.milkdrop
-	rm -Rf $(TARGET_DIR)/usr/share/xbmc/addons/visualization.projectm
-	rm -Rf $(TARGET_DIR)/usr/share/xbmc/addons/visualization.itunes
+	rm -Rf $(TARGET_DIR)/usr/share/kodi/addons/screensaver.rsxs.plasma
+	rm -Rf $(TARGET_DIR)/usr/share/kodi/addons/visualization.milkdrop
+	rm -Rf $(TARGET_DIR)/usr/share/kodi/addons/visualization.projectm
+	rm -Rf $(TARGET_DIR)/usr/share/kodi/addons/visualization.itunes
 endef
 KODI_POST_INSTALL_TARGET_HOOKS += KODI_CLEAN_UNUSED_ADDONS
 
 define KODI_CLEAN_CONFLUENCE_SKIN
-	find $(TARGET_DIR)/usr/share/xbmc/addons/skin.confluence/media -name *.png -delete
-	find $(TARGET_DIR)/usr/share/xbmc/addons/skin.confluence/media -name *.jpg -delete
+	find $(TARGET_DIR)/usr/share/kodi/addons/skin.confluence/media -name *.png -delete
+	find $(TARGET_DIR)/usr/share/kodi/addons/skin.confluence/media -name *.jpg -delete
 endef
 KODI_POST_INSTALL_TARGET_HOOKS += KODI_CLEAN_CONFLUENCE_SKIN
 
@@ -223,12 +223,14 @@ endef
 KODI_POST_INSTALL_TARGET_HOOKS += KODI_INSTALL_BR_WRAPPER
 
 # When run from a startup script, Kodi has no $HOME where to store its
-# configuration, so ends up storing it in /.xbmc  (yes, at the root of
+# configuration, so ends up storing it in /.kodi  (yes, at the root of
 # the rootfs). This is a problem for read-only filesystems. But we can't
-# easily change that, so create /.xbmc as a symlink where we want the
-# config to eventually be.
+# easily change that, so create /.kodi as a symlink where we want the
+# config to eventually be. Add synlinks for the legacy XBMC name as well
 define KODI_INSTALL_CONFIG_DIR
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/var/kodi
+	ln -sf /var/kodi $(TARGET_DIR)/.kodi
+	ln -sf /var/kodi $(TARGET_DIR)/var/xbmc
 	ln -sf /var/kodi $(TARGET_DIR)/.xbmc
 endef
 KODI_POST_INSTALL_TARGET_HOOKS += KODI_INSTALL_CONFIG_DIR
-- 
1.9.1
