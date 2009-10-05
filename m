From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 5 Oct 2009 11:10:30 +0200
Subject: [Buildroot] [git commit master] wpa_supplicant: adjust make
	environment for pkg-config call
Message-ID: <20091005091049.A490577785@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=656ad7347ef6fa50496b9bcafae604148d1aacc5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In case that wpa_supplicant is configured with DBus interface,
it calls pkg-config to find the dbus headers and libraries.
Adjust the make environment so that it will use the right
pkg-config search paths.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.6.3.3
