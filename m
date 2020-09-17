From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2020 21:56:15 +0200
Subject: [Buildroot] [git commit] package/18xx-ti-utils: build/install
 wlconf as a host utility
Message-ID: <20200917194737.A5B308B8B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd5a0afca990f24a345b90c71112b8039a8a8546
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

wlconf is build and installed as a host utility to be able to tweak
the wl18xx firmware configuration at build time.

Signed-off-by: Miken Valabdas <mvalabdas@distech-controls.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/18xx-ti-utils/18xx-ti-utils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/18xx-ti-utils/18xx-ti-utils.mk b/package/18xx-ti-utils/18xx-ti-utils.mk
index d1f0388c3a..625127d709 100644
--- a/package/18xx-ti-utils/18xx-ti-utils.mk
+++ b/package/18xx-ti-utils/18xx-ti-utils.mk
@@ -21,10 +21,14 @@ define 18XX_TI_UTILS_BUILD_CMDS
 		NFSROOT="$(STAGING_DIR)" NLVER=3 $(MAKE) -C $(@D) \
 		CFLAGS="$(TARGET_CFLAGS) $(18XX_TI_UTILS_CFLAGS)" \
 		$(18XX_TI_UTILS_BUILD_TARGET)
+
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/wlconf \
+		$(HOST_CONFIGURE_OPTS)
 endef
 
 define 18XX_TI_UTILS_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/calibrator $(TARGET_DIR)/usr/bin/calibrator
+	$(INSTALL) -m 0755 $(@D)/wlconf/wlconf $(HOST_DIR)/bin/wlconf
 endef
 
 $(eval $(generic-package))
