From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
Date: Thu, 12 Dec 2019 08:53:56 +0100
Subject: [Buildroot] [PATCH v4 09/13] package/wpa_supplicant: adapt for
 preset-all
In-Reply-To: <20191212075400.1499536-1-jeremy.rosen@smile.fr>
References: <20191212075400.1499536-1-jeremy.rosen@smile.fr>
Message-ID: <20191212075400.1499536-10-jeremy.rosen@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

all services were installed but not enabled.
This change enables the non-templated service
but disables  the templated ones

Enabling the templates creates weird links which are probably an
upstream bug.

Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
---
 package/wpa_supplicant/50-wpa_supplicant.preset | 4 ++++
 package/wpa_supplicant/wpa_supplicant.mk        | 2 ++
 2 files changed, 6 insertions(+)
 create mode 100644 package/wpa_supplicant/50-wpa_supplicant.preset

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
-- 
2.24.0
