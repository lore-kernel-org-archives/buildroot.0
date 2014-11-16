From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Nov 2014 16:39:07 +0100
Subject: [Buildroot] [PATCH] package/sdl_sound: do not enable -Werror,
	even in debug mode
Message-ID: <1416152347-760-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch to remove -Werror from configure.in.

We then need to autoreconf, but the package is missing the GNU-related
NEWS, AUTHORS and such files, so we also have to make if an automake
foreign package, too.

Fixes:
    http://autobuild.buildroot.net/results/6f5/6f5e1b782923d6e69e929466f0ddd3eeba28c6f1/
    http://autobuild.buildroot.net/results/c1b/c1b31dc37fe62cb6901edad02bf50d73072b7cf0/
    http://autobuild.buildroot.net/results/162/162e6d77e5812060001ea22faff99055aae3122a/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/sdl_sound/0001-no-Werror.patch | 25 +++++++++++++++++++++++++
 package/sdl_sound/sdl_sound.mk         |  3 +++
 2 files changed, 28 insertions(+)
 create mode 100644 package/sdl_sound/0001-no-Werror.patch

diff --git a/package/sdl_sound/0001-no-Werror.patch b/package/sdl_sound/0001-no-Werror.patch
new file mode 100644
index 0000000..9aa91c7
--- /dev/null
+++ b/package/sdl_sound/0001-no-Werror.patch
@@ -0,0 +1,25 @@
+configure: do not enable -Werror, even in debug mode
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN sdl_sound-1.0.3.orig/configure.in sdl_sound-1.0.3/configure.in
+--- sdl_sound-1.0.3.orig/configure.in	2008-04-20 22:33:43.000000000 +0200
++++ sdl_sound-1.0.3/configure.in	2014-11-16 16:19:24.460113401 +0100
+@@ -70,7 +70,7 @@
+   else
+     CFLAGS="-O0"
+   fi
+-  CFLAGS="$CFLAGS -Werror"
++  CFLAGS="$CFLAGS"
+   AC_DEFINE(DEBUG, 1, [Define for debug builds.])
+   AC_DEFINE(DEBUG_CHATTER, 1, [Define for debug build chattering.])
+ else
+diff -durN sdl_sound-1.0.3.orig/Makefile.am sdl_sound-1.0.3/Makefile.am
+--- sdl_sound-1.0.3.orig/Makefile.am	2008-04-17 20:02:22.000000000 +0200
++++ sdl_sound-1.0.3/Makefile.am	2014-11-16 16:36:20.671156805 +0100
+@@ -1,3 +1,5 @@
++AUTOMAKE_OPTIONS = foreign
++
+ lib_LTLIBRARIES = libSDL_sound.la
+ 
+ SUBDIRS = decoders . playsound
diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index 416f381..6180b42 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -12,6 +12,9 @@ SDL_SOUND_LICENSE_FILES = COPYING
 SDL_SOUND_INSTALL_STAGING = YES
 SDL_SOUND_DEPENDENCIES = sdl
 
+# Patch touching configure.in
+SDL_SOUND_AUTORECONF = YES
+
 ifneq ($(BR2_ENABLE_LOCALE),y)
 SDL_SOUND_DEPENDENCIES += libiconv
 endif
-- 
1.9.1
