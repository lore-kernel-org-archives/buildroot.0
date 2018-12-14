From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 14 Dec 2018 16:54:35 +0100
Subject: [Buildroot] [PATCH v2,
 2/2] alsa-utils: fix systemd build with pkgconf 1.5.3
In-Reply-To: <20181214155435.31884-1-fontaine.fabrice@gmail.com>
References: <20181214155435.31884-1-fontaine.fabrice@gmail.com>
Message-ID: <20181214155435.31884-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
paths found in the .pc file. This is correct when the paths refer to
something in STAGING_DIR (e.g. libdir, includedir), but not when it
refers to something used for the target.

alsa-utils uses the systemdsystemunitdir variable from systemd.pc to
decide where to install things. Since DESTDIR is prepended to the
install destination, this will end up in the wrong location.

Until a better solution is found in pkgconf, pass the
systemdsystemunitdir to use explicitly instead of relying on systemd.pc.

Fixes:
 - http://autobuild.buildroot.org/results/d8ad140ae52b4fe8e153de3835f3f17e92b58e53

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/alsa-utils/alsa-utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 8b2d335be4..4983283328 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -88,6 +88,7 @@ endef
 
 ifeq ($(BR2_PACKAGE_ALSA_UTILS_ALSACTL)$(BR2_INIT_SYSTEMD),yy)
 ALSA_UTILS_DEPENDENCIES += systemd
+ALSA_UTILS_CONF_OPTS += --with-systemdsystemunitdir=/usr/lib/systemd/system
 define ALSA_UTILS_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 $(@D)/alsactl/alsa-restore.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/alsa-restore.service
-- 
2.14.1
