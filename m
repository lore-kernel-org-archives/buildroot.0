From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Apr 2015 20:35:57 +0200
Subject: [Buildroot] [PATCH/RFC 04/27] package/kodi-pvr-addons: Split into
	addon-specific packages
In-Reply-To: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427913380-14808-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-addons/Config.in          |    6 ------
 package/kodi-pvr-addons/kodi-pvr-addons.mk |   27 ---------------------------
 package/kodi/Config.in                     |   10 +++++++++-
 3 files changed, 9 insertions(+), 34 deletions(-)
 delete mode 100644 package/kodi-pvr-addons/Config.in
 delete mode 100644 package/kodi-pvr-addons/kodi-pvr-addons.mk

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
index 0abc228..80bba83 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -256,9 +256,17 @@ source "package/kodi-audioencoder-wav/Config.in"
 
 endif # BR2_PACKAGE_KODI_OPTICALDRIVE
 
+config BR2_PACKAGE_KODI_PVR_ADDONS
+	bool "kodi-pvr-addons"
+	help
+	  A collection of PVR backend addons for Kodi
+
+if BR2_PACKAGE_KODI_PVR_ADDONS
+
 comment "Kodi PVR addons"
 
 source "package/kodi-addon-xvdr/Config.in"
-source "package/kodi-pvr-addons/Config.in"
+
+endif # BR2_PACKAGE_KODI_PVR_ADDONS
 
 endif # BR2_PACKAGE_KODI
-- 
1.7.10.4
