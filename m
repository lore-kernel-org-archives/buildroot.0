From: Vadim Kochan <vadim4j@gmail.com>
Date: Sat,  5 Jan 2019 22:00:46 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/gettext-tiny: Add new package
In-Reply-To: <20190105200046.31512-1-vadim4j@gmail.com>
References: <20190105200046.31512-1-vadim4j@gmail.com>
Message-ID: <20190105200046.31512-4-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add gettext-tiny package from the sabotage-linux project:

    gettext-tiny provides lightweight replacements for tools typically used
    from the GNU gettext suite, which is incredibly bloated and takes a lot
    of time to build (in the order of an hour on slow devices). the most
    notable component is msgfmt which is used to create binary translation
    files in the .mo format out of textual input files in .po format. this
    is the most important tool for building software from source, because it
    is used from the build processes of many software packages.

Some files were taken from gettext-gnu (some po/* files and gettextize
script) to make possible perform gettextizing of packages.

The main purpose of gettext-tiny is to replace gettext for the "host" if
NLS support is not needed. There is no option to manually select
gettext-gnu or gettext-tiny, it is done automatically by virtual gettext
package, because there is no reason to have gettext-tiny for the target.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 DEVELOPERS                                         |   3 +
 ...-format-not-a-string-literal-error-for-gc.patch |  55 ++
 ...ig.rpath-from-gettext-gnu-distro-0.19.8.1.patch | 709 +++++++++++++++++++++
 package/gettext-tiny/gettext-tiny.hash             |  14 +
 package/gettext-tiny/gettext-tiny.mk               | 104 +++
 package/gettext/Config.in                          |  19 +-
 6 files changed, 895 insertions(+), 9 deletions(-)
 create mode 100644 package/gettext-tiny/0001-libintl-Fix-format-not-a-string-literal-error-for-gc.patch
 create mode 100644 package/gettext-tiny/0002-Add-config.rpath-from-gettext-gnu-distro-0.19.8.1.patch
 create mode 100644 package/gettext-tiny/gettext-tiny.hash
 create mode 100644 package/gettext-tiny/gettext-tiny.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9654fcf2bf..0df7e4b83e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2140,6 +2140,9 @@ N:	Tzu-Jung Lee <roylee17@gmail.com>
 F:	package/dropwatch/
 F:	package/tstools/
 
+N:	Vadim Kochan <vadim4j@gmail.com>
+F:	package/gettext-tiny/
+
 N:	Valentin Korenblit <valentinkorenblit@gmail.com>
 F:	package/clang/
 F:	package/clinfo/
diff --git a/package/gettext-tiny/0001-libintl-Fix-format-not-a-string-literal-error-for-gc.patch b/package/gettext-tiny/0001-libintl-Fix-format-not-a-string-literal-error-for-gc.patch
new file mode 100644
index 0000000000..7f89820e78
--- /dev/null
+++ b/package/gettext-tiny/0001-libintl-Fix-format-not-a-string-literal-error-for-gc.patch
@@ -0,0 +1,55 @@
+From 34f631ce80700aa1eaadc032026f12f86584bd8a Mon Sep 17 00:00:00 2001
+From: Vadim Kochan <vadim.kochan@petcube.com>
+Date: Mon, 31 Dec 2018 00:40:29 +0200
+Subject: [PATCH] gettext-tiny: Fix format not a string literal error
+
+Add 'format_arg' attribute for the functions which may return string
+as formatted parameter, otherwise it fails to compile on high versions
+of gcc.
+
+Signed-off-by: Vadim Kochan <vadim.kochan@petcube.com>
+---
+ include/libintl.h | 27 +++++++++++++++++++++------
+ 1 file changed, 21 insertions(+), 6 deletions(-)
+
+diff --git a/include/libintl.h b/include/libintl.h
+index b1af2b4..1883e1b 100644
+--- a/include/libintl.h
++++ b/include/libintl.h
+@@ -4,12 +4,27 @@
+ #ifdef __cplusplus
+ extern "C" {
+ #endif
+-char *gettext(const char *msgid);
+-char *dgettext(const char *domainname, const char *msgid);
+-char *dcgettext(const char *domainname, const char *msgid, int category);
+-char *ngettext(const char *msgid1, const char *msgid2, unsigned long n);
+-char *dngettext(const char *domainname, const char *msgid1, const char *msgid2, unsigned long n);
+-char *dcngettext(const char *domainname, const char *msgid1, const char *msgid2, unsigned long n, int category);
++/* _INTL_MAY_RETURN_STRING_ARG(n) declares that the given function may return
++ *    its n-th argument literally.  This enables GCC to warn for example about
++ *       printf (gettext ("foo %y")).  */
++#if defined __GNUC__ && __GNUC__ >= 3 && !(defined __APPLE_CC__ && __APPLE_CC__ > 1 && defined __cplusplus)
++# define _INTL_MAY_RETURN_STRING_ARG(n) __attribute__ ((__format_arg__ (n)))
++#else
++# define _INTL_MAY_RETURN_STRING_ARG(n)
++#endif
++
++char *gettext(const char *msgid)
++	_INTL_MAY_RETURN_STRING_ARG(1);
++char *dgettext(const char *domainname, const char *msgid)
++	_INTL_MAY_RETURN_STRING_ARG(2);
++char *dcgettext(const char *domainname, const char *msgid, int category)
++	_INTL_MAY_RETURN_STRING_ARG(2);
++char *ngettext(const char *msgid1, const char *msgid2, unsigned long n)
++	_INTL_MAY_RETURN_STRING_ARG(1) _INTL_MAY_RETURN_STRING_ARG(2);
++char *dngettext(const char *domainname, const char *msgid1, const char *msgid2, unsigned long n)
++	_INTL_MAY_RETURN_STRING_ARG(2) _INTL_MAY_RETURN_STRING_ARG(3);
++char *dcngettext(const char *domainname, const char *msgid1, const char *msgid2, unsigned long n, int category)
++	_INTL_MAY_RETURN_STRING_ARG(2) _INTL_MAY_RETURN_STRING_ARG(3);
+ 
+ char *textdomain(const char *domainname);
+ char *bind_textdomain_codeset(const char *domainname, const char *codeset);
+-- 
+2.14.1
+
diff --git a/package/gettext-tiny/0002-Add-config.rpath-from-gettext-gnu-distro-0.19.8.1.patch b/package/gettext-tiny/0002-Add-config.rpath-from-gettext-gnu-distro-0.19.8.1.patch
new file mode 100644
index 0000000000..8f64e62462
--- /dev/null
+++ b/package/gettext-tiny/0002-Add-config.rpath-from-gettext-gnu-distro-0.19.8.1.patch
@@ -0,0 +1,709 @@
+From c69895f748e99e5d714cd219ec767fa0197fc4d0 Mon Sep 17 00:00:00 2001
+From: Vadim Kochan <vadim.kochan@petcube.com>
+Date: Sat, 5 Jan 2019 08:21:27 +0200
+Subject: [PATCH] Add config.rpath from gettext gnu distro 0.19.8.1
+
+Some packages during gettextization (like libuio) requires that
+config.rpath exists in /share/gettext*/ folder. Because there is no
+such file in the gettext gnu repo (because it is added only for the
+released tar), so add it manually.
+
+Signed-off-by: Vadim Kochan <vadim.kochan@petcube.com>
+---
+ build-aux/config.rpath | 684 +++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 684 insertions(+)
+ create mode 100755 build-aux/config.rpath
+
+diff --git a/build-aux/config.rpath b/build-aux/config.rpath
+new file mode 100755
+index 0000000..98183ff
+--- /dev/null
++++ b/build-aux/config.rpath
+@@ -0,0 +1,684 @@
++#! /bin/sh
++# Output a system dependent set of variables, describing how to set the
++# run time search path of shared libraries in an executable.
++#
++#   Copyright 1996-2016 Free Software Foundation, Inc.
++#   Taken from GNU libtool, 2001
++#   Originally by Gordon Matzigkeit <gord@gnu.ai.mit.edu>, 1996
++#
++#   This file is free software; the Free Software Foundation gives
++#   unlimited permission to copy and/or distribute it, with or without
++#   modifications, as long as this notice is preserved.
++#
++# The first argument passed to this file is the canonical host specification,
++#    CPU_TYPE-MANUFACTURER-OPERATING_SYSTEM
++# or
++#    CPU_TYPE-MANUFACTURER-KERNEL-OPERATING_SYSTEM
++# The environment variables CC, GCC, LDFLAGS, LD, with_gnu_ld
++# should be set by the caller.
++#
++# The set of defined variables is at the end of this script.
++
++# Known limitations:
++# - On IRIX 6.5 with CC="cc", the run time search patch must not be longer
++#   than 256 bytes, otherwise the compiler driver will dump core. The only
++#   known workaround is to choose shorter directory names for the build
++#   directory and/or the installation directory.
++
++# All known linkers require a '.a' archive for static linking (except MSVC,
++# which needs '.lib').
++libext=a
++shrext=.so
++
++host="$1"
++host_cpu=`echo "$host" | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\1/'`
++host_vendor=`echo "$host" | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\2/'`
++host_os=`echo "$host" | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\3/'`
++
++# Code taken from libtool.m4's _LT_CC_BASENAME.
++
++for cc_temp in $CC""; do
++  case $cc_temp in
++    compile | *[\\/]compile | ccache | *[\\/]ccache ) ;;
++    distcc | *[\\/]distcc | purify | *[\\/]purify ) ;;
++    \-*) ;;
++    *) break;;
++  esac
++done
++cc_basename=`echo "$cc_temp" | sed -e 's%^.*/%%'`
++
++# Code taken from libtool.m4's _LT_COMPILER_PIC.
++
++wl=
++if test "$GCC" = yes; then
++  wl='-Wl,'
++else
++  case "$host_os" in
++    aix*)
++      wl='-Wl,'
++      ;;
++    mingw* | cygwin* | pw32* | os2* | cegcc*)
++      ;;
++    hpux9* | hpux10* | hpux11*)
++      wl='-Wl,'
++      ;;
++    irix5* | irix6* | nonstopux*)
++      wl='-Wl,'
++      ;;
++    linux* | k*bsd*-gnu | kopensolaris*-gnu)
++      case $cc_basename in
++        ecc*)
++          wl='-Wl,'
++          ;;
++        icc* | ifort*)
++          wl='-Wl,'
++          ;;
++        lf95*)
++          wl='-Wl,'
++          ;;
++        nagfor*)
++          wl='-Wl,-Wl,,'
++          ;;
++        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
++          wl='-Wl,'
++          ;;
++        ccc*)
++          wl='-Wl,'
++          ;;
++        xl* | bgxl* | bgf* | mpixl*)
++          wl='-Wl,'
++          ;;
++        como)
++          wl='-lopt='
++          ;;
++        *)
++          case `$CC -V 2>&1 | sed 5q` in
++            *Sun\ F* | *Sun*Fortran*)
++              wl=
++              ;;
++            *Sun\ C*)
++              wl='-Wl,'
++              ;;
++          esac
++          ;;
++      esac
++      ;;
++    newsos6)
++      ;;
++    *nto* | *qnx*)
++      ;;
++    osf3* | osf4* | osf5*)
++      wl='-Wl,'
++      ;;
++    rdos*)
++      ;;
++    solaris*)
++      case $cc_basename in
++        f77* | f90* | f95* | sunf77* | sunf90* | sunf95*)
++          wl='-Qoption ld '
++          ;;
++        *)
++          wl='-Wl,'
++          ;;
++      esac
++      ;;
++    sunos4*)
++      wl='-Qoption ld '
++      ;;
++    sysv4 | sysv4.2uw2* | sysv4.3*)
++      wl='-Wl,'
++      ;;
++    sysv4*MP*)
++      ;;
++    sysv5* | unixware* | sco3.2v5* | sco5v6* | OpenUNIX*)
++      wl='-Wl,'
++      ;;
++    unicos*)
++      wl='-Wl,'
++      ;;
++    uts4*)
++      ;;
++  esac
++fi
++
++# Code taken from libtool.m4's _LT_LINKER_SHLIBS.
++
++hardcode_libdir_flag_spec=
++hardcode_libdir_separator=
++hardcode_direct=no
++hardcode_minus_L=no
++
++case "$host_os" in
++  cygwin* | mingw* | pw32* | cegcc*)
++    # FIXME: the MSVC++ port hasn't been tested in a loooong time
++    # When not using gcc, we currently assume that we are using
++    # Microsoft Visual C++.
++    if test "$GCC" != yes; then
++      with_gnu_ld=no
++    fi
++    ;;
++  interix*)
++    # we just hope/assume this is gcc and not c89 (= MSVC++)
++    with_gnu_ld=yes
++    ;;
++  openbsd*)
++    with_gnu_ld=no
++    ;;
++esac
++
++ld_shlibs=yes
++if test "$with_gnu_ld" = yes; then
++  # Set some defaults for GNU ld with shared library support. These
++  # are reset later if shared libraries are not supported. Putting them
++  # here allows them to be overridden if necessary.
++  # Unlike libtool, we use -rpath here, not --rpath, since the documented
++  # option of GNU ld is called -rpath, not --rpath.
++  hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
++  case "$host_os" in
++    aix[3-9]*)
++      # On AIX/PPC, the GNU linker is very broken
++      if test "$host_cpu" != ia64; then
++        ld_shlibs=no
++      fi
++      ;;
++    amigaos*)
++      case "$host_cpu" in
++        powerpc)
++          ;;
++        m68k)
++          hardcode_libdir_flag_spec='-L$libdir'
++          hardcode_minus_L=yes
++          ;;
++      esac
++      ;;
++    beos*)
++      if $LD --help 2>&1 | grep ': supported targets:.* elf' > /dev/null; then
++        :
++      else
++        ld_shlibs=no
++      fi
++      ;;
++    cygwin* | mingw* | pw32* | cegcc*)
++      # hardcode_libdir_flag_spec is actually meaningless, as there is
++      # no search path for DLLs.
++      hardcode_libdir_flag_spec='-L$libdir'
++      if $LD --help 2>&1 | grep 'auto-import' > /dev/null; then
++        :
++      else
++        ld_shlibs=no
++      fi
++      ;;
++    haiku*)
++      ;;
++    interix[3-9]*)
++      hardcode_direct=no
++      hardcode_libdir_flag_spec='${wl}-rpath,$libdir'
++      ;;
++    gnu* | linux* | tpf* | k*bsd*-gnu | kopensolaris*-gnu)
++      if $LD --help 2>&1 | grep ': supported targets:.* elf' > /dev/null; then
++        :
++      else
++        ld_shlibs=no
++      fi
++      ;;
++    netbsd*)
++      ;;
++    solaris*)
++      if $LD -v 2>&1 | grep 'BFD 2\.8' > /dev/null; then
++        ld_shlibs=no
++      elif $LD --help 2>&1 | grep ': supported targets:.* elf' > /dev/null; then
++        :
++      else
++        ld_shlibs=no
++      fi
++      ;;
++    sysv5* | sco3.2v5* | sco5v6* | unixware* | OpenUNIX*)
++      case `$LD -v 2>&1` in
++        *\ [01].* | *\ 2.[0-9].* | *\ 2.1[0-5].*)
++          ld_shlibs=no
++          ;;
++        *)
++          if $LD --help 2>&1 | grep ': supported targets:.* elf' > /dev/null; then
++            hardcode_libdir_flag_spec='`test -z "$SCOABSPATH" && echo ${wl}-rpath,$libdir`'
++          else
++            ld_shlibs=no
++          fi
++          ;;
++      esac
++      ;;
++    sunos4*)
++      hardcode_direct=yes
++      ;;
++    *)
++      if $LD --help 2>&1 | grep ': supported targets:.* elf' > /dev/null; then
++        :
++      else
++        ld_shlibs=no
++      fi
++      ;;
++  esac
++  if test "$ld_shlibs" = no; then
++    hardcode_libdir_flag_spec=
++  fi
++else
++  case "$host_os" in
++    aix3*)
++      # Note: this linker hardcodes the directories in LIBPATH if there
++      # are no directories specified by -L.
++      hardcode_minus_L=yes
++      if test "$GCC" = yes; then
++        # Neither direct hardcoding nor static linking is supported with a
++        # broken collect2.
++        hardcode_direct=unsupported
++      fi
++      ;;
++    aix[4-9]*)
++      if test "$host_cpu" = ia64; then
++        # On IA64, the linker does run time linking by default, so we don't
++        # have to do anything special.
++        aix_use_runtimelinking=no
++      else
++        aix_use_runtimelinking=no
++        # Test if we are trying to use run time linking or normal
++        # AIX style linking. If -brtl is somewhere in LDFLAGS, we
++        # need to do runtime linking.
++        case $host_os in aix4.[23]|aix4.[23].*|aix[5-9]*)
++          for ld_flag in $LDFLAGS; do
++            if (test $ld_flag = "-brtl" || test $ld_flag = "-Wl,-brtl"); then
++              aix_use_runtimelinking=yes
++              break
++            fi
++          done
++          ;;
++        esac
++      fi
++      hardcode_direct=yes
++      hardcode_libdir_separator=':'
++      if test "$GCC" = yes; then
++        case $host_os in aix4.[012]|aix4.[012].*)
++          collect2name=`${CC} -print-prog-name=collect2`
++          if test -f "$collect2name" && \
++            strings "$collect2name" | grep resolve_lib_name >/dev/null
++          then
++            # We have reworked collect2
++            :
++          else
++            # We have old collect2
++            hardcode_direct=unsupported
++            hardcode_minus_L=yes
++            hardcode_libdir_flag_spec='-L$libdir'
++            hardcode_libdir_separator=
++          fi
++          ;;
++        esac
++      fi
++      # Begin _LT_AC_SYS_LIBPATH_AIX.
++      echo 'int main () { return 0; }' > conftest.c
++      ${CC} ${LDFLAGS} conftest.c -o conftest
++      aix_libpath=`dump -H conftest 2>/dev/null | sed -n -e '/Import File Strings/,/^$/ { /^0/ { s/^0  *\(.*\)$/\1/; p; }
++}'`
++      if test -z "$aix_libpath"; then
++        aix_libpath=`dump -HX64 conftest 2>/dev/null | sed -n -e '/Import File Strings/,/^$/ { /^0/ { s/^0  *\(.*\)$/\1/; p; }
++}'`
++      fi
++      if test -z "$aix_libpath"; then
++        aix_libpath="/usr/lib:/lib"
++      fi
++      rm -f conftest.c conftest
++      # End _LT_AC_SYS_LIBPATH_AIX.
++      if test "$aix_use_runtimelinking" = yes; then
++        hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
++      else
++        if test "$host_cpu" = ia64; then
++          hardcode_libdir_flag_spec='${wl}-R $libdir:/usr/lib:/lib'
++        else
++          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
++        fi
++      fi
++      ;;
++    amigaos*)
++      case "$host_cpu" in
++        powerpc)
++          ;;
++        m68k)
++          hardcode_libdir_flag_spec='-L$libdir'
++          hardcode_minus_L=yes
++          ;;
++      esac
++      ;;
++    bsdi[45]*)
++      ;;
++    cygwin* | mingw* | pw32* | cegcc*)
++      # When not using gcc, we currently assume that we are using
++      # Microsoft Visual C++.
++      # hardcode_libdir_flag_spec is actually meaningless, as there is
++      # no search path for DLLs.
++      hardcode_libdir_flag_spec=' '
++      libext=lib
++      ;;
++    darwin* | rhapsody*)
++      hardcode_direct=no
++      if { case $cc_basename in ifort*) true;; *) test "$GCC" = yes;; esac; }; then
++        :
++      else
++        ld_shlibs=no
++      fi
++      ;;
++    dgux*)
++      hardcode_libdir_flag_spec='-L$libdir'
++      ;;
++    freebsd2.[01]*)
++      hardcode_direct=yes
++      hardcode_minus_L=yes
++      ;;
++    freebsd* | dragonfly*)
++      hardcode_libdir_flag_spec='-R$libdir'
++      hardcode_direct=yes
++      ;;
++    hpux9*)
++      hardcode_libdir_flag_spec='${wl}+b ${wl}$libdir'
++      hardcode_libdir_separator=:
++      hardcode_direct=yes
++      # hardcode_minus_L: Not really in the search PATH,
++      # but as the default location of the library.
++      hardcode_minus_L=yes
++      ;;
++    hpux10*)
++      if test "$with_gnu_ld" = no; then
++        hardcode_libdir_flag_spec='${wl}+b ${wl}$libdir'
++        hardcode_libdir_separator=:
++        hardcode_direct=yes
++        # hardcode_minus_L: Not really in the search PATH,
++        # but as the default location of the library.
++        hardcode_minus_L=yes
++      fi
++      ;;
++    hpux11*)
++      if test "$with_gnu_ld" = no; then
++        hardcode_libdir_flag_spec='${wl}+b ${wl}$libdir'
++        hardcode_libdir_separator=:
++        case $host_cpu in
++          hppa*64*|ia64*)
++            hardcode_direct=no
++            ;;
++          *)
++            hardcode_direct=yes
++            # hardcode_minus_L: Not really in the search PATH,
++            # but as the default location of the library.
++            hardcode_minus_L=yes
++            ;;
++        esac
++      fi
++      ;;
++    irix5* | irix6* | nonstopux*)
++      hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
++      hardcode_libdir_separator=:
++      ;;
++    netbsd*)
++      hardcode_libdir_flag_spec='-R$libdir'
++      hardcode_direct=yes
++      ;;
++    newsos6)
++      hardcode_direct=yes
++      hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
++      hardcode_libdir_separator=:
++      ;;
++    *nto* | *qnx*)
++      ;;
++    openbsd*)
++      if test -f /usr/libexec/ld.so; then
++        hardcode_direct=yes
++        if test -z "`echo __ELF__ | $CC -E - | grep __ELF__`" || test "$host_os-$host_cpu" = "openbsd2.8-powerpc"; then
++          hardcode_libdir_flag_spec='${wl}-rpath,$libdir'
++        else
++          case "$host_os" in
++            openbsd[01].* | openbsd2.[0-7] | openbsd2.[0-7].*)
++              hardcode_libdir_flag_spec='-R$libdir'
++              ;;
++            *)
++              hardcode_libdir_flag_spec='${wl}-rpath,$libdir'
++              ;;
++          esac
++        fi
++      else
++        ld_shlibs=no
++      fi
++      ;;
++    os2*)
++      hardcode_libdir_flag_spec='-L$libdir'
++      hardcode_minus_L=yes
++      ;;
++    osf3*)
++      hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
++      hardcode_libdir_separator=:
++      ;;
++    osf4* | osf5*)
++      if test "$GCC" = yes; then
++        hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
++      else
++        # Both cc and cxx compiler support -rpath directly
++        hardcode_libdir_flag_spec='-rpath $libdir'
++      fi
++      hardcode_libdir_separator=:
++      ;;
++    solaris*)
++      hardcode_libdir_flag_spec='-R$libdir'
++      ;;
++    sunos4*)
++      hardcode_libdir_flag_spec='-L$libdir'
++      hardcode_direct=yes
++      hardcode_minus_L=yes
++      ;;
++    sysv4)
++      case $host_vendor in
++        sni)
++          hardcode_direct=yes # is this really true???
++          ;;
++        siemens)
++          hardcode_direct=no
++          ;;
++        motorola)
++          hardcode_direct=no #Motorola manual says yes, but my tests say they lie
++          ;;
++      esac
++      ;;
++    sysv4.3*)
++      ;;
++    sysv4*MP*)
++      if test -d /usr/nec; then
++        ld_shlibs=yes
++      fi
++      ;;
++    sysv4*uw2* | sysv5OpenUNIX* | sysv5UnixWare7.[01].[10]* | unixware7* | sco3.2v5.0.[024]*)
++      ;;
++    sysv5* | sco3.2v5* | sco5v6*)
++      hardcode_libdir_flag_spec='`test -z "$SCOABSPATH" && echo ${wl}-R,$libdir`'
++      hardcode_libdir_separator=':'
++      ;;
++    uts4*)
++      hardcode_libdir_flag_spec='-L$libdir'
++      ;;
++    *)
++      ld_shlibs=no
++      ;;
++  esac
++fi
++
++# Check dynamic linker characteristics
++# Code taken from libtool.m4's _LT_SYS_DYNAMIC_LINKER.
++# Unlike libtool.m4, here we don't care about _all_ names of the library, but
++# only about the one the linker finds when passed -lNAME. This is the last
++# element of library_names_spec in libtool.m4, or possibly two of them if the
++# linker has special search rules.
++library_names_spec=      # the last element of library_names_spec in libtool.m4
++libname_spec='lib$name'
++case "$host_os" in
++  aix3*)
++    library_names_spec='$libname.a'
++    ;;
++  aix[4-9]*)
++    library_names_spec='$libname$shrext'
++    ;;
++  amigaos*)
++    case "$host_cpu" in
++      powerpc*)
++        library_names_spec='$libname$shrext' ;;
++      m68k)
++        library_names_spec='$libname.a' ;;
++    esac
++    ;;
++  beos*)
++    library_names_spec='$libname$shrext'
++    ;;
++  bsdi[45]*)
++    library_names_spec='$libname$shrext'
++    ;;
++  cygwin* | mingw* | pw32* | cegcc*)
++    shrext=.dll
++    library_names_spec='$libname.dll.a $libname.lib'
++    ;;
++  darwin* | rhapsody*)
++    shrext=.dylib
++    library_names_spec='$libname$shrext'
++    ;;
++  dgux*)
++    library_names_spec='$libname$shrext'
++    ;;
++  freebsd[23].*)
++    library_names_spec='$libname$shrext$versuffix'
++    ;;
++  freebsd* | dragonfly*)
++    library_names_spec='$libname$shrext'
++    ;;
++  gnu*)
++    library_names_spec='$libname$shrext'
++    ;;
++  haiku*)
++    library_names_spec='$libname$shrext'
++    ;;
++  hpux9* | hpux10* | hpux11*)
++    case $host_cpu in
++      ia64*)
++        shrext=.so
++        ;;
++      hppa*64*)
++        shrext=.sl
++        ;;
++      *)
++        shrext=.sl
++        ;;
++    esac
++    library_names_spec='$libname$shrext'
++    ;;
++  interix[3-9]*)
++    library_names_spec='$libname$shrext'
++    ;;
++  irix5* | irix6* | nonstopux*)
++    library_names_spec='$libname$shrext'
++    case "$host_os" in
++      irix5* | nonstopux*)
++        libsuff= shlibsuff=
++        ;;
++      *)
++        case $LD in
++          *-32|*"-32 "|*-melf32bsmip|*"-melf32bsmip ") libsuff= shlibsuff= ;;
++          *-n32|*"-n32 "|*-melf32bmipn32|*"-melf32bmipn32 ") libsuff=32 shlibsuff=N32 ;;
++          *-64|*"-64 "|*-melf64bmip|*"-melf64bmip ") libsuff=64 shlibsuff=64 ;;
++          *) libsuff= shlibsuff= ;;
++        esac
++        ;;
++    esac
++    ;;
++  linux*oldld* | linux*aout* | linux*coff*)
++    ;;
++  linux* | k*bsd*-gnu | kopensolaris*-gnu)
++    library_names_spec='$libname$shrext'
++    ;;
++  knetbsd*-gnu)
++    library_names_spec='$libname$shrext'
++    ;;
++  netbsd*)
++    library_names_spec='$libname$shrext'
++    ;;
++  newsos6)
++    library_names_spec='$libname$shrext'
++    ;;
++  *nto* | *qnx*)
++    library_names_spec='$libname$shrext'
++    ;;
++  openbsd*)
++    library_names_spec='$libname$shrext$versuffix'
++    ;;
++  os2*)
++    libname_spec='$name'
++    shrext=.dll
++    library_names_spec='$libname.a'
++    ;;
++  osf3* | osf4* | osf5*)
++    library_names_spec='$libname$shrext'
++    ;;
++  rdos*)
++    ;;
++  solaris*)
++    library_names_spec='$libname$shrext'
++    ;;
++  sunos4*)
++    library_names_spec='$libname$shrext$versuffix'
++    ;;
++  sysv4 | sysv4.3*)
++    library_names_spec='$libname$shrext'
++    ;;
++  sysv4*MP*)
++    library_names_spec='$libname$shrext'
++    ;;
++  sysv5* | sco3.2v5* | sco5v6* | unixware* | OpenUNIX* | sysv4*uw2*)
++    library_names_spec='$libname$shrext'
++    ;;
++  tpf*)
++    library_names_spec='$libname$shrext'
++    ;;
++  uts4*)
++    library_names_spec='$libname$shrext'
++    ;;
++esac
++
++sed_quote_subst='s/\(["`$\\]\)/\\\1/g'
++escaped_wl=`echo "X$wl" | sed -e 's/^X//' -e "$sed_quote_subst"`
++shlibext=`echo "$shrext" | sed -e 's,^\.,,'`
++escaped_libname_spec=`echo "X$libname_spec" | sed -e 's/^X//' -e "$sed_quote_subst"`
++escaped_library_names_spec=`echo "X$library_names_spec" | sed -e 's/^X//' -e "$sed_quote_subst"`
++escaped_hardcode_libdir_flag_spec=`echo "X$hardcode_libdir_flag_spec" | sed -e 's/^X//' -e "$sed_quote_subst"`
++
++LC_ALL=C sed -e 's/^\([a-zA-Z0-9_]*\)=/acl_cv_\1=/' <<EOF
++
++# How to pass a linker flag through the compiler.
++wl="$escaped_wl"
++
++# Static library suffix (normally "a").
++libext="$libext"
++
++# Shared library suffix (normally "so").
++shlibext="$shlibext"
++
++# Format of library name prefix.
++libname_spec="$escaped_libname_spec"
++
++# Library names that the linker finds when passed -lNAME.
++library_names_spec="$escaped_library_names_spec"
++
++# Flag to hardcode \$libdir into a binary during linking.
++# This must work even if \$libdir does not exist.
++hardcode_libdir_flag_spec="$escaped_hardcode_libdir_flag_spec"
++
++# Whether we need a single -rpath flag with a separated argument.
++hardcode_libdir_separator="$hardcode_libdir_separator"
++
++# Set to yes if using DIR/libNAME.so during linking hardcodes DIR into the
++# resulting binary.
++hardcode_direct="$hardcode_direct"
++
++# Set to yes if using the -LDIR flag during linking hardcodes DIR into the
++# resulting binary.
++hardcode_minus_L="$hardcode_minus_L"
++
++EOF
+-- 
+2.14.1
+
diff --git a/package/gettext-tiny/gettext-tiny.hash b/package/gettext-tiny/gettext-tiny.hash
new file mode 100644
index 0000000000..31fde2a525
--- /dev/null
+++ b/package/gettext-tiny/gettext-tiny.hash
@@ -0,0 +1,14 @@
+# Locally Computed:
+sha256 654dcd52f2650476c8822b60bee89c20a0aa7f6a1bf6001701eeacd71a9e388b  gettext-tiny-v0.3.1.tar.gz
+sha256 64f7e3661c832c19eb9d3ea156cd4410f97cf263d80fd546517c20f584ed15e8  gettextize.in?h=v0.19.8.1
+sha256 ed85e3a2a4ce7157180b40ffab00bd8a24b4891c9ffc3e3bc94cb161d62e744c  Makefile.in.in?h=v0.19.8.1
+sha256 d5a3b72f3d2a12b6740416c201b35c77808a981feae8a7c9b674cd3ee875e000  Makevars.template?h=v0.19.8.1
+sha256 33234736a58f1610c73e1c8c08faf1b2ef1397d878dd7d2cbd888ca0f2da4ffc  boldquot.sed?h=v0.19.8.1
+sha256 3b0b89aa6625c051e69cce1e341f973f62ca94aff62cbb36b4a452ce67eb261c  en at boldquot.header?h=v0.19.8.1
+sha256 90e35325bf9b6b9562bd0882128ea4650b65c9389b35edf9ff534dc3a48e8bed  en at quot.header?h=v0.19.8.1
+sha256 73e650aeccc3ef0a7c2e1bbab934b0882b61f19569e96e4615d069dc50b6becd  insert-header.sin?h=v0.19.8.1
+sha256 d19ab2cc69000c1206f1b8460952857f05d154158da8b89273ac2900a5c80ec0  quot.sed?h=v0.19.8.1
+sha256 9a36cf3e93b6374521c81fa4f302350d3c04b95573f5570717284107689188e6  remove-potcdate.sin?h=v0.19.8.1
+sha256 01b364b311c593a1a80c02fe2dd68cbeff7014515f4d54b3bf62dc74370a1790  Rules-quot?h=v0.19.8.1
+sha256 0f8fdf35a253d2c04c8ca15c454798549aaddef6eff3a1a9447779f107e2aaac  lock.m4?h=v0.19.8.1
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING?h=v0.19.8.1
diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
new file mode 100644
index 0000000000..7726243d71
--- /dev/null
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -0,0 +1,104 @@
+################################################################################
+#
+# gettext-tiny
+#
+################################################################################
+
+GETTEXT_TINY_VERSION = v0.3.1
+GETTEXT_TINY_SITE = $(call github,sabotage-linux,gettext-tiny,$(GETTEXT_TINY_VERSION))
+GETTEXT_TINY_LICENSE = MIT, GPL-3.0+ (extra gettext)
+GETTEXT_TINY_INSTALL_STAGING = YES
+GETTEXT_TINY_LICENSE_FILES = LICENSE, extra/COPYING
+GETTEXT_TINY_OPTS = LIBINTL=NOOP
+
+HOST_GETTEXT_TINY_PROVIDES = host-gettext
+
+# needed for gettextize
+GETTEXT_TINY_ARCHIVE_VERSION = 0.19.8
+
+GETTEXT_TINY_EXTRA_GETTEXT_URI = https://git.savannah.gnu.org/cgit/gettext.git/plain
+GETTEXT_TINY_EXTRA_GETTEXT_VERSION = v$(GETTEXT_GNU_VERSION)
+GETTEXT_TINY_EXTRA_GETTEXT_FILES =  \
+				   gettext-tools/misc/gettextize.in \
+				   gettext-tools/po/Makevars.template \
+				   gettext-runtime/m4/lock.m4 \
+				   gettext-runtime/po/boldquot.sed \
+				   gettext-runtime/po/en at boldquot.header \
+				   gettext-runtime/po/en at quot.header \
+				   gettext-runtime/po/insert-header.sin \
+				   gettext-runtime/po/quot.sed \
+				   gettext-runtime/po/remove-potcdate.sin \
+				   gettext-runtime/po/Rules-quot \
+				   gettext-runtime/po/Makefile.in.in \
+				   COPYING
+HOST_GETTEXT_TINY_EXTRA_DOWNLOADS = \
+			       $(patsubst %,\
+			       $(GETTEXT_TINY_EXTRA_GETTEXT_URI)/%?h=$(GETTEXT_TINY_EXTRA_GETTEXT_VERSION),\
+			       $(GETTEXT_TINY_EXTRA_GETTEXT_FILES))
+
+define HOST_GETTEXT_TINY_COPY_FILE
+	$(Q)mkdir -p $(@D)/extra
+
+	$(foreach f,$(GETTEXT_TINY_EXTRA_GETTEXT_FILES),\
+		cp $(HOST_GETTEXT_TINY_DL_DIR)/$(notdir $(f)?h=$(GETTEXT_TINY_EXTRA_GETTEXT_VERSION)) $(@D)/extra/$(notdir $(f))
+	)
+endef
+HOST_GETTEXT_TINY_POST_EXTRACT_HOOKS += HOST_GETTEXT_TINY_COPY_FILE
+
+ifeq ($(BR2_ENABLE_LOCALE),)
+HOST_GETTEXT_TINY_DEPENDENCIES = libiconv
+endif
+
+define HOST_GETTEXT_TINY_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(HOST_CONFIGURE_OPTS) \
+		$(GETTEXT_TINY_OPTS)
+
+	cp $(@D)/extra/gettextize.in $(@D)/gettextize
+
+        $(SED) 's, at PACKAGE@,gettext-tools,g;' $(@D)/gettextize
+        $(SED) 's, at VERSION@,$(GETTEXT_GNU_VERSION),g;' $(@D)/gettextize
+        $(SED) 's, at ARCHIVE_VERSION@,$(GETTEXT_TINY_ARCHIVE_VERSION),' $(@D)/gettextize
+        $(SED) 's, at prefix@,$(HOST_DIR),g;' $(@D)/gettextize
+        $(SED) 's, at datarootdir@,$${prefix}/share,g;' $(@D)/gettextize
+        $(SED) 's, at datadir@,$${prefix}/share,g;' $(@D)/gettextize
+	$(SED) 's, at PATH_SEPARATOR@,:,g;' $(@D)/gettextize
+        $(SED) 's, at RELOCATABLE@,no,g;' $(@D)/gettextize
+        $(SED) 's, at exec_prefix@,$${prefix},g;' $(@D)/gettextize
+        $(SED) 's, at bindir@,$${exec_prefix}/bin,g;' $(@D)/gettextize
+endef
+
+define HOST_GETTEXT_TINY_INSTALL_CMDS
+	$(Q)mkdir -p $(HOST_DIR)/share/gettext-tiny/po
+	$(Q)mkdir -p $(HOST_DIR)/share/gettext-tiny/m4
+
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(HOST_CONFIGURE_OPTS) \
+		prefix=$(HOST_DIR) install
+
+	$(SED) '/read dummy/d' $(@D)/gettextize
+
+	$(INSTALL) -m 0755 -D $(@D)/gettextize $(HOST_DIR)/bin/gettextize
+	$(INSTALL) -m 0644 -D $(@D)/build-aux/config.rpath $(HOST_DIR)/share/gettext-tiny/config.rpath
+	$(INSTALL) -m 0644 -D $(@D)/extra/lock.m4 $(HOST_DIR)/share/gettext-tiny/m4/lock.m4
+	$(INSTALL) -m 0644 -D $(@D)/extra/Makefile.in.in $(HOST_DIR)/share/gettext-tiny/po/Makefile.in.in
+	$(INSTALL) -m 0644 -D $(@D)/extra/boldquot.sed $(HOST_DIR)/share/gettext-tiny/po/boldquot.sed
+	$(INSTALL) -m 0644 -D $(@D)/extra/en at boldquot.header $(HOST_DIR)/share/gettext-tiny/po/en at boldquot.header
+	$(INSTALL) -m 0644 -D $(@D)/extra/en at quot.header $(HOST_DIR)/share/gettext-tiny/po/en@quot.header
+	$(INSTALL) -m 0644 -D $(@D)/extra/insert-header.sin $(HOST_DIR)/share/gettext-tiny/po/insert-header.sin
+	$(INSTALL) -m 0644 -D $(@D)/extra/quot.sed $(HOST_DIR)/share/gettext-tiny/po/quot.sed
+	$(INSTALL) -m 0644 -D $(@D)/extra/remove-potcdate.sin $(HOST_DIR)/share/gettext-tiny/po/remove-potcdate.sin
+	$(INSTALL) -m 0644 -D $(@D)/extra/Rules-quot $(HOST_DIR)/share/gettext-tiny/po/Rules-quot
+	$(INSTALL) -m 0644 -D $(@D)/extra/Makevars.template $(HOST_DIR)/share/gettext-tiny/po/Makevars.template
+
+	$(Q)touch $(HOST_DIR)/share/gettext-tiny/ABOUT-NLS
+endef
+
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
+GETTEXTIZE = $(HOST_CONFIGURE_OPTS) \
+	     AUTOM4TE=$(HOST_DIR)/bin/autom4te \
+	     gettext_datadir=$(HOST_DIR)/usr/share/gettext-tiny \
+	     $(HOST_DIR)/bin/gettextize -f
+endif
+
+$(eval $(host-generic-package))
diff --git a/package/gettext/Config.in b/package/gettext/Config.in
index 9546468571..158864e299 100644
--- a/package/gettext/Config.in
+++ b/package/gettext/Config.in
@@ -1,13 +1,13 @@
-menuconfig BR2_PACKAGE_GETTEXT
+config BR2_PACKAGE_GETTEXT
 	bool "gettext"
 	select BR2_PACKAGE_HAS_GETTEXT
+	depends on BR2_SYSTEM_ENABLE_NLS
 
 if BR2_PACKAGE_GETTEXT
 
 config BR2_PACKAGE_GETTEXT_GNU
 	bool "gettext-gnu"
 	default y
-	depends on BR2_USE_WCHAR
 	help
 	  The GNU `gettext' utilities are a set of tools that provide a
 	  framework to help other GNU packages produce multi-lingual
@@ -19,9 +19,6 @@ config BR2_PACKAGE_GETTEXT_GNU
 
 	  http://www.gnu.org/software/gettext/
 
-comment "gettext-gnu needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
-
 config BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL
 	bool
 	default y if BR2_SYSTEM_ENABLE_NLS
@@ -29,13 +26,17 @@ config BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL
 
 config BR2_PACKAGE_PROVIDES_GETTEXT
 	string
-	default "gettext-gnu" if BR2_PACKAGE_GETTEXT_GNU
+	default "gettext-gnu"
 
 config BR2_PACKAGE_HAS_GETTEXT
 	bool
 
+endif
+
+comment "gettext requires NLS enabled"
+	depends on !BR2_SYSTEM_ENABLE_NLS
+
 config BR2_PACKAGE_PROVIDES_HOST_GETTEXT
 	string
-	default "host-gettext-gnu"
-
-endif
+	default "host-gettext-gnu" if BR2_SYSTEM_ENABLE_NLS
+	default "host-gettext-tiny" if !BR2_SYSTEM_ENABLE_NLS
-- 
2.14.1
