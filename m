From: Romain Naour <romain.naour@smile.fr>
Date: Thu,  1 Aug 2019 11:21:19 +0200
Subject: [Buildroot] [PATCH v4] package/piglit: new package
Message-ID: <20190801092119.12590-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Romain Naour <romain.naour@gmail.com>

Piglit is an open-source test suite for OpenGL implementations.
It's an python3 script based around several tools like glxinfo,
wflinfo, dmesg.

Even though waffle support can be replaced by freeglut,
using pliglit with waffle is recommended since freeglut
will be replaced by waffle.

Add host-python-{mako,numpy,six} dependency since the build system
is checking with the host-python interpreter.

There is no comment about waffle dependency due to too complex
dependencies of waffle.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
[Reworked during the Buildroot summer camp 2019]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v4: version bump
    Update upstream vcs url (gitlab)
    Remove waffle comment due to complex dependencies
    "select" waffle instead of "depends on"
v3: bump version, rebase after the switch to xorgproto
    add a dependency on waffle package
    reorder packages in Config.in
    I'm not sure if we can avoid host-python-{mako,numpy,six} dependency
    because the build system is checking with host-python.
    Yocto packaging use the same workaround.
    https://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-graphics/piglit/piglit_git.bb
v2: bump version
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/piglit/Config.in   | 31 +++++++++++++++++
 package/piglit/piglit.hash |  6 ++++
 package/piglit/piglit.mk   | 69 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 108 insertions(+)
 create mode 100644 package/piglit/Config.in
 create mode 100644 package/piglit/piglit.hash
 create mode 100644 package/piglit/piglit.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 05711ba678..2323e0e302 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1948,6 +1948,7 @@ F:	package/minetest/
 F:	package/minetest-game/
 F:	package/openpowerlink/
 F:	package/physfs/
+F:	package/piglit/
 F:	package/solarus/
 F:	package/stress-ng/
 F:	package/supertux/
diff --git a/package/Config.in b/package/Config.in
index 9b2cc7522d..0050b92def 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -118,6 +118,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/oprofile/Config.in"
 	source "package/pax-utils/Config.in"
 	source "package/pcm-tools/Config.in"
+	source "package/piglit/Config.in"
 	source "package/pv/Config.in"
 	source "package/racehound/Config.in"
 	source "package/ramsmp/Config.in"
diff --git a/package/piglit/Config.in b/package/piglit/Config.in
new file mode 100644
index 0000000000..8fd2b931e2
--- /dev/null
+++ b/package/piglit/Config.in
@@ -0,0 +1,31 @@
+config BR2_PACKAGE_PIGLIT
+	bool "piglit"
+	depends on BR2_PACKAGE_PYTHON3 # python3 only script
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+        depends on BR2_PACKAGE_WAFFLE_SUPPORTS_GLX || \
+		BR2_PACKAGE_WAFFLE_SUPPORTS_WAYLAND || \
+                BR2_PACKAGE_WAFFLE_SUPPORTS_X11_EGL || \
+                BR2_PACKAGE_WAFFLE_SUPPORTS_GBM
+	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_MESA3D_DEMOS # glxinfo
+	select BR2_PACKAGE_PYTHON_MAKO
+	select BR2_PACKAGE_PYTHON_NUMPY
+	select BR2_PACKAGE_PYTHON_SIX
+	select BR2_PACKAGE_PYTHON3_BZIP2
+	select BR2_PACKAGE_PYTHON3_PYEXPAT
+	select BR2_PACKAGE_PYTHON3_XZ
+	select BR2_PACKAGE_PYTHON3_ZLIB
+	select BR2_PACKAGE_UTIL_LINUX # runtime
+	select BR2_PACKAGE_UTIL_LINUX_BINARIES # requires real dmesg tool
+	select BR2_PACKAGE_WAFFLE # wflinfo, libwaffle-1
+	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XORGPROTO if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_ZLIB
+	help
+	  Piglit is an open-source test suite for OpenGL
+	  implementations.
+
+	  https://piglit.freedesktop.org
diff --git a/package/piglit/piglit.hash b/package/piglit/piglit.hash
new file mode 100644
index 0000000000..8cfd04f7e0
--- /dev/null
+++ b/package/piglit/piglit.hash
@@ -0,0 +1,6 @@
+# Locally calculated
+sha256 4eba46520df1c47b0aea5446c302ff51d52f905a63d1ba29230866fc6c952a2e  piglit-ef761094be04d14e258ad7706e7295f80d4411f2.tar.gz
+sha256 dcc398730859aee7cc1d6aa57f526f8d181b47bb3a49830e85b5723d5bc2c3bc  COPYING
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licences/GPL-2
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  licences/GPL-3
+sha256 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  licences/LGPL-2
diff --git a/package/piglit/piglit.mk b/package/piglit/piglit.mk
new file mode 100644
index 0000000000..58625d1234
--- /dev/null
+++ b/package/piglit/piglit.mk
@@ -0,0 +1,69 @@
+################################################################################
+#
+# piglit
+#
+################################################################################
+
+PIGLIT_VERSION = ef761094be04d14e258ad7706e7295f80d4411f2
+PIGLIT_SITE = https://gitlab.freedesktop.org/mesa/piglit.git
+PIGLIT_SITE_METHOD = git
+PIGLIT_LICENSE = MIT (code), \
+	LGPL-2.0+ (libpiglit*.so), \
+	GPL-3.0 (tests/glslparsertest/glsl2/norsetto-*), \
+	GPL-2.0+ (tests/glslparsertest/glsl2/gst-gl-*), \
+	BSD-3-Clause (tests/glslparsertest/shaders/*)
+PIGLIT_LICENSE_FILES = COPYING licences/GPL-2 licences/GPL-3 licences/LGPL-2
+
+PIGLIT_DEPENDENCIES = host-pkgconf \
+	host-python-mako \
+	host-python-numpy \
+	host-python-six \
+	libpng \
+	python-mako \
+	python-numpy \
+	python-six \
+	waffle \
+	zlib
+
+PIGLIT_CONF_OPTS += \
+	-DPIGLIT_USE_WAFFLE=ON \
+	-DPIGLIT_BUILD_CL_TESTS=OFF \
+	-DPIGLIT_BUILD_WGL_TESTS=OFF
+
+ifeq ($(BR2_PACKAGE_XORG7),y)
+# libxcb for xcb-dri2
+PIGLIT_DEPENDENCIES += \
+	xlib_libX11 \
+	xlib_libXext \
+	xorgproto \
+	$(if $(BR2_PACKAGE_LIBXCB),libxcb)
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+PIGLIT_DEPENDENCIES += libgl libdrm
+PIGLIT_CONF_OPTS += -DPIGLIT_BUILD_GL_TESTS=ON
+else
+PIGLIT_CONF_OPTS += -DPIGLIT_BUILD_GL_TESTS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_HAS_LIBGL),yy)
+PIGLIT_CONF_OPTS += -DPIGLIT_BUILD_GLX_TESTS=ON
+else
+PIGLIT_CONF_OPTS += -DPIGLIT_BUILD_GLX_TESTS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
+PIGLIT_CONF_OPTS += -DPIGLIT_BUILD_GLES1_TESTS=ON \
+	-DPIGLIT_BUILD_GLES2_TESTS=ON \
+	-DPIGLIT_BUILD_GLES3_TESTS=ON
+else
+PIGLIT_CONF_OPTS += -DPIGLIT_BUILD_GLES1_TESTS=OFF \
+	-DPIGLIT_BUILD_GLES2_TESTS=OFF \
+	-DPIGLIT_BUILD_GLES3_TESTS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+PIGLIT_DEPENDENCIES += wayland libxkbcommon
+endif
+
+$(eval $(cmake-package))
-- 
2.20.1
