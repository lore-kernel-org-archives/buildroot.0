From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 18 Dec 2019 18:33:22 +0100
Subject: [Buildroot] [git commit] package/wpa_supplicant: adapt to systemctl
 preset-all
Message-ID: <20191218172934.855EC8806D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c27708e148794fd107935e69edbd60d4b7ad6f10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All services were installed but not enabled.

This change enables the non-templated service but disables the
templated ones.

Enabling the templates creates weird links which are probably an
upstream bug.

Signed-off-by: J??r??my Rosen <jeremy.rosen@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wpa_supplicant/50-wpa_supplicant.preset | 4 ++++
 package/wpa_supplicant/wpa_supplicant.mk        | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/package/wpa_supplicant/50-wpa_supplicant.preset b/package/wpa_supplicant/50-wpa_supplicant.preset
new file mode 100644
index 0000000000..9af8562c0e
--- /dev/null
+++ b/package/wpa_supplicant/50-wpa_supplicant.preset
@@ -0,0 +1,4 @@
+disable wpa_supplicant at .service
+disable wpa_supplicant-nl80211 at .service
+disable wpa_supplicant-wired at .service
+
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 9dcebca9bf..4f95ea6276 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -227,6 +227,8 @@ define WPA_SUPPLICANT_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant-nl80211 at .service
 	$(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant-wired at .service \
 		$(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant-wired at .service
+	$(INSTALL) -D -m 644 $(WPA_SUPPLICANT_PKGDIR)/50-wpa_supplicant.preset \
+		$(TARGET_DIR)/usr/lib/systemd/system-preset/50-wpa_supplicant.preset
 endef
 
 $(eval $(generic-package))
