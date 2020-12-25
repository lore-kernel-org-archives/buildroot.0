From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2020 23:14:20 +0100
Subject: [Buildroot] [git commit] package/rhash: fix build failure due to
 gcc -v
Message-ID: <20201225221612.C3ADF8886A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=550302c0b9536cf250b3dfc2d7ebb7b2b8df8010
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With BR2_RELRO_PARTIAL or BR2_RELRO_FULL, our toolchain wrapper will
forcibly add -Wl,-z,relro to any call to the actual compiler. This
usually works OK, because gcc will only use those options it needs for
the compile step it has to carry: pre-processing, compiling, assembling,
or linking, and ignore those options it does not need.

Excpt in one case: when -v is passed standalone, with no input file,
then gcc will falsely believe it has to do a link stage;

    $ gcc -Wl,-z,relro -v
    [...]
    /usr/bin/ld: /usr/lib/gcc/x86_64-linux-gnu/9/../../../x86_64-linux-gnu/Scrt1.o: in function `_start':
    (.text+0x24): undefined reference to `main'
    collect2: error: ld returned 1 exit status

Fixing that in our wrapper will not be easy, because we'd have to detect
there is no input file. Doing so would probably require we support
almost all gcc options to differentiate between the parameter of an
option (e.g. -I /some/path) from an actual inpout file. This would not
be very robust, and would have a high risk od breaking when we introduce
the next gcc version.

Since it seems that only rhash is affected, due to its inventive,
custom, hand-written configure script, we just patch it to be a bit more
robust in the face of a compiler that could not accept -v, and fallback
to --version.

Fixes:
 - http://autobuild.buildroot.org/results/8605c16cc28316954ce8b9dcc266974390c5da20

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr:
  - retain "$CC -v" as default, fallback to "$CC --version", in the hope
    that it stands better chance with upstream
  - write a commit log to explain the actual root-cause of the build
    failure
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-configure-allow-cross-compilation.patch   | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/package/rhash/0001-configure-allow-cross-compilation.patch b/package/rhash/0001-configure-allow-cross-compilation.patch
new file mode 100644
index 0000000000..6a8f40f184
--- /dev/null
+++ b/package/rhash/0001-configure-allow-cross-compilation.patch
@@ -0,0 +1,57 @@
+From a3d0ef352529217c9c32ce1a1b1db1420798cbe5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 10 Oct 2020 11:07:39 +0200
+Subject: [PATCH] configure: allow cross-compilation
+
+Some compilers are in fact a wrapper (e.g. to speed compilation with
+ccache or distcc, or as a cross-compiler wrapper). Those wrappers may
+not properly recognise the -v option, or may internally enforce some
+flags that conflict with -v.
+
+Use --version as a fall-back.
+
+With --version. the compiler will report its executable's basename, e.g.
+arm-linux-gcc not gcc. Catter for that by grepping for the compiler
+family name.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[yann.morin.1998 at free.fr:
+  - retain "$CC -v" as default, fallback to "$CC --version"
+]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ configure | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 9d72895..46491f7 100755
+--- a/configure
++++ b/configure
+@@ -513,9 +513,14 @@ else
+   CC_TMP="$CC"
+   test -n "$OPT_CC" && OTHER_CC= || OTHER_CC="gcc cc"
+   for CC in "$CC_TMP" $OTHER_CC; do
++    cc_name_tmp=
+     if run_cmd "$CC -v"; then
+       cc_name_tmp=$($CC -v 2>&1 | tail -n 1 | cut -d ' ' -f 1)
+-      if test "$cc_name_tmp" = "gcc"; then
++    elif run_cmd "$CC --version"; then
++      cc_name_tmp=$($CC --version 2>&1 | head -n 1 | cut -d ' ' -f 1)
++    fi
++    if test "${cc_name_tmp}"; then
++      if echo "$cc_name_tmp" | grep -q "gcc"; then
+         cc_name=$cc_name_tmp
+         start_check "$CC version"
+         cc_vendor=gnu
+@@ -539,7 +544,7 @@ else
+         finish_check "$cc_name $cc_version"
+         break
+       fi
+-      if $CC -v 2>&1 | grep -q "clang"; then
++      if echo "$cc_name_tmp" | grep -q "clang"; then
+         start_check "$CC version"
+         cc_vendor=clang
+         cc_version=$($CC -dumpversion 2>&1)
+-- 
+2.25.1
+
