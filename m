From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Feb 2017 21:06:21 +0100
Subject: [Buildroot] [git commit branch/next] package/lugaru: new package
Message-ID: <20170226201311.DA4BB8221F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c61a6ab32d9c495f0234ebc46fe5fc2f8c1f4ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Lugaru needs SDL2 library with OpenGL support which require X11 support.
Otherwise Lugaru error out with "No dynamic GL support in video driver"
message.

https://osslugaru.gitlab.io/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-ImageIO-fix-invalid-conversion.patch      | 35 ++++++++++++++++++++
 package/lugaru/Config.in                           | 38 ++++++++++++++++++++++
 package/lugaru/lugaru.hash                         |  2 ++
 package/lugaru/lugaru.mk                           | 30 +++++++++++++++++
 6 files changed, 107 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3784a28..c7ca3ca 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1291,6 +1291,7 @@ F:	package/expedite/
 F:	package/iqvlinux/
 F:	package/liblinear/
 F:	package/linux-syscall-support/
+F:	package/lugaru/
 F:	package/mcelog/
 F:	package/openpowerlink/
 F:	package/stress-ng/
diff --git a/package/Config.in b/package/Config.in
index e6dbe58..3fa820b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -222,6 +222,7 @@ menu "Games"
 	source "package/gnuchess/Config.in"
 	source "package/lbreakout2/Config.in"
 	source "package/ltris/Config.in"
+	source "package/lugaru/Config.in"
 	source "package/opentyrian/Config.in"
 	source "package/opentyrian-data/Config.in"
 	source "package/prboom/Config.in"
diff --git a/package/lugaru/0001-ImageIO-fix-invalid-conversion.patch b/package/lugaru/0001-ImageIO-fix-invalid-conversion.patch
new file mode 100644
index 0000000..6096477
--- /dev/null
+++ b/package/lugaru/0001-ImageIO-fix-invalid-conversion.patch
@@ -0,0 +1,35 @@
+From 73e56ba8e91b6bae59220e6f25c1b7c15817edb5 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sun, 12 Feb 2017 21:17:44 +0100
+Subject: [PATCH] ImageIO: fix invalid conversion
+
+Fixes:
+Source/Utils/ImageIO.cpp:125:27: error: invalid conversion from 'int' to 'boolean' [-fpermissive]
+     cinfo.quantize_colors = 0;
+                           ^
+
+quantize_colors type is bool, so it must be initialized to TRUE or FALSE.
+
+Patch status: upsteam
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ Source/Utils/ImageIO.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/Utils/ImageIO.cpp b/Source/Utils/ImageIO.cpp
+index 706c201..c19a63e 100644
+--- a/Source/Utils/ImageIO.cpp
++++ b/Source/Utils/ImageIO.cpp
+@@ -122,7 +122,7 @@ static bool load_jpg(const char* file_name, ImageRec& tex)
+     (void)jpeg_read_header(&cinfo, TRUE);
+ 
+     cinfo.out_color_space = JCS_RGB;
+-    cinfo.quantize_colors = 0;
++    cinfo.quantize_colors = FALSE;
+     (void)jpeg_calc_output_dimensions(&cinfo);
+     (void)jpeg_start_decompress(&cinfo);
+ 
+-- 
+2.9.3
+
diff --git a/package/lugaru/Config.in b/package/lugaru/Config.in
new file mode 100644
index 0000000..521c89a
--- /dev/null
+++ b/package/lugaru/Config.in
@@ -0,0 +1,38 @@
+config BR2_PACKAGE_LUGARU
+	bool "lugaru"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_HAS_LIBGL # libglu
+	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_XORG7 # SDL2 OpenGL (GLX)
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
+	depends on BR2_USE_MMU # SDL2 OpenGL (GLX)
+	depends on !BR2_STATIC_LIBS # SDL2
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBGLU # GL/glu.h
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_LIBVORBIS
+	select BR2_PACKAGE_OPENAL
+	select BR2_PACKAGE_SDL2
+	select BR2_PACKAGE_SDL2_OPENGL
+	select BR2_PACKAGE_ZLIB
+	help
+	  Lugaru (pronounced Loo-GAH-roo) is a cross-platform
+	  third-person action game. The main character, Turner, is an
+	  anthropomorphic rebel bunny rabbit with impressive combat
+	  skills. In his quest to find those responsible for
+	  slaughtering his village, he uncovers a far-reaching
+	  conspiracy involving the corrupt leaders of the rabbit
+	  republic and the starving wolves from a nearby den. Turner
+	  takes it upon himself to fight against their plot and save
+	  his fellow rabbits from slavery.
+
+	  https://osslugaru.gitlab.io/
+
+comment "lugaru needs X11 and a toolchain w/ C++, OpenGL backend, gcc >= 4.7, NPTL, dynamic library"
+	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_HAS_LIBGL || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		BR2_STATIC_LIBS
diff --git a/package/lugaru/lugaru.hash b/package/lugaru/lugaru.hash
new file mode 100644
index 0000000..6ba2bca
--- /dev/null
+++ b/package/lugaru/lugaru.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 f3ea477caf78911c69939fbdc163f9f6517c7ef2267e716a0e050be1a166ef97 lugaru-1.2.tar.xz
diff --git a/package/lugaru/lugaru.mk b/package/lugaru/lugaru.mk
new file mode 100644
index 0000000..7704931
--- /dev/null
+++ b/package/lugaru/lugaru.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# lugaru
+#
+################################################################################
+
+LUGARU_VERSION = 1.2
+LUGARU_SITE = https://bitbucket.org/osslugaru/lugaru/downloads
+LUGARU_SOURCE = lugaru-$(LUGARU_VERSION).tar.xz
+
+LUGARU_LICENSE = GPLv2+, CC-BY-SA-3.0 (Wolfire and Slib assets), \
+	CC-BY-SA-4.0 (OSS Lugaru, Jendraz and Philtron R. assets)
+LUGARU_LICENSE_FILES = COPYING.txt CONTENT-LICENSE.txt
+
+LUGARU_DEPENDENCIES = host-pkgconf jpeg libgl libglu libpng libvorbis \
+	openal sdl2 zlib
+
+# Avoid incompatible posix_memalign declaration on x86 and x86_64 with
+# musl.
+# https://gcc.gnu.org/ml/gcc-patches/2015-05/msg01425.html
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL):$(BR2_i386)$(BR2_x86_64),y:y)
+define LUGARU_REMOVE_PEDANTIC
+	$(SED) 's% -pedantic%%' $(@D)/CMakeLists.txt
+endef
+LUGARU_POST_PATCH_HOOKS += LUGARU_REMOVE_PEDANTIC
+endif
+
+LUGARU_CONF_OPTS = -DSYSTEM_INSTALL=ON
+
+$(eval $(cmake-package))
