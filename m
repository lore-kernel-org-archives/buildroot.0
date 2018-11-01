From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 14:49:23 +0100
Subject: [Buildroot] [git commit] package/alsa-utils: install systemd
 service files
Message-ID: <20181101134723.08F7984C70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0ea36edc263e940f8a6a2008ae6b21d60e1fb60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
