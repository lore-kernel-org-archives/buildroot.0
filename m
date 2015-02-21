From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 17:22:32 +0100
Subject: [Buildroot] [git commit branch/next] package/mesa3d-headers: new
	package
Message-ID: <20150221164241.EE7D480447@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8138a360181b60573ce070eb86b80f546dfc9cba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Some OpenGL/EGL/GLES/VG providers do not provide the corresponding
headers, and rely on using "the headers provided by the distribution".

In our case, we can not rely on such headers, because we are not a
distribution, and we have no way to provide those headers (not even
speaking about relying on the headers provided by hte host distribution,
because they might well not be installed at all).

Also, we can not rely on another package to provide those headers,
because we can only have one provider enabled in any configuration.

The Khronos group provides such headers, and they are the reference
headers, but we can not realy use them:

  - most of them are not packaged: they are not versioned and not
    provided in a tarball, but as separately downloadable files;

  - those headers are anyway incomplete: there are headers not provided
    by Khronos, like GL.h

Instead, we rely on mesa3d to provide those headers: mesa3d has all the
headers we need.

Modifying the existing mesa3d package would not be easy; we'd have to
differentiate whther we need only the headers or the full package. The
meas3d Config.in and .mk are already quite non-trivial that adding such
a feature would render them even more illegible.

So, we introduce mea3d-headers as a new package, that is in fact just
mesa3d with a much simplified Config.in and .mk, that other OpenXXX
providers may select if they do not provide the OpenXXX headers.

Note: we're not installing GLES3 headers, because what Buildroot
currently calls libgles is in fact libgles2; we have no way to specify
that we have libgles3. So, we just install headers for GLES and GLES2.

[Thomas:
  - Wrap Config.in help text to a reasonable length.
  - Don't rely on mesa3d to provide mesa3d-headers: they should be
    mutually exclusive. Instead, error out if both packages are
    selected.
  - Take into account the update of mesa3d to 10.4.5.
  - Don't copy each header file individually, use a cp -dpfr call to
    copy entires header files directories.]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |    1 +
 package/mesa3d-headers/Config.in           |    9 +++++
 package/mesa3d-headers/mesa3d-headers.hash |    1 +
 package/mesa3d-headers/mesa3d-headers.mk   |   48 ++++++++++++++++++++++++++++
 package/mesa3d/mesa3d.mk                   |    1 +
 5 files changed, 60 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 377cf9a..d333311 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -211,6 +211,7 @@ endif
 	source "package/linux-fusion/Config.in"
 	source "package/lite/Config.in"
 	source "package/mesa3d/Config.in"
+	source "package/mesa3d-headers/Config.in"
 	source "package/ocrad/Config.in"
 	source "package/psplash/Config.in"
 	source "package/sawman/Config.in"
diff --git a/package/mesa3d-headers/Config.in b/package/mesa3d-headers/Config.in
new file mode 100644
index 0000000..c4efab6
--- /dev/null
+++ b/package/mesa3d-headers/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_MESA3D_HEADERS
+	bool
+	help
+	  Mesa 3D, an open-source implementation of the OpenGL
+	  specification.
+
+	  This package only installs headers needed by other packages.
+
+	  http://mesa3d.org
diff --git a/package/mesa3d-headers/mesa3d-headers.hash b/package/mesa3d-headers/mesa3d-headers.hash
new file mode 120000
index 0000000..137d0be
--- /dev/null
+++ b/package/mesa3d-headers/mesa3d-headers.hash
@@ -0,0 +1 @@
+../mesa3d/mesa3d.hash
\ No newline at end of file
diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
new file mode 100644
index 0000000..0c4c9f4
--- /dev/null
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# mesa3d-headers
+#
+################################################################################
+
+# mesa3d-headers is inherently incompatible with mesa3d, so error out
+# if both are enabled.
+ifeq ($(BR2_PACKAGE_MESA3D)$(BR2_PACKAGE_MESA3D_HEADERS),yy)
+$(error mesa3d-headers enabled, but mesa3d enabled too)
+endif
+
+# Not possible to directly refer to mesa3d variables, because of
+# first/second expansion trickery...
+MESA3D_HEADERS_VERSION = 10.4.5
+MESA3D_HEADERS_SOURCE = MesaLib-$(MESA3D_HEADERS_VERSION).tar.bz2
+MESA3D_HEADERS_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_HEADERS_VERSION)
+MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
+MESA3D_HEADERS_LICENSE_FILES = docs/license.html
+
+# Only installs header files
+MESA3D_HEADERS_INSTALL_STAGING = YES
+MESA3D_HEADERS_INSTALL_TARGET = NO
+
+MESA3D_HEADERS_DIRS = KHR
+
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+MESA3D_HEADERS_DIRS += GL
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
+MESA3D_HEADERS_DIRS += EGL
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
+MESA3D_HEADERS_DIRS += GLES GLES2
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_LIBOPENVG),y)
+MESA3D_HEADERS_DIRS += VG
+endif
+
+define MESA3D_HEADERS_INSTALL_STAGING_CMDS
+	$(foreach d,$(MESA3D_HEADERS_DIRS),\
+		cp -dpfr $(@D)/include/$(d) $(STAGING_DIR)/usr/include/ || exit 1$(sep))
+endef
+
+$(eval $(generic-package))
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index c2d9d54..5e0e20e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# When updating the version, please also update mesa3d-headers
 MESA3D_VERSION = 10.4.5
 MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.bz2
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
