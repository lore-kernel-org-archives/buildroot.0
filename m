From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 30 Oct 2015 16:05:35 +0000
Subject: [Buildroot] [PATCH] sudo: fix -fstack-protector detection
Message-ID: <1446221135-10180-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport a patch series from upstream to fix the configure check for
-fstack-protector.

Fixes:
  http://autobuild.buildroot.net/results/bdd3e5352aa283b96717202a794f9762d15cc736/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...etter-configure-test-for-fstack-protector.patch |  415 ++++++++++++++++++++
 ...LDFLAGS-when-checking-for-stack-protector.patch |   81 ++++
 ...program-when-checking-for-stack-protector.patch |  189 +++++++++
 3 files changed, 685 insertions(+), 0 deletions(-)
 create mode 100644 package/sudo/0002-Better-configure-test-for-fstack-protector.patch
 create mode 100644 package/sudo/0003-Preserve-LDFLAGS-when-checking-for-stack-protector.patch
 create mode 100644 package/sudo/0004-Actually-link-the-test-program-when-checking-for-stack-protector.patch

diff --git a/package/sudo/0002-Better-configure-test-for-fstack-protector.patch b/package/sudo/0002-Better-configure-test-for-fstack-protector.patch
new file mode 100644
index 0000000..b9ec410
--- /dev/null
+++ b/package/sudo/0002-Better-configure-test-for-fstack-protector.patch
@@ -0,0 +1,415 @@
+Better configure test for -fstack-protector. Some gcc installations may
+be missing the ssp library even though the compiler supports it.
+
+Backported from upstream:
+  http://www.sudo.ws/repos/sudo/rev/4ade5d1249f4
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+# HG changeset patch
+# User Todd C. Miller <Todd.Miller@courtesan.com>
+# Date 1446137469 21600
+# Node ID 4ade5d1249f483c4dd6c579c70b327791094afe8
+# Parent  97ee37d905ceefa433e93a0f552c2a3e5926e2fb
+Better configure test for -fstack-protector.  Some gcc installations
+may be missing the ssp library even though the compiler supports it.
+
+diff -r 97ee37d905ce -r 4ade5d1249f4 configure
+--- a/configure	Sun Oct 25 14:28:38 2015 -0600
++++ b/configure	Thu Oct 29 10:51:09 2015 -0600
+@@ -23916,236 +23916,94 @@
+ fi
+ 
+ if test "$enable_hardening" != "no"; then
+-    if test -n "$GCC"; then
+-	{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether C compiler accepts -fstack-protector-strong" >&5
+-$as_echo_n "checking whether C compiler accepts -fstack-protector-strong... " >&6; }
+-if ${ax_cv_check_cflags___fstack_protector_strong+:} false; then :
+-  $as_echo_n "(cached) " >&6
+-else
+-
+-  ax_check_save_flags=$CFLAGS
+-  CFLAGS="$CFLAGS  -fstack-protector-strong"
+-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+-/* end confdefs.h.  */
+-
+-int
+-main ()
+-{
+-
+-  ;
+-  return 0;
+-}
+-_ACEOF
+-if ac_fn_c_try_compile "$LINENO"; then :
+-  ax_cv_check_cflags___fstack_protector_strong=yes
+-else
+-  ax_cv_check_cflags___fstack_protector_strong=no
+-fi
+-rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+-  CFLAGS=$ax_check_save_flags
+-fi
+-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ax_cv_check_cflags___fstack_protector_strong" >&5
+-$as_echo "$ax_cv_check_cflags___fstack_protector_strong" >&6; }
+-if test x"$ax_cv_check_cflags___fstack_protector_strong" = xyes; then :
+-
+-	    { $as_echo "$as_me:${as_lineno-$LINENO}: checking whether the linker accepts -fstack-protector-strong" >&5
+-$as_echo_n "checking whether the linker accepts -fstack-protector-strong... " >&6; }
+-if ${ax_cv_check_ldflags___fstack_protector_strong+:} false; then :
+-  $as_echo_n "(cached) " >&6
+-else
+-
+-  ax_check_save_flags=$LDFLAGS
+-  LDFLAGS="$LDFLAGS  -fstack-protector-strong"
+-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+-/* end confdefs.h.  */
+-
+-int
+-main ()
+-{
+-
+-  ;
+-  return 0;
+-}
+-_ACEOF
+-if ac_fn_c_try_link "$LINENO"; then :
+-  ax_cv_check_ldflags___fstack_protector_strong=yes
+-else
+-  ax_cv_check_ldflags___fstack_protector_strong=no
+-fi
+-rm -f core conftest.err conftest.$ac_objext \
+-    conftest$ac_exeext conftest.$ac_ext
+-  LDFLAGS=$ax_check_save_flags
+-fi
+-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ax_cv_check_ldflags___fstack_protector_strong" >&5
+-$as_echo "$ax_cv_check_ldflags___fstack_protector_strong" >&6; }
+-if test x"$ax_cv_check_ldflags___fstack_protector_strong" = xyes; then :
+-
+-		SSP_CFLAGS="-fstack-protector-strong"
+-		SSP_LDFLAGS="-Wc,-fstack-protector-strong"
+-
+-else
+-  :
+-fi
+-
+-
+-else
+-  :
+-fi
+-
+-	if test -z "$SSP_CFLAGS"; then
+-	    { $as_echo "$as_me:${as_lineno-$LINENO}: checking whether C compiler accepts -fstack-protector-all" >&5
+-$as_echo_n "checking whether C compiler accepts -fstack-protector-all... " >&6; }
+-if ${ax_cv_check_cflags___fstack_protector_all+:} false; then :
+-  $as_echo_n "(cached) " >&6
+-else
+-
+-  ax_check_save_flags=$CFLAGS
+-  CFLAGS="$CFLAGS  -fstack-protector-all"
+-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+-/* end confdefs.h.  */
+-
+-int
+-main ()
+-{
+-
+-  ;
+-  return 0;
+-}
+-_ACEOF
+-if ac_fn_c_try_compile "$LINENO"; then :
+-  ax_cv_check_cflags___fstack_protector_all=yes
+-else
+-  ax_cv_check_cflags___fstack_protector_all=no
+-fi
+-rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+-  CFLAGS=$ax_check_save_flags
+-fi
+-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ax_cv_check_cflags___fstack_protector_all" >&5
+-$as_echo "$ax_cv_check_cflags___fstack_protector_all" >&6; }
+-if test x"$ax_cv_check_cflags___fstack_protector_all" = xyes; then :
+-
+-		{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether the linker accepts -fstack-protector-all" >&5
+-$as_echo_n "checking whether the linker accepts -fstack-protector-all... " >&6; }
+-if ${ax_cv_check_ldflags___fstack_protector_all+:} false; then :
+-  $as_echo_n "(cached) " >&6
+-else
+-
+-  ax_check_save_flags=$LDFLAGS
+-  LDFLAGS="$LDFLAGS  -fstack-protector-all"
+-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+-/* end confdefs.h.  */
+-
+-int
+-main ()
+-{
+-
+-  ;
+-  return 0;
+-}
+-_ACEOF
+-if ac_fn_c_try_link "$LINENO"; then :
+-  ax_cv_check_ldflags___fstack_protector_all=yes
+-else
+-  ax_cv_check_ldflags___fstack_protector_all=no
+-fi
+-rm -f core conftest.err conftest.$ac_objext \
+-    conftest$ac_exeext conftest.$ac_ext
+-  LDFLAGS=$ax_check_save_flags
+-fi
+-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ax_cv_check_ldflags___fstack_protector_all" >&5
+-$as_echo "$ax_cv_check_ldflags___fstack_protector_all" >&6; }
+-if test x"$ax_cv_check_ldflags___fstack_protector_all" = xyes; then :
+-
+-		    SSP_CFLAGS="-fstack-protector-all"
+-		    SSP_LDFLAGS="-Wc,-fstack-protector-all"
+-
+-else
+-  :
+-fi
+-
+-
+-else
+-  :
+-fi
+-
+-	    if test -z "$SSP_CFLAGS"; then
+-		{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether C compiler accepts -fstack-protector" >&5
+-$as_echo_n "checking whether C compiler accepts -fstack-protector... " >&6; }
+-if ${ax_cv_check_cflags___fstack_protector+:} false; then :
+-  $as_echo_n "(cached) " >&6
+-else
+-
+-  ax_check_save_flags=$CFLAGS
+-  CFLAGS="$CFLAGS  -fstack-protector"
+-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+-/* end confdefs.h.  */
+-
+-int
+-main ()
+-{
+-
+-  ;
+-  return 0;
+-}
+-_ACEOF
+-if ac_fn_c_try_compile "$LINENO"; then :
+-  ax_cv_check_cflags___fstack_protector=yes
+-else
+-  ax_cv_check_cflags___fstack_protector=no
+-fi
+-rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+-  CFLAGS=$ax_check_save_flags
+-fi
+-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ax_cv_check_cflags___fstack_protector" >&5
+-$as_echo "$ax_cv_check_cflags___fstack_protector" >&6; }
+-if test x"$ax_cv_check_cflags___fstack_protector" = xyes; then :
+-
+-		    { $as_echo "$as_me:${as_lineno-$LINENO}: checking whether the linker accepts -fstack-protector" >&5
+-$as_echo_n "checking whether the linker accepts -fstack-protector... " >&6; }
+-if ${ax_cv_check_ldflags___fstack_protector+:} false; then :
+-  $as_echo_n "(cached) " >&6
+-else
+-
+-  ax_check_save_flags=$LDFLAGS
+-  LDFLAGS="$LDFLAGS  -fstack-protector"
+-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+-/* end confdefs.h.  */
+-
+-int
+-main ()
+-{
+-
+-  ;
+-  return 0;
+-}
+-_ACEOF
+-if ac_fn_c_try_link "$LINENO"; then :
+-  ax_cv_check_ldflags___fstack_protector=yes
+-else
+-  ax_cv_check_ldflags___fstack_protector=no
+-fi
+-rm -f core conftest.err conftest.$ac_objext \
+-    conftest$ac_exeext conftest.$ac_ext
+-  LDFLAGS=$ax_check_save_flags
+-fi
+-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ax_cv_check_ldflags___fstack_protector" >&5
+-$as_echo "$ax_cv_check_ldflags___fstack_protector" >&6; }
+-if test x"$ax_cv_check_ldflags___fstack_protector" = xyes; then :
+-
+-			SSP_CFLAGS="-fstack-protector"
+-			SSP_LDFLAGS="-Wc,-fstack-protector"
+-
+-else
+-  :
+-fi
+-
+-
+-else
+-  :
+-fi
+-
+-	    fi
+-	fi
++    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for compiler stack protector support" >&5
++$as_echo_n "checking for compiler stack protector support... " >&6; }
++if ${sudo_cv_var_stack_protector+:} false; then :
++  $as_echo_n "(cached) " >&6
++else
++
++	    sudo_cv_var_stack_protector=no
++	    _CFLAGS="$CFLAGS"
++	    _LDFLAGS="$LDFLAGS"
++	    CFLAGS="-fstack-protector-strong"
++	    LDFLAGS="-fstack-protector-strong"
++	    cat confdefs.h - <<_ACEOF >conftest.$ac_ext
++/* end confdefs.h.  */
++
++		$ac_includes_default
++int
++main ()
++{
++char buf[1024]; buf[1023] = '\0';
++  ;
++  return 0;
++}
++
++_ACEOF
++if ac_fn_c_try_compile "$LINENO"; then :
++
++		sudo_cv_var_stack_protector="-fstack-protector-strong"
++
++else
++
++		CFLAGS="-fstack-protector-all"
++		LDFLAGS="-fstack-protector-all"
++		cat confdefs.h - <<_ACEOF >conftest.$ac_ext
++/* end confdefs.h.  */
++
++		    $ac_includes_default
++int
++main ()
++{
++char buf[1024]; buf[1023] = '\0';
++  ;
++  return 0;
++}
++
++_ACEOF
++if ac_fn_c_try_compile "$LINENO"; then :
++
++		    sudo_cv_var_stack_protector="-fstack-protector-all"
++
++else
++
++		    CFLAGS="-fstack-protector"
++		    LDFLAGS="-fstack-protector"
++		    cat confdefs.h - <<_ACEOF >conftest.$ac_ext
++/* end confdefs.h.  */
++
++			$ac_includes_default
++int
++main ()
++{
++char buf[1024]; buf[1023] = '\0';
++  ;
++  return 0;
++}
++
++_ACEOF
++if ac_fn_c_try_compile "$LINENO"; then :
++
++			sudo_cv_var_stack_protector="-fstack-protector"
++
++fi
++rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
++
++fi
++rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
++
++fi
++rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
++	    CFLAGS="$_CFLAGS"
++	    LDFLAGS="$_LDFLAGS"
++
++
++fi
++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $sudo_cv_var_stack_protector" >&5
++$as_echo "$sudo_cv_var_stack_protector" >&6; }
++    if test X"$sudo_cv_var_stack_protector" != X"no"; then
++	SSP_CFLAGS="$sudo_cv_var_stack_protector"
++	SSP_LDFLAGS="-Wc,$sudo_cv_var_stack_protector"
+     fi
+     { $as_echo "$as_me:${as_lineno-$LINENO}: checking whether the linker accepts -Wl,-z,relro" >&5
+ $as_echo_n "checking whether the linker accepts -Wl,-z,relro... " >&6; }
+diff -r 97ee37d905ce -r 4ade5d1249f4 configure.ac
+--- a/configure.ac	Sun Oct 25 14:28:38 2015 -0600
++++ b/configure.ac	Thu Oct 29 10:51:09 2015 -0600
+@@ -3978,29 +3978,45 @@
+ dnl This test relies on AC_LANG_WERROR
+ dnl
+ if test "$enable_hardening" != "no"; then
+-    if test -n "$GCC"; then
+-	AX_CHECK_COMPILE_FLAG([-fstack-protector-strong], [
+-	    AX_CHECK_LINK_FLAG([-fstack-protector-strong], [
+-		SSP_CFLAGS="-fstack-protector-strong"
+-		SSP_LDFLAGS="-Wc,-fstack-protector-strong"
+-	    ])
+-	])
+-	if test -z "$SSP_CFLAGS"; then
+-	    AX_CHECK_COMPILE_FLAG([-fstack-protector-all], [
+-		AX_CHECK_LINK_FLAG([-fstack-protector-all], [
+-		    SSP_CFLAGS="-fstack-protector-all"
+-		    SSP_LDFLAGS="-Wc,-fstack-protector-all"
++    AC_CACHE_CHECK([for compiler stack protector support],
++	[sudo_cv_var_stack_protector],
++	[
++	    sudo_cv_var_stack_protector=no
++	    _CFLAGS="$CFLAGS"
++	    _LDFLAGS="$LDFLAGS"
++	    CFLAGS="-fstack-protector-strong"
++	    LDFLAGS="-fstack-protector-strong"
++	    AC_COMPILE_IFELSE([
++		AC_LANG_PROGRAM([AC_INCLUDES_DEFAULT],
++		[[char buf[1024]; buf[1023] = '\0';]])
++	    ], [
++		sudo_cv_var_stack_protector="-fstack-protector-strong"
++	    ], [
++		CFLAGS="-fstack-protector-all"
++		LDFLAGS="-fstack-protector-all"
++		AC_COMPILE_IFELSE([
++		    AC_LANG_PROGRAM([AC_INCLUDES_DEFAULT],
++		    [[char buf[1024]; buf[1023] = '\0';]])
++		], [
++		    sudo_cv_var_stack_protector="-fstack-protector-all"
++		], [
++		    CFLAGS="-fstack-protector"
++		    LDFLAGS="-fstack-protector"
++		    AC_COMPILE_IFELSE([
++			AC_LANG_PROGRAM([AC_INCLUDES_DEFAULT],
++			[[char buf[1024]; buf[1023] = '\0';]])
++		    ], [
++			sudo_cv_var_stack_protector="-fstack-protector"
++		    ], [])
+ 		])
+ 	    ])
+-	    if test -z "$SSP_CFLAGS"; then
+-		AX_CHECK_COMPILE_FLAG([-fstack-protector], [
+-		    AX_CHECK_LINK_FLAG([-fstack-protector], [
+-			SSP_CFLAGS="-fstack-protector"
+-			SSP_LDFLAGS="-Wc,-fstack-protector"
+-		    ])
+-		])
+-	    fi
+-	fi
++	    CFLAGS="$_CFLAGS"
++	    LDFLAGS="$_LDFLAGS"
++	]
++    )
++    if test X"$sudo_cv_var_stack_protector" != X"no"; then
++	SSP_CFLAGS="$sudo_cv_var_stack_protector"
++	SSP_LDFLAGS="-Wc,$sudo_cv_var_stack_protector"
+     fi
+     AX_CHECK_LINK_FLAG([-Wl,-z,relro], [LDFLAGS="${LDFLAGS} -Wl,-z,relro"])
+ fi
+
diff --git a/package/sudo/0003-Preserve-LDFLAGS-when-checking-for-stack-protector.patch b/package/sudo/0003-Preserve-LDFLAGS-when-checking-for-stack-protector.patch
new file mode 100644
index 0000000..6ba3bb3
--- /dev/null
+++ b/package/sudo/0003-Preserve-LDFLAGS-when-checking-for-stack-protector.patch
@@ -0,0 +1,81 @@
+Preserve LDFLAGS when checking for stack protector as they may include
+rpath settings to allow the stack protector lib to be found. Avoidusing
+existing CFLAGS since we don't want the compiler to optimize away the
+stack variable.
+
+Backported from upstream:
+  http://www.sudo.ws/repos/sudo/rev/e6bc59225c06
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+# HG changeset patch
+# User Todd C. Miller <Todd.Miller@courtesan.com>
+# Date 1446149181 21600
+# Node ID e6bc59225c06c5d45580197519a73e3feea14cbd
+# Parent  4ade5d1249f483c4dd6c579c70b327791094afe8
+Preserve LDFLAGS when checking for stack protector as they may include
+rpath settings to allow the stack protector lib to be found.  Avoid
+using existing CFLAGS since we don't want the compiler to optimize
+away the stack variable.
+
+diff -r 4ade5d1249f4 -r e6bc59225c06 configure
+--- a/configure	Thu Oct 29 10:51:09 2015 -0600
++++ b/configure	Thu Oct 29 14:06:21 2015 -0600
+@@ -23926,7 +23926,7 @@
+ 	    _CFLAGS="$CFLAGS"
+ 	    _LDFLAGS="$LDFLAGS"
+ 	    CFLAGS="-fstack-protector-strong"
+-	    LDFLAGS="-fstack-protector-strong"
++	    LDFLAGS="$_LDFLAGS -fstack-protector-strong"
+ 	    cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+ 
+@@ -23947,7 +23947,7 @@
+ else
+ 
+ 		CFLAGS="-fstack-protector-all"
+-		LDFLAGS="-fstack-protector-all"
++		LDFLAGS="$_LDFLAGS -fstack-protector-all"
+ 		cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+ 
+@@ -23968,7 +23968,7 @@
+ else
+ 
+ 		    CFLAGS="-fstack-protector"
+-		    LDFLAGS="-fstack-protector"
++		    LDFLAGS="$_LDFLAGS -fstack-protector"
+ 		    cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+ 
+diff -r 4ade5d1249f4 -r e6bc59225c06 configure.ac
+--- a/configure.ac	Thu Oct 29 10:51:09 2015 -0600
++++ b/configure.ac	Thu Oct 29 14:06:21 2015 -0600
+@@ -3985,7 +3985,7 @@
+ 	    _CFLAGS="$CFLAGS"
+ 	    _LDFLAGS="$LDFLAGS"
+ 	    CFLAGS="-fstack-protector-strong"
+-	    LDFLAGS="-fstack-protector-strong"
++	    LDFLAGS="$_LDFLAGS -fstack-protector-strong"
+ 	    AC_COMPILE_IFELSE([
+ 		AC_LANG_PROGRAM([AC_INCLUDES_DEFAULT],
+ 		[[char buf[1024]; buf[1023] = '\0';]])
+@@ -3993,7 +3993,7 @@
+ 		sudo_cv_var_stack_protector="-fstack-protector-strong"
+ 	    ], [
+ 		CFLAGS="-fstack-protector-all"
+-		LDFLAGS="-fstack-protector-all"
++		LDFLAGS="$_LDFLAGS -fstack-protector-all"
+ 		AC_COMPILE_IFELSE([
+ 		    AC_LANG_PROGRAM([AC_INCLUDES_DEFAULT],
+ 		    [[char buf[1024]; buf[1023] = '\0';]])
+@@ -4001,7 +4001,7 @@
+ 		    sudo_cv_var_stack_protector="-fstack-protector-all"
+ 		], [
+ 		    CFLAGS="-fstack-protector"
+-		    LDFLAGS="-fstack-protector"
++		    LDFLAGS="$_LDFLAGS -fstack-protector"
+ 		    AC_COMPILE_IFELSE([
+ 			AC_LANG_PROGRAM([AC_INCLUDES_DEFAULT],
+ 			[[char buf[1024]; buf[1023] = '\0';]])
+
diff --git a/package/sudo/0004-Actually-link-the-test-program-when-checking-for-stack-protector.patch b/package/sudo/0004-Actually-link-the-test-program-when-checking-for-stack-protector.patch
new file mode 100644
index 0000000..87dc29b
--- /dev/null
+++ b/package/sudo/0004-Actually-link-the-test-program-when-checking-for-stack-protector.patch
@@ -0,0 +1,189 @@
+When checking for stack protector support we need to actually link the
+test program.
+
+Backported from upstream:
+  http://www.sudo.ws/repos/sudo/rev/ab4f94aac7de
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+# HG changeset patch
+# User Todd C. Miller <Todd.Miller@courtesan.com>
+# Date 1446216562 21600
+# Node ID ab4f94aac7de73efa1b201890354c74126baf7ca
+# Parent  e6bc59225c06c5d45580197519a73e3feea14cbd
+When checking for stack protector support we need to actually link
+the test program.
+
+diff -r e6bc59225c06 -r ab4f94aac7de configure
+--- a/configure	Thu Oct 29 14:06:21 2015 -0600
++++ b/configure	Fri Oct 30 08:49:22 2015 -0600
+@@ -23922,11 +23922,17 @@
+   $as_echo_n "(cached) " >&6
+ else
+ 
+-	    sudo_cv_var_stack_protector=no
++	    # Avoid using CFLAGS since the compiler might optimize away our
++	    # test.  We don't want LIBS to interfere with the test but keep
++	    # LDFLAGS as it may have an rpath needed to find the ssp lib.
+ 	    _CFLAGS="$CFLAGS"
+ 	    _LDFLAGS="$LDFLAGS"
+-	    CFLAGS="-fstack-protector-strong"
+-	    LDFLAGS="$_LDFLAGS -fstack-protector-strong"
++	    _LIBS="$LIBS"
++	    LIBS=
++
++	    sudo_cv_var_stack_protector="-fstack-protector-strong"
++	    CFLAGS="$sudo_cv_var_stack_protector"
++	    LDFLAGS="$_LDFLAGS $sudo_cv_var_stack_protector"
+ 	    cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+ 
+@@ -23940,14 +23946,13 @@
+ }
+ 
+ _ACEOF
+-if ac_fn_c_try_compile "$LINENO"; then :
+-
+-		sudo_cv_var_stack_protector="-fstack-protector-strong"
+-
+-else
+-
+-		CFLAGS="-fstack-protector-all"
+-		LDFLAGS="$_LDFLAGS -fstack-protector-all"
++if ac_fn_c_try_link "$LINENO"; then :
++
++else
++
++		sudo_cv_var_stack_protector="-fstack-protector-all"
++		CFLAGS="$sudo_cv_var_stack_protector"
++		LDFLAGS="$_LDFLAGS $sudo_cv_var_stack_protector"
+ 		cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+ 
+@@ -23961,14 +23966,13 @@
+ }
+ 
+ _ACEOF
+-if ac_fn_c_try_compile "$LINENO"; then :
+-
+-		    sudo_cv_var_stack_protector="-fstack-protector-all"
+-
+-else
+-
+-		    CFLAGS="-fstack-protector"
+-		    LDFLAGS="$_LDFLAGS -fstack-protector"
++if ac_fn_c_try_link "$LINENO"; then :
++
++else
++
++		    sudo_cv_var_stack_protector="-fstack-protector"
++		    CFLAGS="$sudo_cv_var_stack_protector"
++		    LDFLAGS="$_LDFLAGS $sudo_cv_var_stack_protector"
+ 		    cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+ 
+@@ -23982,20 +23986,26 @@
+ }
+ 
+ _ACEOF
+-if ac_fn_c_try_compile "$LINENO"; then :
+-
+-			sudo_cv_var_stack_protector="-fstack-protector"
+-
+-fi
+-rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+-
+-fi
+-rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+-
+-fi
+-rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
++if ac_fn_c_try_link "$LINENO"; then :
++
++else
++
++			sudo_cv_var_stack_protector=no
++
++fi
++rm -f core conftest.err conftest.$ac_objext \
++    conftest$ac_exeext conftest.$ac_ext
++
++fi
++rm -f core conftest.err conftest.$ac_objext \
++    conftest$ac_exeext conftest.$ac_ext
++
++fi
++rm -f core conftest.err conftest.$ac_objext \
++    conftest$ac_exeext conftest.$ac_ext
+ 	    CFLAGS="$_CFLAGS"
+ 	    LDFLAGS="$_LDFLAGS"
++	    LIBS="$_LIBS"
+ 
+ 
+ fi
+diff -r e6bc59225c06 -r ab4f94aac7de configure.ac
+--- a/configure.ac	Thu Oct 29 14:06:21 2015 -0600
++++ b/configure.ac	Fri Oct 30 08:49:22 2015 -0600
+@@ -3981,37 +3981,42 @@
+     AC_CACHE_CHECK([for compiler stack protector support],
+ 	[sudo_cv_var_stack_protector],
+ 	[
+-	    sudo_cv_var_stack_protector=no
++	    # Avoid using CFLAGS since the compiler might optimize away our
++	    # test.  We don't want LIBS to interfere with the test but keep
++	    # LDFLAGS as it may have an rpath needed to find the ssp lib.
+ 	    _CFLAGS="$CFLAGS"
+ 	    _LDFLAGS="$LDFLAGS"
+-	    CFLAGS="-fstack-protector-strong"
+-	    LDFLAGS="$_LDFLAGS -fstack-protector-strong"
+-	    AC_COMPILE_IFELSE([
++	    _LIBS="$LIBS"
++	    LIBS=
++
++	    sudo_cv_var_stack_protector="-fstack-protector-strong"
++	    CFLAGS="$sudo_cv_var_stack_protector"
++	    LDFLAGS="$_LDFLAGS $sudo_cv_var_stack_protector"
++	    AC_LINK_IFELSE([
+ 		AC_LANG_PROGRAM([AC_INCLUDES_DEFAULT],
+ 		[[char buf[1024]; buf[1023] = '\0';]])
+-	    ], [
+-		sudo_cv_var_stack_protector="-fstack-protector-strong"
+-	    ], [
+-		CFLAGS="-fstack-protector-all"
+-		LDFLAGS="$_LDFLAGS -fstack-protector-all"
+-		AC_COMPILE_IFELSE([
++	    ], [], [
++		sudo_cv_var_stack_protector="-fstack-protector-all"
++		CFLAGS="$sudo_cv_var_stack_protector"
++		LDFLAGS="$_LDFLAGS $sudo_cv_var_stack_protector"
++		AC_LINK_IFELSE([
+ 		    AC_LANG_PROGRAM([AC_INCLUDES_DEFAULT],
+ 		    [[char buf[1024]; buf[1023] = '\0';]])
+-		], [
+-		    sudo_cv_var_stack_protector="-fstack-protector-all"
+-		], [
+-		    CFLAGS="-fstack-protector"
+-		    LDFLAGS="$_LDFLAGS -fstack-protector"
+-		    AC_COMPILE_IFELSE([
++		], [], [
++		    sudo_cv_var_stack_protector="-fstack-protector"
++		    CFLAGS="$sudo_cv_var_stack_protector"
++		    LDFLAGS="$_LDFLAGS $sudo_cv_var_stack_protector"
++		    AC_LINK_IFELSE([
+ 			AC_LANG_PROGRAM([AC_INCLUDES_DEFAULT],
+ 			[[char buf[1024]; buf[1023] = '\0';]])
+-		    ], [
+-			sudo_cv_var_stack_protector="-fstack-protector"
+-		    ], [])
++		    ], [], [
++			sudo_cv_var_stack_protector=no
++		    ])
+ 		])
+ 	    ])
+ 	    CFLAGS="$_CFLAGS"
+ 	    LDFLAGS="$_LDFLAGS"
++	    LIBS="$_LIBS"
+ 	]
+     )
+     if test X"$sudo_cv_var_stack_protector" != X"no"; then
+
-- 
1.7.1
