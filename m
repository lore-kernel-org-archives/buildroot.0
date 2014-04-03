From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
Date: Thu, 3 Apr 2014 19:51:20 +0200
Subject: [Buildroot] [PATCH RFC] libevas: Break circular dependency on mesa
Message-ID: <1396547480-9739-1-git-send-email-vincent.stehle@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes the following error, when doing e.g. `make qemu_arm_vexpress_defconfig`:

  package/xbmc/Config.in:10:error: recursive dependency detected!
  package/xbmc/Config.in:10:      symbol BR2_PACKAGE_XBMC depends on BR2_PACKAGE_HAS_OPENGL_EGL
  package/opengl/libegl/Config.in:1:      symbol BR2_PACKAGE_HAS_OPENGL_EGL is selected by BR2_PACKAGE_MESA3D_OPENGL_EGL
  package/mesa3d/Config.in:92:    symbol BR2_PACKAGE_MESA3D_OPENGL_EGL depends on BR2_PACKAGE_MESA3D
  package/mesa3d/Config.in:1:     symbol BR2_PACKAGE_MESA3D is selected by BR2_PACKAGE_LIBEVAS_GL
  package/efl/libevas/Config.in:149:      symbol BR2_PACKAGE_LIBEVAS_GL is part of choice <choice>
  package/efl/libevas/Config.in:144:      choice <choice> contains symbol <choice>
  package/efl/libevas/Config.in:144:      choice <choice> contains symbol BR2_PACKAGE_LIBEVAS_SDL_GL
  package/efl/libevas/Config.in:90:       symbol BR2_PACKAGE_LIBEVAS_SDL_GL depends on BR2_PACKAGE_SDL_X11
  package/sdl/Config.in:24:       symbol BR2_PACKAGE_SDL_X11 depends on BR2_PACKAGE_SDL
  package/sdl/Config.in:1:        symbol BR2_PACKAGE_SDL is selected by BR2_PACKAGE_PYTHON_PYGAME
  package/python-pygame/Config.in:1:      symbol BR2_PACKAGE_PYTHON_PYGAME depends on BR2_PACKAGE_PYTHON
  package/python/Config.in:1:     symbol BR2_PACKAGE_PYTHON is selected by BR2_PACKAGE_XBMC

Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
Cc: Bernd Kuhls <berndkuhls@hotmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---


Hi,

Here is a proposal for a temporary patch, which breaks one mesa related
dependency loop. This loop appears in my case when using
qemu_arm_vexpress_defconfig.

It seems some circular dependencies related to mesa were introduced into
buildroot recently (1). It is my understanding that "temporary" patches were
applied recently to fix a number of those dependencies, and that a more robust
solution in the form of virtual packages was being worked on by Yann [2].

This proposed patch is certainly temporary and would have to be reverted, when
the virtual packages are ready.

Is libevas a good candidate to break the dependency loop?

Also, an idea: maybe it would make sense to enhance `make graph-depends` to be
able to generate the full dependencies graph, as well as the `selects`? And,
maybe even better, highlight the loops?

Best regards,

V.

(1) by commit 3199fd4ef58ba33e7f8742491a0f081af4944a9f
[1] http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/80799


 package/efl/libevas/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/efl/libevas/Config.in b/package/efl/libevas/Config.in
index 2afa888..8eea23d 100644
--- a/package/efl/libevas/Config.in
+++ b/package/efl/libevas/Config.in
@@ -148,7 +148,7 @@ choice
 
 config BR2_PACKAGE_LIBEVAS_GL
 	bool "generic OpenGL"
-	select BR2_PACKAGE_MESA3D
+	depends on BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_LIBEET
 
 config BR2_PACKAGE_LIBEVAS_GLES_SGX
-- 
1.9.1
