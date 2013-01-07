From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 7 Jan 2013 21:43:01 +0100
Subject: [Buildroot] [git commit] elfutils: towards uClibc support:
	argp-standalone usage
Message-ID: <20130107212532.0472B9A692@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e6c06fb11684ab8aa5454338024040dae95e57e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

elfutils uses the argp family of functions, that isn't available in
uClibc. So, we add a dependency on argp-standalone if building with
uClibc, and modify elfutils source code to link against argp if
needed.

Heavily based from work done by Stefan Fr??berg, but with many further
modifications by Thomas Petazzoni.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/elfutils/Config.in                      |    4 +
 package/elfutils/elfutils-02-argp-support.patch |   92 +++++++++++++++++++++++
 package/elfutils/elfutils.mk                    |    4 +
 3 files changed, 100 insertions(+), 0 deletions(-)

diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index 87744b5..ee1e4ab 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -8,6 +8,10 @@ config BR2_PACKAGE_ELFUTILS
 	depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC || \
 		   BR2_TOOLCHAIN_CTNG_glibc     || \
 		   BR2_TOOLCHAIN_CTNG_eglibc
+	select BR2_PACKAGE_ARGP_STANDALONE if \
+	       BR2_TOOLCHAIN_BUILDROOT   || \
+	       BR2_TOOLCHAIN_CTNG_uClibc || \
+	       BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	help
 	  Libraries/utilities to handle ELF objects (drop in
 	  replacement for libelf).
diff --git a/package/elfutils/elfutils-02-argp-support.patch b/package/elfutils/elfutils-02-argp-support.patch
new file mode 100644
index 0000000..f81ac8f
--- /dev/null
+++ b/package/elfutils/elfutils-02-argp-support.patch
@@ -0,0 +1,92 @@
+Allow the usage of an external implementation of the argp functions
+
+uClibc lack the argp family of functions that glibc has. Therefore, we
+add a check in the configure script to see if argp_parse is available
+in the C library. If not, we look if it is available in the additional
+'argp' library. If so, we link against that library. If not, we error
+out.
+
+This allows to build elfutils against uClibc with an external argp
+library.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -269,6 +269,13 @@
+ 	enable_progs=yes)
+ AM_CONDITIONAL(ENABLE_PROGS, test "$enable_progs" = yes)
+ 
++AC_CHECK_FUNC([argp_parse])
++if test "$ac_cv_func_argp_parse" != yes; then
++   AC_CHECK_LIB([argp],[argp_parse],ARGP_LIBS=-largp,
++		AC_MSG_ERROR([No argp_parse function available.]))
++fi
++AC_SUBST(ARGP_LIBS)
++
+ dnl Test for zlib and bzlib, gives ZLIB/BZLIB .am
+ dnl conditional and config.h USE_ZLIB/USE_BZLIB #define.
+ save_LIBS="$LIBS"
+Index: b/src/Makefile.am
+===================================================================
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -98,26 +98,29 @@
+ # Buggy old compilers.
+ readelf_no_Werror = yes
+ 
+-readelf_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
++readelf_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl \
++	$(ARGP_LIBS)
+ nm_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl \
+-	   $(demanglelib)
+-size_LDADD = $(libelf) $(libeu) $(libmudflap)
+-strip_LDADD = $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
+-ld_LDADD = $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
++	   $(demanglelib) $(ARGP_LIBS)
++size_LDADD = $(libelf) $(libeu) $(libmudflap) $(ARGP_LIBS)
++strip_LDADD = $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl $(ARGP_LIBS)
++ld_LDADD = $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl $(ARGP_LIBS)
+ if NATIVE_LD
+ # -ldl is always needed for libebl.
+ ld_LDADD += libld_elf.a
+ endif
+ ld_LDFLAGS = -rdynamic
+-elflint_LDADD  = $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
+-findtextrel_LDADD = $(libdw) $(libelf) $(libmudflap)
+-addr2line_LDADD = $(libdw) $(libelf) $(libmudflap)
+-elfcmp_LDADD = $(libebl) $(libelf) $(libmudflap) -ldl
+-objdump_LDADD  = $(libasm) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
+-ranlib_LDADD = libar.a $(libelf) $(libeu) $(libmudflap)
+-strings_LDADD = $(libelf) $(libeu) $(libmudflap)
+-ar_LDADD = libar.a $(libelf) $(libeu) $(libmudflap)
+-unstrip_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) $(libmudflap) -ldl
++elflint_LDADD  = $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl $(ARGP_LIBS)
++findtextrel_LDADD = $(libdw) $(libelf) $(libmudflap) $(ARGP_LIBS)
++addr2line_LDADD = $(libdw) $(libelf) $(libmudflap) $(ARGP_LIBS)
++elfcmp_LDADD = $(libebl) $(libelf) $(libmudflap) -ldl $(ARGP_LIBS)
++objdump_LDADD  = $(libasm) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl \
++	$(ARGP_LIBS)
++ranlib_LDADD = libar.a $(libelf) $(libeu) $(libmudflap) $(ARGP_LIBS)
++strings_LDADD = $(libelf) $(libeu) $(libmudflap) $(ARGP_LIBS)
++ar_LDADD = libar.a $(libelf) $(libeu) $(libmudflap) $(ARGP_LIBS)
++unstrip_LDADD = $(libebl) $(libelf) $(libdw) $(libeu) $(libmudflap) -ldl \
++	$(ARGP_LIBS)
+ 
+ ldlex.o: ldscript.c
+ ldlex_no_Werror = yes
+Index: b/libdw/Makefile.am
+===================================================================
+--- a/libdw/Makefile.am
++++ b/libdw/Makefile.am
+@@ -111,7 +111,7 @@
+ 		-Wl,--enable-new-dtags,-rpath,$(pkglibdir) \
+ 		-Wl,--version-script,$<,--no-undefined \
+ 		-Wl,--whole-archive $(filter-out $<,$^) -Wl,--no-whole-archive\
+-		-ldl $(zip_LIBS)
++		-ldl $(zip_LIBS) $(ARGP_LIBS)
+ 	if readelf -d $@ | fgrep -q TEXTREL; then exit 1; fi
+ 	ln -fs $@ $@.$(VERSION)
+ 
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index f8a4e85..9f9de52 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -25,6 +25,10 @@ ELFUTILS_CONF_ENV += \
         CPPFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))"
 endif
 
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),y)
+ ELFUTILS_DEPENDENCIES += argp-standalone
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
  ELFUTILS_DEPENDENCIES += zlib
  ELFUTILS_CONF_OPT += --with-zlib
