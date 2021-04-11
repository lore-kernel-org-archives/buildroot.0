From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 11 Apr 2021 17:20:14 +0200
Subject: [Buildroot] [PATCH v2,1/1] package/skalibs: fix build with xtensa
Message-ID: <20210411152014.254121-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build with xtensa toolchain is broken since bump to version 2.10.0.2 in
commit 4d5587cb56224b2b28f53b0202fb14b2ab32d5fb indeed patch was dropped
assuming that it was included upstream but this assumption was wrong.

The code was just reworked in version 2.10.0.0 and commit
https://github.com/skarnet/skalibs/commit/21e6ea800cc96ba76e94ad8de1dfa58ab1b7ceb6

Fixes:
 - http://autobuild.buildroot.org/results/ee58ffa7b2f0be46ef7bc0ba38d3142f26a9bce9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Use upstream patch

 .../0001-Do-not-ld-into-dev-null.patch        | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 package/skalibs/0001-Do-not-ld-into-dev-null.patch

diff --git a/package/skalibs/0001-Do-not-ld-into-dev-null.patch b/package/skalibs/0001-Do-not-ld-into-dev-null.patch
new file mode 100644
index 0000000000..5f6a9a8285
--- /dev/null
+++ b/package/skalibs/0001-Do-not-ld-into-dev-null.patch
@@ -0,0 +1,115 @@
+From 9d6e78c736ba93da20e5efbae914b94b08ca9590 Mon Sep 17 00:00:00 2001
+From: Laurent Bercot <ska-skaware@skarnet.org>
+Date: Sun, 11 Apr 2021 14:42:16 +0000
+Subject: [PATCH]  Do not ld into /dev/null
+
+[Retrieved from:
+https://github.com/skarnet/skalibs/commit/9d6e78c736ba93da20e5efbae914b94b08ca9590]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure | 25 ++++++++++++-------------
+ 1 file changed, 12 insertions(+), 13 deletions(-)
+
+diff --git a/configure b/configure
+index 2804a2f..c02079e 100755
+--- a/configure
++++ b/configure
+@@ -99,7 +99,7 @@ stripdir () {
+ tryflag () {
+   echo "Checking whether compiler accepts $2 ..."
+   echo "typedef int x;" > "$tmpc"
+-  if $CC_AUTO "$2" -c -o /dev/null "$tmpc" >/dev/null 2>&1 ; then
++  if $CC_AUTO "$2" -c -o "$tmpo" "$tmpc" >/dev/null 2>&1 ; then
+     echo "  ... yes"
+     eval "$1=\"\${$1} \$2\""
+     eval "$1=\${$1# }"
+@@ -113,7 +113,7 @@ tryflag () {
+ tryldflag () {
+   echo "Checking whether linker accepts $2 ..."
+   echo "typedef int x;" > "$tmpc"
+-  if $CC_AUTO -nostdlib "$2" -o /dev/null "$tmpc" >/dev/null 2>&1 ; then
++  if $CC_AUTO -nostdlib "$2" -o "$tmpe" "$tmpc" >/dev/null 2>&1 ; then
+     echo "  ... yes"
+     eval "$1=\"\${$1} \$2\""
+     eval "$1=\${$1# }"
+@@ -156,17 +156,17 @@ choose () {
+   libs="$*"
+   r=true
+   case "$what" in
+-    *c*) $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST -o try$name.o -c src/sysdeps/try$name.c 2>/dev/null || r=false ;;
++    *c*) $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST -o "$tmpo" -c src/sysdeps/try$name.c 2>/dev/null || r=false ;;
+   esac
+   if $r ; then
+     case "$what" in
+-      *l*) $CC_AUTO $CFLAGS_AUTO $CFLAGS $CFLAGS_POST $LDFLAGS_AUTO $LDFLAGS $LDFLAGS_POST -o try$name try$name.o $libs 2>/dev/null || r=false ;;
++      *l*) $CC_AUTO $CFLAGS_AUTO $CFLAGS $CFLAGS_POST $LDFLAGS_AUTO $LDFLAGS $LDFLAGS_POST -o try$name "$tmpo" $libs 2>/dev/null || r=false ;;
+     esac
+   fi
+   if $r ; then
+     case "$what" in
+      *r*) if test -n "$cross" ; then
+-            rm -f try$name.o try$name
++            rm -f try$name
+             fail "$0: sysdep $name cannot be autodetected when cross-compiling. Please manually provide a value with the --with-sysdep-${name}=yes|no|... option."
+           fi
+           ./try$name >/dev/null 2>&1 ; r=$?
+@@ -177,7 +177,7 @@ choose () {
+           esac
+     esac
+   fi
+-  rm -f try$name.o try$name
++  rm -f try$name
+   if $r ; then
+     echo "$name: yes" >> $sysdeps/sysdeps
+     echo "  ... yes"
+@@ -188,10 +188,7 @@ choose () {
+ }
+ 
+ trybasic () {
+-  $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST -o "$tmpe" -c "$1" 2>/dev/null
+-  r=$?
+-  rm -f "$tmpe"
+-  return $r
++  $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST -o "$tmpo" -c "$1" 2>/dev/null
+ }
+ 
+ tryendianness () {
+@@ -297,7 +294,7 @@ detectlibs () {
+   name=$1
+   shift
+   if $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST -c -o try$name.o src/sysdeps/try$name.c 2>/dev/null ; then
+-    until $CC_AUTO $CFLAGS_AUTO $CFLAGS $CFLAGS_POST $LDFLAGS_AUTO $LDFLAGS $LDFLAGS_POST -o /dev/null try$name.o $args 2>/dev/null ; do
++    until $CC_AUTO $CFLAGS_AUTO $CFLAGS $CFLAGS_POST $LDFLAGS_AUTO $LDFLAGS $LDFLAGS_POST -o "$tmpe" try$name.o $args 2>/dev/null ; do
+       if test -z "$*" ; then
+         rm -f try$name.o
+         return 1
+@@ -465,9 +462,11 @@ set -C
+ while test "$i" -lt 50 ; do
+   i=$(($i+1))
+   tmpc="./tmp-configure-$$-$PPID-$i.c"
++  tmpo="./tmp-configure-$$-$PPID-$i.o"
+   tmpe="./tmp-configure-$$-$PPID-$i.tmp"
+   tmps="./tmp-configure-$$-$PPID-$i.sysdeps"
+   2>|/dev/null > "$tmpc" && break
++  2>|/dev/null > "$tmpo" && break
+   2>|/dev/null > "$tmpe" && break
+   2>|/dev/null > "$tmps" && break
+ done
+@@ -475,7 +474,7 @@ if test "$i" -gt 50 ; then
+   fail "$0: cannot create temporary files"
+ fi
+ set +C
+-trap 'rm -f "$tmpc" "$tmpe" "$tmps"' EXIT ABRT INT QUIT TERM HUP
++trap 'rm -f "$tmpc" "$tmpo" "$tmpe" "$tmps"' EXIT ABRT INT QUIT TERM HUP
+ 
+ # Preprocess user-provided sysdeps
+ rm -f "$tmps"
+@@ -533,7 +532,7 @@ test -n "$CC_AUTO" || fail "$0: cannot find a C compiler"
+ echo "  ... $CC_AUTO"
+ echo "Checking whether C compiler works... "
+ echo "typedef int x;" > "$tmpc"
+-if $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST -c -o /dev/null "$tmpc" 2>"$tmpe" ; then
++if $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST -c -o "$tmpo" "$tmpc" 2>"$tmpe" ; then
+   echo "  ... yes"
+ else
+   echo "  ... no. Compiler output follows:"
-- 
2.30.2
