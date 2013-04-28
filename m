From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 28 Apr 2013 22:32:39 +0200
Subject: [Buildroot] [git commit] sdl: fix directfb configure check
Message-ID: <20130428205746.DEB3D9B8AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1655f3c5b735b3dad75df1665b47d309fdf3afcb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure script nicely supports a preconfigured directfb-config
(using ac_cv_path_DIRECTFBCONFIG), except for when it checks the directfb
version where it simply uses whatever directfb-config is in the path,
breaking the build when this isn't available / recent enough.

Fix is to use the correct one instead. As SDL doesn't autoreconf cleanly,
also patch the generated configure script.

Finally move the ac_cv_path_DIRECTFBCONFIG setting under the directfb
conditional as it is only needed there.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sdl/sdl-use-correct-directfb-config.patch |   40 +++++++++++++++++++++
 package/sdl/sdl.mk                                |    2 +-
 2 files changed, 41 insertions(+), 1 deletions(-)

diff --git a/package/sdl/sdl-use-correct-directfb-config.patch b/package/sdl/sdl-use-correct-directfb-config.patch
new file mode 100644
index 0000000..2250790
--- /dev/null
+++ b/package/sdl/sdl-use-correct-directfb-config.patch
@@ -0,0 +1,40 @@
+[PATCH] configure.in: use correct directfb-config in version check
+
+The configure script has just checked for the correct directfb-config
+script, so also use it for the version check instead of whatever
+might be in the path.
+
+Also patch the generated configure, as it doesn't cleanly autoreconf.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ configure    |    2 +-
+ configure.in |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+Index: SDL-1.2.15/configure.in
+===================================================================
+--- SDL-1.2.15.orig/configure.in
++++ SDL-1.2.15/configure.in
+@@ -1276,7 +1276,7 @@
+         else
+             set -- `echo $DIRECTFB_REQUIRED_VERSION | sed 's/\./ /g'`
+             NEED_VERSION=`expr $1 \* 10000 + $2 \* 100 + $3`
+-            set -- `directfb-config --version | sed 's/\./ /g'`
++            set -- `$DIRECTFBCONFIG --version | sed 's/\./ /g'`
+             HAVE_VERSION=`expr $1 \* 10000 + $2 \* 100 + $3`
+             if test $HAVE_VERSION -ge $NEED_VERSION; then
+                 DIRECTFB_CFLAGS=`$DIRECTFBCONFIG --cflags`
+Index: SDL-1.2.15/configure
+===================================================================
+--- SDL-1.2.15.orig/configure
++++ SDL-1.2.15/configure
+@@ -24958,7 +24958,7 @@
+         else
+             set -- `echo $DIRECTFB_REQUIRED_VERSION | sed 's/\./ /g'`
+             NEED_VERSION=`expr $1 \* 10000 + $2 \* 100 + $3`
+-            set -- `directfb-config --version | sed 's/\./ /g'`
++            set -- `$DIRECTFBCONFIG --version | sed 's/\./ /g'`
+             HAVE_VERSION=`expr $1 \* 10000 + $2 \* 100 + $3`
+             if test $HAVE_VERSION -ge $NEED_VERSION; then
+                 DIRECTFB_CFLAGS=`$DIRECTFBCONFIG --cflags`
diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index fb47c4d..59576fb 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -8,7 +8,6 @@ SDL_VERSION = 1.2.15
 SDL_SOURCE = SDL-$(SDL_VERSION).tar.gz
 SDL_SITE = http://www.libsdl.org/release
 SDL_INSTALL_STAGING = YES
-SDL_CONF_ENV = ac_cv_path_DIRECTFBCONFIG=$(STAGING_DIR)/usr/bin/directfb-config
 
 ifeq ($(BR2_PACKAGE_SDL_FBCON),y)
 SDL_CONF_OPT+=--enable-video-fbcon=yes
@@ -19,6 +18,7 @@ endif
 ifeq ($(BR2_PACKAGE_SDL_DIRECTFB),y)
 SDL_DEPENDENCIES += directfb
 SDL_CONF_OPT+=--enable-video-directfb=yes
+SDL_CONF_ENV = ac_cv_path_DIRECTFBCONFIG=$(STAGING_DIR)/usr/bin/directfb-config
 else
 SDL_CONF_OPT=--enable-video-directfb=no
 endif
