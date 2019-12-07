From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
Date: Sat,  7 Dec 2019 19:00:49 +0100
Subject: [Buildroot] [PATCH v3 13/13] package/alsa-utils: add a WantedBy
 section to the unit
In-Reply-To: <20191207180049.3245578-1-jeremy.rosen@smile.fr>
References: <20191207180049.3245578-1-jeremy.rosen@smile.fr>
Message-ID: <20191207180049.3245578-14-jeremy.rosen@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows the user to enable/disable manually the unit.
It is enabled by default

Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
---
 package/alsa-utils/alsa-utils.mk | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 47f07bf7a2..d06af231bf 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -90,11 +90,10 @@ define ALSA_UTILS_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/alsa-restore.service
 	$(INSTALL) -D -m 0644 $(@D)/alsactl/alsa-state.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/alsa-state.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/sound.target.wants
-	ln -sf ../../../../lib/systemd/system/alsa-restore.service \
-		$(TARGET_DIR)/etc/systemd/system/sound.target.wants/alsa-restore.service
-	ln -sf ../../../../lib/systemd/system/alsa-state.service \
-		$(TARGET_DIR)/etc/systemd/system/sound.target.wants/alsa-state.service
+	mkdir $(TARGET_DIR)/usr/lib/systemd/system/alsa-restore.service.d;\
+	printf '[Install]\nWantedBy=multi-user.target\n' > $(TARGET_DIR)/usr/lib/systemd/system/alsa-restore.service.d/buildroot-enable.conf;\
+	mkdir $(TARGET_DIR)/usr/lib/systemd/system/alsa-state.service.d;\
+	printf '[Install]\nWantedBy=multi-user.target\n' > $(TARGET_DIR)/usr/lib/systemd/system/alsa-state.service.d/buildroot-enable.conf;
 endef
 endif
 
-- 
2.24.0
