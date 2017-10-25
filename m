From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Oct 2017 18:03:26 +0200
Subject: [Buildroot] [PATCH] sdl2: explicitly disable raspberry pi video
	backend
Message-ID: <20171025160326.19759-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/d59/d5992dcc9a49ee77afaebdcc9448ac1868fa7de1/
http://autobuild.buildroot.net/results/e89/e894f21ce1983ee3bd8d65a8e59e1adab9a62707/

The configure script automatically enables support for the raspberry pi
video backend if it detects the rpi-userland package.  Unfortunately it
hardcodes a number of include/linker paths unsuitable for cross compilation,
breaking the build:

    if test x$enable_video = xyes -a x$enable_video_rpi = xyes; then
..
     RPI_CFLAGS="-I/opt/vc/include -I/opt/vc/include/interface/vcos/pthreads -I/opt/vc/include/interface/vmcs_host/linux"
     RPI_LDFLAGS="-L/opt/vc/lib -lbcm_host"
    fi

So explicitly disable it until the configure script is fixed.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl2/sdl2.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index facb41e527..fa3b57e6cd 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -18,7 +18,8 @@ SDL2_CONF_OPTS += \
 	--disable-esd \
 	--disable-dbus \
 	--disable-pulseaudio \
-	--disable-video-wayland
+	--disable-video-wayland \
+	--disable-video-rpi
 
 # We must enable static build to get compilation successful.
 SDL2_CONF_OPTS += --enable-static
-- 
2.11.0
