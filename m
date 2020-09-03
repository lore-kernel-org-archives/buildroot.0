From: John Keeping <john@metanate.com>
Date: Thu,  3 Sep 2020 14:35:33 +0100
Subject: [Buildroot] [PATCH] package/alsa-utils: fix install if directories
 exist
Message-ID: <20200903133533.2505458-1-john@metanate.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"mkdir" (without "-p") fails if the target directory exists, which means
that if alsa-utils is being reinstalled or if other files have
previously been installed in the alsa-state.d or alsa-restore.d
directories the installation will fail.

Switch to "$(INSTALL) -d" which allows us to be explicit about the
permissions and handles the case of a pre-existing directory correctly.

Signed-off-by: John Keeping <john@metanate.com>
---
 package/alsa-utils/alsa-utils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 27894d3e92..4776a17454 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -86,10 +86,10 @@ define ALSA_UTILS_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/alsa-restore.service
 	$(INSTALL) -D -m 0644 $(@D)/alsactl/alsa-state.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/alsa-state.service
-	mkdir $(TARGET_DIR)/usr/lib/systemd/system/alsa-restore.service.d
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib/systemd/system/alsa-restore.service.d
 	printf '[Install]\nWantedBy=multi-user.target\n' \
 		>$(TARGET_DIR)/usr/lib/systemd/system/alsa-restore.service.d/buildroot-enable.conf
-	mkdir $(TARGET_DIR)/usr/lib/systemd/system/alsa-state.service.d
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib/systemd/system/alsa-state.service.d
 	printf '[Install]\nWantedBy=multi-user.target\n' \
 		>$(TARGET_DIR)/usr/lib/systemd/system/alsa-state.service.d/buildroot-enable.conf;
 endef
-- 
2.28.0
