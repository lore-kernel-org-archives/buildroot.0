From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 May 2016 16:04:49 +0200
Subject: [Buildroot] [git commit] package/kodi-screensaver-rsxs: needs
	xlib_libXmu
Message-ID: <20160511140632.6439F81ED5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=51ad7ed67636556b13653f0a094c3cd829970375
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes

/home/bernd/buildroot/output/build/kodi-screensaver-rsxs-195e0ec3fbbcb2ee2012cd560e42d05167f0f259/lib/rsxs-1.0/src/common.cc:42:27:
 fatal error: X11/Xmu/StdCmap.h: No such file or directory

X11/Xmu/StdCmap.h is included here:
https://github.com/notspiff/screensavers.rsxs/blob/master/lib/rsxs-1.0/src/common.cc#L48

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-screensaver-rsxs/Config.in                | 6 ++++--
 package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/kodi-screensaver-rsxs/Config.in b/package/kodi-screensaver-rsxs/Config.in
index b489303..0698c7d 100644
--- a/package/kodi-screensaver-rsxs/Config.in
+++ b/package/kodi-screensaver-rsxs/Config.in
@@ -1,10 +1,12 @@
 config BR2_PACKAGE_KODI_SCREENSAVER_RSXS
 	bool "kodi-screensaver-rsxs"
 	depends on BR2_PACKAGE_KODI_GL # libglu
+	depends on BR2_PACKAGE_XORG7 # xlib_libXmu
+	select BR2_PACKAGE_XLIB_LIBXMU
 	help
 	  RSXS screensaver add-ons for Kodi
 
 	  https://github.com/notspiff/screensavers.rsxs
 
-comment "kodi-screensaver-rsxs needs OpenGL"
-	depends on !BR2_PACKAGE_KODI_GL
+comment "kodi-screensaver-rsxs depends on X.org and needs OpenGL"
+	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
index c76e9da..7df6c22 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
@@ -9,6 +9,6 @@ KODI_SCREENSAVER_RSXS_SITE = $(call github,notspiff,screensavers.rsxs,$(KODI_SCR
 KODI_SCREENSAVER_RSXS_LICENSE = GPLv3
 KODI_SCREENSAVER_RSXS_LICENSE_FILES = lib/rsxs-1.0/COPYING
 
-KODI_SCREENSAVER_RSXS_DEPENDENCIES = kodi
+KODI_SCREENSAVER_RSXS_DEPENDENCIES = kodi xlib_libXmu
 
 $(eval $(cmake-package))
