From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 27 Apr 2020 22:33:38 -0600
Subject: [Buildroot] [PATCH 1/1] package/wlroots: bump to version 0.10.1
Message-ID: <20200428043338.117932-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wlroots dropped RDP backend support in:
https://github.com/swaywm/wlroots/commit/ebdbe177d62d3c8bab04f77b86326804ff185bef

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Config.in.legacy             | 6 ++++++
 package/wlroots/Config.in    | 6 ------
 package/wlroots/wlroots.hash | 6 +++---
 package/wlroots/wlroots.mk   | 9 +--------
 4 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c92023310d..20e7f99bb6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2020.05"
 
+config BR2_PACKAGE_WLROOTS_RDP
+	bool "rdp support in wlroots was removed"
+	select BR2_LEGACY
+	help
+	  Support for rdp was removed by wlroots.
+
 config BR2_PACKAGE_COLLECTD_LVM
 	bool "lvm support in collectd was removed"
 	select BR2_LEGACY
diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
index 37261d0ca6..eb4c4725ac 100644
--- a/package/wlroots/Config.in
+++ b/package/wlroots/Config.in
@@ -33,12 +33,6 @@ config BR2_PACKAGE_WLROOTS
 
 if BR2_PACKAGE_WLROOTS
 
-config BR2_PACKAGE_WLROOTS_RDP
-	bool "RDP backend"
-	depends on BR2_PACKAGE_FREERDP
-	help
-	  Support Wayland sessions served using the RDP protocol
-
 config BR2_PACKAGE_WLROOTS_X11
 	bool "X11 backend"
 	depends on BR2_PACKAGE_XORG7
diff --git a/package/wlroots/wlroots.hash b/package/wlroots/wlroots.hash
index 6056a81ba5..20f7313bba 100644
--- a/package/wlroots/wlroots.hash
+++ b/package/wlroots/wlroots.hash
@@ -1,5 +1,5 @@
-# Generated locally, after checking https://github.com/swaywm/wlroots/releases/download/0.8.1/wlroots-0.8.1.tar.gz.sig
-sha256 202b86e0e21699b6660bbda56afc2e3358db7252f83ff69c89f01926b4900d98  wlroots-0.8.1.tar.gz
+# Generated locally, after checking https://github.com/swaywm/wlroots/releases/download/0.10.1/wlroots-0.10.1.tar.gz.sig
+sha256  b84baefbaff7bb04b3d2c43cbacef1a433e2cd65111f8fbf4bfc5faaa4b34b08  wlroots-0.10.1.tar.gz
 
 # Hashes for license files:
-sha256 ffd3737a478b83a8b51b42757d3bf909ef36694508355879722e11fc1fa6736b  LICENSE
+sha256  ffd3737a478b83a8b51b42757d3bf909ef36694508355879722e11fc1fa6736b  LICENSE
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index 52bc4c30e8..136dc2bfcd 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WLROOTS_VERSION = 0.8.1
+WLROOTS_VERSION = 0.10.1
 WLROOTS_SITE = https://github.com/swaywm/wlroots/releases/download/$(WLROOTS_VERSION)
 WLROOTS_LICENSE = MIT
 WLROOTS_INSTALL_STAGING = YES
@@ -44,13 +44,6 @@ else
 WLROOTS_CONF_OPTS += -Dlogind=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_WLROOTS_RDP),y)
-WLROOTS_CONF_OPTS += -Dfreerdp=enabled
-WLROOTS_DEPENDENCIES += freerdp
-else
-WLROOTS_CONF_OPTS += -Dfreerdp=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_WLROOTS_X11),y)
 WLROOTS_CONF_OPTS += -Dx11-backend=enabled
 WLROOTS_DEPENDENCIES += xlib_libX11
-- 
2.20.1
