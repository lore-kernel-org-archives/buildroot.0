From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 18:52:11 +0200
Subject: [Buildroot] [git commit] ti-gfx: use only -I${includedir} as
	pkg-config Cflags
Message-ID: <20140608165226.4B4EC9CF36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=05a734153908ee40d5c7a475b10c40e3f1796dd1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using only -I${includedir} in common practice.

Settings only -I${includedir}/GLES2 breaks Qt5's CMake files,
because at configure time CMake only searchs the paths reported
by pkg-config, and not even /usr/include is used as default.

Even though pkg-config strips out standard include path, that's not
the case with pkgconf (which we are using) in cross-compilation,
which correctly reports the /usr/include dir prefixed with the
sysroot.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter K??mmel <syntheticpp@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ti-gfx/egl.pc    |    2 +-
 package/ti-gfx/glesv2.pc |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ti-gfx/egl.pc b/package/ti-gfx/egl.pc
index 223fb04..36ea413 100644
--- a/package/ti-gfx/egl.pc
+++ b/package/ti-gfx/egl.pc
@@ -8,4 +8,4 @@ Description: TI Graphics SDK implementation of EGL
 Version: 1.9.2188537
 Requires:
 Libs: -L${libdir} -lEGL -lGLESv2 -lIMGegl
-Cflags: -I${includedir}/EGL/ -I${includedir}
+Cflags: -I${includedir}
diff --git a/package/ti-gfx/glesv2.pc b/package/ti-gfx/glesv2.pc
index 4c70aec..b458133 100644
--- a/package/ti-gfx/glesv2.pc
+++ b/package/ti-gfx/glesv2.pc
@@ -8,4 +8,4 @@ Description: TI Graphics SDK implementation of OpenGL ESv2
 Version: 1.9.2188537
 Requires:
 Libs: -L${libdir} -lGLESv2 -lGLES_CM -lsrv_um -lusc -lEGL -lIMGegl
-Cflags: -I${includedir}/GLES2
+Cflags: -I${includedir}
