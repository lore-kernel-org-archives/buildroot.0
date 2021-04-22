From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Apr 2021 21:21:51 +0200
Subject: [Buildroot] [git commit] package/sdl_mixer: fix static build with
 tremor
Message-ID: <20210422190523.D798380FCB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=44fdcdea494073a8aad549d56a330487cd081ef7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Static build with tremor raises a build failure since bump to latest git
tree in commit c8e27f3baa90351a417ff6e172d214c4a72e7314. However, it
should be noted that before this bump, tremor was always disabled in
static builds because vorbisidec detection was broken until
https://github.com/libsdl-org/SDL_mixer/commit/565a9a27cc8c184ad0203f004b834880ffd45d32

Fixes:
 - http://autobuild.buildroot.org/results/9634adc433da0e25732eb98675c59d0f96ac93b2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...nfigure.ac-fix-static-linking-with-tremor.patch | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/sdl_mixer/0003-configure.ac-fix-static-linking-with-tremor.patch b/package/sdl_mixer/0003-configure.ac-fix-static-linking-with-tremor.patch
new file mode 100644
index 0000000000..c3c7f19e7f
--- /dev/null
+++ b/package/sdl_mixer/0003-configure.ac-fix-static-linking-with-tremor.patch
@@ -0,0 +1,24 @@
+From 02e247a0b820753977315786087b969f3b2c53da Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 10 Apr 2021 11:50:17 +0200
+Subject: [PATCH] configure.ac: fix linking with tremor
+
+backported from: https://github.com/libsdl-org/SDL_mixer/pull/312
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c8dbcdb..93d5db0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -453,7 +453,7 @@ if test x$enable_music_ogg = xyes; then
+                 echo "-- dynamic libvorbisidec -> $ogg_lib"
+                 EXTRA_CFLAGS="$EXTRA_CFLAGS -DOGG_DYNAMIC=\\\"$ogg_lib\\\""
+             else
+-                EXTRA_LDFLAGS="$EXTRA_LDFLAGS -lvorbisidec -lvorbis"
++                EXTRA_LDFLAGS="$EXTRA_LDFLAGS -lvorbisidec"
+             fi
+         else
+             AC_MSG_WARN([*** Unable to find Ogg Vorbis Tremor library (http://www.xiph.org/)])
