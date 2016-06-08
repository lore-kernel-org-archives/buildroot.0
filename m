From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  8 Jun 2016 18:42:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/fs-uae: new package
Message-ID: <1465404120-27923-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                    |  1 +
 package/fs-uae/0001-host-tools.patch | 63 ++++++++++++++++++++++++++++++++++++
 package/fs-uae/Config.in             | 36 +++++++++++++++++++++
 package/fs-uae/fs-uae.hash           |  4 +++
 package/fs-uae/fs-uae.mk             | 57 ++++++++++++++++++++++++++++++++
 5 files changed, 161 insertions(+)
 create mode 100644 package/fs-uae/0001-host-tools.patch
 create mode 100644 package/fs-uae/Config.in
 create mode 100644 package/fs-uae/fs-uae.hash
 create mode 100644 package/fs-uae/fs-uae.mk

diff --git a/package/Config.in b/package/Config.in
index 660cdcc..150fc15 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -229,6 +229,7 @@ endmenu
 menu "Games"
 	source "package/chocolate-doom/Config.in"
 	source "package/doom-wad/Config.in"
+	source "package/fs-uae/Config.in"
 	source "package/gnuchess/Config.in"
 	source "package/lbreakout2/Config.in"
 	source "package/ltris/Config.in"
diff --git a/package/fs-uae/0001-host-tools.patch b/package/fs-uae/0001-host-tools.patch
new file mode 100644
index 0000000..932e638
--- /dev/null
+++ b/package/fs-uae/0001-host-tools.patch
@@ -0,0 +1,63 @@
+Cross-compiling needs some tools as host version
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr fs-uae-2.5.30dev.org/Makefile.am fs-uae-2.5.30dev/Makefile.am
+--- fs-uae-2.5.30dev.org/Makefile.am	2015-03-30 22:16:10.000000000 +0200
++++ fs-uae-2.5.30dev/Makefile.am	2015-05-03 13:36:14.295397247 +0200
+@@ -1165,30 +1165,30 @@
+ 
+ CLEANFILES = $(BUILT_SOURCES)
+ 
+-gen/blit.h: gen/genblitter$(EXEEXT)
+-	$(b)/gen/genblitter$(EXEEXT) i > $(b)/gen/blit.h
++gen/blit.h: gen/genblitter_host$(EXEEXT)
++	$(b)/gen/genblitter_host$(EXEEXT) i > $(b)/gen/blit.h
+ 
+-gen/blitfunc.cpp: gen/genblitter$(EXEEXT) gen/blitfunc.h
+-	$(b)/gen/genblitter$(EXEEXT) f > $(b)/gen/blitfunc.cpp
++gen/blitfunc.cpp: gen/genblitter_host$(EXEEXT) gen/blitfunc.h
++	$(b)/gen/genblitter_host$(EXEEXT) f > $(b)/gen/blitfunc.cpp
+ 
+-gen/blitfunc.h: gen/genblitter$(EXEEXT)
+-	$(b)/gen/genblitter$(EXEEXT) h > $(b)/gen/blitfunc.h
++gen/blitfunc.h: gen/genblitter_host$(EXEEXT)
++	$(b)/gen/genblitter_host$(EXEEXT) h > $(b)/gen/blitfunc.h
+ 
+-gen/blittable.cpp: gen/genblitter$(EXEEXT) gen/blitfunc.h
+-	$(b)/gen/genblitter$(EXEEXT) t > $(b)/gen/blittable.cpp
++gen/blittable.cpp: gen/genblitter_host$(EXEEXT) gen/blitfunc.h
++	$(b)/gen/genblitter_host$(EXEEXT) t > $(b)/gen/blittable.cpp
+ 
+-gen/compemu.cpp: gen/gencomp$(EXEEXT)
+-	$(b)/gen/gencomp$(EXEEXT)
++gen/compemu.cpp: gen/gencomp_host$(EXEEXT)
++	$(b)/gen/gencomp_host$(EXEEXT)
+ 
+ gen/compstbl.cpp: gen/compemu.cpp
+ 
+ gen/comptbl.h: gen/compemu.cpp
+ 
+-gen/cpudefs.cpp: gen/build68k$(EXEEXT) src/table68k
+-	$(b)/gen/build68k$(EXEEXT) < $(s)/src/table68k > $(b)/gen/cpudefs.cpp
++gen/cpudefs.cpp: gen/build68k_host$(EXEEXT) src/table68k
++	$(b)/gen/build68k_host$(EXEEXT) < $(s)/src/table68k > $(b)/gen/cpudefs.cpp
+ 
+-gen/cpuemu_0.cpp: gen/gencpu$(EXEEXT)
+-	cd $(b)/gen && ./gencpu$(EXEEXT) --optimized-flags
++gen/cpuemu_0.cpp: gen/gencpu_host$(EXEEXT)
++	cd $(b)/gen && ./gencpu_host$(EXEEXT) --optimized-flags
+ 
+ gen/cpuemu_11.cpp: gen/cpuemu_0.cpp
+ 
+@@ -1216,8 +1216,8 @@
+ 
+ gen/cputbl.h: gen/cpuemu_0.cpp
+ 
+-gen/linetoscr.cpp: gen/genlinetoscr$(EXEEXT)
+-	$(b)/gen/genlinetoscr$(EXEEXT) > $(b)/gen/linetoscr.cpp
++gen/linetoscr.cpp: gen/genlinetoscr_host$(EXEEXT)
++	$(b)/gen/genlinetoscr_host$(EXEEXT) > $(b)/gen/linetoscr.cpp
+ 
+ catalogs = \
+ 	share/locale/cs/LC_MESSAGES/fs-uae.mo \
diff --git a/package/fs-uae/Config.in b/package/fs-uae/Config.in
new file mode 100644
index 0000000..4134f12
--- /dev/null
+++ b/package/fs-uae/Config.in
@@ -0,0 +1,36 @@
+config BR2_PACKAGE_FS_UAE
+	bool "fs-uae"
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_LIBGLEW
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBGLU
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_OPENAL
+	select BR2_PACKAGE_SDL2
+	select BR2_PACKAGE_SDL2_X11
+	select BR2_PACKAGE_XLIB_LIBXI
+	select BR2_PACKAGE_ZLIB
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_XORG7
+	depends on !BR2_STATIC_LIBS # sdl2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # fenv.h
+	depends on BR2_USE_MMU # libglib2
+	depends on BR2_USE_WCHAR # libglib2, X.org
+	help
+	  FS-UAE integrates the most accurate Amiga emulation code
+	  available from WinUAE. FS-UAE emulates A500, A500+, A600,
+	  A1200, A1000, A3000 and A4000 models, but you can tweak the
+	  hardware configuration and create customized Amigas.
+
+	  http://fs-uae.net
+
+comment "fs-uae needs an OpenGL backend, X.org and a (e)glibc/musl toolchain w/ C++, dynamic library, threads, wchar"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) \
+		|| !BR2_PACKAGE_HAS_LIBGL || !BR2_PACKAGE_XORG7 \
+		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
+		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
diff --git a/package/fs-uae/fs-uae.hash b/package/fs-uae/fs-uae.hash
new file mode 100644
index 0000000..9284d25
--- /dev/null
+++ b/package/fs-uae/fs-uae.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256 9df7445bccef5255a66135f040dfbcac48b20df79f09daced166c8771428da83 fs-uae-2.7.14dev.tar.gz
+sha256 a00db7a414706830522d3caf1129748b796c88a81929cfd504d289d00df13f0f d4aa0454e39991b20801ec1f99c475156190c8ef.patch
+sha256 e6e310903c1a1ab20ae8be83dcd497ee2322ca9060a7bb898891a4b44a2e62f2 f09e81f712ae9b78220e945559cbca6a76cdf49b.patch
diff --git a/package/fs-uae/fs-uae.mk b/package/fs-uae/fs-uae.mk
new file mode 100644
index 0000000..ba9d3ad
--- /dev/null
+++ b/package/fs-uae/fs-uae.mk
@@ -0,0 +1,57 @@
+################################################################################
+#
+# fs-uae
+#
+################################################################################
+
+FS_UAE_VERSION = 2.7.14dev
+FS_UAE_SITE = https://fs-uae.net/devel/$(FS_UAE_VERSION)
+FS_UAE_PATCH = \
+	https://github.com/FrodeSolheim/fs-uae/commit/d4aa0454e39991b20801ec1f99c475156190c8ef.patch \
+	https://github.com/FrodeSolheim/fs-uae/commit/f09e81f712ae9b78220e945559cbca6a76cdf49b.patch
+FS_UAE_LICENSE = GPLv2
+FS_UAE_LICENSE_FILES = COPYING
+FS_UAE_AUTORECONF = YES
+FS_UAE_DEPENDENCIES = host-pkgconf host-zip libgl libglew libglib2 \
+	libglu libpng openal sdl2 xlib_libXi zlib
+FS_UAE_CONF_OPTS = --with-glew
+
+ifeq ($(BR2_PACKAGE_LIBMPEG2),y)
+FS_UAE_DEPENDENCIES += libmpeg2
+FS_UAE_CONF_OPTS += --with-libmpeg2
+else
+FS_UAE_CONF_OPTS += --without-libmpeg2
+endif
+
+ifeq ($(BR2_PACKAGE_QT5BASE_GUI),y)
+FS_UAE_DEPENDENCIES += qt5base
+FS_UAE_CONF_OPTS += --with-qt
+else
+FS_UAE_CONF_OPTS += --without-qt
+endif
+
+# fs-uae needs some tools compiled for the host during build
+FS_UAE_CXXFLAGS_FOR_HOST_TOOLS = \
+	-DHAVE_CONFIG_H -I.  -DLINUX -DUAE -DFSUAE -I./flac/include \
+	-I./gen -I./src -I./src/jit -I./src/include -I./src/od-fs \
+	-I./src/od-fs/include -I./src/od-win32 -I./src/od-win32/caps \
+	-I./libfsemu/include -I./glee -I./manymouse -I./src/slirp/include \
+	-I./libudis86/include  -I./prowizard/include -I./softfloat
+
+define FS_UAE_MAKE_HOST_TOOLS
+	mkdir -p $(@D)/gen
+	cd $(@D) && $(HOSTCXX) $(HOST_CXXFLAGS) $(FS_UAE_CXXFLAGS_FOR_HOST_TOOLS) $(HOST_LDFLAGS) \
+		-o gen/genblitter_host src/blitops.cpp src/genblitter.cpp src/writelog.cpp
+	cd $(@D) && $(HOSTCXX) $(HOST_CXXFLAGS) $(FS_UAE_CXXFLAGS_FOR_HOST_TOOLS) $(HOST_LDFLAGS) \
+		-o gen/genlinetoscr_host src/genlinetoscr.cpp
+	cd $(@D) && $(HOSTCXX) $(HOST_CXXFLAGS) $(FS_UAE_CXXFLAGS_FOR_HOST_TOOLS) $(HOST_LDFLAGS) \
+		-o gen/build68k_host src/build68k.cpp src/writelog.cpp
+	cd $(@D) && ./gen/build68k_host < ./src/table68k > ./gen/cpudefs.cpp
+	cd $(@D) && $(HOSTCXX) $(HOST_CXXFLAGS) $(FS_UAE_CXXFLAGS_FOR_HOST_TOOLS) $(HOST_LDFLAGS) \
+		-o gen/gencomp_host src/jit/gencomp.cpp src/missing.cpp src/readcpu.cpp gen/cpudefs.cpp
+	cd $(@D) && $(HOSTCXX) $(HOST_CXXFLAGS) $(FS_UAE_CXXFLAGS_FOR_HOST_TOOLS) $(HOST_LDFLAGS) \
+		-o gen/gencpu_host src/gencpu.cpp src/missing.cpp src/readcpu.cpp gen/cpudefs.cpp
+endef
+FS_UAE_POST_CONFIGURE_HOOKS = FS_UAE_MAKE_HOST_TOOLS
+
+$(eval $(autotools-package))
-- 
2.8.1
