From: Romain Naour <romain.naour@openwide.fr>
Date: Mon,  6 Apr 2015 18:57:30 +0200
Subject: [Buildroot] [PATCH 4/4] package/thrift: add dependency on
	host-autoconf-archive
In-Reply-To: <1428339450-2158-1-git-send-email-romain.naour@openwide.fr>
References: <1428339450-2158-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1428339450-2158-4-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ax_cxx_compile_stdcxx_11 macro bundled in thrift package is
brocken and out of date.
Remove it and use the one provided by autoconf-archive package.

Related to:
[thrift]
http://autobuild.buildroot.net/results/21e/21e3fff1e0d714f94ac7e621289d1a59bc02a05f/build-end.log
[host-thrift]
http://autobuild.buildroot.net/results/b89/b89ffc2bff699eb10bb6abd92369a43d4900354d/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
Now thrift will fail with non C++11 capable toolchains:
checking whether /home/naourr/git/buildroot/test/thrift/host/usr/bin/powerpc-linux-gnu-g++ supports C++11 features by default... no
checking whether /home/naourr/git/buildroot/test/thrift/host/usr/bin/powerpc-linux-gnu-g++ supports C++11 features with -std=c++11... no
checking whether /home/naourr/git/buildroot/test/thrift/host/usr/bin/powerpc-linux-gnu-g++ supports C++11 features with -std=c++0x... no
---
 .../0005-aclocal-remove-c-11-check-macro.patch     | 158 +++++++++++++++++++++
 package/thrift/thrift.mk                           |   4 +-
 2 files changed, 160 insertions(+), 2 deletions(-)
 create mode 100644 package/thrift/0005-aclocal-remove-c-11-check-macro.patch

diff --git a/package/thrift/0005-aclocal-remove-c-11-check-macro.patch b/package/thrift/0005-aclocal-remove-c-11-check-macro.patch
new file mode 100644
index 0000000..19c0c86
--- /dev/null
+++ b/package/thrift/0005-aclocal-remove-c-11-check-macro.patch
@@ -0,0 +1,158 @@
+From bffbd147b123782fe0112f3672ba621d755eb706 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Mon, 6 Apr 2015 18:35:12 +0200
+Subject: [PATCH] aclocal: remove c++11 check macro
+
+The ax_cxx_compile_stdcxx_11 macro is brocken and out of date.
+
+Remove it and use the one provided by autoconf-archive package.
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ aclocal/ax_cxx_compile_stdcxx_11.m4 | 134 ------------------------------------
+ 1 file changed, 134 deletions(-)
+ delete mode 100644 aclocal/ax_cxx_compile_stdcxx_11.m4
+
+diff --git a/aclocal/ax_cxx_compile_stdcxx_11.m4 b/aclocal/ax_cxx_compile_stdcxx_11.m4
+deleted file mode 100644
+index a4c9189..0000000
+--- a/aclocal/ax_cxx_compile_stdcxx_11.m4
++++ /dev/null
+@@ -1,134 +0,0 @@
+-# ============================================================================
+-#  http://www.gnu.org/software/autoconf-archive/ax_cxx_compile_stdcxx_11.html
+-# ============================================================================
+-#
+-# SYNOPSIS
+-#
+-#   AX_CXX_COMPILE_STDCXX_11([ext|noext],[mandatory|optional])
+-#
+-# DESCRIPTION
+-#
+-#   Check for baseline language coverage in the compiler for the C++11
+-#   standard; if necessary, add switches to CXXFLAGS to enable support.
+-#
+-#   The first argument, if specified, indicates whether you insist on an
+-#   extended mode (e.g. -std=gnu++11) or a strict conformance mode (e.g.
+-#   -std=c++11).  If neither is specified, you get whatever works, with
+-#   preference for an extended mode.
+-#
+-#   The second argument, if specified 'mandatory' or if left unspecified,
+-#   indicates that baseline C++11 support is required and that the macro
+-#   should error out if no mode with that support is found.  If specified
+-#   'optional', then configuration proceeds regardless, after defining
+-#   HAVE_CXX11 if and only if a supporting mode is found.
+-#
+-# LICENSE
+-#
+-#   Copyright (c) 2008 Benjamin Kosnik <bkoz@redhat.com>
+-#   Copyright (c) 2012 Zack Weinberg <zackw@panix.com>
+-#   Copyright (c) 2013 Roy Stogner <roystgnr@ices.utexas.edu>
+-#
+-#   Copying and distribution of this file, with or without modification, are
+-#   permitted in any medium without royalty provided the copyright notice
+-#   and this notice are preserved. This file is offered as-is, without any
+-#   warranty.
+-
+-#serial 3
+-
+-m4_define([_AX_CXX_COMPILE_STDCXX_11_testbody], [
+-  template <typename T>
+-    struct check
+-    {
+-      static_assert(sizeof(int) <= sizeof(T), "not big enough");
+-    };
+-
+-    typedef check<check<bool>> right_angle_brackets;
+-
+-    int a;
+-    decltype(a) b;
+-
+-    typedef check<int> check_type;
+-    check_type c;
+-    check_type&& cr = static_cast<check_type&&>(c);
+-
+-    auto d = a;
+-])
+-
+-AC_DEFUN([AX_CXX_COMPILE_STDCXX_11], [dnl
+-  m4_if([$1], [], [],
+-        [$1], [ext], [],
+-        [$1], [noext], [],
+-        [m4_fatal([invalid argument `$1' to AX_CXX_COMPILE_STDCXX_11])])dnl
+-  m4_if([$2], [], [ax_cxx_compile_cxx11_required=true],
+-        [$2], [mandatory], [ax_cxx_compile_cxx11_required=true],
+-        [$2], [optional], [ax_cxx_compile_cxx11_required=false],
+-        [m4_fatal([invalid second argument `$2' to AX_CXX_COMPILE_STDCXX_11])])dnl
+-  AC_LANG_PUSH([C++])dnl
+-  ac_success=no
+-  AC_CACHE_CHECK(whether $CXX supports C++11 features by default,
+-  ax_cv_cxx_compile_cxx11,
+-  [AC_COMPILE_IFELSE([AC_LANG_SOURCE([_AX_CXX_COMPILE_STDCXX_11_testbody])],
+-    [ax_cv_cxx_compile_cxx11=yes],
+-    [ax_cv_cxx_compile_cxx11=no])])
+-  if test x$ax_cv_cxx_compile_cxx11 = xyes; then
+-    ac_success=yes
+-  fi
+-
+-  m4_if([$1], [noext], [], [dnl
+-  if test x$ac_success = xno; then
+-    for switch in -std=gnu++11; do
+-      cachevar=AS_TR_SH([ax_cv_cxx_compile_cxx11_$switch])
+-      AC_CACHE_CHECK(whether $CXX supports C++11 features with $switch,
+-                     $cachevar,
+-        [ac_save_CXXFLAGS="$CXXFLAGS"
+-         CXXFLAGS="$CXXFLAGS $switch"
+-         AC_COMPILE_IFELSE([AC_LANG_SOURCE([_AX_CXX_COMPILE_STDCXX_11_testbody])],
+-          [eval $cachevar=yes],
+-          [eval $cachevar=no])
+-         CXXFLAGS="$ac_save_CXXFLAGS"])
+-      if eval test x\$$cachevar = xyes; then
+-        CXXFLAGS="$CXXFLAGS $switch"
+-        ac_success=yes
+-        break
+-      fi
+-    done
+-  fi])
+-
+-  m4_if([$1], [ext], [], [dnl
+-  if test x$ac_success = xno; then
+-    for switch in -std=c++11; do
+-      cachevar=AS_TR_SH([ax_cv_cxx_compile_cxx11_$switch])
+-      AC_CACHE_CHECK(whether $CXX supports C++11 features with $switch,
+-                     $cachevar,
+-        [ac_save_CXXFLAGS="$CXXFLAGS"
+-         CXXFLAGS="$CXXFLAGS $switch"
+-         AC_COMPILE_IFELSE([AC_LANG_SOURCE([_AX_CXX_COMPILE_STDCXX_11_testbody])],
+-          [eval $cachevar=yes],
+-          [eval $cachevar=no])
+-         CXXFLAGS="$ac_save_CXXFLAGS"])
+-      if eval test x\$$cachevar = xyes; then
+-        CXXFLAGS="$CXXFLAGS $switch"
+-        ac_success=yes
+-        break
+-      fi
+-    done
+-  fi])
+-  AC_LANG_POP([C++])
+-  if test x$ax_cxx_compile_cxx11_required = xtrue; then
+-    if test x$ac_success = xno; then
+-      AC_MSG_ERROR([*** A compiler with support for C++11 language features is required.])
+-    fi
+-  else
+-    if test x$ac_success = xno; then
+-      HAVE_CXX11=0
+-      AC_MSG_NOTICE([No compiler with C++11 support was found])
+-    else
+-      HAVE_CXX11=1
+-      AC_DEFINE(HAVE_CXX11,1,
+-                [define if the compiler supports basic C++11 syntax])
+-    fi
+-
+-    AC_SUBST(HAVE_CXX11)
+-  fi
+-])
+-
+-- 
+1.9.3
+
diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index 409b04d..5d4c515 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -8,8 +8,8 @@ THRIFT_VERSION = 0.9.2
 THRIFT_SITE = http://www.us.apache.org/dist/thrift/$(THRIFT_VERSION)
 THRIFT_DEPENDENCIES = host-pkgconf host-thrift boost libevent openssl zlib
 THRIFT_INSTALL_STAGING = YES
-HOST_THRIFT_DEPENDENCIES = host-bison host-boost host-flex host-libevent \
-	host-openssl host-pkgconf host-zlib
+HOST_THRIFT_DEPENDENCIES = host-autoconf-archive host-bison host-boost \
+	host-flex host-libevent host-openssl host-pkgconf host-zlib
 
 THRIFT_CONF_OPTS = --with-sysroot=$(STAGING_DIR) \
 	--with-boost \
-- 
1.9.3
