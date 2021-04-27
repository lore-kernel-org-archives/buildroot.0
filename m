From: Dick Olsson <hi@senzilla.io>
Date: Tue, 27 Apr 2021 22:41:52 +0000
Subject: [Buildroot] [PATCH 01/10] package/skalibs: bump to version 2.10.0.3
Message-ID: <JTP1rzH5GGMYwRRayKbzGsglWioFlvC9WIFIJBuMG0@cp3-web-029.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove upstream patch that has been committed
- Change hash file indentation to 2 spaces

https://www.mail-archive.com/skaware at list.skarnet.org/msg01579.html

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 .../0001-Do-not-ld-into-dev-null.patch        | 115 ------------------
 package/skalibs/skalibs.hash                  |   4 +-
 package/skalibs/skalibs.mk                    |   2 +-
 3 files changed, 3 insertions(+), 118 deletions(-)
 delete mode 100644 package/skalibs/0001-Do-not-ld-into-dev-null.patch

diff --git a/package/skalibs/0001-Do-not-ld-into-dev-null.patch b/package/skalibs/0001-Do-not-ld-into-dev-null.patch
deleted file mode 100644
index 5f6a9a8285..0000000000
--- a/package/skalibs/0001-Do-not-ld-into-dev-null.patch
+++ /dev/null
@@ -1,115 +0,0 @@
-From 9d6e78c736ba93da20e5efbae914b94b08ca9590 Mon Sep 17 00:00:00 2001
-From: Laurent Bercot <ska-skaware@skarnet.org>
-Date: Sun, 11 Apr 2021 14:42:16 +0000
-Subject: [PATCH]  Do not ld into /dev/null
-
-[Retrieved from:
-https://github.com/skarnet/skalibs/commit/9d6e78c736ba93da20e5efbae914b94b08ca9590]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure | 25 ++++++++++++-------------
- 1 file changed, 12 insertions(+), 13 deletions(-)
-
-diff --git a/configure b/configure
-index 2804a2f..c02079e 100755
---- a/configure
-+++ b/configure
-@@ -99,7 +99,7 @@ stripdir () {
- tryflag () {
-   echo "Checking whether compiler accepts $2 ..."
-   echo "typedef int x;" > "$tmpc"
--  if $CC_AUTO "$2" -c -o /dev/null "$tmpc" >/dev/null 2>&1 ; then
-+  if $CC_AUTO "$2" -c -o "$tmpo" "$tmpc" >/dev/null 2>&1 ; then
-     echo "  ... yes"
-     eval "$1=\"\${$1} \$2\""
-     eval "$1=\${$1# }"
-@@ -113,7 +113,7 @@ tryflag () {
- tryldflag () {
-   echo "Checking whether linker accepts $2 ..."
-   echo "typedef int x;" > "$tmpc"
--  if $CC_AUTO -nostdlib "$2" -o /dev/null "$tmpc" >/dev/null 2>&1 ; then
-+  if $CC_AUTO -nostdlib "$2" -o "$tmpe" "$tmpc" >/dev/null 2>&1 ; then
-     echo "  ... yes"
-     eval "$1=\"\${$1} \$2\""
-     eval "$1=\${$1# }"
-@@ -156,17 +156,17 @@ choose () {
-   libs="$*"
-   r=true
-   case "$what" in
--    *c*) $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST -o try$name.o -c src/sysdeps/try$name.c 2>/dev/null || r=false ;;
-+    *c*) $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST -o "$tmpo" -c src/sysdeps/try$name.c 2>/dev/null || r=false ;;
-   esac
-   if $r ; then
-     case "$what" in
--      *l*) $CC_AUTO $CFLAGS_AUTO $CFLAGS $CFLAGS_POST $LDFLAGS_AUTO $LDFLAGS $LDFLAGS_POST -o try$name try$name.o $libs 2>/dev/null || r=false ;;
-+      *l*) $CC_AUTO $CFLAGS_AUTO $CFLAGS $CFLAGS_POST $LDFLAGS_AUTO $LDFLAGS $LDFLAGS_POST -o try$name "$tmpo" $libs 2>/dev/null || r=false ;;
-     esac
-   fi
-   if $r ; then
-     case "$what" in
-      *r*) if test -n "$cross" ; then
--            rm -f try$name.o try$name
-+            rm -f try$name
-             fail "$0: sysdep $name cannot be autodetected when cross-compiling. Please manually provide a value with the --with-sysdep-${name}=yes|no|... option."
-           fi
-           ./try$name >/dev/null 2>&1 ; r=$?
-@@ -177,7 +177,7 @@ choose () {
-           esac
-     esac
-   fi
--  rm -f try$name.o try$name
-+  rm -f try$name
-   if $r ; then
-     echo "$name: yes" >> $sysdeps/sysdeps
-     echo "  ... yes"
-@@ -188,10 +188,7 @@ choose () {
- }
- 
- trybasic () {
--  $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST -o "$tmpe" -c "$1" 2>/dev/null
--  r=$?
--  rm -f "$tmpe"
--  return $r
-+  $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST -o "$tmpo" -c "$1" 2>/dev/null
- }
- 
- tryendianness () {
-@@ -297,7 +294,7 @@ detectlibs () {
-   name=$1
-   shift
-   if $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST -c -o try$name.o src/sysdeps/try$name.c 2>/dev/null ; then
--    until $CC_AUTO $CFLAGS_AUTO $CFLAGS $CFLAGS_POST $LDFLAGS_AUTO $LDFLAGS $LDFLAGS_POST -o /dev/null try$name.o $args 2>/dev/null ; do
-+    until $CC_AUTO $CFLAGS_AUTO $CFLAGS $CFLAGS_POST $LDFLAGS_AUTO $LDFLAGS $LDFLAGS_POST -o "$tmpe" try$name.o $args 2>/dev/null ; do
-       if test -z "$*" ; then
-         rm -f try$name.o
-         return 1
-@@ -465,9 +462,11 @@ set -C
- while test "$i" -lt 50 ; do
-   i=$(($i+1))
-   tmpc="./tmp-configure-$$-$PPID-$i.c"
-+  tmpo="./tmp-configure-$$-$PPID-$i.o"
-   tmpe="./tmp-configure-$$-$PPID-$i.tmp"
-   tmps="./tmp-configure-$$-$PPID-$i.sysdeps"
-   2>|/dev/null > "$tmpc" && break
-+  2>|/dev/null > "$tmpo" && break
-   2>|/dev/null > "$tmpe" && break
-   2>|/dev/null > "$tmps" && break
- done
-@@ -475,7 +474,7 @@ if test "$i" -gt 50 ; then
-   fail "$0: cannot create temporary files"
- fi
- set +C
--trap 'rm -f "$tmpc" "$tmpe" "$tmps"' EXIT ABRT INT QUIT TERM HUP
-+trap 'rm -f "$tmpc" "$tmpo" "$tmpe" "$tmps"' EXIT ABRT INT QUIT TERM HUP
- 
- # Preprocess user-provided sysdeps
- rm -f "$tmps"
-@@ -533,7 +532,7 @@ test -n "$CC_AUTO" || fail "$0: cannot find a C compiler"
- echo "  ... $CC_AUTO"
- echo "Checking whether C compiler works... "
- echo "typedef int x;" > "$tmpc"
--if $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST -c -o /dev/null "$tmpc" 2>"$tmpe" ; then
-+if $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST -c -o "$tmpo" "$tmpc" 2>"$tmpe" ; then
-   echo "  ... yes"
- else
-   echo "  ... no. Compiler output follows:"
diff --git a/package/skalibs/skalibs.hash b/package/skalibs/skalibs.hash
index 2e486ea901..48e4028edc 100644
--- a/package/skalibs/skalibs.hash
+++ b/package/skalibs/skalibs.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 8bba3d7650bab83d4ea2ad21d6bfb5479a8652e362a478fcb783b3c7cf891e0f  skalibs-2.10.0.2.tar.gz
-sha256 adecb8bedfaae27fcfe65ecb3ef0e2e71aa2a2b49dc21886a200bc677d93e6ec  COPYING
+sha256  b780b0ae650dda0c3ec5f8975174998af2d24c2a2e2be669b1bab46e73b1464d  skalibs-2.10.0.3.tar.gz
+sha256  adecb8bedfaae27fcfe65ecb3ef0e2e71aa2a2b49dc21886a200bc677d93e6ec  COPYING
diff --git a/package/skalibs/skalibs.mk b/package/skalibs/skalibs.mk
index f92859ff26..a1d7035580 100644
--- a/package/skalibs/skalibs.mk
+++ b/package/skalibs/skalibs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKALIBS_VERSION = 2.10.0.2
+SKALIBS_VERSION = 2.10.0.3
 SKALIBS_SITE = http://skarnet.org/software/skalibs
 SKALIBS_LICENSE = ISC
 SKALIBS_LICENSE_FILES = COPYING
-- 
2.30.2
