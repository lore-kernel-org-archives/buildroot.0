From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 15:36:47 +0200
Subject: [Buildroot] [git commit] package/mpv: bump to version 0.32.0
Message-ID: <20200920132833.167A8888DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3485b707b7f8920dcc65086bf468dc70d3d82db9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Use github helper
- Drop first patch (not needed since version 0.30.0 and
  https://github.com/mpv-player/mpv/commit/9fd90c549c4022d7f9283adc1a97a076614c1458)
- vapoursynth-lazy has been dropped since version 0.30.0 and
  https://github.com/mpv-player/mpv/commit/fb8d240c4d045ca254aa6693c48aecc75954cba0
- mali-fbdev has been dropped since version 0.30.0 and
  https://github.com/mpv-player/mpv/commit/83d7123dc32e7fb8b1e05ed21af845707d115295
- libdvread has been dropped since version 0.30.0 and
  https://github.com/mpv-player/mpv/commit/62294049852549e99ec948e0df16452856afa0c1
- libv4l2 has been dropped since version 0.30. and
  https://github.com/mpv-player/mpv/commit/b30e85508a305d668db8419556d295a65ab08707
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ivec.patch => 0001-fix-powerpc64-altivec.patch} |  0
 ...ript-don-t-check-for-fork-on-POSIX-checks.patch | 31 ----------------------
 package/mpv/mpv.hash                               |  4 +--
 package/mpv/mpv.mk                                 | 27 +++----------------
 4 files changed, 5 insertions(+), 57 deletions(-)

diff --git a/package/mpv/0002-fix-powerpc64-altivec.patch b/package/mpv/0001-fix-powerpc64-altivec.patch
similarity index 100%
rename from package/mpv/0002-fix-powerpc64-altivec.patch
rename to package/mpv/0001-fix-powerpc64-altivec.patch
diff --git a/package/mpv/0001-wscript-don-t-check-for-fork-on-POSIX-checks.patch b/package/mpv/0001-wscript-don-t-check-for-fork-on-POSIX-checks.patch
deleted file mode 100644
index 544c03c058..0000000000
--- a/package/mpv/0001-wscript-don-t-check-for-fork-on-POSIX-checks.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 61aea32efe675e584121295452fc7ab2a652d021 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Wed, 20 Apr 2016 09:39:30 -0300
-Subject: [PATCH] wscript: don't check for fork() on POSIX checks
-
-It's not being used, and in fact prevents mpv from being built in nommu
-architectures (cortex M, blackfin, ...)
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-Status: pull request https://github.com/mpv-player/mpv/pull/3068
-
- wscript | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/wscript b/wscript
-index a4ffce6..40328e4 100644
---- a/wscript
-+++ b/wscript
-@@ -127,7 +127,7 @@ main_dependencies = [
-         'desc': 'POSIX environment',
-         # This should be good enough.
-         'func': check_statement(['poll.h', 'unistd.h', 'sys/mman.h'],
--            'struct pollfd pfd; poll(&pfd, 1, 0); fork(); int f[2]; pipe(f); munmap(f,0)'),
-+            'struct pollfd pfd; poll(&pfd, 1, 0); int f[2]; pipe(f); munmap(f,0)'),
-     }, {
-         'name': 'posix-or-mingw',
-         'desc': 'development environment',
--- 
-2.7.3
-
diff --git a/package/mpv/mpv.hash b/package/mpv/mpv.hash
index 734b6a3663..37db771356 100644
--- a/package/mpv/mpv.hash
+++ b/package/mpv/mpv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 f9f9d461d1990f9728660b4ccb0e8cb5dce29ccaa6af567bec481b79291ca623 v0.29.1.tar.gz
-sha256 a99d7b0625a0566271aad6de694e52eafd566db024f9516720d526c680d3ee30 LICENSE.GPL
+sha256  9163f64832226d22e24bbc4874ebd6ac02372cd717bef15c28a0aa858c5fe592  mpv-0.32.0.tar.gz
+sha256  a99d7b0625a0566271aad6de694e52eafd566db024f9516720d526c680d3ee30  LICENSE.GPL
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 6801a0468f..a7c9f7d74a 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-MPV_VERSION = 0.29.1
-MPV_SITE = https://github.com/mpv-player/mpv/archive
-MPV_SOURCE = v$(MPV_VERSION).tar.gz
+MPV_VERSION = 0.32.0
+MPV_SITE = $(call github,mpv-player,mpv,v$(MPV_VERSION))
 MPV_DEPENDENCIES = \
 	host-pkgconf ffmpeg zlib \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
@@ -27,9 +26,7 @@ MPV_CONF_OPTS = \
 	--disable-rsound \
 	--disable-rubberband \
 	--disable-uchardet \
-	--disable-vapoursynth \
-	--disable-vapoursynth-lazy \
-	--disable-mali-fbdev
+	--disable-vapoursynth
 
 # ALSA support requires pcm+mixer
 ifeq ($(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yy)
@@ -112,14 +109,6 @@ else
 MPV_CONF_OPTS += --disable-dvdnav
 endif
 
-# libdvdread
-ifeq ($(BR2_PACKAGE_LIBDVDREAD),y)
-MPV_CONF_OPTS += --enable-dvdread
-MPV_DEPENDENCIES += libdvdread
-else
-MPV_CONF_OPTS += --disable-dvdread
-endif
-
 # libdrm
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
 MPV_CONF_OPTS += --enable-drm
@@ -128,16 +117,6 @@ else
 MPV_CONF_OPTS += --disable-drm
 endif
 
-# libv4l
-ifeq ($(BR2_PACKAGE_LIBV4L),y)
-MPV_CONF_OPTS += \
-	--enable-libv4l2 \
-	--enable-tv
-MPV_DEPENDENCIES += libv4l
-else
-MPV_CONF_OPTS += --disable-libv4l2
-endif
-
 # libvdpau
 ifeq ($(BR2_PACKAGE_LIBVDPAU),y)
 MPV_CONF_OPTS += --enable-vdpau
