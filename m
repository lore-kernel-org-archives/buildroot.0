From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 07 Jun 2021 15:17:39 -0000
Subject: [Buildroot] [git commit] package/poke: new package
Message-ID: <20210607144653.7251682B86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef02a1193931083c622a33182ae2a2741b31b4c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport a patch to disable tcl/tk dependencies when gui support
is disabled.

Backport and rebase a patch to avoid host poisoning while
cross-compiling.

Add another local patch when HELP2MAN is missing.

Disable uClibc-ng toolchain for now due to issues with
bundled gnulib.

The license of gnulib is not easy to describe because
it bundle several sources files with different license [1][2].
Even if not SPDX compliant, use "gnulib license".

[1] https://git.savannah.gnu.org/cgit/gnulib.git/tree/COPYING
[2] https://src.fedoraproject.org/rpms/gnulib/blob/rawhide/f/gnulib.spec#_53

See:
http://www.jemarch.net/poke-1.0-relnotes.html
http://www.jemarch.net/poke-1.1-relnotes.html
http://www.jemarch.net/poke-1.2-relnotes.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Jose E. Marchesi <jemarch@gnu.org>
Cc: Luca Saiu <positron@gnu.org>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
[yann.morin.1998 at free.fr:
  - propagate BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS dependency to comment
  - select busybos-show-others
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                                  |  1 +
 ...t-check-for-Tcl-Tk-if-disable-gui-is-spec.patch | 43 ++++++++++++++
 ...-change-cppflags-to-omit-I-prefix-on-cros.patch | 67 ++++++++++++++++++++++
 ...c-HELP2MAN-replace-by-true-when-cross-com.patch | 34 +++++++++++
 package/poke/Config.in                             | 30 ++++++++++
 package/poke/poke.hash                             |  4 ++
 package/poke/poke.mk                               | 25 ++++++++
 7 files changed, 204 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 45d75c71d0..e4a6dc292d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -126,6 +126,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/pcm-tools/Config.in"
 	source "package/piglit/Config.in"
 	source "package/ply/Config.in"
+	source "package/poke/Config.in"
 	source "package/ptm2human/Config.in"
 	source "package/pv/Config.in"
 	source "package/racehound/Config.in"
diff --git a/package/poke/0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch b/package/poke/0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch
new file mode 100644
index 0000000000..3bd041a0e7
--- /dev/null
+++ b/package/poke/0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch
@@ -0,0 +1,43 @@
+From cef3fc90f02ef4fc49515745194bac3d81a2265b Mon Sep 17 00:00:00 2001
+From: "Jose E. Marchesi" <jose.marchesi@oracle.com>
+Date: Fri, 30 Apr 2021 13:17:05 +0200
+Subject: [PATCH] build: do not check for Tcl/Tk if --disable-gui is specified
+
+2021-04-30  Jose E. Marchesi  <jemarch@gnu.org>
+
+	* configure.ac: Do not check for tcl/tk if --disable-gui is
+	specified at configure time.
+
+(cherry picked from commit 280a5e154287e43c0a40d9530a9cc658a7367a9c)
+[Romain: remove Changelog entry]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ configure.ac | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c7205513..c2f0760a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -214,12 +214,15 @@ fi
+ dnl The GUI is optional, and depends on the availability of Tcl and
+ dnl Tk.
+ 
+-POKE_TCLTK
+-
+ AC_ARG_ENABLE([gui],
+               AS_HELP_STRING([--enable-gui],
+                              [Enable the GUI (default is YES)]),
+-              [gui_enabled=$enableval], [gui_enabled=$has_tcltk])
++              [gui_enabled=$enableval], [gui_enabled=yes])
++
++if test "x$gui_enabled" = "xyes"; then
++ POKE_TCLTK
++ gui_enabled=$has_tcltk
++fi
+ 
+ AM_CONDITIONAL([GUI], [test "x$gui_enabled" = "xyes"])
+ 
+-- 
+2.30.2
+
diff --git a/package/poke/0002-tentatively-change-cppflags-to-omit-I-prefix-on-cros.patch b/package/poke/0002-tentatively-change-cppflags-to-omit-I-prefix-on-cros.patch
new file mode 100644
index 0000000000..8fae85eb20
--- /dev/null
+++ b/package/poke/0002-tentatively-change-cppflags-to-omit-I-prefix-on-cros.patch
@@ -0,0 +1,67 @@
+From ac9d057895f1e61f63cbecafcc3e3820fdb10f84 Mon Sep 17 00:00:00 2001
+From: Luca Saiu <positron@gnu.org>
+Date: Fri, 30 Apr 2021 22:42:57 +0200
+Subject: [PATCH] tentatively change --cppflags to omit -I prefix on
+ cross-compilation
+
+The autoconf macros defined from jitter --cppflags get automatically changed, of
+course.
+
+* configure.ac (JITTER_CROSS_COMPILING): New substitution.
+
+* bin/jitter-config.in.m4sh (main loop) <--cppflags>: Introduce conditional on
+the new substitution.
+
+Suggested by Romain Naour, after his difficulties with building GNU poke with
+buildroot.
+
+(cherry picked from commit 428406c7b8d4c20f3472d41ed57c12c1a88ad37e)
+[Romain:
+  patch jitter-config.in instead of jitter-config.in.m4sh since
+  there is an issue while converting the M4sh m4sh script ( .in.m4sh )
+  into a portable shell script ( .in ) ready to be processed by aclocal
+  for @-substitutions.]
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ jitter/bin/jitter-config.in | 10 +++++++---
+ jitter/configure.ac         |  1 +
+ 2 files changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/jitter/bin/jitter-config.in b/jitter/bin/jitter-config.in
+index 5e124f0..4bc508d 100644
+--- a/jitter/bin/jitter-config.in
++++ b/jitter/bin/jitter-config.in
+@@ -999,10 +999,14 @@ while test "$#" != "0"; do
+         --cppflags)
+             no_option_argument
+             append_to_output cppflags
+-            # Append a -I argument.  This is defined separately from the rest,
+-            # as the installation prefix can be decided very late, at Jitter
++            # Unless cross-compiling, append a -I argument referring the
++            # installation path.  This is defined separately from the rest, as
++            # the installation prefix can be decided very late, at Jitter
+             # installation time.
+-            output="$output -I $includedir";;
++            # (When cross-compiling this would be difficult to do correctly.)
++            if test "x at JITTER_CROSS_COMPILING@" != 'xyes'; then
++              output="$output -I $includedir"
++            fi;;
+         --ldadd)
+             no_option_argument
+             append_to_output ldadd;;
+diff --git a/jitter/configure.ac b/jitter/configure.ac
+index 21d6937..fb12349 100644
+--- a/jitter/configure.ac
++++ b/jitter/configure.ac
+@@ -308,6 +308,7 @@ else
+    AC_MSG_RESULT([yes, cross-compiling from $build to $host .])
+    jitter_cross_compiling=yes
+ fi
++AC_SUBST([JITTER_CROSS_COMPILING], [$jitter_cross_compiling])
+ 
+ # I never test on weird systems not supporting shebangs.
+ AC_SYS_INTERPRETER
+-- 
+2.31.1
+
diff --git a/package/poke/0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch b/package/poke/0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
new file mode 100644
index 0000000000..f217c917f1
--- /dev/null
+++ b/package/poke/0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
@@ -0,0 +1,34 @@
+From 8ba76a5a7ce311f67890199c5595bc1f626495ad Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 30 Apr 2021 15:43:59 +0200
+Subject: [PATCH] configure.ac: HELP2MAN replace ':' by 'true' when
+ cross-compiling
+
+Avoid:
+/usr/bin/make  ./../poke/poke
+../run \
+  : -p poke --name="The GNU extensible binary editor" \
+      ./../poke/poke -o ./poke.1
+../run: line 51: exec: :: not found
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c2f0760a..93769ef9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -74,7 +74,7 @@ gl_LIBTEXTSTYLE_OPTIONAL([0.20.5])
+ if test $cross_compiling = no; then
+   AM_MISSING_PROG(HELP2MAN, help2man)
+ else
+-  HELP2MAN=:
++  HELP2MAN=true
+ fi
+ 
+ dnl recfix is part of the GNU recutils suite, and is used in cfg.mk to
+-- 
+2.30.2
+
diff --git a/package/poke/Config.in b/package/poke/Config.in
new file mode 100644
index 0000000000..eb2e33d5af
--- /dev/null
+++ b/package/poke/Config.in
@@ -0,0 +1,30 @@
+config BR2_PACKAGE_POKE
+	bool "poke"
+	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS # bdwgc
+	depends on BR2_USE_WCHAR # needs wctomb
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # gnulib
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # less
+	select BR2_PACKAGE_BDWGC
+	select BR2_PACKAGE_LESS # runtime
+	select BR2_PACKAGE_READLINE
+	help
+	  GNU poke is a new interactive editor for binary data. Not
+	  limited to editing basic entities such as bits and bytes,
+	  it provides a full-fledged procedural, interactive
+	  programming language designed to describe data structures
+	  and to operate on them. Once a user has defined a structure
+	  for binary data (usually matching some file format) she can
+	  search, inspect, create, shuffle and modify abstract entities
+	  such as ELF relocations, MP3 tags, DWARF expressions,
+	  partition table entries, and so on, with primitives
+	  resembling simple editing of bits and bytes. The program
+	  comes with a library of already written descriptions (or
+	  "pickles" in poke parlance) for many binary formats.
+
+	  https://www.gnu.org/software/poke/
+
+comment "poke needs a glibc or musl toolchain w/ NPTL, wchar"
+	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) \
+		||!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
diff --git a/package/poke/poke.hash b/package/poke/poke.hash
new file mode 100644
index 0000000000..b3a79d90dc
--- /dev/null
+++ b/package/poke/poke.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  f61cf8da5b64c01a1359373725aad1ca257f35c1c9269e4d50dd0664183ddf62  poke-1.2.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  jitter/COPYING
diff --git a/package/poke/poke.mk b/package/poke/poke.mk
new file mode 100644
index 0000000000..c0217b6fad
--- /dev/null
+++ b/package/poke/poke.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# poke
+#
+################################################################################
+
+POKE_VERSION = 1.2
+POKE_SITE = $(BR2_GNU_MIRROR)/poke
+# gnulib license is a mix/mess of public-domain and various GPL and LGPL versions.
+POKE_LICENSE = GPL-3.0+, GPL-3.0+ (jitter), gnulib license (gnulib)
+POKE_LICENSE_FILES = COPYING jitter/COPYING
+
+# 0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch
+# 0003-configure.ac-HELP2MAN-replace-by-false-when-cross-co.patch
+POKE_AUTORECONF = YES
+
+POKE_DEPENDENCIES = host-flex host-bison host-pkgconf bdwgc readline
+
+POKE_CONF_OPTS = \
+	--disable-gui \
+	--disable-libnbd \
+	--disable-mi \
+	--with-libreadline-prefix=$(STAGING_DIR)
+
+$(eval $(autotools-package))
