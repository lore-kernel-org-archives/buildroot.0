From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Nov 2012 11:48:09 +0100
Subject: [Buildroot] [PATCH 1/2] libffi: make blackfin patch a proper git
	patch
Message-ID: <1353062890-30563-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ... => libffi-0001-Add-support-for-Blackfin.patch} |  175 +++++++++++---------
 1 file changed, 99 insertions(+), 76 deletions(-)
 rename package/libffi/{libffi-blackfin-support.patch => libffi-0001-Add-support-for-Blackfin.patch} (93%)

diff --git a/package/libffi/libffi-blackfin-support.patch b/package/libffi/libffi-0001-Add-support-for-Blackfin.patch
similarity index 93%
rename from package/libffi/libffi-blackfin-support.patch
rename to package/libffi/libffi-0001-Add-support-for-Blackfin.patch
index 1af0fce..7a55b40 100644
--- a/package/libffi/libffi-blackfin-support.patch
+++ b/package/libffi/libffi-0001-Add-support-for-Blackfin.patch
@@ -1,4 +1,7 @@
-Add support for Blackfin
+From 643764d29559e2ca6280837069972b1d4790d61a Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Fri, 16 Nov 2012 01:10:10 +0100
+Subject: [PATCH 1/2] Add support for Blackfin
 
 Taken upstream from
 https://github.com/atgreen/libffi/commit/213ed15c70e72d666154c08e2b41dae3f61f20d3. Will
@@ -11,11 +14,25 @@ requires autoconf 2.68.
 Code written by Alexandre Keunecke.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ ChangeLog            |    8 +++
+ Makefile.am          |    4 ++
+ Makefile.in          |  160 ++++++++++++++++++++++-------------------
+ README               |    8 ++-
+ configure            |  113 +++++++++++++----------------
+ configure.ac         |    5 ++
+ src/bfin/ffi.c       |  195 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ src/bfin/ffitarget.h |   43 +++++++++++
+ src/bfin/sysv.S      |  177 +++++++++++++++++++++++++++++++++++++++++++++
+ 9 files changed, 574 insertions(+), 139 deletions(-)
+ create mode 100644 src/bfin/ffi.c
+ create mode 100644 src/bfin/ffitarget.h
+ create mode 100644 src/bfin/sysv.S
 
-Index: libffi/ChangeLog
-===================================================================
---- libffi.orig/ChangeLog
-+++ libffi/ChangeLog
+diff --git a/ChangeLog b/ChangeLog
+index f4148a9..376edf7 100644
+--- a/ChangeLog
++++ b/ChangeLog
 @@ -1,3 +1,11 @@
 +2012-04-23  Alexandre Keunecke I. de Mendonca <alexandre.keunecke@gmail.com>
 +
@@ -28,11 +45,11 @@ Index: libffi/ChangeLog
  2012-04-11  Anthony Green  <green@moxielogic.com>
  
  	* Makefile.am (EXTRA_DIST): Add new script.
-Index: libffi/Makefile.am
-===================================================================
---- libffi.orig/Makefile.am
-+++ libffi/Makefile.am
-@@ -27,6 +27,7 @@ EXTRA_DIST = LICENSE ChangeLog.v1 Change
+diff --git a/Makefile.am b/Makefile.am
+index 4a855d7..16f32a6 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -27,6 +27,7 @@ EXTRA_DIST = LICENSE ChangeLog.v1 ChangeLog.libgcj configure.host \
  	src/x86/win64.S src/x86/freebsd.S src/x86/ffi64.c \
  	src/x86/unix64.S src/x86/ffitarget.h src/pa/ffitarget.h	\
  	src/pa/ffi.c src/pa/linux.S src/pa/hpux32.S src/frv/ffi.c \
@@ -50,10 +67,10 @@ Index: libffi/Makefile.am
  if X86
  nodist_libffi_la_SOURCES += src/x86/ffi.c src/x86/sysv.S
  endif
-Index: libffi/Makefile.in
-===================================================================
---- libffi.orig/Makefile.in
-+++ libffi/Makefile.in
+diff --git a/Makefile.in b/Makefile.in
+index 4308193..f5c10af 100644
+--- a/Makefile.in
++++ b/Makefile.in
 @@ -38,35 +38,36 @@ host_triplet = @host@
  target_triplet = @target@
  @FFI_DEBUG_TRUE at am__append_1 = src/debug.c
@@ -118,7 +135,7 @@ Index: libffi/Makefile.in
  subdir = .
  DIST_COMMON = README $(am__configure_deps) $(srcdir)/Makefile.am \
  	$(srcdir)/Makefile.in $(srcdir)/doc/stamp-vti \
-@@ -75,17 +76,7 @@ DIST_COMMON = README $(am__configure_dep
+@@ -75,17 +76,7 @@ DIST_COMMON = README $(am__configure_deps) $(srcdir)/Makefile.am \
  	compile config.guess config.sub depcomp install-sh ltmain.sh \
  	mdate-sh missing texinfo.tex
  ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
@@ -137,7 +154,7 @@ Index: libffi/Makefile.in
  	$(top_srcdir)/configure.ac
  am__configure_deps = $(am__aclocal_m4_deps) $(CONFIGURE_DEPENDENCIES) \
  	$(ACLOCAL_M4)
-@@ -126,44 +117,45 @@ am_libffi_la_OBJECTS = src/prep_cif.lo s
+@@ -126,44 +117,45 @@ am_libffi_la_OBJECTS = src/prep_cif.lo src/types.lo src/raw_api.lo \
  @FFI_DEBUG_TRUE at am__objects_1 = src/debug.lo
  @MIPS_TRUE at am__objects_2 = src/mips/ffi.lo src/mips/o32.lo \
  @MIPS_TRUE@	src/mips/n32.lo
@@ -209,7 +226,7 @@ Index: libffi/Makefile.in
  nodist_libffi_la_OBJECTS = $(am__objects_1) $(am__objects_2) \
  	$(am__objects_3) $(am__objects_4) $(am__objects_5) \
  	$(am__objects_6) $(am__objects_7) $(am__objects_8) \
-@@ -173,17 +165,17 @@ nodist_libffi_la_OBJECTS = $(am__objects
+@@ -173,17 +165,17 @@ nodist_libffi_la_OBJECTS = $(am__objects_1) $(am__objects_2) \
  	$(am__objects_18) $(am__objects_19) $(am__objects_20) \
  	$(am__objects_21) $(am__objects_22) $(am__objects_23) \
  	$(am__objects_24) $(am__objects_25) $(am__objects_26) \
@@ -231,7 +248,7 @@ Index: libffi/Makefile.in
  	$(am__objects_4) $(am__objects_5) $(am__objects_6) \
  	$(am__objects_7) $(am__objects_8) $(am__objects_9) \
  	$(am__objects_10) $(am__objects_11) $(am__objects_12) \
-@@ -192,8 +184,8 @@ am__objects_30 = $(am__objects_1) $(am__
+@@ -192,8 +184,8 @@ am__objects_30 = $(am__objects_1) $(am__objects_2) $(am__objects_3) \
  	$(am__objects_19) $(am__objects_20) $(am__objects_21) \
  	$(am__objects_22) $(am__objects_23) $(am__objects_24) \
  	$(am__objects_25) $(am__objects_26) $(am__objects_27) \
@@ -242,7 +259,7 @@ Index: libffi/Makefile.in
  libffi_convenience_la_OBJECTS = $(am_libffi_convenience_la_OBJECTS) \
  	$(nodist_libffi_convenience_la_OBJECTS)
  DEFAULT_INCLUDES = -I. at am__isrc@
-@@ -440,6 +432,7 @@ EXTRA_DIST = LICENSE ChangeLog.v1 Change
+@@ -440,6 +432,7 @@ EXTRA_DIST = LICENSE ChangeLog.v1 ChangeLog.libgcj configure.host \
  	src/x86/win64.S src/x86/freebsd.S src/x86/ffi64.c \
  	src/x86/unix64.S src/x86/ffitarget.h src/pa/ffitarget.h	\
  	src/pa/ffi.c src/pa/linux.S src/pa/hpux32.S src/frv/ffi.c \
@@ -250,7 +267,7 @@ Index: libffi/Makefile.in
  	src/frv/eabi.S src/frv/ffitarget.h src/dlmalloc.c \
  	src/moxie/ffi.c src/moxie/eabi.S libtool-version \
  	ChangeLog.libffi m4/libtool.m4 m4/lt~obsolete.m4 \
-@@ -508,10 +501,10 @@ nodist_libffi_la_SOURCES = $(am__append_
+@@ -508,10 +501,10 @@ nodist_libffi_la_SOURCES = $(am__append_1) $(am__append_2) \
  	$(am__append_18) $(am__append_19) $(am__append_20) \
  	$(am__append_21) $(am__append_22) $(am__append_23) \
  	$(am__append_24) $(am__append_25) $(am__append_26) \
@@ -263,7 +280,7 @@ Index: libffi/Makefile.in
  libffi_la_LDFLAGS = -version-info `grep -v '^\#' $(srcdir)/libtool-version` $(LTLDFLAGS) $(AM_LTLDFLAGS)
  AM_CPPFLAGS = -I. -I$(top_srcdir)/include -Iinclude -I$(top_srcdir)/src -DFFI_BUILDING
  AM_CCASFLAGS = $(AM_CPPFLAGS) -g
-@@ -637,6 +630,16 @@ src/mips/o32.lo: src/mips/$(am__dirstamp
+@@ -637,6 +630,16 @@ src/mips/o32.lo: src/mips/$(am__dirstamp) \
  	src/mips/$(DEPDIR)/$(am__dirstamp)
  src/mips/n32.lo: src/mips/$(am__dirstamp) \
  	src/mips/$(DEPDIR)/$(am__dirstamp)
@@ -317,7 +334,7 @@ Index: libffi/Makefile.in
  	-rm -f src/cris/$(DEPDIR)/$(am__dirstamp)
  	-rm -f src/cris/$(am__dirstamp)
  	-rm -f src/frv/$(DEPDIR)/$(am__dirstamp)
-@@ -1670,7 +1682,7 @@ clean-am: clean-aminfo clean-generic cle
+@@ -1670,7 +1682,7 @@ clean-am: clean-aminfo clean-generic clean-libLTLIBRARIES \
  
  distclean: distclean-recursive
  	-rm -f $(am__CONFIG_DISTCLEAN_FILES)
@@ -335,10 +352,43 @@ Index: libffi/Makefile.in
  	-rm -f Makefile
  maintainer-clean-am: distclean-am maintainer-clean-aminfo \
  	maintainer-clean-generic maintainer-clean-vti
-Index: libffi/configure
-===================================================================
---- libffi.orig/configure
-+++ libffi/configure
+diff --git a/README b/README
+index bcc7178..ec240a4 100644
+--- a/README
++++ b/README
+@@ -1,8 +1,8 @@
+ Status
+ ======
+ 
+-libffi-3.0.11 was released on April 11, 2012.  Check the libffi web
+-page for updates: <URL:http://sourceware.org/libffi/>.
++libffi-3.0.XX was released on XXXXXXX.  Check the libffi web page for
++updates: <URL:http://sourceware.org/libffi/>.
+ 
+ 
+ What is libffi?
+@@ -56,6 +56,7 @@ tested:
+ | ARM          | Linux            |
+ | ARM          | iOS              |
+ | AVR32        | Linux            |
++| Blackfin     | uClinux          |
+ | HPPA         | HPUX             |
+ | IA-64        | Linux            |
+ | M68K         | FreeMiNT         |
+@@ -148,6 +149,9 @@ History
+ 
+ See the ChangeLog files for details.
+ 
++3.0.12 XXX-XX-XX
++        Add Blackfin support.
++
+ 3.0.11 Apr-11-12
+         Add support for variadic functions (ffi_prep_cif_var).
+ 	Add Linux/x32 support.
+diff --git a/configure b/configure
+index 91b2317..4ccba55 100755
+--- a/configure
++++ b/configure
 @@ -679,6 +679,8 @@ X86_FALSE
  X86_TRUE
  SPARC_FALSE
@@ -348,7 +398,7 @@ Index: libffi/configure
  MIPS_FALSE
  MIPS_TRUE
  AM_LTLDFLAGS
-@@ -6840,14 +6842,7 @@ s390*-*linux*|s390*-*tpf*|sparc*-*linux*
+@@ -6840,14 +6842,7 @@ s390*-*linux*|s390*-*tpf*|sparc*-*linux*)
  	    LD="${LD-ld} -m elf_i386_fbsd"
  	    ;;
  	  x86_64-*linux*)
@@ -364,7 +414,7 @@ Index: libffi/configure
  	    ;;
  	  ppc64-*linux*|powerpc64-*linux*)
  	    LD="${LD-ld} -m elf32ppclinux"
-@@ -8418,10 +8413,6 @@ _lt_linker_boilerplate=`cat conftest.err
+@@ -8418,10 +8413,6 @@ _lt_linker_boilerplate=`cat conftest.err`
  $RM -r conftest*
  
  
@@ -480,7 +530,7 @@ Index: libffi/configure
   if test x$TARGET = xSPARC; then
    SPARC_TRUE=
    SPARC_FALSE='#'
-@@ -14134,40 +14150,7 @@ $as_echo "#define AC_APPLE_UNIVERSAL_BUI
+@@ -14134,40 +14150,7 @@ $as_echo "#define AC_APPLE_UNIVERSAL_BUILD 1" >>confdefs.h
   esac
  
  
@@ -522,7 +572,7 @@ Index: libffi/configure
  
  if test x$TARGET = xSPARC; then
      { $as_echo "$as_me:${as_lineno-$LINENO}: checking assembler and linker support unaligned pc related relocs" >&5
-@@ -14739,6 +14722,10 @@ if test -z "${MIPS_TRUE}" && test -z "${
+@@ -14739,6 +14722,10 @@ if test -z "${MIPS_TRUE}" && test -z "${MIPS_FALSE}"; then
    as_fn_error $? "conditional \"MIPS\" was never defined.
  Usually this means the macro was only invoked conditionally." "$LINENO" 5
  fi
@@ -533,10 +583,10 @@ Index: libffi/configure
  if test -z "${SPARC_TRUE}" && test -z "${SPARC_FALSE}"; then
    as_fn_error $? "conditional \"SPARC\" was never defined.
  Usually this means the macro was only invoked conditionally." "$LINENO" 5
-Index: libffi/configure.ac
-===================================================================
---- libffi.orig/configure.ac
-+++ libffi/configure.ac
+diff --git a/configure.ac b/configure.ac
+index 1021769..9b946a2 100644
+--- a/configure.ac
++++ b/configure.ac
 @@ -75,6 +75,10 @@ case "$host" in
  	TARGET=AVR32; TARGETDIR=avr32
  	;;
@@ -556,10 +606,11 @@ Index: libffi/configure.ac
  AM_CONDITIONAL(SPARC, test x$TARGET = xSPARC)
  AM_CONDITIONAL(X86, test x$TARGET = xX86)
  AM_CONDITIONAL(X86_FREEBSD, test x$TARGET = xX86_FREEBSD)
-Index: libffi/src/bfin/ffi.c
-===================================================================
+diff --git a/src/bfin/ffi.c b/src/bfin/ffi.c
+new file mode 100644
+index 0000000..0beccc1
 --- /dev/null
-+++ libffi/src/bfin/ffi.c
++++ b/src/bfin/ffi.c
 @@ -0,0 +1,195 @@
 +/* -----------------------------------------------------------------------
 +   ffi.c - Copyright (c) 2012  Alexandre K. I. de Mendonca <alexandre.keunecke@gmail.com>
@@ -756,10 +807,11 @@ Index: libffi/src/bfin/ffi.c
 +
 +
 +
-Index: libffi/src/bfin/ffitarget.h
-===================================================================
+diff --git a/src/bfin/ffitarget.h b/src/bfin/ffitarget.h
+new file mode 100644
+index 0000000..2175c01
 --- /dev/null
-+++ libffi/src/bfin/ffitarget.h
++++ b/src/bfin/ffitarget.h
 @@ -0,0 +1,43 @@
 +/* -----------------------------------------------------------------------
 +   ffitarget.h - Copyright (c) 2012  Alexandre K. I. de Mendonca <alexandre.keunecke@gmail.com>
@@ -804,10 +856,11 @@ Index: libffi/src/bfin/ffitarget.h
 +
 +#endif
 +
-Index: libffi/src/bfin/sysv.S
-===================================================================
+diff --git a/src/bfin/sysv.S b/src/bfin/sysv.S
+new file mode 100644
+index 0000000..ae7a152
 --- /dev/null
-+++ libffi/src/bfin/sysv.S
++++ b/src/bfin/sysv.S
 @@ -0,0 +1,177 @@
 +/* -----------------------------------------------------------------------
 +   sysv.S - Copyright (c) 2012  Alexandre K. I. de Mendonca <alexandre.keunecke@gmail.com>
@@ -986,36 +1039,6 @@ Index: libffi/src/bfin/sysv.S
 +
 +.size _ffi_call_SYSV,.-_ffi_call_SYSV;
 +.endfunc
-Index: libffi/README
-===================================================================
---- libffi.orig/README
-+++ libffi/README
-@@ -1,8 +1,8 @@
- Status
- ======
- 
--libffi-3.0.11 was released on April 11, 2012.  Check the libffi web
--page for updates: <URL:http://sourceware.org/libffi/>.
-+libffi-3.0.XX was released on XXXXXXX.  Check the libffi web page for
-+updates: <URL:http://sourceware.org/libffi/>.
- 
- 
- What is libffi?
-@@ -56,6 +56,7 @@ tested:
- | ARM          | Linux            |
- | ARM          | iOS              |
- | AVR32        | Linux            |
-+| Blackfin     | uClinux          |
- | HPPA         | HPUX             |
- | IA-64        | Linux            |
- | M68K         | FreeMiNT         |
-@@ -148,6 +149,9 @@ History
- 
- See the ChangeLog files for details.
- 
-+3.0.12 XXX-XX-XX
-+        Add Blackfin support.
-+
- 3.0.11 Apr-11-12
-         Add support for variadic functions (ffi_prep_cif_var).
- 	Add Linux/x32 support.
+-- 
+1.7.9.5
+
-- 
1.7.9.5
