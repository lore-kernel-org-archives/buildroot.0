From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2021 09:58:39 +0100
Subject: [Buildroot] [PATCH/next 20/54] package/kodi-pvr-iptvsimple: bump
 version to 7.4.2-Matrix
In-Reply-To: <20210220085913.888324-1-bernd.kuhls@t-online.de>
References: <20210220085913.888324-1-bernd.kuhls@t-online.de>
Message-ID: <20210220085913.888324-21-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch dependency to kodi after upstream removed the dependency to
kodi-platform:
https://github.com/kodi-pvr/pvr.iptvsimple/commit/61fa5d222bc5633d7b1e1c231c089b61fbb0a8c5
https://github.com/kodi-pvr/pvr.iptvsimple/commit/2d9c01439301292992b6e32c578c222b9eddea69

Switch from rapidxml to pugixml:
https://github.com/kodi-pvr/pvr.iptvsimple/commit/b4e292f11c7c3f40b8c7ff18f28f7b2e149c6bee
https://github.com/kodi-pvr/pvr.iptvsimple/commit/6325b2a958888e88809d7d6036610198cb2d3b09

Add missing dependency to zlib.

Added runtime dependencies to inputstream addons:
https://github.com/kodi-pvr/pvr.iptvsimple/commit/af9a1b6933664ef24d407051f20985682881544d
https://github.com/kodi-pvr/pvr.iptvsimple/commit/46bd18fe84227e59b2d3378b17fafb87bcd87f33

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-iptvsimple/Config.in                | 10 ++++++++--
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash |  4 ++--
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk   |  6 +++---
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/package/kodi-pvr-iptvsimple/Config.in b/package/kodi-pvr-iptvsimple/Config.in
index 94fc1f0602..00f4d115bf 100644
--- a/package/kodi-pvr-iptvsimple/Config.in
+++ b/package/kodi-pvr-iptvsimple/Config.in
@@ -1,7 +1,13 @@
 config BR2_PACKAGE_KODI_PVR_IPTVSIMPLE
 	bool "kodi-pvr-iptvsimple"
-	select BR2_PACKAGE_KODI_PLATFORM
-	select BR2_PACKAGE_RAPIDXML
+	# kodi-inputstream-adaptive
+	depends on BR2_aarch64 || BR2_arm || BR2_i386 || BR2_mipsel \
+		|| BR2_mips64el || BR2_x86_64
+	select BR2_PACKAGE_KODI_INPUTSTREAM_ADAPTIVE # runtime
+	select BR2_PACKAGE_KODI_INPUTSTREAM_FFMPEGDIRECT # runtime
+	select BR2_PACKAGE_KODI_INPUTSTREAM_RTMP # runtime
+	select BR2_PACKAGE_PUGIXML
+	select BR2_PACKAGE_ZLIB
 	help
 	  IPTV Live TV and Radio PVR client addon for Kodi
 
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
index f90ff8b737..a5183b055d 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  906d023b4713be558445902ff703ae65e03733d47dd7d0e1b16d02c05679c7ed  kodi-pvr-iptvsimple-3.10.0-Leia.tar.gz
-sha256  50e33ec3cddb75e6c5c5eb1b3d38cc0adee7dec71d7244925106d4a2c4d5e31d  debian/copyright
+sha256  d583ae9904879ccc3e0c00dbda51eb3d36c67587d427a37963dd3750e013e90d  kodi-pvr-iptvsimple-7.4.2-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index 0b31024556..0e19d6951d 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_IPTVSIMPLE_VERSION = 3.10.0-Leia
+KODI_PVR_IPTVSIMPLE_VERSION = 7.4.2-Matrix
 KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
 KODI_PVR_IPTVSIMPLE_LICENSE = GPL-2.0+
-KODI_PVR_IPTVSIMPLE_LICENSE_FILES = debian/copyright
-KODI_PVR_IPTVSIMPLE_DEPENDENCIES = kodi-platform rapidxml
+KODI_PVR_IPTVSIMPLE_LICENSE_FILES = LICENSE.md
+KODI_PVR_IPTVSIMPLE_DEPENDENCIES = kodi pugixml zlib
 
 $(eval $(cmake-package))
-- 
2.29.2
