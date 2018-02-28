From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Feb 2018 14:55:22 +0100
Subject: [Buildroot] [git commit] sdl2: rpi video support needs OpenGL ES
Message-ID: <20180228135555.3064881428@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8778c90254388cd8bfd9a1ab9beb817b762fcd6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes [1]:

  .../build/sdl2-2.0.7/src/video/raspberry/SDL_rpivideo.c: In function 'RPI_Create':
  .../build/sdl2-2.0.7/src/video/raspberry/SDL_rpivideo.c:126:39: error: 'RPI_GLES_DefaultProfileConfig' undeclared (first use in this function); did you mean 'RPI_GLES_DeleteContext'?
       device->GL_DefaultProfileConfig = RPI_GLES_DefaultProfileConfig;
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                         RPI_GLES_DeleteContext
  .../build/sdl2-2.0.7/src/video/raspberry/SDL_rpivideo.c:126:39: note: each undeclared identifier is reported only once for each function it appears in
  .../build/sdl2-2.0.7/src/video/raspberry/SDL_rpivideo.c: In function 'RPI_CreateWindow':
  .../build/sdl2-2.0.7/src/video/raspberry/SDL_rpivideo.c:281:17: error: 'SDL_VideoDevice {aka struct SDL_VideoDevice}' has no member named 'egl_data'; did you mean 'gl_data'?
       if (!_this->egl_data) {
                   ^~~~~~~~
                   gl_data
  .../build/sdl2-2.0.7/src/video/raspberry/SDL_rpivideo.c:286:10: error: 'SDL_WindowData {aka struct SDL_WindowData}' has no member named 'egl_surface'
       wdata->egl_surface = SDL_EGL_CreateSurface(_this, (NativeWindowType) &wdata->dispman_window);
            ^~
  .../build/sdl2-2.0.7/src/video/raspberry/SDL_rpivideo.c:286:26: warning: implicit declaration of function 'SDL_EGL_CreateSurface'; did you mean 'SDL_Vulkan_CreateSurface'? [-Wimplicit-function-declaration]
       wdata->egl_surface = SDL_EGL_CreateSurface(_this, (NativeWindowType) &wdata->dispman_window);
                            ^~~~~~~~~~~~~~~~~~~~~
                            SDL_Vulkan_CreateSurface
  .../build/sdl2-2.0.7/src/video/raspberry/SDL_rpivideo.c:288:14: error: 'SDL_WindowData {aka struct SDL_WindowData}' has no member named 'egl_surface'
       if (wdata->egl_surface == EGL_NO_SURFACE) {
                ^~

[1] http://autobuild.buildroot.net/results/9612d43b192bbb88214a11fe18f8b8da6ad10313

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl2/sdl2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 6cb24d9e75..6508e6b962 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -38,7 +38,7 @@ else
 SDL2_CONF_OPTS += --disable-video-directfb
 endif
 
-ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
+ifeq ($(BR2_PACKAGE_SDL2_OPENGLES)$(BR2_PACKAGE_RPI_USERLAND),yy)
 SDL2_DEPENDENCIES += rpi-userland
 SDL2_CONF_OPTS += --enable-video-rpi
 else
