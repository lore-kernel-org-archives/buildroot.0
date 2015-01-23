From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Jan 2015 00:24:34 +0100
Subject: [Buildroot] [PATCH 05/14 v6] package/mesa3d-headers: new package
In-Reply-To: <cover.1422055104.git.yann.morin.1998@free.fr>
References: <cover.1422055104.git.yann.morin.1998@free.fr>
Message-ID: <a7d0443926fdc7741ab70b454d6c893f7c7a0b5f.1422055104.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some headers required to build GL/EGL/GLES/... stuff are not provided by
Khronos, so we must find an alternate source for those headers.
Currently, we're missing:
  - gl.h for full GL (gl.h for GLES is available from Khronos)
  - dri_interface.h to be able to build GL-enabled Xorg

mesa3d provides all of them, and they are generic enough that they can
be re-used even for other GL/EGL/GLES/... implementations.

Unfortunately, modifying mesa3d so that it only installs its headers is
no trivial task, and would render the mesa3d package really ugly and
unmaintainable in the long run.

Instead, we introduce a stripped-down mesa3d-headers package, which sole
purpose is to install those missing headers.

Alongside the dri_interface.h header, we also need to install a
pkg-config file, dri.pc, so that Xorg et al. are content and believe
they have DRI available.

Since we do only really require a very limited subset of files from
mesa3d, we do not really care of the version we use, so there is no
reason to keep them both in sync, and no reason to add a comment in
mesa3d to that effect.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Notes:

It should not be possible to select both mesa3d *and* mesa3d-headers at
the same time, but it is difficult to foresee the multiple combinations
we may have, due to poor understanding on how binary drivers may behave
and may require, as well as my own poor understanding of the GL stack(s).

So I decided to just print a warning in that case, and just depend on
mesa3d, which would ultimately provide the headers we are interested in
anyway. This can be turned into an error if preferred.
---
 package/Config.in                          |  1 +
 package/mesa3d-headers/Config.in           |  8 +++++
 package/mesa3d-headers/mesa3d-headers.hash |  2 ++
 package/mesa3d-headers/mesa3d-headers.mk   | 57 ++++++++++++++++++++++++++++++
 4 files changed, 68 insertions(+)
 create mode 100644 package/mesa3d-headers/Config.in
 create mode 100644 package/mesa3d-headers/mesa3d-headers.hash
 create mode 100644 package/mesa3d-headers/mesa3d-headers.mk

diff --git a/package/Config.in b/package/Config.in
index 6b2b2a3..b808483 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -215,6 +215,7 @@ endif
 	source "package/linux-fusion/Config.in"
 	source "package/lite/Config.in"
 	source "package/mesa3d/Config.in"
+	source "package/mesa3d-headers/Config.in"
 	source "package/ocrad/Config.in"
 	source "package/psplash/Config.in"
 	source "package/sawman/Config.in"
diff --git a/package/mesa3d-headers/Config.in b/package/mesa3d-headers/Config.in
new file mode 100644
index 0000000..a64fc0c
--- /dev/null
+++ b/package/mesa3d-headers/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_MESA3D_HEADERS
+	bool
+	help
+	  Mesa 3D, an open-source implementation of the OpenGL specification.
+
+	  This package only installs headers needed by other packages.
+
+	  http://mesa3d.org
diff --git a/package/mesa3d-headers/mesa3d-headers.hash b/package/mesa3d-headers/mesa3d-headers.hash
new file mode 100644
index 0000000..df309b5
--- /dev/null
+++ b/package/mesa3d-headers/mesa3d-headers.hash
@@ -0,0 +1,2 @@
+# From http://mesa3d.org/relnotes/10.4.2.html
+sha256	08a119937d9f2aa2f66dd5de97baffc2a6e675f549e40e699a31f5485d15327f	MesaLib-10.4.2.tar.bz2
diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
new file mode 100644
index 0000000..5bfb3c6
--- /dev/null
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -0,0 +1,57 @@
+################################################################################
+#
+# mesa3d-headers
+#
+################################################################################
+
+# mesa3d-headers is inherently incompatible with mesa3d, so if mesa3d
+# is enabled, just rely on it.
+
+ifeq ($(BR2_PACKAGE_MESA3D),y)
+
+ifeq ($(BR2_PACKAGE_MESA3D_HEADERS),y)
+$(warning mesa3d-headers enabled, but mesa3d enabled too)
+endif
+
+MESA3D_HEADERS_SOURCE =
+MESA3D_HEADERS_DEPENDENCIES = mesa3d
+
+else # mesa3d
+
+# Not possible to directly refer to mesa3d variables, because of first/second
+# expansion trickery...
+MESA3D_HEADERS_VERSION = 10.4.2
+MESA3D_HEADERS_SOURCE = MesaLib-$(MESA3D_VERSION).tar.bz2
+MESA3D_HEADERS_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
+MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
+MESA3D_HEADERS_LICENSE_FILES = docs/license.html
+
+# Only installs header files
+MESA3D_HEADERS_INSTALL_STAGING = YES
+MESA3D_HEADERS_INSTALL_TARGET = NO
+
+# Not using $(SED) because we do not want to work in-place, and $(SED)
+# contains -i.
+define MESA3D_HEADERS_BUILD_CMDS
+	sed -e 's:@\(exec_\)\?prefix@:/usr:' \
+	    -e 's:@libdir@:${exec_prefix}/lib:' \
+	    -e 's:@includedir@:${prefix}/include:' \
+	    -e 's:@DRI_DRIVER_INSTALL_DIR@:${libdir}/dri:' \
+	    -e 's:@VERSION@:$(MESA3D_HEADERS_VERSION):' \
+	    -e 's:@DRI_PC_REQ_PRIV@::' \
+	    $(@D)/src/mesa/drivers/dri/dri.pc.in \
+	    >$(@D)/src/mesa/drivers/dri/dri.pc
+endef
+
+define MESA3D_HEADERS_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/include/GL/gl.h \
+		$(STAGING_DIR)/usr/include/GL/gl.h
+	$(INSTALL) -D -m 0644 $(@D)/include/GL/internal/dri_interface.h \
+		$(STAGING_DIR)/usr/include/GL/internal/dri_interface.h
+	$(INSTALL) -D -m 0644 $(@D)/src/mesa/drivers/dri/dri.pc \
+		$(STAGING_DIR)/usr/lib/pkg-config/dri.pc
+endef
+
+endif # !mesa3d
+
+$(eval $(generic-package))
-- 
1.9.1
