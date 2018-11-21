From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 21 Nov 2018 23:01:02 +0100
Subject: [Buildroot] [PATCH v1] alsa-utils: add optional systemd dependency
Message-ID: <20181121220102.10580-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes (reported by Yann E. MORIN, [1]):

/usr/bin/install -D -m 0644 .../build/alsa-utils-1.1.6/alsactl/alsa-restore.service .../target/usr/lib/systemd/system/alsa-restore.service
/usr/bin/install: cannot stat '.../build/alsa-utils-1.1.6/alsactl/alsa-restore.service': No such file or directory

[1] http://lists.busybox.net/pipermail/buildroot/2018-November/236355.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/alsa-utils/alsa-utils.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 0c65082a14..986a745399 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -82,7 +82,8 @@ define ALSA_UTILS_INSTALL_TARGET_CMDS
 	fi
 endef
 
-ifeq ($(BR2_PACKAGE_ALSA_UTILS_ALSACTL),y)
+ifeq ($(BR2_PACKAGE_ALSA_UTILS_ALSACTL)$(BR2_INIT_SYSTEMD),yy)
+ALSA_UTILS_DEPENDENCIES += systemd
 define ALSA_UTILS_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 $(@D)/alsactl/alsa-restore.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/alsa-restore.service
-- 
2.19.1
