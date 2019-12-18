From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 18 Dec 2019 18:33:22 +0100
Subject: [Buildroot] [git commit] package/alsa-utils: add a WantedBy section
 to the systemd unit file
Message-ID: <20191218172934.A93BB812A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4974f7941fa86bf37e7d04ef6e5c991b400d1e64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This allows the user to enable/disable manually the unit.
It is enabled by default

Signed-off-by: J??r??my Rosen <jeremy.rosen@smile.fr>
[yann.morin.1998 at free.fr:
  - split logn lines
  - no need for continued line (no use for ';\' )
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/alsa-utils/alsa-utils.mk | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 52022e32ab..2cd3c4a333 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -90,11 +90,12 @@ define ALSA_UTILS_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/alsa-restore.service
 	$(INSTALL) -D -m 0644 $(@D)/alsactl/alsa-state.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/alsa-state.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/sound.target.wants
-	ln -sf ../../../../lib/systemd/system/alsa-restore.service \
-		$(TARGET_DIR)/etc/systemd/system/sound.target.wants/alsa-restore.service
-	ln -sf ../../../../lib/systemd/system/alsa-state.service \
-		$(TARGET_DIR)/etc/systemd/system/sound.target.wants/alsa-state.service
+	mkdir $(TARGET_DIR)/usr/lib/systemd/system/alsa-restore.service.d
+	printf '[Install]\nWantedBy=multi-user.target\n' \
+		>$(TARGET_DIR)/usr/lib/systemd/system/alsa-restore.service.d/buildroot-enable.conf
+	mkdir $(TARGET_DIR)/usr/lib/systemd/system/alsa-state.service.d
+	printf '[Install]\nWantedBy=multi-user.target\n' \
+		>$(TARGET_DIR)/usr/lib/systemd/system/alsa-state.service.d/buildroot-enable.conf;
 endef
 endif
 
