From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Tue, 28 Aug 2012 01:15:12 +0300
Subject: [Buildroot] [PATCH] upx: high-performance executable packer with
	in-place decompression support
In-Reply-To: <1346105712-20614-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1346105712-20614-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1346105712-20614-2-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/Config.in                 |    2 +
 package/ucl/Config.in             |    6 ++
 package/ucl/ucl-1.03-CFLAGS.patch |  134 +++++++++++++++++++++++++++++++++++++
 package/ucl/ucl.mk                |   26 +++++++
 package/upx/Config.in             |    8 ++
 package/upx/upx.mk                |   53 +++++++++++++++
 6 files changed, 229 insertions(+), 0 deletions(-)
 create mode 100644 package/ucl/Config.in
 create mode 100644 package/ucl/ucl-1.03-CFLAGS.patch
 create mode 100644 package/ucl/ucl.mk
 create mode 100644 package/upx/Config.in
 create mode 100644 package/upx/upx.mk

diff --git a/package/Config.in b/package/Config.in
index f308de7..4be7c22 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -13,6 +13,7 @@ source "package/gzip/Config.in"
 endif
 source "package/lzop/Config.in"
 source "package/lzma/Config.in"
+source "package/upx/Config.in"
 source "package/xz/Config.in"
 endmenu
 
@@ -307,6 +308,7 @@ endmenu
 menu "Compression and decompression"
 source "package/libarchive/Config.in"
 source "package/lzo/Config.in"
+source "package/ucl/Config.in"
 source "package/zlib/Config.in"
 endmenu
 
diff --git a/package/ucl/Config.in b/package/ucl/Config.in
new file mode 100644
index 0000000..00a0b59
--- /dev/null
+++ b/package/ucl/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_UCL
+	bool "ucl"
+	help
+	  The UCL Compression Library
+
+	  http://www.oberhumer.com/opensource/ucl
diff --git a/package/ucl/ucl-1.03-CFLAGS.patch b/package/ucl/ucl-1.03-CFLAGS.patch
new file mode 100644
index 0000000..07c925b
--- /dev/null
+++ b/package/ucl/ucl-1.03-CFLAGS.patch
@@ -0,0 +1,134 @@
+From: Nathan Phillip Brink <binki@gentoo.org>
+Subject: Respect CCASFLAGS (which often defaults to CFLAGS). Fixes
+	compilation for portage-multilib users.
+
+diff -r c090ed619e90 configure.ac
+--- a/configure.ac	Sun Jun 26 16:00:09 2011 -0400
++++ b/configure.ac	Sun Jun 26 20:52:01 2011 -0400
+@@ -47,14 +47,12 @@
+ AC_CANONICAL_TARGET
+ AM_MAINTAINER_MODE
+ 
+-if test -z "$ac_abs_top_srcdir"; then
+-    _AC_SRCPATHS(.)
+-fi
+ if test -r .Conf.settings1; then
+     . ./.Conf.settings1
+ fi
+ 
+ AC_PROG_CC
++AM_PROG_AS
+ AC_PROG_CPP
+ mfx_PROG_CPPFLAGS
+ AC_C_CONST
+@@ -84,13 +82,13 @@
+ if test "X$enable_asm" != Xno; then
+ mfx_compile_S='${CC-cc} -c conftest.S 1>&AS_MESSAGE_LOG_FD'
+ cat > conftest.S <<EOF
+-#include "$ac_abs_top_srcdir/asm/i386/src_gas/crc_asm.S"
++#include "$srcdir/asm/i386/src_gas/crc_asm.S"
+ EOF
+ enable_asm=no
+ if AC_TRY_EVAL(mfx_compile_S); then
+     if AC_TRY_COMMAND([test -s conftest.$ac_objext]); then
+         enable_asm=yes
+-        UCL_ASM_VPATH=":$ac_abs_top_srcdir/asm/i386/src_gas"
++        UCL_ASM_VPATH=":\$(top_srcdir)/asm/i386/src_gas"
+     fi
+ fi
+ if test "X$enable_asm" = Xno; then
+@@ -160,11 +158,6 @@
+ AC_SUBST(UCL_CFLAGS)
+ AC_SUBST(UCL_EXTRA_CFLAGS)
+ 
+-configure_CPPFLAGS=$CPPFLAGS
+-configure_CFLAGS=$CFLAGS
+-AC_SUBST(configure_CPPFLAGS)
+-AC_SUBST(configure_CFLAGS)
+-
+ AC_CONFIG_FILES([Makefile examples/Makefile include/Makefile include/ucl/Makefile src/Makefile])
+ AC_OUTPUT
+ 
+diff -r c090ed619e90 src/Makefile.am
+--- a/src/Makefile.am	Sun Jun 26 16:00:09 2011 -0400
++++ b/src/Makefile.am	Sun Jun 26 20:52:01 2011 -0400
+@@ -4,11 +4,10 @@
+ #
+ 
+ VPATH = @srcdir@@UCL_ASM_VPATH@
+-SUFFIXES = .S
+ 
+ INCLUDES = -I$(top_srcdir)/include -I$(top_srcdir)
+-CPPFLAGS = $(UCL_CPPFLAGS) $(configure_CPPFLAGS) $(UCL_EXTRA_CPPFLAGS)
+-CFLAGS = $(UCL_CFLAGS) $(configure_CFLAGS) $(UCL_EXTRA_CFLAGS)
++AM_CPPFLAGS = $(UCL_CPPFLAGS) $(UCL_EXTRA_CPPFLAGS)
++AM_CFLAGS = $(UCL_CFLAGS) $(UCL_EXTRA_CFLAGS)
+ 
+ lib_LTLIBRARIES = libucl.la
+ 
+@@ -16,51 +15,37 @@
+ 
+ libucl_la_SOURCES = \
+ 	alloc.c \
++	getbit.h \
+ 	n2b_99.c n2b_d.c n2b_ds.c n2b_to.c \
+ 	n2d_99.c n2d_d.c n2d_ds.c n2d_to.c \
+ 	n2e_99.c n2e_d.c n2e_ds.c n2e_to.c \
++	ucl_conf.h \
+ 	ucl_crc.c \
+ 	ucl_init.c \
+-	ucl_ptr.c \
++	ucl_ptr.c ucl_ptr.h \
+ 	ucl_str.c \
+ 	ucl_util.c
+ 
+ EXTRA_DIST = \
+-	getbit.h \
+ 	n2_99.ch \
+-	ucl_conf.h \
+ 	ucl_dll.ch \
+ 	ucl_mchw.ch \
+-	ucl_ptr.h \
+ 	ucl_swd.ch
+ 
+-libucl_la_LIBADD = $(UCL_ASM_OBJECTS)
+-libucl_la_DEPENDENCIES = $(libucl_la_LIBADD)
+-
+-
+ # /***********************************************************************
+ # // assembler support
+ # ************************************************************************/
+ 
+ if UCL_USE_ASM
+-
+-UCL_ASM_OBJECTS = \
+-	cpuid.lo crc_asm.lo crcs_asm.lo rdtsc.lo rdtsca.lo \
+-	n2b_d_f1.lo n2b_d_f2.lo n2b_d_f3.lo n2b_d_f4.lo n2b_d_f5.lo n2b_d_f6.lo \
+-	n2b_d_n1.lo n2b_d_n2.lo n2b_d_n3.lo n2b_d_n4.lo n2b_d_n5.lo n2b_d_n6.lo \
+-	n2b_d_s1.lo n2b_d_s2.lo n2b_d_s3.lo n2b_d_s4.lo n2b_d_s5.lo n2b_d_s6.lo \
+-	n2d_d_f1.lo n2d_d_f2.lo n2d_d_f3.lo n2d_d_f4.lo n2d_d_f5.lo n2d_d_f6.lo \
+-	n2d_d_n1.lo n2d_d_n2.lo n2d_d_n3.lo n2d_d_n4.lo n2d_d_n5.lo n2d_d_n6.lo \
+-	n2d_d_s1.lo n2d_d_s2.lo n2d_d_s3.lo n2d_d_s4.lo n2d_d_s5.lo n2d_d_s6.lo \
+-	n2e_d_f1.lo n2e_d_f2.lo n2e_d_f3.lo n2e_d_f4.lo n2e_d_f5.lo n2e_d_f6.lo \
+-	n2e_d_n1.lo n2e_d_n2.lo n2e_d_n3.lo n2e_d_n4.lo n2e_d_n5.lo n2e_d_n6.lo \
+-	n2e_d_s1.lo n2e_d_s2.lo n2e_d_s3.lo n2e_d_s4.lo n2e_d_s5.lo n2e_d_s6.lo
+-
+-.S.o:
+-	$(CC) -c $<
+-
+-.S.lo:
+-	$(LIBTOOL) --mode=compile $(CC) -c $<
+-
++libucl_la_SOURCES += \
++	cpuid.S crc_asm.S crcs_asm.S rdtsc.S rdtsca.S \
++	n2b_d_f1.S n2b_d_f2.S n2b_d_f3.S n2b_d_f4.S n2b_d_f5.S n2b_d_f6.S \
++	n2b_d_n1.S n2b_d_n2.S n2b_d_n3.S n2b_d_n4.S n2b_d_n5.S n2b_d_n6.S \
++	n2b_d_s1.S n2b_d_s2.S n2b_d_s3.S n2b_d_s4.S n2b_d_s5.S n2b_d_s6.S \
++	n2d_d_f1.S n2d_d_f2.S n2d_d_f3.S n2d_d_f4.S n2d_d_f5.S n2d_d_f6.S \
++	n2d_d_n1.S n2d_d_n2.S n2d_d_n3.S n2d_d_n4.S n2d_d_n5.S n2d_d_n6.S \
++	n2d_d_s1.S n2d_d_s2.S n2d_d_s3.S n2d_d_s4.S n2d_d_s5.S n2d_d_s6.S \
++	n2e_d_f1.S n2e_d_f2.S n2e_d_f3.S n2e_d_f4.S n2e_d_f5.S n2e_d_f6.S \
++	n2e_d_n1.S n2e_d_n2.S n2e_d_n3.S n2e_d_n4.S n2e_d_n5.S n2e_d_n6.S \
++	n2e_d_s1.S n2e_d_s2.S n2e_d_s3.S n2e_d_s4.S n2e_d_s5.S n2e_d_s6.S
+ endif
+-
diff --git a/package/ucl/ucl.mk b/package/ucl/ucl.mk
new file mode 100644
index 0000000..c2bcdf6
--- /dev/null
+++ b/package/ucl/ucl.mk
@@ -0,0 +1,26 @@
+############################################
+#
+# ucl
+# 
+############################################
+
+UCL_VERSION = 1.03
+UCL_SOURCE = ucl-$(UCL_VERSION).tar.gz
+UCL_SITE = http://www.oberhumer.com/opensource/ucl/download/
+UCL_AUTORECONF = yes
+UCL_INSTALL_STAGING = yes
+UCL_LICENSE = GPLv2
+UCL_LICENSE_FILES = COPYING
+
+define UCL_CONFIGURE_FIXUP
+# lzo (and ucl) have some weird sort of mfx_* set of autoconf macros
+# which may only be distributed with lzo itself? Rescue them and
+# place them into acinclude.m4 because there doesn't seem to be an
+# m4/...
+	(cd $(@D); \
+	sed -n -e '/^AC_DEFUN.*mfx_/,/^])#$$/p' aclocal.m4 > acinclude.m4 )
+endef
+
+UCL_POST_PATCH_HOOKS += UCL_CONFIGURE_FIXUP
+
+$(eval $(autotools-package))
diff --git a/package/upx/Config.in b/package/upx/Config.in
new file mode 100644
index 0000000..ef2134b
--- /dev/null
+++ b/package/upx/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_UPX
+	bool "upx"
+	depends on BR2_PACKAGE_UCL
+	depends on BR2_PACKAGE_MICROPERL
+	help
+	  Ultimate Packer for eXecutables (free version using UCL compression and not NRV)
+
+	  http://upx.sourceforge.net
diff --git a/package/upx/upx.mk b/package/upx/upx.mk
new file mode 100644
index 0000000..ade4e7a
--- /dev/null
+++ b/package/upx/upx.mk
@@ -0,0 +1,53 @@
+############################################
+#
+# upx
+# 
+############################################
+
+UPX_VERSION = 3.08
+UPX_SOURCE = upx-$(UPX_VERSION)-src.tar.bz2
+UPX_SITE = http://upx.sourceforge.net/download
+UPX_DEPENDENCIES = ucl host-microperl
+UPX_AUTORECONF = yes
+UPX_LICENSE = GPLv2
+UPX_LICENSE_FILES = COPYING
+
+
+# Because UPX can't currently use the newer XZ compression but
+# older LZMA and because LZMA is currently deprecated in
+# Buildroot, we do the things The Hard Way(TM).
+# This just fetches LZMA sources and unpack them to $(BUILD_DIR)
+# so that UPX can find them.
+# 
+# This might seem braindead way to include source files directly
+# and not just link against LZMA library but there is an explanation
+# provided by one of the authors (John Reiser) of the UPX in
+# https://bugzilla.redhat.com/show_bug.cgi?id=501636
+
+# To prevent picking variables from actual lzma package
+# if it still exists.
+
+SRC_LZMA_VERSION:=4.65
+SRC_LZMA_SOURCE:=lzma465.tar.bz2
+SRC_LZMA_SITE:=http://downloads.sourceforge.net/project/sevenzip/LZMA%20SDK/$(SRC_LZMA_VERSION)
+SRC_LZMA_DIR:=$(BUILD_DIR)/lzma-$(SRC_LZMA_VERSION)
+
+define UPX_CONFIGURE_CMDS
+	$(call DOWNLOAD,$(SRC_LZMA_SITE)/$(SRC_LZMA_SOURCE))
+	# God I hate folks who don't include top level directory in their tarballs ...
+	mkdir -p $(SRC_LZMA_DIR)
+	$(BZCAT) $(DL_DIR)/$(SRC_LZMA_SOURCE) | tar -C $(SRC_LZMA_DIR) $(TAR_OPTIONS) -
+endef
+
+define UPX_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) UPX_UCLDIR=$(UCL_DIR) UPX_LZMA_VERSION=0x465 UPX_LZMADIR=$(SRC_LZMA_DIR) $(MAKE) -C $(@D) all
+endef
+
+define UPX_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/src/upx.out $(TARGET_DIR)/usr/bin/upx
+endef
+
+$(eval $(generic-package))
+
+
+
-- 
1.7.7.6
