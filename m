From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 May 2014 13:08:40 +0200
Subject: [Buildroot] [PATCH 17/30] libva: new package
In-Reply-To: <cover.1401274944.git.yann.morin.1998@free.fr>
References: <cover.1401274944.git.yann.morin.1998@free.fr>
Message-ID: <824c91be4283efddcc4992bd99222102ce635d2c.1401274944.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bernd Kuhls <bernd.kuhls@t-online.de>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                             |  1 +
 package/libva/Config.in                       | 18 +++++++++
 package/libva/libva-0001-no_test_decode.patch | 17 ++++++++
 package/libva/libva.mk                        | 56 +++++++++++++++++++++++++++
 4 files changed, 92 insertions(+)
 create mode 100644 package/libva/Config.in
 create mode 100644 package/libva/libva-0001-no_test_decode.patch
 create mode 100644 package/libva/libva.mk

diff --git a/package/Config.in b/package/Config.in
index 3bc8d24..e2499f7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -599,6 +599,7 @@ source "package/libsvg/Config.in"
 source "package/libsvg-cairo/Config.in"
 source "package/libsvgtiny/Config.in"
 source "package/libungif/Config.in"
+source "package/libva/Config.in"
 source "package/opencv/Config.in"
 source "package/opengl/Config.in"
 source "package/pango/Config.in"
diff --git a/package/libva/Config.in b/package/libva/Config.in
new file mode 100644
index 0000000..9d63b52
--- /dev/null
+++ b/package/libva/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_LIBVA
+	bool "libva"
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XORG7
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm/libpthread-stubs
+	depends on BR2_LARGEFILE # libdrm
+	help
+	  The main motivation for VA-API (Video Acceleration API) is to enable
+	  hardware accelerated video decode/encode at various entry-points (VLD,
+	  IDCT, Motion Compensation etc.) for the prevailing coding standards
+	  today (MPEG-2, MPEG-4 ASP/H.263, MPEG-4 AVC/H.264, and VC-1/VMW3).
+
+	  http://www.freedesktop.org/wiki/Software/vaapi/
+
+comment "libva needs a toolchain w/ largefile, threads"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libva/libva-0001-no_test_decode.patch b/package/libva/libva-0001-no_test_decode.patch
new file mode 100644
index 0000000..0f0d786
--- /dev/null
+++ b/package/libva/libva-0001-no_test_decode.patch
@@ -0,0 +1,17 @@
+mpeg2vldemo is the only file requiring cxx support. It is not needed for
+buildroot, so disable its compilation to avoid depending on cxx.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr libva-1.3.0.org/test/Makefile.am libva-1.3.0/test/Makefile.am
+--- libva-1.3.0.org/test/Makefile.am	2014-03-24 05:49:46.000000000 +0100
++++ libva-1.3.0/test/Makefile.am	2014-04-26 18:12:25.644390292 +0200
+@@ -20,7 +20,7 @@
+ # TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
+ # SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ 
+-SUBDIRS = common decode encode vainfo
++SUBDIRS = common encode vainfo
+ 
+ if USE_X11
+ SUBDIRS += basic putsurface
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
new file mode 100644
index 0000000..85fd712
--- /dev/null
+++ b/package/libva/libva.mk
@@ -0,0 +1,56 @@
+################################################################################
+#
+# libva
+#
+################################################################################
+
+LIBVA_VERSION = 1.3.1
+LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
+LIBVA_SITE = http://www.freedesktop.org/software/vaapi/releases/libva
+LIBVA_LICENSE = MIT
+LIBVA_LICENSE_FILES = COPYING
+LIBVA_AUTORECONF = YES
+LIBVA_INSTALL_STAGING = YES
+LIBVA_DEPENDENCIES = host-pkgconf libdrm
+
+# libdrm is a hard-dependency
+LIBVA_CONF_OPT = \
+	--enable-drm \
+	--disable-dummy-driver \
+	--with-drivers-path="/usr/lib/va"
+
+ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
+LIBVA_DEPENDENCIES += mesa3d
+LIBVA_CONF_OPT += --enable-glx
+else
+LIBVA_CONF_OPT += --disable-glx
+endif
+
+ifeq ($(BR2_PACKAGE_XORG7),y)
+LIBVA_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXfixes
+LIBVA_CONF_OPT += --enable-x11
+else
+LIBVA_CONF_OPT += --disable-x11
+endif
+
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+LIBVA_DEPENDENCIES += wayland
+LIBVA_CONF_OPT += --enable-wayland
+else
+LIBVA_CONF_OPT += --disable-wayland
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
+LIBVA_DEPENDENCIES += libegl
+LIBVA_CONF_OPT += --enable-egl
+else
+LIBVA_CONF_OPT += --disable-egl
+endif
+
+# Autoreconf requires an m4 directory to exist
+define LIBVA_PATCH_M4
+	mkdir -p $(@D)/m4
+endef
+LIBVA_POST_PATCH_HOOKS += LIBVA_PATCH_M4
+
+$(eval $(autotools-package))
-- 
1.8.3.2
