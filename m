From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 18:52:14 +0200
Subject: [Buildroot] [git commit] sunxi-mali: use only -I${includedir} as
	pkg-config Cflags
Message-ID: <20140608165226.5294E9CF36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ff9045f4b62b53f55457f00a80d63e77acd758c
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
 package/sunxi-mali/egl.pc    |    2 +-
 package/sunxi-mali/glesv2.pc |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sunxi-mali/egl.pc b/package/sunxi-mali/egl.pc
index b062ad1..2823209 100644
--- a/package/sunxi-mali/egl.pc
+++ b/package/sunxi-mali/egl.pc
@@ -8,5 +8,5 @@ Description: ARM Mali implementation of EGL
 Version: 1.4
 Requires:
 Libs: -L${libdir} -lEGL -lGLESv2 -lUMP
-Cflags: -I${includedir}/EGL/ -I${includedir}
+Cflags: -I${includedir}
 
diff --git a/package/sunxi-mali/glesv2.pc b/package/sunxi-mali/glesv2.pc
index 9273678..4702d13 100644
--- a/package/sunxi-mali/glesv2.pc
+++ b/package/sunxi-mali/glesv2.pc
@@ -8,5 +8,5 @@ Description: ARM Mali implementation of OpenGL ESv2
 Version: 2.0
 Requires:
 Libs: -L${libdir} -lGLESv2 -lGLESv1_CM -lUMP
-Cflags: -I${includedir}/GLES2
+Cflags: -I${includedir}
 
