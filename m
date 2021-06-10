From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jun 2021 22:24:50 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/mpv: handle --{en,
 dis}able-libmpv-{shared, static}
Message-ID: <20210610195452.B5A1880187@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7dcec4fad930d7a5fa230ec13f9d4afdfcba96b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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

Enabling both the shared and static libraries is not allowed by mpv, so
we consider the BR2_STATIC_LIBS to be static, and otherwise (i.e.
BR2_SHARED_LIBS and BR2_SHARED_STATIC_LIBS) to be shared.

Fixes:
 - http://autobuild.buildroot.org/results/590d2a8b6746ef071dfb439e42b636f81dbdc35d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr:
  - expand config log about shared/static icompatibility
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8601137c08e112a67a565bee1c245481b62f96cd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpv/mpv.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 5713b98e8e..25ac783b52 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -28,6 +28,12 @@ MPV_CONF_OPTS = \
 	--disable-uchardet \
 	--disable-vapoursynth
 
+ifeq ($(BR2_STATIC_LIBS),y)
+MPV_CONF_OPTS += --disable-libmpv-shared --enable-libmpv-static
+else
+MPV_CONF_OPTS += --enable-libmpv-shared --disable-libmpv-static
+endif
+
 # ALSA support requires pcm+mixer
 ifeq ($(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yy)
 MPV_CONF_OPTS += --enable-alsa
