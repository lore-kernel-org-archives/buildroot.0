From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 30 Oct 2018 23:41:39 +0100
Subject: [Buildroot] [PATCH v2] alsa-utils: install systemd sevice files
Message-ID: <20181030224139.5140-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - fix symlinks (reported by ????? ??????????)
---
 package/alsa-utils/alsa-utils.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index e9a45c675f..0c65082a14 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -82,4 +82,18 @@ define ALSA_UTILS_INSTALL_TARGET_CMDS
 	fi
 endef
 
+ifeq ($(BR2_PACKAGE_ALSA_UTILS_ALSACTL),y)
+define ALSA_UTILS_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(@D)/alsactl/alsa-restore.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/alsa-restore.service
+	$(INSTALL) -D -m 0644 $(@D)/alsactl/alsa-state.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/alsa-state.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/sound.target.wants
+	ln -sf ../../../../lib/systemd/system/alsa-restore.service \
+		$(TARGET_DIR)/etc/systemd/system/sound.target.wants/alsa-restore.service
+	ln -sf ../../../../lib/systemd/system/alsa-state.service \
+		$(TARGET_DIR)/etc/systemd/system/sound.target.wants/alsa-state.service
+endef
+endif
+
 $(eval $(autotools-package))
-- 
2.19.1
