From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 30 Aug 2010 22:52:01 +0200
Subject: [Buildroot] [git commit master 1/1] xstroke: fix dependencies
Message-ID: <20100830205310.19F2E8A324@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=40f8f3ff1d7582e1a2d92c707a57582e7dccbb54
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xstroke doesn't need docker, but it does need libXft/Xtst/Xpm.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    2 +-
 package/xstroke/Config.in  |    8 +++-----
 package/xstroke/xstroke.mk |    5 +----
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/CHANGES b/CHANGES
index d9607c2..904a92f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,7 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: atk
+	Updated/fixed packages: atk, xstroke
 
 2010.08-rc2, Released August 30th, 2010:
 
diff --git a/package/xstroke/Config.in b/package/xstroke/Config.in
index 3d68b3e..5589fe6 100644
--- a/package/xstroke/Config.in
+++ b/package/xstroke/Config.in
@@ -1,12 +1,10 @@
 config BR2_PACKAGE_XSTROKE
 	bool "xstroke"
 	depends on BR2_PACKAGE_XORG7
-	depends on BR2_USE_WCHAR # glib2
-	select BR2_PACKAGE_DOCKER
+	select BR2_PACKAGE_XLIB_LIBXFT
+	select BR2_PACKAGE_XLIB_LIBXTST
+	select BR2_PACKAGE_XLIB_LIBXPM
 	help
 	  Handwriting recognition for X
 
 	  http://avr32linux.org/twiki/pub/Main/XStroke
-
-comment "xstroke requires a toolchain with WCHAR support"
-	depends on BR2_PACKAGE_XORG7 && !BR2_USE_WCHAR
diff --git a/package/xstroke/xstroke.mk b/package/xstroke/xstroke.mk
index bfe66cc..920ed9c 100644
--- a/package/xstroke/xstroke.mk
+++ b/package/xstroke/xstroke.mk
@@ -6,12 +6,9 @@
 XSTROKE_VERSION = 0.6
 XSTROKE_SOURCE = xstroke-$(XSTROKE_VERSION).tar.gz
 XSTROKE_SITE = http://avr32linux.org/twiki/pub/Main/XStroke
-XSTROKE_AUTORECONF = NO
-XSTROKE_INSTALL_STAGING = NO
-XSTROKE_INSTALL_TARGET = YES
 XSTROKE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-XSTROKE_DEPENDENCIES = xserver_xorg-server
+XSTROKE_DEPENDENCIES = xlib_libXft xlib_libXtst xlib_libXpm
 
 $(eval $(call AUTOTARGETS,package,xstroke))
 
-- 
1.7.1
