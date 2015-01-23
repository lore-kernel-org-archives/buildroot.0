From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Jan 2015 00:24:35 +0100
Subject: [Buildroot] [PATCH 06/14 v6] package/khronos-registry-opengl: new
	package
In-Reply-To: <cover.1422055104.git.yann.morin.1998@free.fr>
References: <cover.1422055104.git.yann.morin.1998@free.fr>
Message-ID: <8aa48a64d97804de81ed6b22585fac12325d453e.1422055104.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The OpenGL Registry provides all GL headers, save for gl.h itself. We
vampirise the one from mesa3d (at the version we currently package),
which is as good as any other.

Those headers are needed when an OpenGL/EGL/GLES implementation does
not provide its own headers, like the NVidia binary blob (to come in
follow-up patches.)

Note that, even though this is a generic package, and we could
everything in the BUILD_CMDS, we decided to split the tweaking of glx.h
in a post-build script, to really make it clear we are tweaking a
generated file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

--
Tested by building XBMC against the NVidia proprietary blob.

Note: their svn repository holds many other things, even non-public
stuff, so the svn revision we use is the one at which the api directory
was *changed*, which might be lagging behind the revision the repository
is currently at

---
Changes v5 -> v6:
  - depend on mesa3d-headers to provide gl.h, so ditch our bundled copy

Changes v4 -> v5:
  - fix env when calling make

Changes v3 -> v4:
  - move to a sub-dir of opengl/ because we'll add some more Khronos
    registry packages (OpenMAX...)
  - bump revision
---
 package/opengl/Config.in                           |  1 +
 .../0001-run-from-current-dir.patch                | 17 +++++
 package/opengl/khronos-registry-opengl/Config.in   | 25 +++++++
 .../khronos-registry-opengl.mk                     | 83 ++++++++++++++++++++++
 4 files changed, 126 insertions(+)
 create mode 100644 package/opengl/khronos-registry-opengl/0001-run-from-current-dir.patch
 create mode 100644 package/opengl/khronos-registry-opengl/Config.in
 create mode 100644 package/opengl/khronos-registry-opengl/khronos-registry-opengl.mk

diff --git a/package/opengl/Config.in b/package/opengl/Config.in
index d9a5c37..0c3f2cb 100644
--- a/package/opengl/Config.in
+++ b/package/opengl/Config.in
@@ -7,3 +7,4 @@ source "package/opengl/libopenmax/Config.in"
 # Khronos headers, from the Khronos Registries
 source "package/opengl/khronos-registry-khrplatform/Config.in"
 source "package/opengl/khronos-registry-openkode/Config.in"
+source "package/opengl/khronos-registry-opengl/Config.in"
diff --git a/package/opengl/khronos-registry-opengl/0001-run-from-current-dir.patch b/package/opengl/khronos-registry-opengl/0001-run-from-current-dir.patch
new file mode 100644
index 0000000..4b042ab
--- /dev/null
+++ b/package/opengl/khronos-registry-opengl/0001-run-from-current-dir.patch
@@ -0,0 +1,17 @@
+Makefile: allow running without the current dir in PATH
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+Index: a/Makefile
+===================================================================
+--- a/Makefile	(revision 27863)
++++ a/Makefile	(working copy)
+@@ -24,7 +24,7 @@
+ 
+ PYFILES = genheaders.py reg.py
+ GENOPTS =
+-GENHEADERS = genheaders.py $(GENOPTS)
++GENHEADERS = ./genheaders.py $(GENOPTS)
+ 
+ # Generate all headers for GL / GLES / WGL / GLX / EGL
+ # Different headers depend on different XML registry files
diff --git a/package/opengl/khronos-registry-opengl/Config.in b/package/opengl/khronos-registry-opengl/Config.in
new file mode 100644
index 0000000..b320e77
--- /dev/null
+++ b/package/opengl/khronos-registry-opengl/Config.in
@@ -0,0 +1,25 @@
+# Note: this package has no prompt, because it is to be selected by
+# packages that need it, and does not make sense on its own.
+# Further more, we want to avoid it being enabled alongside any other
+# package that provide their own OpenGL headers, like mesa3d or
+# rpi-userland...
+
+config BR2_PACKAGE_KHRONOS_REGISTRY_OPENGL
+	bool
+	select BR2_PACKAGE_KHRONOS_REGISTRY_KHRPLATFORM
+	select BR2_PACKAGE_MESA3D_HEADERS
+	help
+	  The OpenGL Registry contains specifications, header files, and
+	  related documentation for OpenGL and related APIs including GLU,
+	  GLX, and WGL. In addition to the core API specifications, many
+	  extensions to these APIs have been defined by vendors, groups of
+	  vendors, and the ARB. The Registry also contains specifications
+	  and header files for all registered extensions, written as
+	  modifications to the appropriate core API specifications.
+
+	  This package installs the openGL header files. You do not need them
+	  if the OpenGL/EGL/GLES implementation provides its own headers.
+	  Currently, the only known implementation requiring OpenGL Resgistry
+	  is the NVidia proprietary driver.
+
+	  https://www.opengl.org/registry/
diff --git a/package/opengl/khronos-registry-opengl/khronos-registry-opengl.mk b/package/opengl/khronos-registry-opengl/khronos-registry-opengl.mk
new file mode 100644
index 0000000..a66def4
--- /dev/null
+++ b/package/opengl/khronos-registry-opengl/khronos-registry-opengl.mk
@@ -0,0 +1,83 @@
+################################################################################
+#
+# khronos-registry-opengl
+#
+################################################################################
+
+# Using last revision at which the 'api' directory was *changed*, which might
+# not be the latest revision the repository is currently at.
+KHRONOS_REGISTRY_OPENGL_VERSION = 29537
+KHRONOS_REGISTRY_OPENGL_SITE = https://cvs.khronos.org/svn/repos/ogl/trunk/doc/registry/public/api
+KHRONOS_REGISTRY_OPENGL_SITE_METHOD = svn
+
+# No license file, license text in all generated headers
+KHRONOS_REGISTRY_OPENGL_LICENSE = MIT
+
+KHRONOS_REGISTRY_OPENGL_DEPENDENCIES = host-python host-python-lxml \
+	khronos-registry-khrplatform mesa3d-headers
+
+# The registry only installs header files
+KHRONOS_REGISTRY_OPENGL_INSTALL_STAGING = YES
+KHRONOS_REGISTRY_OPENGL_INSTALL_TARGET = NO
+
+# opengl-registry depends on at least one of those virtual packages,
+# so we can be sure we'll have _DIRS set to non-empty.
+KHRONOS_REGISTRY_OPENGL_DIRS = \
+	$(if $(BR2_PACKAGE_HAS_LIBGL),GL) \
+	$(if $(BR2_PACKAGE_HAS_LIBEGL),EGL) \
+	$(if $(BR2_PACKAGE_HAS_LIBGLES),GLES GLES2 GLES3)
+
+# Remove pre-generated files
+define KHRONOS_REGISTRY_OPENGL_RM_H
+	rm -f $(@D)/GL/*.h
+endef
+KHRONOS_REGISTRY_OPENGL_POST_EXTRACT_HOOKS += KHRONOS_REGISTRY_OPENGL_RM_H
+
+define KHRONOS_REGISTRY_OPENGL_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+# We need to tweak the generated glx.h to:
+# - include the X11 headers it needs
+# - include glxext.h like mesa3d's one does
+# - define the glxext prototypes
+define KHRONOS_REGISTRY_OPENGL_FIX_GLX_H
+	awk 'BEGIN { def_proto=1; } \
+	 $$0=="#ifdef GLX_GLXEXT_PROTOTYPES" && def_proto==1 { \
+		print "#define GLX_GLXEXT_PROTOTYPES 1 /* Added by Buildroot */"; \
+		def_proto=0; \
+	 } \
+	 $$0=="#endif /* GLX_VERSION_1_4 */" { \
+		print ""; \
+		print "/* Added by Buildroot */"; \
+		print "#ifndef GLX_GLXEXT_LEGACY"; \
+		print "#include <GL/glxext.h>"; \
+		print "#endif /* GLX_GLXEXT_LEGACY */"; \
+		print "/* End added by Buildroot */"; \
+		print ""; \
+	 } \
+	 { print; } \
+	 $$0=="#define GLX_VERSION_1_0 1" { \
+		print ""; \
+		print "/* Added by Buildroot */"; \
+		print "#include <X11/Xlib.h>"; \
+		print "#include <X11/Xutil.h>"; \
+		print "#include <GL/gl.h>"; \
+		print "/* End added by Buildroot */"; \
+		print ""; \
+	 } \
+	' $(@D)/GL/glx.h >$(@D)/GL/glx.h.tmp
+	mv $(@D)/GL/glx.h.tmp $(@D)/GL/glx.h
+endef
+KHRONOS_REGISTRY_OPENGL_POST_BUILD_HOOKS += KHRONOS_REGISTRY_OPENGL_FIX_GLX_H
+
+define KHRONOS_REGISTRY_OPENGL_INSTALL_STAGING_CMDS
+	for d in $(KHRONOS_REGISTRY_OPENGL_DIRS); do \
+		for h in $(@D)/$${d}/*.h; do \
+			$(INSTALL) -D -m 0644 $${h} $(STAGING_DIR)/usr/include/$${d}/$${h##*/} \
+			|| exit 1; \
+		done \
+	done
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
