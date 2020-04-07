From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Apr 2020 08:11:15 +0200
Subject: [Buildroot] [git commit] package/polkit: properly autoreconf
Message-ID: <20200407061707.88D9A8D42E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8edcb8473001032e3ea6f162784b2f24db88decc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

0001-make-netgroup-support-optional.patch patches configure.ac, but we
don't autoreconf the package, which is not good.

However, simply adding AUTORECONF = YES is not sufficient: polkit
Makefile.am use the automake conditional HAVE_INTROSPECTION, which is
"available" only when the gobject-introspection m4 file is installed.

Since we don't want to make gobject-introspection a mandatory
dependency of polkit, we take a simpler route: add a copy of
introspection.m4 into the polkit source tree. This is only a 142 lines
file, and it can be dropped when
0001-make-netgroup-support-optional.patch is merged upstream.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-make-netgroup-support-optional.patch      | 211 +++++++++++++++++++--
 package/polkit/polkit.mk                           |   2 +-
 2 files changed, 192 insertions(+), 21 deletions(-)

diff --git a/package/polkit/0001-make-netgroup-support-optional.patch b/package/polkit/0001-make-netgroup-support-optional.patch
index f96738c910..86916aba34 100644
--- a/package/polkit/0001-make-netgroup-support-optional.patch
+++ b/package/polkit/0001-make-netgroup-support-optional.patch
@@ -1,4 +1,4 @@
-From 21aa2747e8f0048759aab184b07dd6389666d5e6 Mon Sep 17 00:00:00 2001
+From 1b854ef4bb15032091a33fed587e5ba6f3e582eb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 22 May 2019 13:18:55 -0700
 Subject: [PATCH] make netgroup support optional
@@ -17,20 +17,174 @@ Fixes bug 50145.
 Signed-off-by: A. Wilcox <AWilcox@Wilcox-Tech.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[Thomas: add introspection.m4.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 ---
- configure.ac                                     |  2 +-
- src/polkit/polkitidentity.c                      | 16 ++++++++++++++++
- src/polkit/polkitunixnetgroup.c                  |  3 +++
- .../polkitbackendinteractiveauthority.c          | 14 ++++++++------
- src/polkitbackend/polkitbackendjsauthority.cpp   |  2 ++
- test/polkit/polkitidentitytest.c                 |  9 ++++++++-
- test/polkit/polkitunixnetgrouptest.c             |  3 +++
- .../test-polkitbackendjsauthority.c              |  2 ++
- 8 files changed, 43 insertions(+), 8 deletions(-)
+ buildutil/introspection.m4                    | 142 ++++++++++++++++++
+ configure.ac                                  |   2 +-
+ src/polkit/polkitidentity.c                   |  16 ++
+ src/polkit/polkitunixnetgroup.c               |   3 +
+ .../polkitbackendinteractiveauthority.c       |  14 +-
+ .../polkitbackendjsauthority.cpp              |   2 +
+ test/polkit/polkitidentitytest.c              |   9 +-
+ test/polkit/polkitunixnetgrouptest.c          |   3 +
+ .../test-polkitbackendjsauthority.c           |   2 +
+ 9 files changed, 185 insertions(+), 8 deletions(-)
+ create mode 100644 buildutil/introspection.m4
 
+diff --git a/buildutil/introspection.m4 b/buildutil/introspection.m4
+new file mode 100644
+index 0000000..b0ccd68
+--- /dev/null
++++ b/buildutil/introspection.m4
+@@ -0,0 +1,142 @@
++dnl -*- mode: autoconf -*-
++dnl Copyright 2009 Johan Dahlin
++dnl
++dnl This file is free software; the author(s) gives unlimited
++dnl permission to copy and/or distribute it, with or without
++dnl modifications, as long as this notice is preserved.
++dnl
++
++# serial 1
++
++dnl This is a copy of AS_AC_EXPAND
++dnl
++dnl (C) 2003, 2004, 2005 Thomas Vander Stichele <thomas@apestaart dot org>
++dnl Copying and distribution of this file, with or without modification,
++dnl are permitted in any medium without royalty provided the copyright
++dnl notice and this notice are preserved.
++m4_define([_GOBJECT_INTROSPECTION_AS_AC_EXPAND],
++[
++  EXP_VAR=[$1]
++  FROM_VAR=[$2]
++
++  dnl first expand prefix and exec_prefix if necessary
++  prefix_save=$prefix
++  exec_prefix_save=$exec_prefix
++
++  dnl if no prefix given, then use /usr/local, the default prefix
++  if test "x$prefix" = "xNONE"; then
++    prefix="$ac_default_prefix"
++  fi
++  dnl if no exec_prefix given, then use prefix
++  if test "x$exec_prefix" = "xNONE"; then
++    exec_prefix=$prefix
++  fi
++
++  full_var="$FROM_VAR"
++  dnl loop until it doesn't change anymore
++  while true; do
++    new_full_var="`eval echo $full_var`"
++    if test "x$new_full_var" = "x$full_var"; then break; fi
++    full_var=$new_full_var
++  done
++
++  dnl clean up
++  full_var=$new_full_var
++  AC_SUBST([$1], "$full_var")
++
++  dnl restore prefix and exec_prefix
++  prefix=$prefix_save
++  exec_prefix=$exec_prefix_save
++])
++
++m4_define([_GOBJECT_INTROSPECTION_CHECK_INTERNAL],
++[
++    AC_BEFORE([AC_PROG_LIBTOOL],[$0])dnl setup libtool first
++    AC_BEFORE([AM_PROG_LIBTOOL],[$0])dnl setup libtool first
++    AC_BEFORE([LT_INIT],[$0])dnl setup libtool first
++
++    dnl enable/disable introspection
++    m4_if([$2], [require],
++    [dnl
++        enable_introspection=yes
++    ],[dnl
++        AC_ARG_ENABLE(introspection,
++                  AS_HELP_STRING([--enable-introspection[=@<:@no/auto/yes@:>@]],
++                                 [Enable introspection for this build]),, 
++                                 [enable_introspection=auto])
++    ])dnl
++
++    AC_MSG_CHECKING([for gobject-introspection])
++
++    dnl presence/version checking
++    AS_CASE([$enable_introspection],
++    [no], [dnl
++        found_introspection="no (disabled, use --enable-introspection to enable)"
++    ],dnl
++    [yes],[dnl
++        PKG_CHECK_EXISTS([gobject-introspection-1.0],,
++                         AC_MSG_ERROR([gobject-introspection-1.0 is not installed]))
++        PKG_CHECK_EXISTS([gobject-introspection-1.0 >= $1],
++                         found_introspection=yes,
++                         AC_MSG_ERROR([You need to have gobject-introspection >= $1 installed to build AC_PACKAGE_NAME]))
++    ],dnl
++    [auto],[dnl
++        PKG_CHECK_EXISTS([gobject-introspection-1.0 >= $1], found_introspection=yes, found_introspection=no)
++	dnl Canonicalize enable_introspection
++	enable_introspection=$found_introspection
++    ],dnl
++    [dnl	
++        AC_MSG_ERROR([invalid argument passed to --enable-introspection, should be one of @<:@no/auto/yes@:>@])
++    ])dnl
++
++    AC_MSG_RESULT([$found_introspection])
++
++    dnl expand datadir/libdir so we can pass them to pkg-config
++    dnl and get paths relative to our target directories
++    _GOBJECT_INTROSPECTION_AS_AC_EXPAND(_GI_EXP_DATADIR, "$datadir")
++    _GOBJECT_INTROSPECTION_AS_AC_EXPAND(_GI_EXP_LIBDIR, "$libdir")
++
++    INTROSPECTION_SCANNER=
++    INTROSPECTION_COMPILER=
++    INTROSPECTION_GENERATE=
++    INTROSPECTION_GIRDIR=
++    INTROSPECTION_TYPELIBDIR=
++    if test "x$found_introspection" = "xyes"; then
++       INTROSPECTION_SCANNER=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
++       INTROSPECTION_COMPILER=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
++       INTROSPECTION_GENERATE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0`
++       INTROSPECTION_GIRDIR=`$PKG_CONFIG --define-variable=datadir="${_GI_EXP_DATADIR}" --variable=girdir gobject-introspection-1.0`
++       INTROSPECTION_TYPELIBDIR="$($PKG_CONFIG --define-variable=libdir="${_GI_EXP_LIBDIR}" --variable=typelibdir gobject-introspection-1.0)"
++       INTROSPECTION_CFLAGS=`$PKG_CONFIG --cflags gobject-introspection-1.0`
++       INTROSPECTION_LIBS=`$PKG_CONFIG --libs gobject-introspection-1.0`
++       INTROSPECTION_MAKEFILE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=datadir gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
++    fi
++    AC_SUBST(INTROSPECTION_SCANNER)
++    AC_SUBST(INTROSPECTION_COMPILER)
++    AC_SUBST(INTROSPECTION_GENERATE)
++    AC_SUBST(INTROSPECTION_GIRDIR)
++    AC_SUBST(INTROSPECTION_TYPELIBDIR)
++    AC_SUBST(INTROSPECTION_CFLAGS)
++    AC_SUBST(INTROSPECTION_LIBS)
++    AC_SUBST(INTROSPECTION_MAKEFILE)
++
++    AM_CONDITIONAL(HAVE_INTROSPECTION, test "x$found_introspection" = "xyes")
++])
++
++
++dnl Usage:
++dnl   GOBJECT_INTROSPECTION_CHECK([minimum-g-i-version])
++
++AC_DEFUN([GOBJECT_INTROSPECTION_CHECK],
++[
++  _GOBJECT_INTROSPECTION_CHECK_INTERNAL([$1])
++])
++
++dnl Usage:
++dnl   GOBJECT_INTROSPECTION_REQUIRE([minimum-g-i-version])
++
++
++AC_DEFUN([GOBJECT_INTROSPECTION_REQUIRE],
++[
++  _GOBJECT_INTROSPECTION_CHECK_INTERNAL([$1], [require])
++])
+diff --git a/configure.ac b/configure.ac
+index 5cedb4e..87aa0ad 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -99,7 +99,7 @@ AC_CHECK_LIB(expat,XML_ParserCreate,[EXP
+@@ -99,7 +99,7 @@ AC_CHECK_LIB(expat,XML_ParserCreate,[EXPAT_LIBS="-lexpat"],
  	     [AC_MSG_ERROR([Can't find expat library. Please install expat.])])
  AC_SUBST(EXPAT_LIBS)
  
@@ -39,9 +193,11 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
  
  if test "x$GCC" = "xyes"; then
    LDFLAGS="-Wl,--as-needed $LDFLAGS"
+diff --git a/src/polkit/polkitidentity.c b/src/polkit/polkitidentity.c
+index 3aa1f7f..10e9c17 100644
 --- a/src/polkit/polkitidentity.c
 +++ b/src/polkit/polkitidentity.c
-@@ -182,7 +182,15 @@ polkit_identity_from_string  (const gcha
+@@ -182,7 +182,15 @@ polkit_identity_from_string  (const gchar   *str,
      }
    else if (g_str_has_prefix (str, "unix-netgroup:"))
      {
@@ -57,7 +213,7 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
      }
  
    if (identity == NULL && (error != NULL && *error == NULL))
-@@ -344,6 +352,13 @@ polkit_identity_new_for_gvariant (GVaria
+@@ -344,6 +352,13 @@ polkit_identity_new_for_gvariant (GVariant  *variant,
        GVariant *v;
        const char *name;
  
@@ -71,7 +227,7 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
        v = lookup_asv (details_gvariant, "name", G_VARIANT_TYPE_STRING, error);
        if (v == NULL)
          {
-@@ -353,6 +368,7 @@ polkit_identity_new_for_gvariant (GVaria
+@@ -353,6 +368,7 @@ polkit_identity_new_for_gvariant (GVariant  *variant,
        name = g_variant_get_string (v, NULL);
        ret = polkit_unix_netgroup_new (name);
        g_variant_unref (v);
@@ -79,9 +235,11 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
      }
    else
      {
+diff --git a/src/polkit/polkitunixnetgroup.c b/src/polkit/polkitunixnetgroup.c
+index 8a2b369..83f8d4a 100644
 --- a/src/polkit/polkitunixnetgroup.c
 +++ b/src/polkit/polkitunixnetgroup.c
-@@ -194,6 +194,9 @@ polkit_unix_netgroup_set_name (PolkitUni
+@@ -194,6 +194,9 @@ polkit_unix_netgroup_set_name (PolkitUnixNetgroup *group,
  PolkitIdentity *
  polkit_unix_netgroup_new (const gchar *name)
  {
@@ -91,9 +249,11 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
    g_return_val_if_fail (name != NULL, NULL);
    return POLKIT_IDENTITY (g_object_new (POLKIT_TYPE_UNIX_NETGROUP,
                                         "name", name,
+diff --git a/src/polkitbackend/polkitbackendinteractiveauthority.c b/src/polkitbackend/polkitbackendinteractiveauthority.c
+index 056d9a8..36c2f3d 100644
 --- a/src/polkitbackend/polkitbackendinteractiveauthority.c
 +++ b/src/polkitbackend/polkitbackendinteractiveauthority.c
-@@ -2233,25 +2233,26 @@ get_users_in_net_group (PolkitIdentity
+@@ -2233,25 +2233,26 @@ get_users_in_net_group (PolkitIdentity                    *group,
    GList *ret;
  
    ret = NULL;
@@ -126,7 +286,7 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
        PolkitIdentity *user;
        GError *error = NULL;
  
-@@ -2282,6 +2283,7 @@ get_users_in_net_group (PolkitIdentity
+@@ -2282,6 +2283,7 @@ get_users_in_net_group (PolkitIdentity                    *group,
  
   out:
    endnetgrent ();
@@ -134,9 +294,11 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
    return ret;
  }
  
+diff --git a/src/polkitbackend/polkitbackendjsauthority.cpp b/src/polkitbackend/polkitbackendjsauthority.cpp
+index 9b752d1..09b2878 100644
 --- a/src/polkitbackend/polkitbackendjsauthority.cpp
 +++ b/src/polkitbackend/polkitbackendjsauthority.cpp
-@@ -1502,6 +1502,7 @@ js_polkit_user_is_in_netgroup (JSContext
+@@ -1502,6 +1502,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
  
    JS::CallArgs args = JS::CallArgsFromVp (argc, vp);
  
@@ -144,7 +306,7 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
    JS::RootedString usrstr (authority->priv->cx);
    usrstr = args[0].toString();
    user = JS_EncodeStringToUTF8 (cx, usrstr);
-@@ -1519,6 +1520,7 @@ js_polkit_user_is_in_netgroup (JSContext
+@@ -1519,6 +1520,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
  
    JS_free (cx, netgroup);
    JS_free (cx, user);
@@ -152,6 +314,8 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
  
    ret = true;
  
+diff --git a/test/polkit/polkitidentitytest.c b/test/polkit/polkitidentitytest.c
+index e91967b..e829aaa 100644
 --- a/test/polkit/polkitidentitytest.c
 +++ b/test/polkit/polkitidentitytest.c
 @@ -19,6 +19,7 @@
@@ -162,7 +326,7 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
  #include "glib.h"
  #include <polkit/polkit.h>
  #include <polkit/polkitprivate.h>
-@@ -145,11 +146,15 @@ struct ComparisonTestData comparison_tes
+@@ -145,11 +146,15 @@ struct ComparisonTestData comparison_test_data [] = {
    {"unix-group:root", "unix-group:jane", FALSE},
    {"unix-group:jane", "unix-group:jane", TRUE},
  
@@ -193,6 +357,8 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
  
    add_comparison_tests ();
  
+diff --git a/test/polkit/polkitunixnetgrouptest.c b/test/polkit/polkitunixnetgrouptest.c
+index 3701ba1..e3352eb 100644
 --- a/test/polkit/polkitunixnetgrouptest.c
 +++ b/test/polkit/polkitunixnetgrouptest.c
 @@ -19,6 +19,7 @@
@@ -213,6 +379,8 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
 +#endif
    return g_test_run ();
  }
+diff --git a/test/polkitbackend/test-polkitbackendjsauthority.c b/test/polkitbackend/test-polkitbackendjsauthority.c
+index 71aad23..fdd28f3 100644
 --- a/test/polkitbackend/test-polkitbackendjsauthority.c
 +++ b/test/polkitbackend/test-polkitbackendjsauthority.c
 @@ -137,12 +137,14 @@ test_get_admin_identities (void)
@@ -230,3 +398,6 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
    };
    guint n;
  
+-- 
+2.25.1
+
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 4e7cda943c..8572d8b9ba 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -8,7 +8,7 @@ POLKIT_VERSION = 0.116
 POLKIT_SITE = http://www.freedesktop.org/software/polkit/releases
 POLKIT_LICENSE = GPL-2.0
 POLKIT_LICENSE_FILES = COPYING
-
+POLKIT_AUTORECONF = YES
 POLKIT_INSTALL_STAGING = YES
 
 POLKIT_DEPENDENCIES = \
