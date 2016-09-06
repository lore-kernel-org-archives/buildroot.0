From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  6 Sep 2016 22:36:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/ghostscript: new package
Message-ID: <20160906203620.4685-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                             |   1 +
 package/ghostscript/0001-libtiffconfdir.patch |  26 +++++++
 package/ghostscript/Config.in                 |  22 ++++++
 package/ghostscript/ghostscript.hash          |  13 ++++
 package/ghostscript/ghostscript.mk            | 102 ++++++++++++++++++++++++++
 package/ghostscript/objarch.h-aarch64         |  40 ++++++++++
 package/ghostscript/objarch.h-arm             |  40 ++++++++++
 package/ghostscript/objarch.h-armeb           |  40 ++++++++++
 package/ghostscript/objarch.h-i686            |  41 +++++++++++
 package/ghostscript/objarch.h-microblaze      |  40 ++++++++++
 package/ghostscript/objarch.h-microblazeel    |  40 ++++++++++
 package/ghostscript/objarch.h-mips            |  40 ++++++++++
 package/ghostscript/objarch.h-mips64          |  40 ++++++++++
 package/ghostscript/objarch.h-mips64el        |  40 ++++++++++
 package/ghostscript/objarch.h-mipsel          |  40 ++++++++++
 package/ghostscript/objarch.h-nios2           |  40 ++++++++++
 package/ghostscript/objarch.h-powerpc         |  40 ++++++++++
 package/ghostscript/objarch.h-powerpc64       |  40 ++++++++++
 package/ghostscript/objarch.h-x86_64          |  40 ++++++++++
 19 files changed, 725 insertions(+)
 create mode 100644 package/ghostscript/0001-libtiffconfdir.patch
 create mode 100644 package/ghostscript/Config.in
 create mode 100644 package/ghostscript/ghostscript.hash
 create mode 100644 package/ghostscript/ghostscript.mk
 create mode 100644 package/ghostscript/objarch.h-aarch64
 create mode 100644 package/ghostscript/objarch.h-arm
 create mode 100644 package/ghostscript/objarch.h-armeb
 create mode 100644 package/ghostscript/objarch.h-i686
 create mode 100644 package/ghostscript/objarch.h-microblaze
 create mode 100644 package/ghostscript/objarch.h-microblazeel
 create mode 100644 package/ghostscript/objarch.h-mips
 create mode 100644 package/ghostscript/objarch.h-mips64
 create mode 100644 package/ghostscript/objarch.h-mips64el
 create mode 100644 package/ghostscript/objarch.h-mipsel
 create mode 100644 package/ghostscript/objarch.h-nios2
 create mode 100644 package/ghostscript/objarch.h-powerpc
 create mode 100644 package/ghostscript/objarch.h-powerpc64
 create mode 100644 package/ghostscript/objarch.h-x86_64

diff --git a/package/Config.in b/package/Config.in
index add6052..0c0f226 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -229,6 +229,7 @@ menu "Graphic libraries and applications (graphic/text)"
 comment "Graphic applications"
 	source "package/expedite/Config.in"
 	source "package/fswebcam/Config.in"
+	source "package/ghostscript/Config.in"
 	source "package/glmark2/Config.in"
 	source "package/gnuplot/Config.in"
 	source "package/jhead/Config.in"
diff --git a/package/ghostscript/0001-libtiffconfdir.patch b/package/ghostscript/0001-libtiffconfdir.patch
new file mode 100644
index 0000000..19b34e4
--- /dev/null
+++ b/package/ghostscript/0001-libtiffconfdir.patch
@@ -0,0 +1,26 @@
+Fix cross compile bug
+
+Without this patch unsafe paths are used:
+x86_64-linux-gcc: ERROR: unsafe header/library path used in cross-compilation: '/libtiff'
+
+Downloaded from
+http://bugs.ghostscript.com/show_bug.cgi?id=696508#c3
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+@@ -, +, @@ 
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+--- a/configure.ac	
++++ a/configure.ac	
+@@ -989,7 +989,7 @@ XPSWRITEDEVICE=''
+ 
+ 
+ LIBTIFFDIR='src'
+-LIBTIFFCONFDIR=''
++LIBTIFFCONFDIR='src'
+ 
+ TIFFDEVS_ALL='tiffs tiff12nc tiff24nc tiff48nc tiff32nc tiff64nc tiffcrle tifflzw tiffpack tiffgray tiffsep tiffsep1 tiffscaled tiffscaled4 tiffscaled8 tiffscaled24 tiffscaled32'
+ FAX_DEVS_ALL='cfax dfaxlow dfaxhigh fax faxg3 faxg32d faxg4 tiffg3 tiffg32d tiffg4 tfax'
+-- 
diff --git a/package/ghostscript/Config.in b/package/ghostscript/Config.in
new file mode 100644
index 0000000..531873f
--- /dev/null
+++ b/package/ghostscript/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_GHOSTSCRIPT_ARCH_SUPPORTS
+	bool
+	default y if BR2_arm || BR2_armeb || BR2_aarch64 || \
+		BR2_i386 || BR2_x86_64 || \
+		BR2_microblazeel || BR2_microblazebe || \
+		BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
+		BR2_powerpc || BR2_powerpc64
+
+config BR2_PACKAGE_GHOSTSCRIPT
+	bool "ghostscript"
+	depends on BR2_PACKAGE_GHOSTSCRIPT_ARCH_SUPPORTS
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_GHOSTSCRIPT_FONTS
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LCMS2
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_TIFF
+	help
+	  Ghostscript is an interpreter for PostScript and Portable
+	  Document Format (PDF) files.
+
+	  http://ghostscript.com
diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
new file mode 100644
index 0000000..85e6a82
--- /dev/null
+++ b/package/ghostscript/ghostscript.hash
@@ -0,0 +1,13 @@
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs919/SHA1SUMS
+sha1 6ac5c1fb665b3201622e1149f04c641c506bf6c4  ghostscript-9.19.tar.bz2
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs919/MD5SUMS
+md5 8dc536f97bff762791709ca6d64fc44c  ghostscript-9.19.tar.bz2
+# Locally computed
+sha256 f66dedf882ba69604bd84d33f3db13bb68fd8ae8d8825a49b3f860d2d9c567b2  base-genht.c-add-a-preprocessor-define-to-allow-fope.patch
+sha256 97b5680f0e75ba0d5bdbc374ce991886c071a9fbcd38c0af5da480305f936b8e  do-not-check-local-libpng-source.patch
+sha256 ad3805e00c5b58691e1a4d47f603a06347cdb0188660060b247d56d34ef08700  ghostscript-9.02-genarch.patch
+sha256 4ffb38a517067bce5d27fa1bae128f7e304647df3f1a17d6e1d27c7f22248b6b  ghostscript-9.02-prevent_recompiling.patch
+sha256 5358e6c979210433290f33f2c72619dc67a6f956f556f05adc83ae1435529989  ghostscript-9.15-parallel-make.patch
+sha256 d981e7f186091a6439ea2d668b2fd7ccbad91b0cde0d676f568b1bdbc37fde65  ghostscript-9.16-Werror-return-type.patch
+sha256 aa3e296d7ed14dfbeb23f021c87e0ad380c5d3bd8741bb9e701aaab7a88d123c  ghostscript-native-fix-disable-system-libtiff.patch
+sha256 ff8197f38f621f8264e50416db959b4d4c9837315c0178d8d616c72bd19faecf  png_mak.patch
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
new file mode 100644
index 0000000..f761062
--- /dev/null
+++ b/package/ghostscript/ghostscript.mk
@@ -0,0 +1,102 @@
+################################################################################
+#
+# ghostscript
+#
+################################################################################
+
+GHOSTSCRIPT_VERSION = 9.19
+GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.bz2
+GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs919
+GHOSTSCRIPT_LICENSE = AGPLv3
+GHOSTSCRIPT_LICENSE_FILES = LICENSE
+# 0001-libtiffconfdir.patch
+GHOSTSCRIPT_AUTORECONF = YES
+HOST_GHOSTSCRIPT_AUTORECONF = YES
+GHOSTSCRIPT_DEPENDENCIES = host-ghostscript host-pkgconf \
+	fontconfig ghostscript-fonts jpeg lcms2 libpng tiff
+GHOSTSCRIPT_PATCH = \
+	http://cgit.openembedded.org/openembedded-core/plain/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch \
+	http://cgit.openembedded.org/openembedded-core/plain/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-prevent_recompiling.patch \
+	http://cgit.openembedded.org/openembedded-core/plain/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.15-parallel-make.patch \
+	http://cgit.openembedded.org/openembedded-core/plain/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch \
+	http://cgit.openembedded.org/openembedded-core/plain/meta/recipes-extended/ghostscript/ghostscript/png_mak.patch \
+	http://cgit.openembedded.org/openembedded-core/plain/meta/recipes-extended/ghostscript/files/do-not-check-local-libpng-source.patch
+HOST_GHOSTSCRIPT_DEPENDENCIES = host-pkgconf libpng
+HOST_GHOSTSCRIPT_PATCH = \
+	http://cgit.openembedded.org/openembedded-core/plain/meta/recipes-extended/ghostscript/ghostscript/ghostscript-native-fix-disable-system-libtiff.patch \
+	http://cgit.openembedded.org/openembedded-core/plain/meta/recipes-extended/ghostscript/ghostscript/base-genht.c-add-a-preprocessor-define-to-allow-fope.patch
+
+# Ghostscript has no support for cross-compiling. Instead it expects
+# pre-configured headers containing platform specifics.
+# The headers we use were downloaded from openembedded
+# http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-extended/ghostscript/ghostscript
+GHOSTSCRIPT_ARCH = $(subst ",,$(if $(BR2_i386),i686,$(BR2_ARCH)))
+define GHOSTSCRIPT_INSTALL_OBJ_H
+	$(INSTALL) -D -m 0644 package/ghostscript/objarch.h-$(GHOSTSCRIPT_ARCH) $(@D)/obj/arch.h
+endef
+GHOSTSCRIPT_POST_PATCH_HOOKS += GHOSTSCRIPT_INSTALL_OBJ_H
+
+# Ghostscript includes (old) copies of several libraries, delete them.
+# Inspired by linuxfromscratch:
+# http://www.linuxfromscratch.org/blfs/view/svn/pst/gs.html
+define GHOSTSCRIPT_REMOVE_LIBS
+	rm -rf $(@D)/freetype $(@D)/lcms2 $(@D)/jpeg $(@D)/tiff $(@D)/zlib
+endef
+GHOSTSCRIPT_POST_PATCH_HOOKS += GHOSTSCRIPT_REMOVE_LIBS
+
+define GHOSTSCRIPT_INSTALL_HOST_TOOLS
+	for i in genarch genconf mkromfs echogs gendev genht; do \
+		$(INSTALL) -D -m 755 $(HOST_DIR)/usr/bin/$$i $(@D)/obj/aux/$$i ; \
+	done
+endef
+GHOSTSCRIPT_POST_CONFIGURE_HOOKS += GHOSTSCRIPT_INSTALL_HOST_TOOLS
+
+GHOSTSCRIPT_CONF_OPTS = \
+	--disable-compile-inits \
+	--disable-cups \
+	--enable-fontconfig \
+	--with-fontpath=$(GHOSTSCRIPT_FONTS_TARGET_DIR) \
+	--enable-freetype \
+	--disable-gtk \
+	--without-jbig2dec \
+	--without-libpaper \
+	--with-system-libtiff
+
+ifeq ($(BR2_PACKAGE_LIBIDN),y)
+GHOSTSCRIPT_DEPENDENCIES += libidn
+GHOSTSCRIPT_CONF_OPTS += --with-libidn
+else
+GHOSTSCRIPT_CONF_OPTS += --without-libidn
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
+GHOSTSCRIPT_DEPENDENCIES += xlib_libX11
+GHOSTSCRIPT_CONF_OPTS += --with-x
+else
+GHOSTSCRIPT_CONF_OPTS += --without-x
+endif
+
+HOST_GHOSTSCRIPT_CONF_OPTS = \
+	--disable-cups \
+	--disable-fontconfig \
+	--disable-freetype \
+	--without-jbig2dec \
+	--without-libidn \
+	--with-system-libtiff=no \
+	--without-x
+
+define HOST_GHOSTSCRIPT_BUILD_CMDS
+	mkdir -p $(@D)/obj
+	for i in genarch genconf mkromfs echogs gendev genht; do \
+		$(HOST_GHOSTSCRIPT_MAKE_ENV) $(MAKE) -C $(@D) obj/aux/$$i ; \
+	done
+endef
+
+define HOST_GHOSTSCRIPT_INSTALL_CMDS
+	for i in genarch genconf mkromfs echogs gendev genht; do \
+		$(INSTALL) -D -m 755 $(@D)/obj/aux/$$i $(HOST_DIR)/usr/bin/$$i ; \
+	done
+endef
+
+$(eval $(host-autotools-package))
+$(eval $(autotools-package))
diff --git a/package/ghostscript/objarch.h-aarch64 b/package/ghostscript/objarch.h-aarch64
new file mode 100644
index 0000000..a05de29
--- /dev/null
+++ b/package/ghostscript/objarch.h-aarch64
@@ -0,0 +1,40 @@
+/* Parameters derived from machine and compiler architecture. */
+/* This file is generated mechanically by genarch.c. */
+
+	 /* ---------------- Scalar alignments ---------------- */
+
+#define ARCH_ALIGN_SHORT_MOD 2
+#define ARCH_ALIGN_INT_MOD 4
+#define ARCH_ALIGN_LONG_MOD 8
+#define ARCH_ALIGN_PTR_MOD 8
+#define ARCH_ALIGN_FLOAT_MOD 4
+#define ARCH_ALIGN_DOUBLE_MOD 8
+
+	 /* ---------------- Scalar sizes ---------------- */
+
+#define ARCH_LOG2_SIZEOF_CHAR 0
+#define ARCH_LOG2_SIZEOF_SHORT 1
+#define ARCH_LOG2_SIZEOF_INT 2
+#define ARCH_LOG2_SIZEOF_LONG 3
+#define ARCH_LOG2_SIZEOF_LONG_LONG 3
+#define ARCH_SIZEOF_GX_COLOR_INDEX 8
+#define ARCH_SIZEOF_PTR 8
+#define ARCH_SIZEOF_FLOAT 4
+#define ARCH_SIZEOF_DOUBLE 8
+#define ARCH_FLOAT_MANTISSA_BITS 24
+#define ARCH_DOUBLE_MANTISSA_BITS 53
+
+	 /* ---------------- Unsigned max values ---------------- */
+
+#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
+#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
+#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
+#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
+
+	 /* ---------------- Miscellaneous ---------------- */
+
+#define ARCH_IS_BIG_ENDIAN 0
+#define ARCH_PTRS_ARE_SIGNED 0
+#define ARCH_FLOATS_ARE_IEEE 1
+#define ARCH_ARITH_RSHIFT 2
+#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/package/ghostscript/objarch.h-arm b/package/ghostscript/objarch.h-arm
new file mode 100644
index 0000000..e8772cd
--- /dev/null
+++ b/package/ghostscript/objarch.h-arm
@@ -0,0 +1,40 @@
+/* Parameters derived from machine and compiler architecture. */
+/* This file is generated mechanically by genarch.c. */
+
+	 /* ---------------- Scalar alignments ---------------- */
+
+#define ARCH_ALIGN_SHORT_MOD 2
+#define ARCH_ALIGN_INT_MOD 4
+#define ARCH_ALIGN_LONG_MOD 4
+#define ARCH_ALIGN_PTR_MOD 4
+#define ARCH_ALIGN_FLOAT_MOD 4
+#define ARCH_ALIGN_DOUBLE_MOD 8
+
+	 /* ---------------- Scalar sizes ---------------- */
+
+#define ARCH_LOG2_SIZEOF_CHAR 0
+#define ARCH_LOG2_SIZEOF_SHORT 1
+#define ARCH_LOG2_SIZEOF_INT 2
+#define ARCH_LOG2_SIZEOF_LONG 2
+#define ARCH_LOG2_SIZEOF_LONG_LONG 3
+#define ARCH_SIZEOF_GX_COLOR_INDEX 8
+#define ARCH_SIZEOF_PTR 4
+#define ARCH_SIZEOF_FLOAT 4
+#define ARCH_SIZEOF_DOUBLE 8
+#define ARCH_FLOAT_MANTISSA_BITS 24
+#define ARCH_DOUBLE_MANTISSA_BITS 53
+
+	 /* ---------------- Unsigned max values ---------------- */
+
+#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
+#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
+#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
+#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
+
+	 /* ---------------- Miscellaneous ---------------- */
+
+#define ARCH_IS_BIG_ENDIAN 0
+#define ARCH_PTRS_ARE_SIGNED 0
+#define ARCH_FLOATS_ARE_IEEE 1
+#define ARCH_ARITH_RSHIFT 2
+#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/package/ghostscript/objarch.h-armeb b/package/ghostscript/objarch.h-armeb
new file mode 100644
index 0000000..359097f
--- /dev/null
+++ b/package/ghostscript/objarch.h-armeb
@@ -0,0 +1,40 @@
+/* Parameters derived from machine and compiler architecture. */
+/* This file is generated mechanically by genarch.c. */
+
+	 /* ---------------- Scalar alignments ---------------- */
+
+#define ARCH_ALIGN_SHORT_MOD 2
+#define ARCH_ALIGN_INT_MOD 4
+#define ARCH_ALIGN_LONG_MOD 4
+#define ARCH_ALIGN_PTR_MOD 4
+#define ARCH_ALIGN_FLOAT_MOD 4
+#define ARCH_ALIGN_DOUBLE_MOD 8
+
+	 /* ---------------- Scalar sizes ---------------- */
+
+#define ARCH_LOG2_SIZEOF_CHAR 0
+#define ARCH_LOG2_SIZEOF_SHORT 1
+#define ARCH_LOG2_SIZEOF_INT 2
+#define ARCH_LOG2_SIZEOF_LONG 2
+#define ARCH_LOG2_SIZEOF_LONG_LONG 3
+#define ARCH_SIZEOF_GX_COLOR_INDEX 8
+#define ARCH_SIZEOF_PTR 4
+#define ARCH_SIZEOF_FLOAT 4
+#define ARCH_SIZEOF_DOUBLE 8
+#define ARCH_FLOAT_MANTISSA_BITS 24
+#define ARCH_DOUBLE_MANTISSA_BITS 53
+
+	 /* ---------------- Unsigned max values ---------------- */
+
+#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
+#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
+#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
+#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
+
+	 /* ---------------- Miscellaneous ---------------- */
+
+#define ARCH_IS_BIG_ENDIAN 1
+#define ARCH_PTRS_ARE_SIGNED 0
+#define ARCH_FLOATS_ARE_IEEE 1
+#define ARCH_ARITH_RSHIFT 2
+#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/package/ghostscript/objarch.h-i686 b/package/ghostscript/objarch.h-i686
new file mode 100644
index 0000000..5817b7a
--- /dev/null
+++ b/package/ghostscript/objarch.h-i686
@@ -0,0 +1,41 @@
+/* Parameters derived from machine and compiler architecture. */
+/* This file is generated mechanically by genarch.c. */
+
+	 /* ---------------- Scalar alignments ---------------- */
+
+#define ARCH_ALIGN_SHORT_MOD 2
+#define ARCH_ALIGN_INT_MOD 4
+#define ARCH_ALIGN_LONG_MOD 4
+#define ARCH_ALIGN_PTR_MOD 4
+#define ARCH_ALIGN_FLOAT_MOD 4
+#define ARCH_ALIGN_DOUBLE_MOD 4
+
+	 /* ---------------- Scalar sizes ---------------- */
+
+#define ARCH_LOG2_SIZEOF_CHAR 0
+#define ARCH_LOG2_SIZEOF_SHORT 1
+#define ARCH_LOG2_SIZEOF_INT 2
+#define ARCH_LOG2_SIZEOF_LONG 2
+#define ARCH_LOG2_SIZEOF_LONG_LONG 3
+#define ARCH_SIZEOF_GX_COLOR_INDEX 8
+#define ARCH_SIZEOF_PTR 4
+#define ARCH_SIZEOF_FLOAT 4
+#define ARCH_SIZEOF_DOUBLE 8
+#define ARCH_FLOAT_MANTISSA_BITS 24
+#define ARCH_DOUBLE_MANTISSA_BITS 53
+
+	 /* ---------------- Unsigned max values ---------------- */
+
+#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
+#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
+#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
+#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
+
+	 /* ---------------- Miscellaneous ---------------- */
+
+#define ARCH_IS_BIG_ENDIAN 0
+#define ARCH_PTRS_ARE_SIGNED 0
+#define ARCH_FLOATS_ARE_IEEE 1
+#define ARCH_ARITH_RSHIFT 2
+#define ARCH_DIV_NEG_POS_TRUNCATES 1
+
diff --git a/package/ghostscript/objarch.h-microblaze b/package/ghostscript/objarch.h-microblaze
new file mode 100644
index 0000000..63232fd
--- /dev/null
+++ b/package/ghostscript/objarch.h-microblaze
@@ -0,0 +1,40 @@
+/* Parameters derived from machine and compiler architecture. */
+/* This file is generated mechanically by genarch.c. */
+
+	 /* ---------------- Scalar alignments ---------------- */
+
+#define ARCH_ALIGN_SHORT_MOD 2
+#define ARCH_ALIGN_INT_MOD 4
+#define ARCH_ALIGN_LONG_MOD 4
+#define ARCH_ALIGN_PTR_MOD 4
+#define ARCH_ALIGN_FLOAT_MOD 4
+#define ARCH_ALIGN_DOUBLE_MOD 4
+
+	 /* ---------------- Scalar sizes ---------------- */
+
+#define ARCH_LOG2_SIZEOF_CHAR 0
+#define ARCH_LOG2_SIZEOF_SHORT 1
+#define ARCH_LOG2_SIZEOF_INT 2
+#define ARCH_LOG2_SIZEOF_LONG 2
+#define ARCH_LOG2_SIZEOF_LONG_LONG 3
+#define ARCH_SIZEOF_GX_COLOR_INDEX 8
+#define ARCH_SIZEOF_PTR 4
+#define ARCH_SIZEOF_FLOAT 4
+#define ARCH_SIZEOF_DOUBLE 8
+#define ARCH_FLOAT_MANTISSA_BITS 24
+#define ARCH_DOUBLE_MANTISSA_BITS 53
+
+	 /* ---------------- Unsigned max values ---------------- */
+
+#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
+#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
+#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
+#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
+
+	 /* ---------------- Miscellaneous ---------------- */
+
+#define ARCH_IS_BIG_ENDIAN 1
+#define ARCH_PTRS_ARE_SIGNED 0
+#define ARCH_FLOATS_ARE_IEEE 1
+#define ARCH_ARITH_RSHIFT 2
+#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/package/ghostscript/objarch.h-microblazeel b/package/ghostscript/objarch.h-microblazeel
new file mode 100644
index 0000000..3ec8101
--- /dev/null
+++ b/package/ghostscript/objarch.h-microblazeel
@@ -0,0 +1,40 @@
+/* Parameters derived from machine and compiler architecture. */
+/* This file is generated mechanically by genarch.c. */
+
+	 /* ---------------- Scalar alignments ---------------- */
+
+#define ARCH_ALIGN_SHORT_MOD 2
+#define ARCH_ALIGN_INT_MOD 4
+#define ARCH_ALIGN_LONG_MOD 4
+#define ARCH_ALIGN_PTR_MOD 4
+#define ARCH_ALIGN_FLOAT_MOD 4
+#define ARCH_ALIGN_DOUBLE_MOD 4
+
+	 /* ---------------- Scalar sizes ---------------- */
+
+#define ARCH_LOG2_SIZEOF_CHAR 0
+#define ARCH_LOG2_SIZEOF_SHORT 1
+#define ARCH_LOG2_SIZEOF_INT 2
+#define ARCH_LOG2_SIZEOF_LONG 2
+#define ARCH_LOG2_SIZEOF_LONG_LONG 3
+#define ARCH_SIZEOF_GX_COLOR_INDEX 8
+#define ARCH_SIZEOF_PTR 4
+#define ARCH_SIZEOF_FLOAT 4
+#define ARCH_SIZEOF_DOUBLE 8
+#define ARCH_FLOAT_MANTISSA_BITS 24
+#define ARCH_DOUBLE_MANTISSA_BITS 53
+
+	 /* ---------------- Unsigned max values ---------------- */
+
+#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
+#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
+#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
+#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
+
+	 /* ---------------- Miscellaneous ---------------- */
+
+#define ARCH_IS_BIG_ENDIAN 0
+#define ARCH_PTRS_ARE_SIGNED 0
+#define ARCH_FLOATS_ARE_IEEE 1
+#define ARCH_ARITH_RSHIFT 2
+#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/package/ghostscript/objarch.h-mips b/package/ghostscript/objarch.h-mips
new file mode 100644
index 0000000..b8b637c
--- /dev/null
+++ b/package/ghostscript/objarch.h-mips
@@ -0,0 +1,40 @@
+/* Parameters derived from machine and compiler architecture. */
+/* This file is generated mechanically by genarch.c. */
+
+	 /* ---------------- Scalar alignments ---------------- */
+
+#define ARCH_ALIGN_SHORT_MOD 2
+#define ARCH_ALIGN_INT_MOD 4
+#define ARCH_ALIGN_LONG_MOD 4
+#define ARCH_ALIGN_PTR_MOD 4
+#define ARCH_ALIGN_FLOAT_MOD 4
+#define ARCH_ALIGN_DOUBLE_MOD 8
+
+	 /* ---------------- Scalar sizes ---------------- */
+
+#define ARCH_LOG2_SIZEOF_CHAR 0
+#define ARCH_LOG2_SIZEOF_SHORT 1
+#define ARCH_LOG2_SIZEOF_INT 2
+#define ARCH_LOG2_SIZEOF_LONG 2
+#define ARCH_LOG2_SIZEOF_LONG_LONG 3
+#define ARCH_SIZEOF_GX_COLOR_INDEX 4
+#define ARCH_SIZEOF_PTR 4
+#define ARCH_SIZEOF_FLOAT 4
+#define ARCH_SIZEOF_DOUBLE 8
+#define ARCH_FLOAT_MANTISSA_BITS 24
+#define ARCH_DOUBLE_MANTISSA_BITS 53
+
+	 /* ---------------- Unsigned max values ---------------- */
+
+#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
+#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
+#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
+#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
+
+	 /* ---------------- Miscellaneous ---------------- */
+
+#define ARCH_IS_BIG_ENDIAN 1
+#define ARCH_PTRS_ARE_SIGNED 0
+#define ARCH_FLOATS_ARE_IEEE 1
+#define ARCH_ARITH_RSHIFT 2
+#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/package/ghostscript/objarch.h-mips64 b/package/ghostscript/objarch.h-mips64
new file mode 100644
index 0000000..0d0a16b
--- /dev/null
+++ b/package/ghostscript/objarch.h-mips64
@@ -0,0 +1,40 @@
+/* Parameters derived from machine and compiler architecture. */
+/* This file is generated mechanically by genarch.c. */
+
+	 /* ---------------- Scalar alignments ---------------- */
+
+#define ARCH_ALIGN_SHORT_MOD 2
+#define ARCH_ALIGN_INT_MOD 4
+#define ARCH_ALIGN_LONG_MOD 8
+#define ARCH_ALIGN_PTR_MOD 8
+#define ARCH_ALIGN_FLOAT_MOD 4
+#define ARCH_ALIGN_DOUBLE_MOD 8
+
+	 /* ---------------- Scalar sizes ---------------- */
+
+#define ARCH_LOG2_SIZEOF_CHAR 0
+#define ARCH_LOG2_SIZEOF_SHORT 1
+#define ARCH_LOG2_SIZEOF_INT 2
+#define ARCH_LOG2_SIZEOF_LONG 3
+#define ARCH_LOG2_SIZEOF_LONG_LONG 3
+#define ARCH_SIZEOF_GX_COLOR_INDEX 8
+#define ARCH_SIZEOF_PTR 8
+#define ARCH_SIZEOF_FLOAT 4
+#define ARCH_SIZEOF_DOUBLE 8
+#define ARCH_FLOAT_MANTISSA_BITS 24
+#define ARCH_DOUBLE_MANTISSA_BITS 53
+
+	 /* ---------------- Unsigned max values ---------------- */
+
+#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
+#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
+#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
+#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
+
+	 /* ---------------- Miscellaneous ---------------- */
+
+#define ARCH_IS_BIG_ENDIAN 1
+#define ARCH_PTRS_ARE_SIGNED 0
+#define ARCH_FLOATS_ARE_IEEE 1
+#define ARCH_ARITH_RSHIFT 2
+#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/package/ghostscript/objarch.h-mips64el b/package/ghostscript/objarch.h-mips64el
new file mode 100644
index 0000000..a05de29
--- /dev/null
+++ b/package/ghostscript/objarch.h-mips64el
@@ -0,0 +1,40 @@
+/* Parameters derived from machine and compiler architecture. */
+/* This file is generated mechanically by genarch.c. */
+
+	 /* ---------------- Scalar alignments ---------------- */
+
+#define ARCH_ALIGN_SHORT_MOD 2
+#define ARCH_ALIGN_INT_MOD 4
+#define ARCH_ALIGN_LONG_MOD 8
+#define ARCH_ALIGN_PTR_MOD 8
+#define ARCH_ALIGN_FLOAT_MOD 4
+#define ARCH_ALIGN_DOUBLE_MOD 8
+
+	 /* ---------------- Scalar sizes ---------------- */
+
+#define ARCH_LOG2_SIZEOF_CHAR 0
+#define ARCH_LOG2_SIZEOF_SHORT 1
+#define ARCH_LOG2_SIZEOF_INT 2
+#define ARCH_LOG2_SIZEOF_LONG 3
+#define ARCH_LOG2_SIZEOF_LONG_LONG 3
+#define ARCH_SIZEOF_GX_COLOR_INDEX 8
+#define ARCH_SIZEOF_PTR 8
+#define ARCH_SIZEOF_FLOAT 4
+#define ARCH_SIZEOF_DOUBLE 8
+#define ARCH_FLOAT_MANTISSA_BITS 24
+#define ARCH_DOUBLE_MANTISSA_BITS 53
+
+	 /* ---------------- Unsigned max values ---------------- */
+
+#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
+#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
+#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
+#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
+
+	 /* ---------------- Miscellaneous ---------------- */
+
+#define ARCH_IS_BIG_ENDIAN 0
+#define ARCH_PTRS_ARE_SIGNED 0
+#define ARCH_FLOATS_ARE_IEEE 1
+#define ARCH_ARITH_RSHIFT 2
+#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/package/ghostscript/objarch.h-mipsel b/package/ghostscript/objarch.h-mipsel
new file mode 100644
index 0000000..29f90dd
--- /dev/null
+++ b/package/ghostscript/objarch.h-mipsel
@@ -0,0 +1,40 @@
+/* Parameters derived from machine and compiler architecture. */
+/* This file is generated mechanically by genarch.c. */
+
+	 /* ---------------- Scalar alignments ---------------- */
+
+#define ARCH_ALIGN_SHORT_MOD 2
+#define ARCH_ALIGN_INT_MOD 4
+#define ARCH_ALIGN_LONG_MOD 4
+#define ARCH_ALIGN_PTR_MOD 4
+#define ARCH_ALIGN_FLOAT_MOD 4
+#define ARCH_ALIGN_DOUBLE_MOD 8
+
+	 /* ---------------- Scalar sizes ---------------- */
+
+#define ARCH_LOG2_SIZEOF_CHAR 0
+#define ARCH_LOG2_SIZEOF_SHORT 1
+#define ARCH_LOG2_SIZEOF_INT 2
+#define ARCH_LOG2_SIZEOF_LONG 2
+#define ARCH_LOG2_SIZEOF_LONG_LONG 3
+#define ARCH_SIZEOF_GX_COLOR_INDEX 4
+#define ARCH_SIZEOF_PTR 4
+#define ARCH_SIZEOF_FLOAT 4
+#define ARCH_SIZEOF_DOUBLE 8
+#define ARCH_FLOAT_MANTISSA_BITS 24
+#define ARCH_DOUBLE_MANTISSA_BITS 53
+
+	 /* ---------------- Unsigned max values ---------------- */
+
+#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
+#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
+#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
+#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
+
+	 /* ---------------- Miscellaneous ---------------- */
+
+#define ARCH_IS_BIG_ENDIAN 0
+#define ARCH_PTRS_ARE_SIGNED 0
+#define ARCH_FLOATS_ARE_IEEE 1
+#define ARCH_ARITH_RSHIFT 2
+#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/package/ghostscript/objarch.h-nios2 b/package/ghostscript/objarch.h-nios2
new file mode 100644
index 0000000..3ec8101
--- /dev/null
+++ b/package/ghostscript/objarch.h-nios2
@@ -0,0 +1,40 @@
+/* Parameters derived from machine and compiler architecture. */
+/* This file is generated mechanically by genarch.c. */
+
+	 /* ---------------- Scalar alignments ---------------- */
+
+#define ARCH_ALIGN_SHORT_MOD 2
+#define ARCH_ALIGN_INT_MOD 4
+#define ARCH_ALIGN_LONG_MOD 4
+#define ARCH_ALIGN_PTR_MOD 4
+#define ARCH_ALIGN_FLOAT_MOD 4
+#define ARCH_ALIGN_DOUBLE_MOD 4
+
+	 /* ---------------- Scalar sizes ---------------- */
+
+#define ARCH_LOG2_SIZEOF_CHAR 0
+#define ARCH_LOG2_SIZEOF_SHORT 1
+#define ARCH_LOG2_SIZEOF_INT 2
+#define ARCH_LOG2_SIZEOF_LONG 2
+#define ARCH_LOG2_SIZEOF_LONG_LONG 3
+#define ARCH_SIZEOF_GX_COLOR_INDEX 8
+#define ARCH_SIZEOF_PTR 4
+#define ARCH_SIZEOF_FLOAT 4
+#define ARCH_SIZEOF_DOUBLE 8
+#define ARCH_FLOAT_MANTISSA_BITS 24
+#define ARCH_DOUBLE_MANTISSA_BITS 53
+
+	 /* ---------------- Unsigned max values ---------------- */
+
+#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
+#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
+#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
+#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
+
+	 /* ---------------- Miscellaneous ---------------- */
+
+#define ARCH_IS_BIG_ENDIAN 0
+#define ARCH_PTRS_ARE_SIGNED 0
+#define ARCH_FLOATS_ARE_IEEE 1
+#define ARCH_ARITH_RSHIFT 2
+#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/package/ghostscript/objarch.h-powerpc b/package/ghostscript/objarch.h-powerpc
new file mode 100644
index 0000000..359097f
--- /dev/null
+++ b/package/ghostscript/objarch.h-powerpc
@@ -0,0 +1,40 @@
+/* Parameters derived from machine and compiler architecture. */
+/* This file is generated mechanically by genarch.c. */
+
+	 /* ---------------- Scalar alignments ---------------- */
+
+#define ARCH_ALIGN_SHORT_MOD 2
+#define ARCH_ALIGN_INT_MOD 4
+#define ARCH_ALIGN_LONG_MOD 4
+#define ARCH_ALIGN_PTR_MOD 4
+#define ARCH_ALIGN_FLOAT_MOD 4
+#define ARCH_ALIGN_DOUBLE_MOD 8
+
+	 /* ---------------- Scalar sizes ---------------- */
+
+#define ARCH_LOG2_SIZEOF_CHAR 0
+#define ARCH_LOG2_SIZEOF_SHORT 1
+#define ARCH_LOG2_SIZEOF_INT 2
+#define ARCH_LOG2_SIZEOF_LONG 2
+#define ARCH_LOG2_SIZEOF_LONG_LONG 3
+#define ARCH_SIZEOF_GX_COLOR_INDEX 8
+#define ARCH_SIZEOF_PTR 4
+#define ARCH_SIZEOF_FLOAT 4
+#define ARCH_SIZEOF_DOUBLE 8
+#define ARCH_FLOAT_MANTISSA_BITS 24
+#define ARCH_DOUBLE_MANTISSA_BITS 53
+
+	 /* ---------------- Unsigned max values ---------------- */
+
+#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
+#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
+#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
+#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
+
+	 /* ---------------- Miscellaneous ---------------- */
+
+#define ARCH_IS_BIG_ENDIAN 1
+#define ARCH_PTRS_ARE_SIGNED 0
+#define ARCH_FLOATS_ARE_IEEE 1
+#define ARCH_ARITH_RSHIFT 2
+#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/package/ghostscript/objarch.h-powerpc64 b/package/ghostscript/objarch.h-powerpc64
new file mode 100644
index 0000000..0d0a16b
--- /dev/null
+++ b/package/ghostscript/objarch.h-powerpc64
@@ -0,0 +1,40 @@
+/* Parameters derived from machine and compiler architecture. */
+/* This file is generated mechanically by genarch.c. */
+
+	 /* ---------------- Scalar alignments ---------------- */
+
+#define ARCH_ALIGN_SHORT_MOD 2
+#define ARCH_ALIGN_INT_MOD 4
+#define ARCH_ALIGN_LONG_MOD 8
+#define ARCH_ALIGN_PTR_MOD 8
+#define ARCH_ALIGN_FLOAT_MOD 4
+#define ARCH_ALIGN_DOUBLE_MOD 8
+
+	 /* ---------------- Scalar sizes ---------------- */
+
+#define ARCH_LOG2_SIZEOF_CHAR 0
+#define ARCH_LOG2_SIZEOF_SHORT 1
+#define ARCH_LOG2_SIZEOF_INT 2
+#define ARCH_LOG2_SIZEOF_LONG 3
+#define ARCH_LOG2_SIZEOF_LONG_LONG 3
+#define ARCH_SIZEOF_GX_COLOR_INDEX 8
+#define ARCH_SIZEOF_PTR 8
+#define ARCH_SIZEOF_FLOAT 4
+#define ARCH_SIZEOF_DOUBLE 8
+#define ARCH_FLOAT_MANTISSA_BITS 24
+#define ARCH_DOUBLE_MANTISSA_BITS 53
+
+	 /* ---------------- Unsigned max values ---------------- */
+
+#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
+#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
+#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
+#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
+
+	 /* ---------------- Miscellaneous ---------------- */
+
+#define ARCH_IS_BIG_ENDIAN 1
+#define ARCH_PTRS_ARE_SIGNED 0
+#define ARCH_FLOATS_ARE_IEEE 1
+#define ARCH_ARITH_RSHIFT 2
+#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/package/ghostscript/objarch.h-x86_64 b/package/ghostscript/objarch.h-x86_64
new file mode 100644
index 0000000..a05de29
--- /dev/null
+++ b/package/ghostscript/objarch.h-x86_64
@@ -0,0 +1,40 @@
+/* Parameters derived from machine and compiler architecture. */
+/* This file is generated mechanically by genarch.c. */
+
+	 /* ---------------- Scalar alignments ---------------- */
+
+#define ARCH_ALIGN_SHORT_MOD 2
+#define ARCH_ALIGN_INT_MOD 4
+#define ARCH_ALIGN_LONG_MOD 8
+#define ARCH_ALIGN_PTR_MOD 8
+#define ARCH_ALIGN_FLOAT_MOD 4
+#define ARCH_ALIGN_DOUBLE_MOD 8
+
+	 /* ---------------- Scalar sizes ---------------- */
+
+#define ARCH_LOG2_SIZEOF_CHAR 0
+#define ARCH_LOG2_SIZEOF_SHORT 1
+#define ARCH_LOG2_SIZEOF_INT 2
+#define ARCH_LOG2_SIZEOF_LONG 3
+#define ARCH_LOG2_SIZEOF_LONG_LONG 3
+#define ARCH_SIZEOF_GX_COLOR_INDEX 8
+#define ARCH_SIZEOF_PTR 8
+#define ARCH_SIZEOF_FLOAT 4
+#define ARCH_SIZEOF_DOUBLE 8
+#define ARCH_FLOAT_MANTISSA_BITS 24
+#define ARCH_DOUBLE_MANTISSA_BITS 53
+
+	 /* ---------------- Unsigned max values ---------------- */
+
+#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
+#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
+#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
+#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
+
+	 /* ---------------- Miscellaneous ---------------- */
+
+#define ARCH_IS_BIG_ENDIAN 0
+#define ARCH_PTRS_ARE_SIGNED 0
+#define ARCH_FLOATS_ARE_IEEE 1
+#define ARCH_ARITH_RSHIFT 2
+#define ARCH_DIV_NEG_POS_TRUNCATES 1
-- 
2.9.3
