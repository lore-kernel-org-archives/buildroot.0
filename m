From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 11 Jan 2020 10:22:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/cwiid: add bluez5_utils support
Message-ID: <20200111092215.419309-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cwiid/Config.in | 2 +-
 package/cwiid/cwiid.mk  | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
index 7ee8117355..c66ffe1aee 100644
--- a/package/cwiid/Config.in
+++ b/package/cwiid/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_CWIID
 	depends on BR2_USE_WCHAR # bluez_utils -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez_utils -> dbus, alsa-lib, libglib2
 	depends on BR2_USE_MMU # bluez_utils -> dbus, libglib2
-	select BR2_PACKAGE_BLUEZ_UTILS
+	select BR2_PACKAGE_BLUEZ_UTILS if !BR2_PACKAGE_BLUEZ5_UTILS
 	help
 	  A collection of Linux tools written in C for interfacing to
 	  the Nintendo Wiimote.
diff --git a/package/cwiid/cwiid.mk b/package/cwiid/cwiid.mk
index c092e401df..4f8f091909 100644
--- a/package/cwiid/cwiid.mk
+++ b/package/cwiid/cwiid.mk
@@ -12,7 +12,11 @@ CWIID_LICENSE_FILES = COPYING
 CWIID_AUTORECONF = YES
 CWIID_INSTALL_STAGING = YES
 
-CWIID_DEPENDENCIES = host-pkgconf host-bison host-flex bluez_utils
+CWIID_DEPENDENCIES = \
+	host-pkgconf \
+	host-bison \
+	host-flex \
+	$(if $(BR2_PACKAGE_BLUEZ_UTILS),bluez_utils,bluez5_utils)
 
 # Disable python support. This disables the 2 following things:
 #   - wminput Python plugin support
-- 
2.24.1
