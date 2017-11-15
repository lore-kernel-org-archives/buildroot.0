From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Nov 2017 19:41:24 +0100
Subject: [Buildroot] [git commit branch/2017.08.x] sdl2: explicitly disable
 raspberry pi video backend
Message-ID: <20171115184824.C25EF8047F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09c8d7e5758b697e939668f72a4a993c1bc4ec2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

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
(cherry picked from commit 3a798acf239dee04d573f575337bf823c13020fd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl2/sdl2.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index e64628d..e370980 100644
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
