From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 23:32:56 +0200
Subject: [Buildroot] [git commit] skalibs: bump version to 2.5.1.1
Message-ID: <20170702213031.5794280641@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=022cbb3467bc0fe1ca8f57af53aa01654db720c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-No-runtime-tests-for-endianness.patch     | 14 ++--
 .../0002-No-runtime-tests-for-type-sizes.patch     | 98 +++++++++++++++++-----
 ...e-linker-use-dummy-file-when-testing-libs.patch | 10 +--
 package/skalibs/skalibs.hash                       |  2 +-
 package/skalibs/skalibs.mk                         |  2 +-
 5 files changed, 90 insertions(+), 36 deletions(-)

diff --git a/package/skalibs/0001-No-runtime-tests-for-endianness.patch b/package/skalibs/0001-No-runtime-tests-for-endianness.patch
index 5f763c4..8bf76d4 100644
--- a/package/skalibs/0001-No-runtime-tests-for-endianness.patch
+++ b/package/skalibs/0001-No-runtime-tests-for-endianness.patch
@@ -1,6 +1,6 @@
-From 6754b208e7ec3bd1d4265db18fa4c0e7961a77bf Mon Sep 17 00:00:00 2001
+From f0e49690a6da92079d03afbf2aae413b273d2010 Mon Sep 17 00:00:00 2001
 From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-Date: Mon, 20 Mar 2017 20:05:00 +0100
+Date: Thu, 18 May 2017 19:38:37 +0200
 Subject: [PATCH] No runtime tests for endianness
 
 Replace build and execution of runtime test programs for determining
@@ -18,10 +18,10 @@ Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
  create mode 100644 src/sysdeps/trylittleendian.c
 
 diff --git a/configure b/configure
-index 1579025..4da9c5e 100755
+index 1eaccd3..5fffc34 100755
 --- a/configure
 +++ b/configure
-@@ -463,13 +463,20 @@ EOF
+@@ -471,13 +471,20 @@ EOF
    fi
    exec 3>&-
  
@@ -44,8 +44,8 @@ index 1579025..4da9c5e 100755
 -  rm -f tryendianness
 +  rm -f trybigendian trylittleendian
  
-   trytypesize ushort USHORT "unsigned short"
-   trytypesize uint UINT "unsigned int"
+   trytypes
+   choose clr accept4 ACCEPT4 'accept4()'
 diff --git a/src/sysdeps/trybigendian.c b/src/sysdeps/trybigendian.c
 new file mode 100644
 index 0000000..d857572
@@ -94,5 +94,5 @@ index 0000000..68b93c1
 +	return 0;
 +}
 -- 
-2.1.4
+2.9.3
 
diff --git a/package/skalibs/0002-No-runtime-tests-for-type-sizes.patch b/package/skalibs/0002-No-runtime-tests-for-type-sizes.patch
index 3f16171..694b5d0 100644
--- a/package/skalibs/0002-No-runtime-tests-for-type-sizes.patch
+++ b/package/skalibs/0002-No-runtime-tests-for-type-sizes.patch
@@ -1,6 +1,6 @@
-From d868600a3f437750bc44a783d677a25a48100096 Mon Sep 17 00:00:00 2001
-From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-Date: Sun, 4 Dec 2016 19:11:25 +0100
+From 2596155d76e4f2a3eab45ef7d095ade996b8b2a5 Mon Sep 17 00:00:00 2001
+From: "Van Bemten, Lionel (Nokia - BE/Antwerp)" <lionel.van_bemten@nokia.com>
+Date: Thu, 18 May 2017 19:38:46 +0200
 Subject: [PATCH] No runtime tests for type sizes
 
 Replace build and execution of runtime test programs for determining
@@ -8,47 +8,101 @@ some type sizes of the target with compile time test programs.
 
 This improves support for cross-compilation.
 
+Signed-off-by: "Van Bemten, Lionel (Nokia - BE/Antwerp)" <lionel.van_bemten@nokia.com>
 Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
 ---
- configure | 24 +++++++++++++++++++++---
- 1 file changed, 21 insertions(+), 3 deletions(-)
+ configure | 74 ++++++++++++++++++++++++++++++++++++++++++++++++++-------------
+ 1 file changed, 59 insertions(+), 15 deletions(-)
 
 diff --git a/configure b/configure
-index 4da9c5e..b5926ca 100755
+index 5fffc34..115fea3 100755
 --- a/configure
 +++ b/configure
-@@ -157,10 +157,28 @@ choose () {
+@@ -154,25 +154,69 @@ choose () {
+   fi
+ }
  
- trytypesize () {
-   echo "Checking size of $3..."
--  $CC_AUTO $CPPFLAGS_AUTO $CFLAGS_AUTO $LDFLAGS_AUTO -o trysizeof$1 src/sysdeps/trysizeof$1.c
--  type_size=$(./trysizeof$1) || fail "$0: unable to determine size of $3"
++findtypesize () {
++  typ=$1
++  abbr=$2
 +  r=false
 +  type_size=0
 +  while true; do
-+    cat<<EOF>trysizeof$1.c
++    cat>trysizeof${abbr}.c<<EOF
 +#include <sys/types.h>
 +
 +int main(void)
 +{
-+  static int v = 1 / !!((sizeof($3) == $type_size));
++  static int v = 1 / !!((sizeof($typ) == $type_size));
 +  return 0;
 +}
 +EOF
-+    if $CC_AUTO $CPPFLAGS_AUTO $CFLAGS_AUTO $LDFLAGS_AUTO -o trysizeof$1 trysizeof$1.c 2>/dev/null; then
++    if $CC_AUTO $CPPFLAGS_AUTO $CFLAGS_AUTO $LDFLAGS_AUTO -o trysizeof${abbr} trysizeof${abbr}.c 2>/dev/null; then
 +        r=true
 +        break
 +    fi
 +    type_size=$(expr $type_size + 1)
 +    test $type_size -le 16 || break
 +  done
-+  test $r = true || fail "$0: unable to determine size of $3"
-   type_bits=$(expr 8 \* $type_size)
--  rm -f trysizeof$1
-+  rm -f trysizeof$1 trysizeof$1.c
-   echo "sizeof$1: $type_size" >> $sysdeps/sysdeps
-   echo "#define ${package_macro_name}_SIZEOF$2 $type_size" >> $sysdeps/sysdeps.h
-   echo "#define ${package_macro_name}_$2_BITS $type_bits" >> $sysdeps/sysdeps.h
++  rm -f trysizeof${abbr} trysizeof${abbr}.c
++  test $r = true || fail "$0: unable to determine size of $typ"
++  caps=$(echo "sizeof${abbr}" | tr a-z A-Z)
++  echo "#define ${package_macro_name}_${caps} $type_size" >> $sysdeps/sysdeps.h
++  echo "sizeof${abbr}: $type_size" >> $sysdeps/sysdeps
++}
++
++findtypesign () {
++  typ=$1
++  abbr=$2
++  caps=$(echo "signed${abbr}" | tr a-z A-Z)
++  cat>trysignof${abbr}.c<<EOF
++#include <sys/types.h>
++
++int main(void)
++{
++  static int v = 1 / !!(((($typ) -1) < 0));
++  return 0;
++}
++EOF
++  if $CC_AUTO $CPPFLAGS_AUTO $CFLAGS_AUTO $LDFLAGS_AUTO -o trysignof${abbr} trysignof${abbr}.c 2>/dev/null; then
++    echo "#define ${package_macro_name}_HASSIGNED${caps}" >> $sysdeps/sysdeps.h
++    echo "#undef ${package_macro_name}_HASUNSIGNED${caps}" >> $sysdeps/sysdeps.h
++    echo "signed${abbr}: yes" >> $sysdeps/sysdeps
++  else
++    echo "#undef ${package_macro_name}_HASSIGNED${caps}" >> $sysdeps/sysdeps.h
++    echo "#define ${package_macro_name}_HASUNSIGNED${caps}" >> $sysdeps/sysdeps.h
++    echo "signed${abbr}: no" >> $sysdeps/sysdeps
++  fi
++  rm -f trysignof${abbr} trysignof${abbr}.c
++}
++
+ trytypes () {
+   echo "Checking size and signedness of standard types..."
+-  $CC_AUTO $CPPFLAGS_AUTO $CFLAGS_AUTO $LDFLAGS_AUTO -o output-types src/sysdeps/output-types.c
+-  ./output-types >> $sysdeps/sysdeps
+-  ./output-types | grep -F sizeof | while read key value ; do
+-    caps=$(echo $key | sed s/:\$// | tr a-z A-Z)
+-    echo "#define ${package_macro_name}_${caps} $value" >> $sysdeps/sysdeps.h
++  for t in "unsigned short" "unsigned int" "unsigned long"; do
++    findtypesize "$t" "${t/nsigned /}"
+   done
+-  ./output-types | grep -F signed | while read key value ; do
+-    caps=$(echo $key | sed s/:\$// | tr a-z A-Z)
+-    if test $value = yes ; then
+-      echo "#define ${package_macro_name}_HASSIGNED${caps}"
+-      echo "#undef ${package_macro_name}_HASUNSIGNED${caps}"
+-    else
+-      echo "#undef ${package_macro_name}_HASSIGNED${caps}"
+-      echo "#define ${package_macro_name}_HASUNSIGNED${caps}"
+-    fi >> $sysdeps/sysdeps.h
++  for t in size uid gid pid time dev ino; do
++    findtypesize "${t}_t" "$t"
++    findtypesign "${t}_t" "$t"
+   done
+-  rm -f output-types
+   echo "  ... done"
+ }
+ 
 -- 
-2.5.5
+2.9.3
 
diff --git a/package/skalibs/0003-Make-linker-use-dummy-file-when-testing-libs.patch b/package/skalibs/0003-Make-linker-use-dummy-file-when-testing-libs.patch
index ef0e173..55cc96a 100644
--- a/package/skalibs/0003-Make-linker-use-dummy-file-when-testing-libs.patch
+++ b/package/skalibs/0003-Make-linker-use-dummy-file-when-testing-libs.patch
@@ -1,4 +1,4 @@
-From da293110f429e1206728c1551cf0f6b462b3d8c0 Mon Sep 17 00:00:00 2001
+From 4d9aca413b42191223d8dc2ba9b4f943ee90c94b Mon Sep 17 00:00:00 2001
 From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
 Date: Thu, 29 Dec 2016 19:36:24 +0100
 Subject: [PATCH] Make linker use dummy file when testing libs
@@ -18,10 +18,10 @@ Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 1579025..12980fb 100755
+index 115fea3..7d38447 100755
 --- a/configure
 +++ b/configure
-@@ -173,7 +173,7 @@ trylibs () {
+@@ -226,7 +226,7 @@ trylibs () {
    echo "Checking whether system has $2..." >&3
    shift 2
    if $CC_AUTO $CPPFLAGS_AUTO $CFLAGS_AUTO -c -o try$name.o src/sysdeps/try$name.c 2>/dev/null ; then
@@ -30,7 +30,7 @@ index 1579025..12980fb 100755
        if test -z "$*" ; then
          rm -f try$name.o
          echo
-@@ -189,7 +189,7 @@ trylibs () {
+@@ -242,7 +242,7 @@ trylibs () {
      else
        echo "  ... yes, with$args" >&3
      fi
@@ -40,5 +40,5 @@ index 1579025..12980fb 100755
    else
      echo
 -- 
-2.4.11
+2.9.3
 
diff --git a/package/skalibs/skalibs.hash b/package/skalibs/skalibs.hash
index 195ac47..8ab7234 100644
--- a/package/skalibs/skalibs.hash
+++ b/package/skalibs/skalibs.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 0708172bc2ec9825f8a4f312d35f8dcd94da5f291425a598c33c873b3de77df8 skalibs-2.4.0.2.tar.gz
+sha256 aa387f11a01751b37fd32603fdf9328a979f74f97f0172def1b0ad73b7e8d51d  skalibs-2.5.1.1.tar.gz
diff --git a/package/skalibs/skalibs.mk b/package/skalibs/skalibs.mk
index 55b8a29..c6f97ee 100644
--- a/package/skalibs/skalibs.mk
+++ b/package/skalibs/skalibs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKALIBS_VERSION = 2.4.0.2
+SKALIBS_VERSION = 2.5.1.1
 SKALIBS_SITE = http://skarnet.org/software/skalibs
 SKALIBS_LICENSE = ISC
 SKALIBS_LICENSE_FILES = COPYING
