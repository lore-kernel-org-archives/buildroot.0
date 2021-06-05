From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  5 Jun 2021 22:05:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpv: handle --{en,
 dis}able-libmpv-{shared, static}
Message-ID: <20210605200555.1252806-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libmpv-static and libmpv-shared are disabled by default resulting in the
following build failure when building with gl but without rpi, wayland
or x11:

Checking for OpenGL without platform-specific code (e.g. for libmpv)      : libmpv-shared not found
Checking for OpenGL context support                                       : gl-cocoa not found
You manually enabled the feature 'gl', but the autodetection check failed.

Here is an extract of wscript:

    } , {
        'name': '--plain-gl',
        'desc': 'OpenGL without platform-specific code (e.g. for libmpv)',
        'deps': 'libmpv-shared || libmpv-static',
        'func': check_true,
    }, {
        'name': '--gl',
        'desc': 'OpenGL context support',
        'deps': 'gl-cocoa || gl-x11 || egl-x11 || egl-drm || '
                 + 'gl-win32 || gl-wayland || rpi || '
                 + 'plain-gl',
        'func': check_true,
        'req': True,
        'fmsg': "No OpenGL video output found or enabled. " +
                "Aborting. If you really mean to compile without OpenGL " +
                "video outputs use --disable-gl.",
    }, {

Fixes:
 - http://autobuild.buildroot.org/results/590d2a8b6746ef071dfb439e42b636f81dbdc35d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpv/mpv.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 5713b98e8e..364a49f893 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -28,6 +28,20 @@ MPV_CONF_OPTS = \
 	--disable-uchardet \
 	--disable-vapoursynth
 
+ifeq ($(BR2_STATIC_LIBS),y)
+MPV_CONF_OPTS += \
+	--disable-libmpv-shared \
+	--enable-libmpv-static
+else ifeq ($(BR2_SHARED_LIBS),y)
+MPV_CONF_OPTS += \
+	--enable-libmpv-shared \
+	--disable-libmpv-static
+else
+MPV_CONF_OPTS += \
+	--enable-libmpv-shared \
+	--enable-libmpv-static
+endif
+
 # ALSA support requires pcm+mixer
 ifeq ($(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yy)
 MPV_CONF_OPTS += --enable-alsa
-- 
2.30.2
