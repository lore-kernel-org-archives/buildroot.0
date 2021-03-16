From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 23:10:30 +0100
Subject: [Buildroot] [git commit] package/alsa-utils: add SELinux repolicy
 module
Message-ID: <20210316214740.4AE4F87B82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a376df7f154573052aecc4475a7998694e8c0c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The alsa-utils package adds some tools that needs the proper module in
the SELinux refpolicy to work properly when SELinux is enabled on the
system.

Add support for the alsactl tool, through the use of the admin/alsa
module.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/alsa-utils/alsa-utils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index d9f0fea7b4..2658c827a0 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -15,6 +15,10 @@ ALSA_UTILS_DEPENDENCIES = host-pkgconf alsa-lib \
 	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate) \
 	$(TARGET_NLS_DEPENDENCIES)
 
+ifeq ($(BR2_PACKAGE_ALSA_UTILS_ALSACTL),y)
+ALSA_UTILS_SELINUX_MODULES += alsa
+endif
+
 ALSA_UTILS_CONF_ENV = \
 	ac_cv_prog_ncurses5_config=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS) \
 	LIBS=$(TARGET_NLS_LIBS)
