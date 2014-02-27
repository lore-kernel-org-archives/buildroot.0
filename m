From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Thu, 27 Feb 2014 17:25:07 -0500
Subject: [Buildroot] [PATCH v2] libdrm: bump to 2.4.52 and remove useless
	dependencies on libpciaccess
Message-ID: <1393539908-14365-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the version 2.4.32, libdrm no longer requires dependencies on
the libpciaccess unless for the intel-dri.

For more information :
http://cgit.freedesktop.org/mesa/drm/commit/?id=be30d350b64c1a83473a9ffbedf8e2c680a65fcd

Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> (PATCH v1)
---
Changes v1 -> v2:
  - bump to version 2.4.52
---
 package/libdrm/Config.in | 3 ---
 package/libdrm/libdrm.mk | 5 +----
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 205f47c..4ac4e52 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -23,21 +23,18 @@ config BR2_PACKAGE_LIBDRM_INTEL
 config BR2_PACKAGE_LIBDRM_RADEON
 	bool "radeon"
 	select BR2_PACKAGE_LIBATOMIC_OPS
-	select BR2_PACKAGE_XLIB_LIBPCIACCESS
 	depends on BR2_i386 || BR2_x86_64
 	help
 	  install AMD/ATI graphics driver
 
 config BR2_PACKAGE_LIBDRM_NOUVEAU
 	bool "nouveau"
-	select BR2_PACKAGE_XLIB_LIBPCIACCESS
 	depends on BR2_i386 || BR2_x86_64
 	help
 	  install Nvidia graphics driver
 
 config BR2_PACKAGE_LIBDRM_VMWGFX
 	bool "vmwgfx"
-	select BR2_PACKAGE_XLIB_LIBPCIACCESS
 	depends on BR2_i386 || BR2_x86_64
 	help
 	  installs Vmware graphics driver
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index f5efaf1..71fce98 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.46
+LIBDRM_VERSION = 2.4.52
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm/
 LIBDRM_LICENSE = MIT
@@ -28,21 +28,18 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_RADEON),y)
 LIBDRM_CONF_OPT += --enable-radeon
-LIBDRM_DEPENDENCIES += xlib_libpciaccess
 else
 LIBDRM_CONF_OPT += --disable-radeon
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_NOUVEAU),y)
 LIBDRM_CONF_OPT += --enable-nouveau
-LIBDRM_DEPENDENCIES += xlib_libpciaccess
 else
 LIBDRM_CONF_OPT += --disable-nouveau
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_VMWGFX),y)
 LIBDRM_CONF_OPT += --enable-vmwgfx
-LIBDRM_DEPENDENCIES += xlib_libpciaccess
 else
 LIBDRM_CONF_OPT += --disable-vmwgfx
 endif
-- 
1.9.0
