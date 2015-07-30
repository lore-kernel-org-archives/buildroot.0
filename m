From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:29:24 +0200
Subject: [Buildroot] [git commit branch/next] package/kodi-pvr-addons:
	Prepare to split into addon-specific packages
Message-ID: <20150808105650.ADCB981830@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d9f1a92885b93c83667b0f563c2b58ca95152a5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The PVR addons formerly being part of the xbmc-pvr-addons package were
split into seperate packages being hosted on https://github.com/kodi-pvr

This patch removes the old PVR addon package to prepare for the new
PVR addon packages being added as subsequent patches.

[Thomas: keep alphabetic ordering for addons, as noticed by Yann
E. Morin.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                           |    6 ++++++
 package/kodi-pvr-addons/Config.in          |    6 ------
 package/kodi-pvr-addons/kodi-pvr-addons.mk |   27 ---------------------------
 package/kodi/Config.in                     |    7 +++----
 4 files changed, 9 insertions(+), 37 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 08caa8b..e52a813 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,12 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.08"
 
+config BR2_PACKAGE_KODI_PVR_ADDONS
+	bool "Kodi PVR addon was split"
+	select BR2_LEGACY
+	help
+	  Kodi PVR addon was split into seperate modules
+
 config BR2_BINUTILS_VERSION_2_23_2
 	bool "binutils 2.23 option renamed"
 	select BR2_LEGACY
diff --git a/package/kodi-pvr-addons/Config.in b/package/kodi-pvr-addons/Config.in
deleted file mode 100644
index 80916c7..0000000
--- a/package/kodi-pvr-addons/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_KODI_PVR_ADDONS
-	bool "kodi-pvr-addons"
-	help
-	  A collection of PVR backend addons for Kodi
-
-	  https://github.com/opdenkamp/xbmc-pvr-addons
diff --git a/package/kodi-pvr-addons/kodi-pvr-addons.mk b/package/kodi-pvr-addons/kodi-pvr-addons.mk
deleted file mode 100644
index 1a09265..0000000
--- a/package/kodi-pvr-addons/kodi-pvr-addons.mk
+++ /dev/null
@@ -1,27 +0,0 @@
-################################################################################
-#
-# kodi-pvr-addons
-#
-################################################################################
-
-# This cset is on the branch 'helix'
-# When Kodi is updated, this should be updated to the corresponding branch
-KODI_PVR_ADDONS_VERSION = 4854fbe9dc0499ca8d1e10e8c18e329d3eb48814
-KODI_PVR_ADDONS_SITE = $(call github,opdenkamp,xbmc-pvr-addons,$(KODI_PVR_ADDONS_VERSION))
-KODI_PVR_ADDONS_LICENSE = GPLv3+
-KODI_PVR_ADDONS_LICENSE_FILES = COPYING
-
-# There's no ./configure in the git tree, we need to generate it
-KODI_PVR_ADDONS_AUTORECONF = YES
-
-KODI_PVR_ADDONS_DEPENDENCIES = zlib
-# This really is a runtime dependency, but we need KODI to be installed
-# first, since we'll install files in KODI's directories _after_ KODI has
-# installed its own files
-KODI_PVR_ADDONS_DEPENDENCIES += kodi
-
-KODI_PVR_ADDONS_CONF_OPTS = \
-	--enable-release \
-	--enable-addons-with-dependencies
-
-$(eval $(autotools-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 6ec2463..52ae04e 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -254,9 +254,8 @@ menu "Audio encoder addons"
 	source "package/kodi-audioencoder-wav/Config.in"
 endmenu
 
-comment "Kodi PVR addons"
-
-source "package/kodi-addon-xvdr/Config.in"
-source "package/kodi-pvr-addons/Config.in"
+menu "PVR addons"
+	source "package/kodi-addon-xvdr/Config.in"
+endmenu
 
 endif # BR2_PACKAGE_KODI
