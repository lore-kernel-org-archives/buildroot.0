From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 6 Feb 2019 15:40:10 +0100
Subject: [Buildroot] [git commit] package/sdl: remove qtopia video driver
 option
Message-ID: <20190206145216.C469F7F952@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a56bc5f4706bcf0674593cf05394df85eabb031
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The qtopia option uses the obsolete qt4 package, which we are about to
remove, to remove the qtopia option as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Arnout: move the enable-qtopia=no option to the beginning]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy      | 6 ++++++
 package/sdl/Config.in | 4 ----
 package/sdl/sdl.mk    | 9 ++-------
 3 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 5a330cada9..0eb69361cc 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2019.02"
 
+config BR2_PACKAGE_SDL_QTOPIA
+	bool "sdl qtopia video driver option removed"
+	select BR2_LEGACY
+	help
+	  The SDL QTopia video driver option was removed.
+
 config BR2_PACKAGE_PYTHON_PYQT
 	bool "python-pyqt package removed"
 	select BR2_LEGACY
diff --git a/package/sdl/Config.in b/package/sdl/Config.in
index 65ac8a2469..9f1e34de5c 100644
--- a/package/sdl/Config.in
+++ b/package/sdl/Config.in
@@ -17,10 +17,6 @@ config BR2_PACKAGE_SDL_DIRECTFB
 	bool "SDL DirectFB video driver"
 	depends on BR2_PACKAGE_DIRECTFB
 
-config BR2_PACKAGE_SDL_QTOPIA
-	bool "SDL Qtopia video driver"
-	depends on BR2_PACKAGE_QT
-
 config BR2_PACKAGE_SDL_X11
 	bool "SDL X11 video driver"
 	depends on BR2_PACKAGE_XORG7
diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 0a6a7de139..06564d610a 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -23,6 +23,8 @@ HOST_SDL_PRE_CONFIGURE_HOOKS += SDL_RUN_AUTOGEN
 SDL_DEPENDENCIES += host-automake host-autoconf host-libtool
 HOST_SDL_DEPENDENCIES += host-automake host-autoconf host-libtool
 
+SDL_CONF_OPTS += --enable-video-qtopia=no
+
 ifeq ($(BR2_PACKAGE_SDL_FBCON),y)
 SDL_CONF_OPTS += --enable-video-fbcon=yes
 else
@@ -37,13 +39,6 @@ else
 SDL_CONF_OPTS += --enable-video-directfb=no
 endif
 
-ifeq ($(BR2_PACKAGE_SDL_QTOPIA),y)
-SDL_CONF_OPTS += --enable-video-qtopia=yes
-SDL_DEPENDENCIES += qt
-else
-SDL_CONF_OPTS += --enable-video-qtopia=no
-endif
-
 ifeq ($(BR2_PACKAGE_SDL_X11),y)
 SDL_CONF_OPTS += --enable-video-x11=yes
 SDL_DEPENDENCIES += \
