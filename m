From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 19:58:29 +0100
Subject: [Buildroot] [git commit] package/xbmc-pvr-addons: rename to
	'kodi-pvr-addons'
Message-ID: <20141227185849.7234580446@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b3df2a353fdc06d0e913766bd1764e69de9749ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following the rename of the XBMC project to Kodi, this commit renames
the xbmc-pvr-addons package to kodi-pvr-addons, and adds the
appropriate Config.in.legacy handling.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                           |    7 +++++
 package/kodi-pvr-addons/Config.in          |    6 +++++
 package/kodi-pvr-addons/kodi-pvr-addons.mk |   34 ++++++++++++++++++++++++++++
 package/kodi/Config.in                     |    2 +-
 package/xbmc-pvr-addons/Config.in          |    6 -----
 package/xbmc-pvr-addons/xbmc-pvr-addons.mk |   34 ----------------------------
 6 files changed, 48 insertions(+), 41 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a4b5ad8..653eeac 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -102,6 +102,13 @@ endif
 
 comment "Legacy options removed in 2015.02"
 
+config BR2_PACKAGE_XBMC_PVR_ADDONS
+	bool "xbmc options have been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_KODI_PVR_ADDONS
+	help
+	  The XBMC media center project was renamed to Kodi entertainment center
+
 config BR2_PACKAGE_XBMC
 	bool "xbmc options have been renamed"
 	select BR2_LEGACY
diff --git a/package/kodi-pvr-addons/Config.in b/package/kodi-pvr-addons/Config.in
new file mode 100644
index 0000000..80916c7
--- /dev/null
+++ b/package/kodi-pvr-addons/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_KODI_PVR_ADDONS
+	bool "kodi-pvr-addons"
+	help
+	  A collection of PVR backend addons for Kodi
+
+	  https://github.com/opdenkamp/xbmc-pvr-addons
diff --git a/package/kodi-pvr-addons/kodi-pvr-addons.mk b/package/kodi-pvr-addons/kodi-pvr-addons.mk
new file mode 100644
index 0000000..5e70bb3
--- /dev/null
+++ b/package/kodi-pvr-addons/kodi-pvr-addons.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# kodi-pvr-addons
+#
+################################################################################
+
+# This cset is on the branch 'gotham'
+# When Kodi is updated, then this should be updated to the corresponding branch
+KODI_PVR_ADDONS_VERSION = be12a8da2072e9c3ddad54892df2f85b759d4e9a
+KODI_PVR_ADDONS_SITE = $(call github,opdenkamp,xbmc-pvr-addons,$(KODI_PVR_ADDONS_VERSION))
+KODI_PVR_ADDONS_LICENSE = GPLv3+
+KODI_PVR_ADDONS_LICENSE_FILES = COPYING
+
+# There's no ./configure in the git tree, we need to generate it
+KODI_PVR_ADDONS_AUTORECONF = YES
+
+KODI_PVR_ADDONS_DEPENDENCIES = boost zlib
+# This really is a runtime dependency, but we need KODI to be installed
+# first, since we'll install files in KODI's directories _after_ KODI has
+# installed its own files
+KODI_PVR_ADDONS_DEPENDENCIES += kodi
+
+KODI_PVR_ADDONS_CONF_OPTS = \
+	--enable-release \
+	--enable-addons-with-dependencies
+
+ifeq ($(BR2_PACKAGE_MYSQL),y)
+KODI_PVR_ADDONS_CONF_OPTS += --enable-mysql
+KODI_PVR_ADDONS_DEPENDENCIES += mysql
+else
+KODI_PVR_ADDONS_CONF_OPTS += --disable-mysql
+endif
+
+$(eval $(autotools-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 2bd43b6..d1286b7 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -238,6 +238,6 @@ config BR2_PACKAGE_KODI_WAVPACK
 comment "Kodi addons"
 
 source "package/xbmc-addon-xvdr/Config.in"
-source "package/xbmc-pvr-addons/Config.in"
+source "package/kodi-pvr-addons/Config.in"
 
 endif # BR2_PACKAGE_KODI
diff --git a/package/xbmc-pvr-addons/Config.in b/package/xbmc-pvr-addons/Config.in
deleted file mode 100644
index 27f20e3..0000000
--- a/package/xbmc-pvr-addons/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XBMC_PVR_ADDONS
-	bool "xbmc-pvr-addons"
-	help
-	  A collection of PVR backend addons for XBMC.
-
-	  https://github.com/opdenkamp/xbmc-pvr-addons
diff --git a/package/xbmc-pvr-addons/xbmc-pvr-addons.mk b/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
deleted file mode 100644
index 4410153..0000000
--- a/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
+++ /dev/null
@@ -1,34 +0,0 @@
-################################################################################
-#
-# xbmc-pvr-addons
-#
-################################################################################
-
-# This cset is on the branch 'gotham'
-# When XBMC is updated, then this should be updated to the corresponding branch
-XBMC_PVR_ADDONS_VERSION = be12a8da2072e9c3ddad54892df2f85b759d4e9a
-XBMC_PVR_ADDONS_SITE = $(call github,opdenkamp,xbmc-pvr-addons,$(XBMC_PVR_ADDONS_VERSION))
-XBMC_PVR_ADDONS_LICENSE = GPLv3+
-XBMC_PVR_ADDONS_LICENSE_FILES = COPYING
-
-# There's no ./configure in the git tree, we need to generate it
-XBMC_PVR_ADDONS_AUTORECONF = YES
-
-XBMC_PVR_ADDONS_DEPENDENCIES = boost zlib
-# This really is a runtime dependency, but we need XBMC to be installed
-# first, since we'll install files in XBMC's directories _after_ XBMC has
-# installed its own files
-XBMC_PVR_ADDONS_DEPENDENCIES += kodi
-
-XBMC_PVR_ADDONS_CONF_OPTS = \
-	--enable-release \
-	--enable-addons-with-dependencies
-
-ifeq ($(BR2_PACKAGE_MYSQL),y)
-XBMC_PVR_ADDONS_CONF_OPTS += --enable-mysql
-XBMC_PVR_ADDONS_DEPENDENCIES += mysql
-else
-XBMC_PVR_ADDONS_CONF_OPTS += --disable-mysql
-endif
-
-$(eval $(autotools-package))
