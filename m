From: Romain Naour <romain.naour@gmail.com>
Date: Wed,  1 Mar 2017 23:56:11 +0100
Subject: [Buildroot] [PATCH v3 2/2] package/supertux: new package
In-Reply-To: <20170301225611.11494-1-romain.naour@gmail.com>
References: <20170301225611.11494-1-romain.naour@gmail.com>
Message-ID: <20170301225611.11494-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Checked that libphysfs.so.1 is used by supertux2 binary.
$ LD_TRACE_LOADED_OBJECTS=1 /usr/bin/supertux2
	...
	libphysfs.so.1 => /usr/lib64/libphysfs.so.1

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v3: add physfs package dependency
    upate license list
v2: update GCC minimal version to 4.8
Coding style checked with check-package script (v1) and build tested
with test-pkg script.
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/supertux/Config.in     | 38 ++++++++++++++++++++++++++++++++
 package/supertux/supertux.hash |  2 ++
 package/supertux/supertux.mk   | 49 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 91 insertions(+)
 create mode 100644 package/supertux/Config.in
 create mode 100644 package/supertux/supertux.hash
 create mode 100644 package/supertux/supertux.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 2cc2401..21991b9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1292,6 +1292,7 @@ F:	package/mcelog/
 F:	package/openpowerlink/
 F:	package/physfs/
 F:	package/stress-ng/
+F:	package/supertux/
 F:	package/terminology/
 F:	package/upower/
 F:	package/xenomai/
diff --git a/package/Config.in b/package/Config.in
index b15e064..1a9172e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -229,6 +229,7 @@ menu "Games"
 	source "package/rubix/Config.in"
 	source "package/sl/Config.in"
 	source "package/stella/Config.in"
+	source "package/supertux/Config.in"
 	source "package/supertuxkart/Config.in"
 endmenu
 
diff --git a/package/supertux/Config.in b/package/supertux/Config.in
new file mode 100644
index 0000000..43f0e3a
--- /dev/null
+++ b/package/supertux/Config.in
@@ -0,0 +1,38 @@
+config BR2_PACKAGE_SUPERTUX
+	bool "supertux"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_HAS_LIBGL # libglew
+	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_XORG7 # libglew, SDL2 OpenGL (GLX)
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11 gcc attributes noreturn
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
+	depends on BR2_USE_MMU # SDL2 OpenGL (GLX)
+	depends on !BR2_STATIC_LIBS # SDL2
+	depends on BR2_USE_WCHAR # Boost
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_DATE_TIME
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_LIBGLEW
+	select BR2_PACKAGE_LIBGLU # GL/glu.h
+	select BR2_PACKAGE_LIBOGG
+	select BR2_PACKAGE_LIBVORBIS
+	select BR2_PACKAGE_OPENAL
+	select BR2_PACKAGE_PHYSFS
+	select BR2_PACKAGE_SDL2
+	select BR2_PACKAGE_SDL2_IMAGE
+	select BR2_PACKAGE_SDL2_OPENGL
+	help
+	  SuperTux is a free classic 2D jump'n run sidescroller game in
+	  a style similar to the original Super Mario games covered
+	  under the GNU GPL.
+
+	  http://supertux.github.io/
+
+comment "supertux needs X11 and a toolchain w/ C++, OpenGL backend, gcc >= 4.8, NPTL, dynamic library, wchar"
+	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_HAS_LIBGL || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		BR2_STATIC_LIBS || !BR2_USE_WCHAR
diff --git a/package/supertux/supertux.hash b/package/supertux/supertux.hash
new file mode 100644
index 0000000..c56f608
--- /dev/null
+++ b/package/supertux/supertux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 c9dc3b42991ce5c5d0d0cb94e44c4ec2373ad09029940f0e92331e7e9ada0ac5 SuperTux-v0.5.1-Source.tar.gz
diff --git a/package/supertux/supertux.mk b/package/supertux/supertux.mk
new file mode 100644
index 0000000..6a409e3
--- /dev/null
+++ b/package/supertux/supertux.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+# supertux
+#
+################################################################################
+
+SUPERTUX_VERSION = 0.5.1
+SUPERTUX_SITE = https://github.com/SuperTux/supertux/releases/download/v$(SUPERTUX_VERSION)
+SUPERTUX_SOURCE = SuperTux-v$(SUPERTUX_VERSION)-Source.tar.gz
+
+# Supertux itself is GPLv3+, but it bundles a few libraries with different
+# licenses (sexp-cpp, squirrel, tinygettext) which are linked statically.
+SUPERTUX_LICENSE = GPLv3+ (code), CC-BY-SA 2.0, CC-BY-SA 3.0, GPLv2+ (images music sounds)
+SUPERTUX_LICENSE_FILES = LICENSE.txt data/AUTHORS
+
+# Use bundled squirrel, tinygettext sexp-cpp packages which are hardcoded in
+# the CMake build system.
+SUPERTUX_DEPENDENCIES = host-pkgconf boost libcurl libgl libglew libglu \
+	libogg libvorbis openal physfs sdl2 sdl2_image
+
+# ENABLE_BOOST_STATIC_LIBS=OFF: use boost shared libraries since supertux
+# depends on !BR2_STATIC_LIBS and boost provide only shared libraries with
+# BR2_SHARED_LIBS.
+# ENABLE_OPENGL=ON: Can be disabled but will make SuperTux unplayable slow.
+# GLBINDING_ENABLED=OFF: use GLEW (default) instead of glbinding.
+# Install the game directly in /usr/bin and game data in /usr/share/supertux2.
+# Force using physfs.so from staging since the check on PHYSFS_getPrefDir symbol
+# in physfs.h (CHECK_SYMBOL_EXISTS) doesn't work.
+SUPERTUX_CONF_OPTS += \
+	-DENABLE_BOOST_STATIC_LIBS=OFF \
+	-DBUILD_DOCUMENTATION=OFF \
+	-DENABLE_OPENGL=ON \
+	-DGLBINDING_ENABLED=OFF \
+	-DINSTALL_SUBDIR_BIN="bin" \
+	-DINSTALL_SUBDIR_SHARE="share/supertux2" \
+	-DUSE_SYSTEM_PHYSFS=ON
+
+# Avoid incompatible posix_memalign declaration on x86 and x86_64 with
+# musl.
+# https://gcc.gnu.org/ml/gcc-patches/2015-05/msg01425.html
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL):$(BR2_i386)$(BR2_x86_64),y:y)
+define SUPERTUX_REMOVE_PEDANTIC
+	$(SED) 's% -pedantic%%' $(@D)/CMakeLists.txt
+	$(SED) 's%CHECK_CXX_FLAG(pedantic)%%' $(@D)/external/tinygettext/CMakeLists.txt
+endef
+SUPERTUX_POST_PATCH_HOOKS += SUPERTUX_REMOVE_PEDANTIC
+endif
+
+$(eval $(cmake-package))
-- 
2.9.3
