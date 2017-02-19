From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Feb 2017 14:18:34 +0100
Subject: [Buildroot] [PATCH 2/2] package/cwiid: add optional dependency to
	bluez5_utils
In-Reply-To: <20170219131834.27844-1-bernd.kuhls@t-online.de>
References: <20170219131834.27844-1-bernd.kuhls@t-online.de>
Message-ID: <20170219131834.27844-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/cwiid/Config.in | 2 +-
 package/cwiid/cwiid.mk  | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
index 03b7dbbcd..69e54f5b7 100644
--- a/package/cwiid/Config.in
+++ b/package/cwiid/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_CWIID
 	depends on BR2_USE_WCHAR # bluez_utils -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez_utils -> dbus, alsa-lib, libglib2
 	depends on BR2_USE_MMU # bluez_utils -> dbus, libglib2
-	select BR2_PACKAGE_BLUEZ_UTILS
+	select BR2_PACKAGE_BLUEZ_UTILS if !BR2_PACKAGE_BLUEZ5_UTILS
 	help
 	  A collection of Linux tools written in C for interfacing to the
 	  Nintendo Wiimote.
diff --git a/package/cwiid/cwiid.mk b/package/cwiid/cwiid.mk
index 36450c17e..5bccebe87 100644
--- a/package/cwiid/cwiid.mk
+++ b/package/cwiid/cwiid.mk
@@ -12,13 +12,19 @@ CWIID_LICENSE_FILES = COPYING
 CWIID_AUTORECONF = YES
 CWIID_INSTALL_STAGING = YES
 
-CWIID_DEPENDENCIES = host-pkgconf host-bison host-flex bluez_utils
+CWIID_DEPENDENCIES = host-pkgconf host-bison host-flex
 
 # Disable python support. This disables the 2 following things:
 #   - wminput Python plugin support
 #   - cwiid Python module
 CWIID_CONF_OPTS = --without-python --disable-ldconfig
 
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
+CWIID_DEPENDENCIES += bluez5_utils
+else
+CWIID_DEPENDENCIES += bluez_utils
+endif
+
 ifeq ($(BR2_PACKAGE_CWIID_WMGUI),y)
 CWIID_DEPENDENCIES += libgtk2 libglib2
 CWIID_CONF_OPTS += --enable-wmgui
-- 
2.11.0
