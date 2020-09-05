From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Sep 2020 10:17:57 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/alsa-utils: fix
 install if directories exist
Message-ID: <20200905082724.22EC880AEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=faed27194c9cda9ab6ac1b03d7428ef212355496
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

"mkdir" (without "-p") fails if the target directory exists, which means
that if alsa-utils is being reinstalled or if other files have
previously been installed in the alsa-state.d or alsa-restore.d
directories the installation will fail.

Switch to "$(INSTALL) -d" which allows us to be explicit about the
permissions and handles the case of a pre-existing directory correctly.

Signed-off-by: John Keeping <john@metanate.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a421da99a716b236081e1aa9c0ef7f327b42818d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-utils/alsa-utils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 7afa36d503..646f897943 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -90,10 +90,10 @@ define ALSA_UTILS_INSTALL_INIT_SYSTEMD
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
