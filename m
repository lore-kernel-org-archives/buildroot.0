From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 22:53:08 +0200
Subject: [Buildroot] [git commit] package/skalibs: bump version to 2.9.0.0
Message-ID: <20190930204831.134A383CCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6cea3ed79d3b5bfab836f7359e451df20753fd8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump version to 2.9.0.0 and drop runtime test patches, as
cross-compilation detection has been revamped.

The hash of the COPYING file is updated to take into account the
copyright year change:

-Copyright (c) 2011-2018 Laurent Bercot <ska-skaware@skarnet.org>
+Copyright (c) 2011-2019 Laurent Bercot <ska-skaware@skarnet.org>

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-linker-use-dummy-file-when-testing-libs.patch} |  10 +-
 .../0001-No-runtime-tests-for-endianness.patch     |  96 -----------------
 .../0002-No-runtime-tests-for-type-sizes.patch     | 115 ---------------------
 package/skalibs/skalibs.hash                       |   4 +-
 package/skalibs/skalibs.mk                         |   3 +-
 5 files changed, 9 insertions(+), 219 deletions(-)

diff --git a/package/skalibs/0003-Make-linker-use-dummy-file-when-testing-libs.patch b/package/skalibs/0001-Make-linker-use-dummy-file-when-testing-libs.patch
similarity index 89%
rename from package/skalibs/0003-Make-linker-use-dummy-file-when-testing-libs.patch
rename to package/skalibs/0001-Make-linker-use-dummy-file-when-testing-libs.patch
index 0841179369..17376210f0 100644
--- a/package/skalibs/0003-Make-linker-use-dummy-file-when-testing-libs.patch
+++ b/package/skalibs/0001-Make-linker-use-dummy-file-when-testing-libs.patch
@@ -1,4 +1,4 @@
-From 02ef4599179ead87cc6d154a32acaa6627cbfca2 Mon Sep 17 00:00:00 2001
+From ca69c0d48e65acadccfe65e3adf16c34a744627b Mon Sep 17 00:00:00 2001
 From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
 Date: Tue, 10 Oct 2017 19:51:34 +0200
 Subject: [PATCH] Make linker use dummy file when testing libs
@@ -18,10 +18,10 @@ Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 8348b1f..62e5981 100755
+index 54d755b..64a061a 100755
 --- a/configure
 +++ b/configure
-@@ -227,7 +227,7 @@ trylibs () {
+@@ -230,7 +230,7 @@ trylibs () {
    echo "Checking whether system has $2..." >&3
    shift 2
    if $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST -c -o try$name.o src/sysdeps/try$name.c 2>/dev/null ; then
@@ -30,7 +30,7 @@ index 8348b1f..62e5981 100755
        if test -z "$*" ; then
          rm -f try$name.o
          echo
-@@ -243,7 +243,7 @@ trylibs () {
+@@ -246,7 +246,7 @@ trylibs () {
      else
        echo "  ... yes, with$args" >&3
      fi
@@ -40,5 +40,5 @@ index 8348b1f..62e5981 100755
    else
      echo
 -- 
-2.13.6
+2.17.2
 
diff --git a/package/skalibs/0001-No-runtime-tests-for-endianness.patch b/package/skalibs/0001-No-runtime-tests-for-endianness.patch
deleted file mode 100644
index eb70b4ed56..0000000000
--- a/package/skalibs/0001-No-runtime-tests-for-endianness.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From d3920dce139734e00bbe4447a16ef24dfe4d704a Mon Sep 17 00:00:00 2001
-From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-Date: Tue, 10 Oct 2017 19:51:02 +0200
-Subject: [PATCH] No runtime tests for endianness
-
-Replace build and execution of runtime test programs for determining
-the endianness of the target with compile time test programs.
-
-This improves support for cross-compilation.
-
-Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
----
- configure                     | 13 ++++++++++---
- src/sysdeps/trybigendian.c    | 16 ++++++++++++++++
- src/sysdeps/trylittleendian.c | 19 +++++++++++++++++++
- 3 files changed, 45 insertions(+), 3 deletions(-)
- create mode 100644 src/sysdeps/trybigendian.c
- create mode 100644 src/sysdeps/trylittleendian.c
-
-diff --git a/configure b/configure
-index f34dcd0..f2a77f3 100755
---- a/configure
-+++ b/configure
-@@ -478,12 +478,19 @@ EOF
-   exec 3>&-
- 
-   echo "Checking system endianness..."
--  $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST $LDFLAGS_AUTO $LDFLAGS $LDFLAGS_POST -o tryendianness src/sysdeps/tryendianness.c
--  endianness=$(./tryendianness) || fail "$0: unable to determine endianness"
-+  if $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST $LDFLAGS_AUTO $LDFLAGS $LDFLAGS_POST -o trybigendian src/sysdeps/trybigendian.c 2>/dev/null; then
-+      endianness=big
-+  else
-+      if $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST $LDFLAGS_AUTO $LDFLAGS $LDFLAGS_POST -o trylittleendian src/sysdeps/trylittleendian.c 2>/dev/null; then
-+          endianness=little
-+      else
-+          fail "$0: unable to determine endianness"
-+      fi
-+  fi
-   echo "endianness: $endianness" >> $sysdeps/sysdeps
-   echo "#define ${package_macro_name}_ENDIANNESS \"$endianness\"" >> $sysdeps/sysdeps.h
-   echo "  ... $endianness"
--  rm -f tryendianness
-+  rm -f trybigendian trylittleendian
- 
-   trytypes
-   choose clr accept4 ACCEPT4 'accept4()'
-diff --git a/src/sysdeps/trybigendian.c b/src/sysdeps/trybigendian.c
-new file mode 100644
-index 0000000..d857572
---- /dev/null
-+++ b/src/sysdeps/trybigendian.c
-@@ -0,0 +1,16 @@
-+#if defined(__BYTE_ORDER) && (__BYTE_ORDER == __BIG_ENDIAN) ||	       \
-+	defined(__BYTE_ORDER__) && (__BYTE_ORDER__  == __ORDER_BIG_ENDIAN__) || \
-+	defined(__BIG_ENDIAN) ||				       \
-+	defined(__ARMEB__) ||					       \
-+	defined(__THUMBEB__) ||				       \
-+	defined(__AARCH64EB__) ||				       \
-+	defined(_MIPSEB) || defined(__MIPSEB) || defined(__MIPSEB__)
-+#define YEAH
-+#else
-+#error "not big endian"
-+#endif
-+
-+int main(void)
-+{
-+	return 0;
-+}
-diff --git a/src/sysdeps/trylittleendian.c b/src/sysdeps/trylittleendian.c
-new file mode 100644
-index 0000000..68b93c1
---- /dev/null
-+++ b/src/sysdeps/trylittleendian.c
-@@ -0,0 +1,19 @@
-+#if defined(__BYTE_ORDER) && (__BYTE_ORDER == __LITTLE_ENDIAN) ||	\
-+	defined(__BYTE_ORDER__) && (__BYTE_ORDER__  == __ORDER_LITTLE_ENDIAN__) || \
-+	defined(__LITTLE_ENDIAN) ||					\
-+	defined(__ARMEL__) ||						\
-+	defined(__THUMBEL__) ||					\
-+	defined(__AARCH64EL__) ||					\
-+	defined(__i386) || defined(__i386__) ||			\
-+	defined(__amd64) || defined(__amd64__) ||			\
-+	defined(__x86_64) || defined(__x86_64__) ||			\
-+	defined(_MIPSEL) || defined(__MIPSEL) || defined(__MIPSEL__)
-+#define YEAH
-+#else
-+#error "not little endian"
-+#endif
-+
-+int main(void)
-+{
-+	return 0;
-+}
--- 
-2.13.6
-
diff --git a/package/skalibs/0002-No-runtime-tests-for-type-sizes.patch b/package/skalibs/0002-No-runtime-tests-for-type-sizes.patch
deleted file mode 100644
index ad3b19eb7d..0000000000
--- a/package/skalibs/0002-No-runtime-tests-for-type-sizes.patch
+++ /dev/null
@@ -1,115 +0,0 @@
-From f411b502222c8fe442d7b3beb00b530c9e16b7a2 Mon Sep 17 00:00:00 2001
-From: "Van Bemten, Lionel (Nokia - BE/Antwerp)" <lionel.van_bemten@nokia.com>
-Date: Sun, 29 Apr 2018 19:53:40 +0200
-Subject: [PATCH] No runtime tests for type sizes
-
-Replace build and execution of runtime test programs for determining
-some type sizes of the target with compile time test programs.
-
-This improves support for cross-compilation.
-
-Signed-off-by: "Van Bemten, Lionel (Nokia - BE/Antwerp)" <lionel.van_bemten@nokia.com>
-Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
----
- configure | 75 ++++++++++++++++++++++++++++++++++++++++++++++++++-------------
- 1 file changed, 60 insertions(+), 15 deletions(-)
-
-diff --git a/configure b/configure
-index 434eec8..c09e9c8 100755
---- a/configure
-+++ b/configure
-@@ -155,23 +155,69 @@ choose () {
-   fi
- }
- 
-+findtypesize () {
-+  typ=$1
-+  abbr=$2
-+  r=false
-+  type_size=0
-+  while true; do
-+    cat>trysizeof${abbr}.c<<EOF
-+#include <sys/types.h>
-+
-+int main(void)
-+{
-+  static int v = 1 / !!((sizeof($typ) == $type_size));
-+  return 0;
-+}
-+EOF
-+    if $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST $LDFLAGS_AUTO $LDFLAGS $LDFLAGS_POST -o trysizeof${abbr} trysizeof${abbr}.c 2>/dev/null; then
-+        r=true
-+        break
-+    fi
-+    type_size=$(expr $type_size + 1)
-+    test $type_size -le 16 || break
-+  done
-+  rm -f trysizeof${abbr} trysizeof${abbr}.c
-+  test $r = true || fail "$0: unable to determine size of $typ"
-+  caps=$(echo "sizeof${abbr}" | tr a-z A-Z)
-+  echo "#define ${package_macro_name}_${caps} $type_size" >> $sysdeps/sysdeps.h
-+  echo "sizeof${abbr}: $type_size" >> $sysdeps/sysdeps
-+}
-+
-+findtypesign () {
-+  typ=$1
-+  abbr=$2
-+  caps=$(echo "signed${abbr}" | tr a-z A-Z)
-+  cat>trysignof${abbr}.c<<EOF
-+#include <sys/types.h>
-+
-+int main(void)
-+{
-+  static int v = 1 / !!(((($typ) -1) < 0));
-+  return 0;
-+}
-+EOF
-+  if $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST $LDFLAGS_AUTO $LDFLAGS $LDFLAGS_POST -o trysignof${abbr} trysignof${abbr}.c 2>/dev/null; then
-+    echo "#define ${package_macro_name}_HAS${caps}" >> $sysdeps/sysdeps.h
-+    echo "#undef ${package_macro_name}_HASUN${caps}" >> $sysdeps/sysdeps.h
-+    echo "signed${abbr}: yes" >> $sysdeps/sysdeps
-+  else
-+    echo "#undef ${package_macro_name}_HAS${caps}" >> $sysdeps/sysdeps.h
-+    echo "#define ${package_macro_name}_HASUN${caps}" >> $sysdeps/sysdeps.h
-+    echo "signed${abbr}: no" >> $sysdeps/sysdeps
-+  fi
-+  rm -f trysignof${abbr} trysignof${abbr}.c
-+}
-+
- trytypes () {
-   echo "Checking size and signedness of standard types..."
--  $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST $LDFLAGS_AUTO $LDFLAGS $LDFLAGS_POST -o output-types src/sysdeps/output-types.c
--  ./output-types >> $sysdeps/sysdeps
--  ./output-types | grep -F sizeof | while read key value ; do
--    caps=$(echo $key | sed s/:\$// | tr a-z A-Z)
--    echo "#define ${package_macro_name}_${caps} $value" >> $sysdeps/sysdeps.h
-+  for t in "unsigned short" "unsigned int" "unsigned long"; do
-+    abbr=$(echo "$t" | sed -e 's/nsigned //')
-+    findtypesize "$t" "${abbr}"
-   done
--  ./output-types | grep -F signed | while read key value ; do
--    caps=$(echo $key | sed s/:\$// | tr a-z A-Z)
--    if test $value = yes ; then
--      echo "#define ${package_macro_name}_HAS${caps}"
--      echo "#undef ${package_macro_name}_HASUN${caps}"
--    else
--      echo "#undef ${package_macro_name}_HAS${caps}"
--      echo "#define ${package_macro_name}_HASUN${caps}"
--    fi >> $sysdeps/sysdeps.h
-+  for t in size uid gid pid time dev ino; do
-+    findtypesize "${t}_t" "$t"
-+    findtypesign "${t}_t" "$t"
-   done
-   rm -f output-types
-   echo "  ... done"
-@@ -548,7 +594,6 @@ EOF
-   choose cl itimer ITIMER 'setitimer()'
-   choose cl namespaces NAMESPACES 'namespaces'
-   choose cl nsgetparent NSGETPARENT 'NS_GET_PARENT'
--  choose cl explicit_bzero EXPLICIT_BZERO 'explicit_bzero()'
- 
-   echo '#endif' >> $sysdeps/sysdeps.h
- fi
--- 
-2.14.3
-
diff --git a/package/skalibs/skalibs.hash b/package/skalibs/skalibs.hash
index 0646dbc0e4..e8e591dd05 100644
--- a/package/skalibs/skalibs.hash
+++ b/package/skalibs/skalibs.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 30ac73f1e8da6387fcfa19cfe1e326a143b4d811aaf532988b280daefa56dcc7  skalibs-2.6.4.0.tar.gz
-sha256 3eadcf980c40da0f257b8292d805ff41e5e5a908c1942315d9a627732e1aa012  COPYING
+sha256 f5604f9e5ebb436d3a8efa16a2c4133f7bd424d9f22aa88fe7a372f0153396fb  skalibs-2.9.0.0.tar.gz
+sha256 d8e17a6418d26867c13801810903a1f78beac8cfe8f92c2a85afe59f3c3fc48c  COPYING
diff --git a/package/skalibs/skalibs.mk b/package/skalibs/skalibs.mk
index 7672b0d31a..be94a186fc 100644
--- a/package/skalibs/skalibs.mk
+++ b/package/skalibs/skalibs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKALIBS_VERSION = 2.6.4.0
+SKALIBS_VERSION = 2.9.0.0
 SKALIBS_SITE = http://skarnet.org/software/skalibs
 SKALIBS_LICENSE = ISC
 SKALIBS_LICENSE_FILES = COPYING
@@ -13,6 +13,7 @@ SKALIBS_INSTALL_STAGING = YES
 SKALIBS_CONF_OPTS = \
 	--prefix=/usr \
 	--with-default-path=/sbin:/usr/sbin:/bin:/usr/bin \
+	--with-sysdep-devurandom=yes \
 	$(SHARED_STATIC_LIBS_OPTS)
 
 define SKALIBS_CONFIGURE_CMDS
