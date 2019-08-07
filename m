From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 7 Aug 2019 16:30:47 +0200
Subject: [Buildroot] [git commit] package/gpsd: unconditionally enable NTP
 time hinting support
Message-ID: <20190807142811.5F24B88689@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57f85e52a7b29363e76735930bc1bb51a38718ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mandatory LEAP* defines are only enabled when TIMEHINT_ENABLE is
enabled: https://gitlab.com/gpsd/gpsd/blob/master/gpsd.h#L293

And TIMEHINT_ENABLE is only enabled when NTPSHM_ENABLE is enabled:
https://gitlab.com/gpsd/gpsd/blob/master/gpsd.h#L109

Upstream has entirely dropped the TIMEHINT_ENABLE option:

  https://gitlab.com/gpsd/gpsd/commit/8546be5f1eee36fd3fc66f09f2adfc18814d574c

So, for the time being, we simply enable it unconditionally.

Fixes:

  http://autobuild.buildroot.net/results/44639b8fe407bee30ac96ab54b8037439f3dac88/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: drop Config.in.legacy, improve commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gpsd/Config.in | 3 ---
 package/gpsd/gpsd.mk   | 6 ++----
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 685830aed3..22f7e6e1d9 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -44,9 +44,6 @@ config BR2_PACKAGE_GPSD_PROFILING
 comment "profiling support not available with uClibc-based toolchain"
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
 
-config BR2_PACKAGE_GPSD_NTP_SHM
-	bool "NTP time hinting support"
-
 config BR2_PACKAGE_GPSD_PPS
 	bool "PPS time syncing support"
 	select BR2_PACKAGE_GPSD_NTP_SHM
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index f1c7bb7349..79d2ccfeaa 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -24,7 +24,8 @@ GPSD_SCONS_OPTS = \
 	sysroot=$(STAGING_DIR) \
 	strip=no \
 	python=no \
-	qt=no
+	qt=no \
+	ntpshm=yes
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 GPSD_DEPENDENCIES += ncurses
@@ -161,9 +162,6 @@ GPSD_SCONS_OPTS += ublox=no
 endif
 
 # Features
-ifneq ($(BR2_PACKAGE_GPSD_NTP_SHM),y)
-GPSD_SCONS_OPTS += ntpshm=no
-endif
 ifneq ($(BR2_PACKAGE_GPSD_PPS),y)
 GPSD_SCONS_OPTS += pps=no
 endif
