From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 22:38:37 +0100
Subject: [Buildroot] [git commit] Revert "package/cwiid: add optional
	dependency to bluez5_utils"
Message-ID: <20170301213905.69B2780DE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=331ee5b7b0de1c8841dd2ea198aedd54f9b0eaf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit d4c4c259d25a8f2c5c2e2a5736609ba285fdd018. It was
mistakenly committed and pushed: it causes Kconfig circular
dependencies, so it cannot be applied as-is.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cwiid/Config.in | 2 +-
 package/cwiid/cwiid.mk  | 8 +-------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
index 69e54f5..03b7dbb 100644
--- a/package/cwiid/Config.in
+++ b/package/cwiid/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_CWIID
 	depends on BR2_USE_WCHAR # bluez_utils -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez_utils -> dbus, alsa-lib, libglib2
 	depends on BR2_USE_MMU # bluez_utils -> dbus, libglib2
-	select BR2_PACKAGE_BLUEZ_UTILS if !BR2_PACKAGE_BLUEZ5_UTILS
+	select BR2_PACKAGE_BLUEZ_UTILS
 	help
 	  A collection of Linux tools written in C for interfacing to the
 	  Nintendo Wiimote.
diff --git a/package/cwiid/cwiid.mk b/package/cwiid/cwiid.mk
index 5bccebe..36450c1 100644
--- a/package/cwiid/cwiid.mk
+++ b/package/cwiid/cwiid.mk
@@ -12,19 +12,13 @@ CWIID_LICENSE_FILES = COPYING
 CWIID_AUTORECONF = YES
 CWIID_INSTALL_STAGING = YES
 
-CWIID_DEPENDENCIES = host-pkgconf host-bison host-flex
+CWIID_DEPENDENCIES = host-pkgconf host-bison host-flex bluez_utils
 
 # Disable python support. This disables the 2 following things:
 #   - wminput Python plugin support
 #   - cwiid Python module
 CWIID_CONF_OPTS = --without-python --disable-ldconfig
 
-ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
-CWIID_DEPENDENCIES += bluez5_utils
-else
-CWIID_DEPENDENCIES += bluez_utils
-endif
-
 ifeq ($(BR2_PACKAGE_CWIID_WMGUI),y)
 CWIID_DEPENDENCIES += libgtk2 libglib2
 CWIID_CONF_OPTS += --enable-wmgui
