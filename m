From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Oct 2017 09:45:34 +0200
Subject: [Buildroot] [git commit] skalibs: bump version to 2.6.0.1
Message-ID: <20171025073940.BEB50811F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4703e63f193ceac247717c20a0a6ec327488fb16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump version to 2.6.0.1 and refresh patches.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-No-runtime-tests-for-endianness.patch     | 24 ++++++++++------------
 .../0002-No-runtime-tests-for-type-sizes.patch     | 18 ++++++++--------
 ...e-linker-use-dummy-file-when-testing-libs.patch | 18 ++++++++--------
 package/skalibs/skalibs.hash                       |  2 +-
 package/skalibs/skalibs.mk                         |  2 +-
 5 files changed, 31 insertions(+), 33 deletions(-)

diff --git a/package/skalibs/0001-No-runtime-tests-for-endianness.patch b/package/skalibs/0001-No-runtime-tests-for-endianness.patch
index 8bf76d4..eb70b4e 100644
--- a/package/skalibs/0001-No-runtime-tests-for-endianness.patch
+++ b/package/skalibs/0001-No-runtime-tests-for-endianness.patch
@@ -1,6 +1,6 @@
-From f0e49690a6da92079d03afbf2aae413b273d2010 Mon Sep 17 00:00:00 2001
+From d3920dce139734e00bbe4447a16ef24dfe4d704a Mon Sep 17 00:00:00 2001
 From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-Date: Thu, 18 May 2017 19:38:37 +0200
+Date: Tue, 10 Oct 2017 19:51:02 +0200
 Subject: [PATCH] No runtime tests for endianness
 
 Replace build and execution of runtime test programs for determining
@@ -10,29 +10,27 @@ This improves support for cross-compilation.
 
 Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
 ---
- configure                     | 15 +++++++++++----
+ configure                     | 13 ++++++++++---
  src/sysdeps/trybigendian.c    | 16 ++++++++++++++++
  src/sysdeps/trylittleendian.c | 19 +++++++++++++++++++
- 3 files changed, 46 insertions(+), 4 deletions(-)
+ 3 files changed, 45 insertions(+), 3 deletions(-)
  create mode 100644 src/sysdeps/trybigendian.c
  create mode 100644 src/sysdeps/trylittleendian.c
 
 diff --git a/configure b/configure
-index 1eaccd3..5fffc34 100755
+index f34dcd0..f2a77f3 100755
 --- a/configure
 +++ b/configure
-@@ -471,13 +471,20 @@ EOF
-   fi
+@@ -478,12 +478,19 @@ EOF
    exec 3>&-
  
--  echo "Checking system endianness..."
--  $CC_AUTO $CPPFLAGS_AUTO $CFLAGS_AUTO -o tryendianness src/sysdeps/tryendianness.c
+   echo "Checking system endianness..."
+-  $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST $LDFLAGS_AUTO $LDFLAGS $LDFLAGS_POST -o tryendianness src/sysdeps/tryendianness.c
 -  endianness=$(./tryendianness) || fail "$0: unable to determine endianness"
-+    echo "Checking system endianness..."
-+  if $CC_AUTO $CPPFLAGS_AUTO $CFLAGS_AUTO -o trybigendian src/sysdeps/trybigendian.c 2>/dev/null; then
++  if $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST $LDFLAGS_AUTO $LDFLAGS $LDFLAGS_POST -o trybigendian src/sysdeps/trybigendian.c 2>/dev/null; then
 +      endianness=big
 +  else
-+      if $CC_AUTO $CPPFLAGS_AUTO $CFLAGS_AUTO -o trylittleendian src/sysdeps/trylittleendian.c 2>/dev/null; then
++      if $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST $LDFLAGS_AUTO $LDFLAGS $LDFLAGS_POST -o trylittleendian src/sysdeps/trylittleendian.c 2>/dev/null; then
 +          endianness=little
 +      else
 +          fail "$0: unable to determine endianness"
@@ -94,5 +92,5 @@ index 0000000..68b93c1
 +	return 0;
 +}
 -- 
-2.9.3
+2.13.6
 
diff --git a/package/skalibs/0002-No-runtime-tests-for-type-sizes.patch b/package/skalibs/0002-No-runtime-tests-for-type-sizes.patch
index b1fdcfb..3ee0cdd 100644
--- a/package/skalibs/0002-No-runtime-tests-for-type-sizes.patch
+++ b/package/skalibs/0002-No-runtime-tests-for-type-sizes.patch
@@ -1,6 +1,6 @@
-From 91045c0f5fa8f126fa7a407e467b6d941e7ef602 Mon Sep 17 00:00:00 2001
+From df3a3e708653ca1cdb0eda77bbda5cb8de177571 Mon Sep 17 00:00:00 2001
 From: "Van Bemten, Lionel (Nokia - BE/Antwerp)" <lionel.van_bemten@nokia.com>
-Date: Thu, 18 May 2017 19:38:46 +0200
+Date: Tue, 10 Oct 2017 19:51:18 +0200
 Subject: [PATCH] No runtime tests for type sizes
 
 Replace build and execution of runtime test programs for determining
@@ -11,11 +11,11 @@ This improves support for cross-compilation.
 Signed-off-by: "Van Bemten, Lionel (Nokia - BE/Antwerp)" <lionel.van_bemten@nokia.com>
 Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
 ---
- configure | 75 ++++++++++++++++++++++++++++++++++++++++++++++++++-------------
- 1 file changed, 60 insertions(+), 15 deletions(-)
+ configure | 77 ++++++++++++++++++++++++++++++++++++++++++++++++++-------------
+ 1 file changed, 61 insertions(+), 16 deletions(-)
 
 diff --git a/configure b/configure
-index 8ba948e..b129556 100755
+index f2a77f3..8348b1f 100755
 --- a/configure
 +++ b/configure
 @@ -154,25 +154,70 @@ choose () {
@@ -37,7 +37,7 @@ index 8ba948e..b129556 100755
 +  return 0;
 +}
 +EOF
-+    if $CC_AUTO $CPPFLAGS_AUTO $CFLAGS_AUTO $LDFLAGS_AUTO -o trysizeof${abbr} trysizeof${abbr}.c 2>/dev/null; then
++    if $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST $LDFLAGS_AUTO $LDFLAGS $LDFLAGS_POST -o trysizeof${abbr} trysizeof${abbr}.c 2>/dev/null; then
 +        r=true
 +        break
 +    fi
@@ -64,7 +64,7 @@ index 8ba948e..b129556 100755
 +  return 0;
 +}
 +EOF
-+  if $CC_AUTO $CPPFLAGS_AUTO $CFLAGS_AUTO $LDFLAGS_AUTO -o trysignof${abbr} trysignof${abbr}.c 2>/dev/null; then
++  if $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST $LDFLAGS_AUTO $LDFLAGS $LDFLAGS_POST -o trysignof${abbr} trysignof${abbr}.c 2>/dev/null; then
 +    echo "#define ${package_macro_name}_HASSIGNED${caps}" >> $sysdeps/sysdeps.h
 +    echo "#undef ${package_macro_name}_HASUNSIGNED${caps}" >> $sysdeps/sysdeps.h
 +    echo "signed${abbr}: yes" >> $sysdeps/sysdeps
@@ -78,7 +78,7 @@ index 8ba948e..b129556 100755
 +
  trytypes () {
    echo "Checking size and signedness of standard types..."
--  $CC_AUTO $CPPFLAGS_AUTO $CFLAGS_AUTO $LDFLAGS_AUTO -o output-types src/sysdeps/output-types.c
+-  $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST $LDFLAGS_AUTO $LDFLAGS $LDFLAGS_POST -o output-types src/sysdeps/output-types.c
 -  ./output-types >> $sysdeps/sysdeps
 -  ./output-types | grep -F sizeof | while read key value ; do
 -    caps=$(echo $key | sed s/:\$// | tr a-z A-Z)
@@ -105,5 +105,5 @@ index 8ba948e..b129556 100755
  }
  
 -- 
-2.9.4
+2.13.6
 
diff --git a/package/skalibs/0003-Make-linker-use-dummy-file-when-testing-libs.patch b/package/skalibs/0003-Make-linker-use-dummy-file-when-testing-libs.patch
index 55cc96a..0841179 100644
--- a/package/skalibs/0003-Make-linker-use-dummy-file-when-testing-libs.patch
+++ b/package/skalibs/0003-Make-linker-use-dummy-file-when-testing-libs.patch
@@ -1,6 +1,6 @@
-From 4d9aca413b42191223d8dc2ba9b4f943ee90c94b Mon Sep 17 00:00:00 2001
+From 02ef4599179ead87cc6d154a32acaa6627cbfca2 Mon Sep 17 00:00:00 2001
 From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-Date: Thu, 29 Dec 2016 19:36:24 +0100
+Date: Tue, 10 Oct 2017 19:51:34 +0200
 Subject: [PATCH] Make linker use dummy file when testing libs
 
 For some architectures, like Xtensa or HPPA, ld from binutils requires
@@ -18,19 +18,19 @@ Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 115fea3..7d38447 100755
+index 8348b1f..62e5981 100755
 --- a/configure
 +++ b/configure
-@@ -226,7 +226,7 @@ trylibs () {
+@@ -227,7 +227,7 @@ trylibs () {
    echo "Checking whether system has $2..." >&3
    shift 2
-   if $CC_AUTO $CPPFLAGS_AUTO $CFLAGS_AUTO -c -o try$name.o src/sysdeps/try$name.c 2>/dev/null ; then
--    until $CC_AUTO $CFLAGS_AUTO $LDFLAGS_AUTO -o /dev/null try$name.o $args 2>/dev/null ; do
-+    until $CC_AUTO $CFLAGS_AUTO $LDFLAGS_AUTO -o try$name try$name.o $args 2>/dev/null ; do
+   if $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST -c -o try$name.o src/sysdeps/try$name.c 2>/dev/null ; then
+-    until $CC_AUTO $CFLAGS_AUTO $CFLAGS $CFLAGS_POST $LDFLAGS_AUTO $LDFLAGS $LDFLAGS_POST -o /dev/null try$name.o $args 2>/dev/null ; do
++    until $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST -o try$name try$name.o $args 2>/dev/null ; do
        if test -z "$*" ; then
          rm -f try$name.o
          echo
-@@ -242,7 +242,7 @@ trylibs () {
+@@ -243,7 +243,7 @@ trylibs () {
      else
        echo "  ... yes, with$args" >&3
      fi
@@ -40,5 +40,5 @@ index 115fea3..7d38447 100755
    else
      echo
 -- 
-2.9.3
+2.13.6
 
diff --git a/package/skalibs/skalibs.hash b/package/skalibs/skalibs.hash
index 16af3af..1e0625f 100644
--- a/package/skalibs/skalibs.hash
+++ b/package/skalibs/skalibs.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 3572cb8c7d2ae9d16da5a0f3d23b48e013e0c957f1329d100f04dd5accb054c3  skalibs-2.6.0.0.tar.gz
+sha256 b11f515d29768497d648c7ae87e26f7441395a056ebbe3fe89596fe6454a557a  skalibs-2.6.0.1.tar.gz
diff --git a/package/skalibs/skalibs.mk b/package/skalibs/skalibs.mk
index 5be28d5..2588d27 100644
--- a/package/skalibs/skalibs.mk
+++ b/package/skalibs/skalibs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKALIBS_VERSION = 2.6.0.0
+SKALIBS_VERSION = 2.6.0.1
 SKALIBS_SITE = http://skarnet.org/software/skalibs
 SKALIBS_LICENSE = ISC
 SKALIBS_LICENSE_FILES = COPYING
