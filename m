From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 26 Mar 2017 18:28:49 +0200
Subject: [Buildroot] [PATCH 1/5] package/mesa3d: allow to enable OpenGL
	texture float support
Message-ID: <20170326162853.3022-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While testing on a PC target with an HD6310 graphic card, the
OpenGL support was in "compat profile" mode (i.e OpenGL 2.1).

Extended renderer info (GLX_MESA_query_renderer):
    Vendor: X.Org (0x1002)
    Device: AMD PALM (DRM 2.49.0 / 4.10.4) (0x9802)
    Version: 17.0.2
    Accelerated: yes
    Video memory: 256MB
    Unified memory: no
    Preferred profile: compat (0x2)
    Max core profile version: 0.0
    Max compat profile version: 2.1
    Max GLES1 profile version: 1.1
    Max GLES[23] profile version: 2.0
OpenGL vendor string: X.Org
OpenGL renderer string: Gallium 0.4 on AMD PALM (DRM 2.49.0 / 4.10.4)
OpenGL version string: 2.1 Mesa 17.0.2
OpenGL shading language version string: 1.30

OpenGL ES profile version string: OpenGL ES 2.0 Mesa 17.0.2
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 1.0.16

It turn out that texture float support was missing...

Extended renderer info (GLX_MESA_query_renderer):
    Vendor: X.Org (0x1002)
    Device: AMD PALM (DRM 2.49.0 / 4.10.4) (0x9802)
    Version: 17.0.2
    Accelerated: yes
    Video memory: 256MB
    Unified memory: no
    Preferred profile: core (0x1)
    Max core profile version: 3.3
    Max compat profile version: 3.0
    Max GLES1 profile version: 1.1
    Max GLES[23] profile version: 3.0
OpenGL vendor string: X.Org
OpenGL renderer string: Gallium 0.4 on AMD PALM (DRM 2.49.0 / 4.10.4)
OpenGL core profile version string: 3.3 (Core Profile) Mesa 17.0.2
OpenGL core profile shading language version string: 3.30
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile

OpenGL version string: 3.0 Mesa 17.0.2
OpenGL shading language version string: 1.30
OpenGL context flags: (none)

Add a new option to let the user disable this feature if
it doesn't comply to the SGI license.
Add docs/patents.txt to MESA3D_LICENSE_FILES

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
NOTE: --enable-texture-float is always enabled in the masa package
in Fedora:
http://pkgs.fedoraproject.org/cgit/rpms/mesa.git/tree/mesa.spec?h=f25#n418
---
 package/mesa3d/Config.in | 18 ++++++++++++++++++
 package/mesa3d/mesa3d.mk |  7 +++++++
 2 files changed, 25 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 2b085ab..b743df3 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -194,6 +194,24 @@ config BR2_PACKAGE_MESA3D_OPENGL_ES
 	  Use the Khronos OpenGL ES APIs. This is commonly used on embedded
 	  systems and represents a subset of the OpenGL API.
 
+config BR2_PACKAGE_MESA3D_OPENGL_TEXTURE_FLOAT
+	bool "OpenGL texture float (patented format)"
+	help
+	  GL_ARB_texture_float is required to enable GLX core profile
+	  (OpenGL3.x) otherwise the compat profile is used (OpenGL2.1).
+
+	  The source code to implement ARB_texture_float extension is
+	  included and can be toggled on at compile time, for those who
+	  purchased a license from SGI, or are in a country where the
+	  patent does not apply, etc.
+
+	  Please consult docs/patents.txt with your lawyer before
+	  building Mesa.
+
+	  If unsure, say N.
+
+	  http://www.google.com/patents/about?id=mIIOAAAAEBAJ&dq=6650327
+
 endif # BR2_PACKAGE_MESA3D_DRIVER
 
 config BR2_PACKAGE_PROVIDES_LIBGL
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 07f43bb..57e83ca 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -183,6 +183,13 @@ else
 MESA3D_CONF_OPTS += --disable-gles1 --disable-gles2
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_TEXTURE_FLOAT),y)
+MESA3D_CONF_OPTS += --enable-texture-float
+MESA3D_LICENSE_FILES += docs/patents.txt
+else
+MESA3D_CONF_OPTS += --disable-texture-float
+endif
+
 ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
 MESA3D_CONF_OPTS += --enable-lmsensors
 MESA3D_DEPENDENCIES += lm-sensors
-- 
2.9.3
