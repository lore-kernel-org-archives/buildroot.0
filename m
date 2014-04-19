From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 00:04:38 +0200
Subject: [Buildroot] [git commit] package/mesa3d: always enable openGL
Message-ID: <20140419220449.B0CC49C910@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=384d601d4ea2c41bb7928f756bfe88af4d38b38b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we only pass --enable-opengl is at least one DRI driver is
enabled, since full OpenGL is only possible with a DRI driver (and the
X.Org stack). Otherwise, we pass --disable-opengl on the assumption that
OpenGL is not possible.

But mesa3d's ./configure is a bit weird: enabling OpenGL-ES and diabling
full OpenGL is an error (see autobuild failure below).

It turns out that, if there is no DRI driver enabled, but --enable-opengl
is passed, ./configure will behave properly wrt OpenGL-ES, and will not
build the full OpenGL libgl.

Thanks to Paul for explaining this.

Fixes:
    http://autobuild.buildroot.net/results/61c/61c1c566dc0e829cb663ca30b1fd6cf9cc6cd931/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/mesa3d.mk |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index db166f8..a09e4c6 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -80,13 +80,10 @@ endif
 
 # APIs
 
-# Full OpenGL is provided by DRI drivers with X.Org; DRI drivers are only
-# enabled when X.Org is enabled anyway, so no need to check for X.Org here.
-ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
+# Always enable OpenGL:
+#   - it is needed for GLES (mesa3d's ./configure is a bit weird)
+#   - but if no DRI driver is enabled, then libgl is not built
 MESA3D_CONF_OPT += --enable-opengl
-else
-MESA3D_CONF_OPT += --disable-opengl
-endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
 # egl depends on gbm, gbm depends on udev
