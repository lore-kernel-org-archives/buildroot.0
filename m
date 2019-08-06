From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  6 Aug 2019 07:19:20 +0200
Subject: [Buildroot] [PATCH 2/3] package/gpsd: requires NTP time hinting
 support
In-Reply-To: <20190806051921.28680-1-bernd.kuhls@t-online.de>
References: <20190806051921.28680-1-bernd.kuhls@t-online.de>
Message-ID: <20190806051921.28680-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/446/44639b8fe407bee30ac96ab54b8037439f3dac88/

Mandatory LEAP* defines are only enabled when TIMEHINT_ENABLE is
enabled: https://gitlab.com/gpsd/gpsd/blob/master/gpsd.h#L293

And TIMEHINT_ENABLE is only enabled when NTPSHM_ENABLE is enabled:
https://gitlab.com/gpsd/gpsd/blob/master/gpsd.h#L109

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy       | 5 +++++
 package/gpsd/Config.in | 3 ---
 package/gpsd/gpsd.mk   | 6 ++----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index de05b07c97..f443ab0741 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,11 @@ endif
 
 comment "Legacy options removed in 2019.08"
 
+config BR2_PACKAGE_GPSD_NTP_SHM
+	bool "gpsd optional NTP time hinting support removed"
+	help
+	  gpsd requires NTP time hinting support
+
 config BR2_GCC_VERSION_6_X
 	bool "gcc 6.x support removed"
 	select BR2_LEGACY
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
-- 
2.20.1
