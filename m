From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 23:04:27 +0200
Subject: [Buildroot] [git commit] package/vnstat: bump version to 2.4
Message-ID: <20190915205956.C89B78E6F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c9265dd79bd328e50d8ec11984ba7232b3ec1f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hash.

vnstat as of version 2.0 requires sqlite:
https://github.com/vergoh/vnstat/commit/bb24d7bd0f5e9051872f88a98f8b7906b4959aa7

Added --disable-extra-paths to _CONF_OPTS to prevent build error:
https://github.com/vergoh/vnstat/commit/fffc15d877edf37ff42ab057e1f30c70e6e99314

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vnstat/Config.in   | 1 +
 package/vnstat/vnstat.hash | 3 ++-
 package/vnstat/vnstat.mk   | 9 +++++----
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/vnstat/Config.in b/package/vnstat/Config.in
index bb68c14462..677ff575b5 100644
--- a/package/vnstat/Config.in
+++ b/package/vnstat/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_VNSTAT
 	bool "vnstat"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR # mbstowcs()
+	select BR2_PACKAGE_SQLITE
 	help
 	  vnStat is a console-based network traffic monitor that keeps a
 	  log of network traffic for the selected interface(s). It uses
diff --git a/package/vnstat/vnstat.hash b/package/vnstat/vnstat.hash
index 1f515290c2..94b4adc40b 100644
--- a/package/vnstat/vnstat.hash
+++ b/package/vnstat/vnstat.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	18e4c53576ca9e1ef2f0e063a6d83b0c44e3b1cf008560d658745df5c9aa7971	vnstat-1.17.tar.gz
+sha256 a0955999abd56d5463d257ffdccc9b1e9ad9ea504de81e64ba4c197f1245abaa  vnstat-2.4.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/vnstat/vnstat.mk b/package/vnstat/vnstat.mk
index 18fb319177..f0ef1cc69d 100644
--- a/package/vnstat/vnstat.mk
+++ b/package/vnstat/vnstat.mk
@@ -4,17 +4,18 @@
 #
 ################################################################################
 
-VNSTAT_VERSION = 1.17
+VNSTAT_VERSION = 2.4
 VNSTAT_SITE = http://humdi.net/vnstat
 VNSTAT_LICENSE = GPL-2.0
 VNSTAT_LICENSE_FILES = COPYING
-VNSTAT_DEPENDENCIES = host-pkgconf
+VNSTAT_DEPENDENCIES = host-pkgconf sqlite
+VNSTAT_CONF_OPTS = --disable-extra-paths
 
 ifeq ($(BR2_PACKAGE_GD)$(BR2_PACKAGE_LIBPNG),yy)
 VNSTAT_DEPENDENCIES += gd
-VNSTAT_CONF_OPTS = --enable-image-output
+VNSTAT_CONF_OPTS += --enable-image-output
 else
-VNSTAT_CONF_OPTS = --disable-image-output
+VNSTAT_CONF_OPTS += --disable-image-output
 endif
 
 $(eval $(autotools-package))
