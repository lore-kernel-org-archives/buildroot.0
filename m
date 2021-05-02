From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  2 May 2021 23:49:17 +0200
Subject: [Buildroot] [PATCH 3/5] package/poke: new package
In-Reply-To: <20210502214919.1826571-1-romain.naour@gmail.com>
References: <20210502214919.1826571-1-romain.naour@gmail.com>
Message-ID: <20210502214919.1826571-4-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport a patch to disable tcl/tk dependencies when gui support
is disabled.

Add a local patch to workaround a path poisoning issue. Issue
reported upstream.

Add another local patch when HELP2MAN is missing.

Disable uClibc-ng toolchain for now due to issues with
bundled gnulib.

See:
http://www.jemarch.net/poke-1.0-relnotes.html
http://www.jemarch.net/poke-1.1-relnotes.html
http://www.jemarch.net/poke-1.2-relnotes.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Jose E. Marchesi <jemarch@gnu.org>
Cc: Luca Saiu <positron@gnu.org>
---
Build tested with test-pkg and Runtime tested on gitlab:
https://gitlab.com/kubu93/buildroot/-/jobs/1229817663
---
 package/Config.in                             |  1 +
 ...ck-for-Tcl-Tk-if-disable-gui-is-spec.patch | 43 ++++++++++++++++++
 ...nfig.in-avoit-host-poisoning-while-c.patch | 45 +++++++++++++++++++
 ...P2MAN-replace-by-true-when-cross-com.patch | 34 ++++++++++++++
 package/poke/Config.in                        | 31 +++++++++++++
 package/poke/poke.hash                        |  3 ++
 package/poke/poke.mk                          | 23 ++++++++++
 7 files changed, 180 insertions(+)
 create mode 100644 package/poke/0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch
 create mode 100644 package/poke/0002-jitter-jitter-config.in-avoit-host-poisoning-while-c.patch
 create mode 100644 package/poke/0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
 create mode 100644 package/poke/Config.in
 create mode 100644 package/poke/poke.hash
 create mode 100644 package/poke/poke.mk

diff --git a/package/Config.in b/package/Config.in
index 6181aaac2c..922ae99e13 100644
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
diff --git a/package/poke/0002-jitter-jitter-config.in-avoit-host-poisoning-while-c.patch b/package/poke/0002-jitter-jitter-config.in-avoit-host-poisoning-while-c.patch
new file mode 100644
index 0000000000..fa55f817ff
--- /dev/null
+++ b/package/poke/0002-jitter-jitter-config.in-avoit-host-poisoning-while-c.patch
@@ -0,0 +1,45 @@
+From c37419e459bd5863534719fa50755174d0912e6d Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 30 Apr 2021 14:32:21 +0200
+Subject: [PATCH] jitter: jitter-config.in: avoit host poisoning while
+ cross-compiling
+
+When jitter is bundled into another project (poke), jitter-config --cppflags
+return an unsafe path "-I /usr/include".
+
+In the context of Buildroot, such configuration script woulf be "fixed"
+after installation. But jitter-config is not installed by poke since it's
+build as static library and liked to poke.
+
+For now, patch jitter-config.in instead of jitter-config.in.m4sh since
+there is an issue while converting the M4sh m4sh script ( .in.m4sh )
+into a portable shell script ( .in ) ready to be processed by aclocal
+for @-substitutions.
+
+[1] https://git.buildroot.net/buildroot/tree/package/pkg-generic.mk?h=2021.02.1#n291
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ jitter/bin/jitter-config.in | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/jitter/bin/jitter-config.in b/jitter/bin/jitter-config.in
+index 5e124f0..af0ac9d 100644
+--- a/jitter/bin/jitter-config.in
++++ b/jitter/bin/jitter-config.in
+@@ -998,11 +998,7 @@ while test "$#" != "0"; do
+             append_to_output cflags;;
+         --cppflags)
+             no_option_argument
+-            append_to_output cppflags
+-            # Append a -I argument.  This is defined separately from the rest,
+-            # as the installation prefix can be decided very late, at Jitter
+-            # installation time.
+-            output="$output -I $includedir";;
++            append_to_output cppflags;;
+         --ldadd)
+             no_option_argument
+             append_to_output ldadd;;
+-- 
+2.30.2
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
index 0000000000..5d391bfb43
--- /dev/null
+++ b/package/poke/Config.in
@@ -0,0 +1,31 @@
+config BR2_PACKAGE_POKE
+	bool "poke"
+	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS # bdwgc
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # less
+	depends on BR2_USE_WCHAR # needs wctomb
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # gnulib
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
+comment "poke needs a toolchain w/ NPTL, wchar"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
+
+comment "poke needs glibc or musl"
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/poke/poke.hash b/package/poke/poke.hash
new file mode 100644
index 0000000000..f8d23e635a
--- /dev/null
+++ b/package/poke/poke.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  f61cf8da5b64c01a1359373725aad1ca257f35c1c9269e4d50dd0664183ddf62  poke-1.2.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/poke/poke.mk b/package/poke/poke.mk
new file mode 100644
index 0000000000..ecf2221acd
--- /dev/null
+++ b/package/poke/poke.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# poke
+#
+################################################################################
+
+POKE_VERSION = 1.2
+POKE_SITE = $(BR2_GNU_MIRROR)/poke
+POKE_LICENSE = GPL-3.0+
+POKE_LICENSE_FILES = COPYING
+
+# 0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch
+# 0003-configure.ac-HELP2MAN-replace-by-false-when-cross-co.patch
+POKE_AUTORECONF = YES
+
+POKE_DEPENDENCIES = host-flex host-bison host-pkgconf bdwgc readline
+
+POKE_CONF_OPTS = --disable-gui \
+	--disable-libnbd \
+	--disable-mi \
+	--with-libreadline-prefix=$(STAGING_DIR)
+
+$(eval $(autotools-package))
-- 
2.30.2
