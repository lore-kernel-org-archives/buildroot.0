From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Jun 2020 23:03:19 +0200
Subject: [Buildroot] [PATCH 1/2 v3] package/libglvnd: new package
In-Reply-To: <cover.1592859356.git.yann.morin.1998@free.fr>
References: <cover.1592859356.git.yann.morin.1998@free.fr>
Message-ID: <542cc139b2fd9000416bbeb342ce9d8059f167a6.1592859356.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jakub Skrzypnik <jskrzypnik@novomatic-tech.com>

libglvnd is the GL Vendor-Neutral Dispatch library, used to dispatch
GL calls across multiple GL implementations at runtime.

Full GL support, as usual, requires (parts of) the X11 stack: libX11,
libXext, and xorgproto (for glproto). However, with just libX11, it is
possible to do EGL on X11. EGL and GLES have no dependencies.

Note: x11 and glx are 'features', so need to be 'enabled' or 'disabled'
(or 'auto', but we don't care in Buildroot), while egl and gles1/2 are
'booleans', so need to be 'true' or 'false'.

When an actual provider for GL, EGL, or GLES is enabled, so must the
corresponding flavour be enabled in libglvnd. Conversely, when there is
no actual provider, the corresponding support must be disabled in
libglvnd. So we make each flavour selectable with hidden options, which
actual providers will have to select.

The license for libglvnd itself is a custom license by NVidia. It is
pretty close to MIT, but it's different (although Debian does classify
it as MIT); SPDX has no identifier for that license either. As such, we
choose to just identify it as 'libglvnd license', and let users deal
that with their legal department. Additionally, libglvnd bundles some
code from other projects, so we list them explicitly as well.

Signed-off-by: Jakub Skrzypnik <jskrzypnik@novomatic-tech.com>
[yann.morin.1998 at free.fr:
  - provide help text
  - don't force X11 libraries, split them between X11 and full GL
  - make each flavour selectable
  - fix make check-package issues
  - fix and complete licensing information
  - expand commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in              |  1 +
 package/libglvnd/Config.in     | 42 +++++++++++++++++++++++++++
 package/libglvnd/libglvnd.hash |  7 +++++
 package/libglvnd/libglvnd.mk   | 53 ++++++++++++++++++++++++++++++++++
 4 files changed, 103 insertions(+)
 create mode 100644 package/libglvnd/Config.in
 create mode 100644 package/libglvnd/libglvnd.hash
 create mode 100644 package/libglvnd/libglvnd.mk

diff --git a/package/Config.in b/package/Config.in
index e2bb004015..9c6b994549 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -310,6 +310,7 @@ comment "Graphic libraries"
 	source "package/fbv/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/imagemagick/Config.in"
+	source "package/libglvnd/Config.in"
 	source "package/linux-fusion/Config.in"
 	source "package/lite/Config.in"
 	source "package/mesa3d/Config.in"
diff --git a/package/libglvnd/Config.in b/package/libglvnd/Config.in
new file mode 100644
index 0000000000..680479a19b
--- /dev/null
+++ b/package/libglvnd/Config.in
@@ -0,0 +1,42 @@
+config BR2_PACKAGE_LIBGLVND
+	bool "libglvnd"
+	help
+	  The GL Vendor-Neutral Dispatch library
+
+	  libglvnd is a vendor-neutral dispatch layer for arbitrating
+	  OpenGL API calls between multiple vendors. It allows multiple
+	  drivers from different vendors to coexist on the same
+	  filesystem, and determines which vendor to dispatch each API
+	  call to at runtime.
+
+	  Both GLX and EGL are supported, in any combination with OpenGL
+	  and OpenGL ES.
+
+if BR2_PACKAGE_LIBGLVND
+
+config BR2_PACKAGE_LIBGLVND_DISPATCH_GL
+	bool
+	depends on BR2_PACKAGE_XORG7 # libx11, libXext, xorgproto
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_XORGPROTO
+	select BR2_PACKAGE_HAS_LIBGL
+
+config BR2_PACKAGE_LIBGLVND_DISPATCH_EGL
+	bool
+	select BR2_PACKAGE_HAS_LIBEGL
+
+config BR2_PACKAGE_LIBGLVND_DISPATCH_GLES
+	bool
+	select BR2_PACKAGE_HAS_LIBGLES
+
+config BR2_PACKAGE_PROVIDES_LIBGL
+	default "libglvnd" if BR2_PACKAGE_LIBGLVND_DISPATCH_GL
+
+config BR2_PACKAGE_PROVIDES_LIBEGL
+	default "libglvnd" if BR2_PACKAGE_LIBGLVND_DISPATCH_EGL
+
+config BR2_PACKAGE_PROVIDES_LIBGLES
+	default "libglvnd" if BR2_PACKAGE_LIBGLVND_DISPATCH_GLES
+
+endif
diff --git a/package/libglvnd/libglvnd.hash b/package/libglvnd/libglvnd.hash
new file mode 100644
index 0000000000..1b13c5738e
--- /dev/null
+++ b/package/libglvnd/libglvnd.hash
@@ -0,0 +1,7 @@
+# Locally computed
+sha256  b26c931ff79feced0d1ac69332797a08427308fa85541282ee9995680c880b24  libglvnd-v1.3.1.tar.gz
+
+# Locally computed hashes for license files
+sha256  224534547628a9e5e889d8808385bd38839e6bdb77d89c90ac04dad6891a4f5f  README.md
+sha256  bebdc0fd27cd37af8406e47af23c113866b7856c3f7349ffcbc672029ec8acf7  src/util/uthash/LICENSE
+sha256  f6f207863675ca5a5128fd120b9aef4f4bbab73ffa57e5f771ccffc8e3cc56b7  src/util/cJSON/LICENSE
diff --git a/package/libglvnd/libglvnd.mk b/package/libglvnd/libglvnd.mk
new file mode 100644
index 0000000000..917e03a7f7
--- /dev/null
+++ b/package/libglvnd/libglvnd.mk
@@ -0,0 +1,53 @@
+################################################################################
+#
+# libglvnd
+#
+################################################################################
+
+LIBGLVND_VERSION = 1.3.1
+LIBGLVND_SOURCE = libglvnd-v$(LIBGLVND_VERSION).tar.gz
+LIBGLVND_SITE = https://gitlab.freedesktop.org/glvnd/libglvnd/-/archive/v$(LIBGLVND_VERSION)
+
+LIBGLVND_LICENSE = \
+	libglvnd license, \
+	Apache-2.0 (Khronos headers), \
+	MIT (Xorg; mesa; cJSON), \
+	BSD-1=Clause (uthash)
+
+LIBGLVND_LICENSE_FILES = \
+	README.md \
+	src/util/uthash/LICENSE \
+	src/util/cJSON/LICENSE
+
+LIBGLVND_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
+LIBGLVND_DEPENDENCIES += xlib_libX11
+LIBGLVND_CONF_OPTS += -Dx11=enabled
+else
+LIBGLVND_CONF_OPTS += -Dx11=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLVND_DISPATCH_GL),y)
+LIBGLVND_DEPENDENCIES += xlib_libXext xorgproto
+LIBGLVND_CONF_OPTS += -Dglx=enabled
+LIBGLVND_PROVIDES += libgl
+else
+LIBGLVND_CONF_OPTS += -Dglx=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLVND_DISPATCH_EGL),y)
+LIBGLVND_CONF_OPTS = -Degl=true
+LIBGLVND_PROVIDES += libegl
+else
+LIBGLVND_CONF_OPTS = -Degl=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLVND_DISPATCH_GLES),y)
+LIBGLVND_CONF_OPTS = -Dgles1=true -Dgles2=true
+LIBGLVND_PROVIDES += libgles
+else
+LIBGLVND_CONF_OPTS = -Dgles1=false -Dgles2=false
+endif
+
+$(eval $(meson-package))
-- 
2.20.1
