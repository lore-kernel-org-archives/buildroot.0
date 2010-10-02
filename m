From: Martin Banky <martin.banky@gmail.com>
Date: Sat,  2 Oct 2010 13:51:21 -0700
Subject: [Buildroot] [PATCH 1/2] jpeg: bump to 8b
In-Reply-To: <1286052682-22218-1-git-send-email-Martin.Banky@gmail.com>
References: <1286052682-22218-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1286052682-22218-2-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/jpeg/jpeg-build.patch   |   99 ---------------------------------------
 package/jpeg/jpeg-libtool.patch |   66 --------------------------
 package/jpeg/jpeg.mk            |    7 +--
 3 files changed, 3 insertions(+), 169 deletions(-)
 delete mode 100644 package/jpeg/jpeg-build.patch
 delete mode 100644 package/jpeg/jpeg-libtool.patch

diff --git a/package/jpeg/jpeg-build.patch b/package/jpeg/jpeg-build.patch
deleted file mode 100644
index 9f3c5c2..0000000
--- a/package/jpeg/jpeg-build.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-- Respect options from configure (bindir/libdir/etc...)
-- Grab AR from the env instead of hardcoding to 'ar'
-- Fix install to respect $(DESTDIR)
-- Also install jpegint.h #64254
-
---- jpeg/makefile.cfg
-+++ jpeg/makefile.cfg
-@@ -11,13 +11,13 @@
- # Where to install the programs and man pages.
- prefix = @prefix@
- exec_prefix = @exec_prefix@
--bindir = $(exec_prefix)/bin
--libdir = $(exec_prefix)/lib
--includedir = $(prefix)/include
-+bindir = @bindir@
-+libdir = @libdir@
-+includedir = @includedir@
- binprefix =
- manprefix =
- manext = 1
--mandir = $(prefix)/man/man$(manext)
-+mandir = @mandir@/man$(manext)
- 
- # The name of your C compiler:
- CC= @CC@
-@@ -60,7 +60,8 @@
- # directory creation command
- MKDIR= mkdir
- # library (.a) file creation command
--AR= ar rc
-+AR = @AR@
-+ARFLAGS = rc
- # second step in .a creation (use "touch" if not needed)
- AR2= @RANLIB@
- # installation program
-@@ -163,7 +164,7 @@
- # without libtool:
- libjpeg.a: @A2K_DEPS@ $(LIBOBJECTS)
- 	$(RM) libjpeg.a
--	$(AR) libjpeg.a  $(LIBOBJECTS)
-+	$(AR) $(ARFLAGS) libjpeg.a  $(LIBOBJECTS)
- 	$(AR2) libjpeg.a
- 
- # with libtool:
-@@ -191,25 +191,29 @@
- # Installation rules:
- 
- install: cjpeg djpeg jpegtran rdjpgcom wrjpgcom @FORCE_INSTALL_LIB@
--	$(INSTALL_PROGRAM) cjpeg $(bindir)/$(binprefix)cjpeg
--	$(INSTALL_PROGRAM) djpeg $(bindir)/$(binprefix)djpeg
--	$(INSTALL_PROGRAM) jpegtran $(bindir)/$(binprefix)jpegtran
--	$(INSTALL_PROGRAM) rdjpgcom $(bindir)/$(binprefix)rdjpgcom
--	$(INSTALL_PROGRAM) wrjpgcom $(bindir)/$(binprefix)wrjpgcom
--	$(INSTALL_DATA) $(srcdir)/cjpeg.1 $(mandir)/$(manprefix)cjpeg.$(manext)
--	$(INSTALL_DATA) $(srcdir)/djpeg.1 $(mandir)/$(manprefix)djpeg.$(manext)
--	$(INSTALL_DATA) $(srcdir)/jpegtran.1 $(mandir)/$(manprefix)jpegtran.$(manext)
--	$(INSTALL_DATA) $(srcdir)/rdjpgcom.1 $(mandir)/$(manprefix)rdjpgcom.$(manext)
--	$(INSTALL_DATA) $(srcdir)/wrjpgcom.1 $(mandir)/$(manprefix)wrjpgcom.$(manext)
-+	mkdir -p $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)
-+	$(INSTALL_PROGRAM) cjpeg $(DESTDIR)$(bindir)/$(binprefix)cjpeg
-+	$(INSTALL_PROGRAM) djpeg $(DESTDIR)$(bindir)/$(binprefix)djpeg
-+	$(INSTALL_PROGRAM) jpegtran $(DESTDIR)$(bindir)/$(binprefix)jpegtran
-+	$(INSTALL_PROGRAM) rdjpgcom $(DESTDIR)$(bindir)/$(binprefix)rdjpgcom
-+	$(INSTALL_PROGRAM) wrjpgcom $(DESTDIR)$(bindir)/$(binprefix)wrjpgcom
-+	$(INSTALL_DATA) $(srcdir)/cjpeg.1 $(DESTDIR)$(mandir)/$(manprefix)cjpeg.$(manext)
-+	$(INSTALL_DATA) $(srcdir)/djpeg.1 $(DESTDIR)$(mandir)/$(manprefix)djpeg.$(manext)
-+	$(INSTALL_DATA) $(srcdir)/jpegtran.1 $(DESTDIR)$(mandir)/$(manprefix)jpegtran.$(manext)
-+	$(INSTALL_DATA) $(srcdir)/rdjpgcom.1 $(DESTDIR)$(mandir)/$(manprefix)rdjpgcom.$(manext)
-+	$(INSTALL_DATA) $(srcdir)/wrjpgcom.1 $(DESTDIR)$(mandir)/$(manprefix)wrjpgcom.$(manext)
- 
- install-lib: libjpeg.$(A) install-headers
--	$(INSTALL_LIB) libjpeg.$(A) $(libdir)/$(binprefix)libjpeg.$(A)
-+	mkdir -p $(DESTDIR)$(libdir)
-+	$(INSTALL_LIB) libjpeg.$(A) $(DESTDIR)$(libdir)/$(binprefix)libjpeg.$(A)
- 
- install-headers: jconfig.h
--	$(INSTALL_DATA) jconfig.h $(includedir)/jconfig.h
--	$(INSTALL_DATA) $(srcdir)/jpeglib.h $(includedir)/jpeglib.h
--	$(INSTALL_DATA) $(srcdir)/jmorecfg.h $(includedir)/jmorecfg.h
--	$(INSTALL_DATA) $(srcdir)/jerror.h $(includedir)/jerror.h
-+	mkdir -p $(DESTDIR)$(includedir)
-+	$(INSTALL_DATA) jconfig.h $(DESTDIR)$(includedir)/jconfig.h
-+	$(INSTALL_DATA) $(srcdir)/jpegint.h $(DESTDIR)$(includedir)/jpegint.h
-+	$(INSTALL_DATA) $(srcdir)/jpeglib.h $(DESTDIR)$(includedir)/jpeglib.h
-+	$(INSTALL_DATA) $(srcdir)/jmorecfg.h $(DESTDIR)$(includedir)/jmorecfg.h
-+	$(INSTALL_DATA) $(srcdir)/jerror.h $(DESTDIR)$(includedir)/jerror.h
- 
- clean:
- 	$(RM) *.o *.lo libjpeg.a libjpeg.la
---- jpeg/configure
-+++ jpeg/configure
-@@ -1777,6 +1777,7 @@
- s%@CPP@%$CPP%g
- s%@INSTALL_PROGRAM@%$INSTALL_PROGRAM%g
- s%@INSTALL_DATA@%$INSTALL_DATA%g
-+s%@AR@%${AR-ar}%g
- s%@RANLIB@%$RANLIB%g
- s%@LIBTOOL@%$LIBTOOL%g
- s%@O@%$O%g
diff --git a/package/jpeg/jpeg-libtool.patch b/package/jpeg/jpeg-libtool.patch
deleted file mode 100644
index 3c4b573..0000000
--- a/package/jpeg/jpeg-libtool.patch
+++ /dev/null
@@ -1,66 +0,0 @@
---- jpeg/configure
-+++ jpeg/configure
-@@ -1559,7 +1559,7 @@
-   if test "x$LTSTATIC" = xno; then
-     disable_static="--disable-static"
-   fi
--  $srcdir/ltconfig $disable_shared $disable_static $srcdir/ltmain.sh
-+  $srcdir/ltconfig $disable_shared $disable_static $srcdir/ltmain.sh $CHOST
- fi
- 
- # Select memory manager depending on user input.
---- jpeg/ltconfig
-+++ jpeg/ltconfig
-@@ -299,6 +299,7 @@
- # Transform linux* to *-*-linux-gnu*, to support old configure scripts.
- case "$host_os" in
- linux-gnu*) ;;
-+linux-uclibc*) ;;
- linux*) host=`echo $host | sed 's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
- esac
- 
-@@ -553,7 +553,9 @@
-     # On HP-UX, both CC and GCC only warn that PIC is supported... then they
-     # create non-PIC objects.  So, if there were any warnings, we assume that
-     # PIC is not supported.
-+    # Make sure we only test warnings on HP-UX (pic_flag == +Z) or we can
-+    # easily break Linux builds http://bugs.gentoo.org/70947
--    if test -s conftest.err; then
-+    if test -s conftest.err -a "$pic_flag" = "+Z"; then
-       echo "$ac_t"no 1>&6
-       can_build_shared=no
-       pic_flag=
-@@ -1210,7 +1210,6 @@
-   else
-     # Only the GNU ld.so supports shared libraries on MkLinux.
-     case "$host_cpu" in
--    powerpc*) dynamic_linker=no ;;
-     *) dynamic_linker='Linux ld.so' ;;
-     esac
-   fi
-@@ -1259,6 +1260,25 @@
-   fi
-   ;;
- 
-+linux-uclibc*)
-+  version_type=linux
-+  need_lib_prefix=no
-+  need_version=no
-+  library_names_spec='${libname}${release}.so.$versuffix ${libname}${release}.so.$major $libname.so'
-+  soname_spec='${libname}${release}.so.$major'
-+  finish_cmds='PATH="\$PATH:/sbin" ldconfig -n $libdir'
-+  shlibpath_var=LD_LIBRARY_PATH
-+  shlibpath_overrides_runpath=no
-+  deplibs_check_method=pass_all
-+  # This implies no fast_install, which is unacceptable.
-+  # Some rework will be needed to allow for fast_install
-+  # before this can be enabled.
-+  # Note: copied from linux-gnu, and may not be appropriate.
-+  hardcode_into_libs=yes
-+  # Assume using the uClibc dynamic linker.
-+  dynamic_linker="uClibc ld.so"
-+  ;;
-+
- netbsd* | openbsd*)
-   version_type=sunos
-   library_names_spec='${libname}${release}.so.$versuffix'
diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
index 4f08534..1f408a0 100644
--- a/package/jpeg/jpeg.mk
+++ b/package/jpeg/jpeg.mk
@@ -20,13 +20,12 @@
 # License along with this program; if not, write to the Free Software
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
 # USA
-JPEG_VERSION:=6b
-JPEG_SITE:=ftp://ftp.uu.net/graphics/jpeg/
-JPEG_SOURCE=jpegsrc.v$(JPEG_VERSION).tar.gz
+JPEG_VERSION = 8b
+JPEG_SITE = http://www.ijg.org/files/
+JPEG_SOURCE = jpegsrc.v$(JPEG_VERSION).tar.gz
 JPEG_INSTALL_STAGING = YES
 JPEG_INSTALL_TARGET = YES
 JPEG_LIBTOOL_PATCH = NO
-JPEG_CONF_OPT = --without-x --enable-shared --enable-static
 
 define JPEG_REMOVE_USELESS_TOOLS
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,cjpeg djpeg jpegtrans rdjpgcom wrjpgcom)
-- 
1.7.3.1
