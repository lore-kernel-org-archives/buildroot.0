From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon,  5 Oct 2009 10:30:31 +0200
Subject: [Buildroot] [PATCH] wpa_supplicant: adjust make environment for
	pkg-config call
Message-ID: <1254731431-8430-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In case that wpa_supplicant is configured with DBus interface,
it calls pkg-config to find the dbus headers and libraries.
Adjust the make environment so that it will use the right
pkg-config search paths.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/wpa_supplicant/wpa_supplicant.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 4195b1c..5d78573 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -19,7 +19,10 @@ ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_OPENSSL),y)
 	WPA_SUPPLICANT_DEPENDENCIES += openssl
 endif
 ifeq ($(BR2_PACKAGE_DBUS),y)
-	WPA_SUPPLICANT_DEPENDENCIES += dbus
+	WPA_SUPPLICANT_DEPENDENCIES += host-pkgconfig dbus
+	WPA_SUPPLICANT_MAKE_ENV = \
+		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)"	\
+		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
 endif
 
 $(eval $(call AUTOTARGETS,package,wpa_supplicant))
-- 
1.6.0.4
