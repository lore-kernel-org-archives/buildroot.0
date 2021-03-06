From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 22:15:35 +0100
Subject: [Buildroot] [git commit] package/kodi-pvr-iptvsimple: bump version
 to 7.4.3-Matrix
Message-ID: <20210308072138.371908893D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8890d168c45d3f084ee14404d34541d4439b0e5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
index f90ff8b737..24f8f377f7 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  906d023b4713be558445902ff703ae65e03733d47dd7d0e1b16d02c05679c7ed  kodi-pvr-iptvsimple-3.10.0-Leia.tar.gz
-sha256  50e33ec3cddb75e6c5c5eb1b3d38cc0adee7dec71d7244925106d4a2c4d5e31d  debian/copyright
+sha256  70afe4e0c8df6c00c155cff0cc1e6bcf2d2a2de07a3f77367b4ad76ba7442b22  kodi-pvr-iptvsimple-7.4.3-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index 0b31024556..ca4b2ff604 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_IPTVSIMPLE_VERSION = 3.10.0-Leia
+KODI_PVR_IPTVSIMPLE_VERSION = 7.4.3-Matrix
 KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
 KODI_PVR_IPTVSIMPLE_LICENSE = GPL-2.0+
-KODI_PVR_IPTVSIMPLE_LICENSE_FILES = debian/copyright
-KODI_PVR_IPTVSIMPLE_DEPENDENCIES = kodi-platform rapidxml
+KODI_PVR_IPTVSIMPLE_LICENSE_FILES = LICENSE.md
+KODI_PVR_IPTVSIMPLE_DEPENDENCIES = kodi pugixml zlib
 
 $(eval $(cmake-package))
