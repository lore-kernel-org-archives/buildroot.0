From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 22:58:04 +0200
Subject: [Buildroot] [git commit] package/mesa3d: only enable full OpenGL
	when a DRI driver is enabled
Message-ID: <20140417210125.4B5099C845@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c0d7d1c5bb55a173f2b4b7aca898ccd36c33872e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Full OpenGL is only provided when:
  - a DRI driver is enabled,
  - and X.Org is enabled

Since DRI driver depend on X.Org being selected, this means that we
can (have to) enable full OpenGL as soon as a DRI driver is enabled.

On the other hand, Gallium drivers, which currently do enable full
OpenGL, only really provide OpenGL EGL and GLES, not full OpenGL.

So we exclude Gallium drivers when checking whether to enable full
OpenGL in mesa3d.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/mesa3d.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 0d41efa..db166f8 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -80,9 +80,9 @@ endif
 
 # APIs
 
-# At least one API is required, for buildroot enable OpenGL API by default.
-# Other APIs (EGL, EGL_ES) are optional
-ifeq ($(BR2_PACKAGE_MESA3D_DRIVER),y)
+# Full OpenGL is provided by DRI drivers with X.Org; DRI drivers are only
+# enabled when X.Org is enabled anyway, so no need to check for X.Org here.
+ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
 MESA3D_CONF_OPT += --enable-opengl
 else
 MESA3D_CONF_OPT += --disable-opengl
