From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 22 Sep 2018 12:56:26 +0200
Subject: [Buildroot] [PATCH v3 3/3] package/piglit: new package
In-Reply-To: <20180922105626.22626-1-romain.naour@gmail.com>
References: <20180922105626.22626-1-romain.naour@gmail.com>
Message-ID: <20180922105626.22626-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Piglit is an open-source test suite for OpenGL implementations.
It's an python3 script based around several tools like glxinfo,
wflinfo, dmesg.

Even though waffle support can be replaced by freeglut,
using pliglit with waffle is recommended since freeglut
will be replaced by waffle.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
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
 package/piglit/Config.in   | 32 +++++++++++++++++++++
 package/piglit/piglit.hash |  6 ++++
 package/piglit/piglit.mk   | 69 ++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 109 insertions(+)
 create mode 100644 package/piglit/Config.in
 create mode 100644 package/piglit/piglit.hash
 create mode 100644 package/piglit/piglit.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1bcaea9d34..574b04df46 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1777,6 +1777,7 @@ F:	package/minetest/
 F:	package/minetest-game/
 F:	package/openpowerlink/
 F:	package/physfs/
+F:	package/piglit/
 F:	package/solarus/
 F:	package/stress-ng/
 F:	package/supertux/
diff --git a/package/Config.in b/package/Config.in
index 2dcc2e611a..c441b1098e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -115,6 +115,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/nmon/Config.in"
 	source "package/oprofile/Config.in"
 	source "package/pax-utils/Config.in"
+	source "package/piglit/Config.in"
 	source "package/pv/Config.in"
 	source "package/racehound/Config.in"
 	source "package/ramsmp/Config.in"
diff --git a/package/piglit/Config.in b/package/piglit/Config.in
new file mode 100644
index 0000000000..f17995fb6d
--- /dev/null
+++ b/package/piglit/Config.in
@@ -0,0 +1,32 @@
+config BR2_PACKAGE_PIGLIT
+	bool "piglit"
+	depends on BR2_PACKAGE_PYTHON3 # python3 only script
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_WAFFLE # wflinfo, libwaffle-1
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
+	select BR2_PACKAGE_UTIL_LINUX # runtime dependency
+	select BR2_PACKAGE_UTIL_LINUX_BINARIES # require real dmesg tool
+	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XORGPROTO if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_ZLIB
+	help
+	  Piglit is an open-source test suite for OpenGL
+	  implementations.
+
+	  https://piglit.freedesktop.org
+
+comment "piglit needs waffle"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_WAFFLE
diff --git a/package/piglit/piglit.hash b/package/piglit/piglit.hash
new file mode 100644
index 0000000000..9e1beb467b
--- /dev/null
+++ b/package/piglit/piglit.hash
@@ -0,0 +1,6 @@
+# Locally calculated
+sha256 50e76e953630b929cf2e68fca2a2b19b1032b68f623805a5172ead2ef22bc3b4  piglit-c0350279c5c1972a1ccff65b91de10ab9f4567e9.tar.gz
+sha256 dcc398730859aee7cc1d6aa57f526f8d181b47bb3a49830e85b5723d5bc2c3bc  COPYING
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licences/GPL-2
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  licences/GPL-3
+sha256 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  licences/LGPL-2
diff --git a/package/piglit/piglit.mk b/package/piglit/piglit.mk
new file mode 100644
index 0000000000..738107a834
--- /dev/null
+++ b/package/piglit/piglit.mk
@@ -0,0 +1,69 @@
+################################################################################
+#
+# piglit
+#
+################################################################################
+
+PIGLIT_VERSION = c0350279c5c1972a1ccff65b91de10ab9f4567e9
+PIGLIT_SITE = https://anongit.freedesktop.org/git/piglit.git
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
2.14.4
