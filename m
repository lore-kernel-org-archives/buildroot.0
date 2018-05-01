From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue,  1 May 2018 21:08:52 +0200
Subject: [Buildroot] [PATCH 1/5] skalibs: bump version to 2.6.4.0
In-Reply-To: <20180501190856.19386-1-eric.le.bihan.dev@free.fr>
References: <20180501190856.19386-1-eric.le.bihan.dev@free.fr>
Message-ID: <20180501190856.19386-2-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 .../0002-No-runtime-tests-for-type-sizes.patch     | 40 +++++++++++++---------
 package/skalibs/skalibs.hash                       |  2 +-
 package/skalibs/skalibs.mk                         |  2 +-
 3 files changed, 25 insertions(+), 19 deletions(-)

diff --git a/package/skalibs/0002-No-runtime-tests-for-type-sizes.patch b/package/skalibs/0002-No-runtime-tests-for-type-sizes.patch
index 3ee0cddb75..ad3b19eb7d 100644
--- a/package/skalibs/0002-No-runtime-tests-for-type-sizes.patch
+++ b/package/skalibs/0002-No-runtime-tests-for-type-sizes.patch
@@ -1,6 +1,6 @@
-From df3a3e708653ca1cdb0eda77bbda5cb8de177571 Mon Sep 17 00:00:00 2001
+From f411b502222c8fe442d7b3beb00b530c9e16b7a2 Mon Sep 17 00:00:00 2001
 From: "Van Bemten, Lionel (Nokia - BE/Antwerp)" <lionel.van_bemten@nokia.com>
-Date: Tue, 10 Oct 2017 19:51:18 +0200
+Date: Sun, 29 Apr 2018 19:53:40 +0200
 Subject: [PATCH] No runtime tests for type sizes
 
 Replace build and execution of runtime test programs for determining
@@ -11,14 +11,14 @@ This improves support for cross-compilation.
 Signed-off-by: "Van Bemten, Lionel (Nokia - BE/Antwerp)" <lionel.van_bemten@nokia.com>
 Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
 ---
- configure | 77 ++++++++++++++++++++++++++++++++++++++++++++++++++-------------
- 1 file changed, 61 insertions(+), 16 deletions(-)
+ configure | 75 ++++++++++++++++++++++++++++++++++++++++++++++++++-------------
+ 1 file changed, 60 insertions(+), 15 deletions(-)
 
 diff --git a/configure b/configure
-index f2a77f3..8348b1f 100755
+index 434eec8..c09e9c8 100755
 --- a/configure
 +++ b/configure
-@@ -154,25 +154,70 @@ choose () {
+@@ -155,23 +155,69 @@ choose () {
    fi
  }
  
@@ -65,12 +65,12 @@ index f2a77f3..8348b1f 100755
 +}
 +EOF
 +  if $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST $LDFLAGS_AUTO $LDFLAGS $LDFLAGS_POST -o trysignof${abbr} trysignof${abbr}.c 2>/dev/null; then
-+    echo "#define ${package_macro_name}_HASSIGNED${caps}" >> $sysdeps/sysdeps.h
-+    echo "#undef ${package_macro_name}_HASUNSIGNED${caps}" >> $sysdeps/sysdeps.h
++    echo "#define ${package_macro_name}_HAS${caps}" >> $sysdeps/sysdeps.h
++    echo "#undef ${package_macro_name}_HASUN${caps}" >> $sysdeps/sysdeps.h
 +    echo "signed${abbr}: yes" >> $sysdeps/sysdeps
 +  else
-+    echo "#undef ${package_macro_name}_HASSIGNED${caps}" >> $sysdeps/sysdeps.h
-+    echo "#define ${package_macro_name}_HASUNSIGNED${caps}" >> $sysdeps/sysdeps.h
++    echo "#undef ${package_macro_name}_HAS${caps}" >> $sysdeps/sysdeps.h
++    echo "#define ${package_macro_name}_HASUN${caps}" >> $sysdeps/sysdeps.h
 +    echo "signed${abbr}: no" >> $sysdeps/sysdeps
 +  fi
 +  rm -f trysignof${abbr} trysignof${abbr}.c
@@ -90,20 +90,26 @@ index f2a77f3..8348b1f 100755
 -  ./output-types | grep -F signed | while read key value ; do
 -    caps=$(echo $key | sed s/:\$// | tr a-z A-Z)
 -    if test $value = yes ; then
--      echo "#define ${package_macro_name}_HASSIGNED${caps}"
--      echo "#undef ${package_macro_name}_HASUNSIGNED${caps}"
+-      echo "#define ${package_macro_name}_HAS${caps}"
+-      echo "#undef ${package_macro_name}_HASUN${caps}"
 -    else
--      echo "#undef ${package_macro_name}_HASSIGNED${caps}"
--      echo "#define ${package_macro_name}_HASUNSIGNED${caps}"
+-      echo "#undef ${package_macro_name}_HAS${caps}"
+-      echo "#define ${package_macro_name}_HASUN${caps}"
 -    fi >> $sysdeps/sysdeps.h
 +  for t in size uid gid pid time dev ino; do
 +    findtypesize "${t}_t" "$t"
 +    findtypesign "${t}_t" "$t"
    done
--  rm -f output-types
+   rm -f output-types
    echo "  ... done"
- }
+@@ -548,7 +594,6 @@ EOF
+   choose cl itimer ITIMER 'setitimer()'
+   choose cl namespaces NAMESPACES 'namespaces'
+   choose cl nsgetparent NSGETPARENT 'NS_GET_PARENT'
+-  choose cl explicit_bzero EXPLICIT_BZERO 'explicit_bzero()'
  
+   echo '#endif' >> $sysdeps/sysdeps.h
+ fi
 -- 
-2.13.6
+2.14.3
 
diff --git a/package/skalibs/skalibs.hash b/package/skalibs/skalibs.hash
index a65aaadb3d..0646dbc0e4 100644
--- a/package/skalibs/skalibs.hash
+++ b/package/skalibs/skalibs.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 8508ca00d4e2355e9ec0ec7f4808e98b349999d6732d2f123ac53b4df5260c81  skalibs-2.6.3.1.tar.gz
+sha256 30ac73f1e8da6387fcfa19cfe1e326a143b4d811aaf532988b280daefa56dcc7  skalibs-2.6.4.0.tar.gz
 sha256 3eadcf980c40da0f257b8292d805ff41e5e5a908c1942315d9a627732e1aa012  COPYING
diff --git a/package/skalibs/skalibs.mk b/package/skalibs/skalibs.mk
index 2ce0c33ff0..7672b0d31a 100644
--- a/package/skalibs/skalibs.mk
+++ b/package/skalibs/skalibs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKALIBS_VERSION = 2.6.3.1
+SKALIBS_VERSION = 2.6.4.0
 SKALIBS_SITE = http://skarnet.org/software/skalibs
 SKALIBS_LICENSE = ISC
 SKALIBS_LICENSE_FILES = COPYING
-- 
2.14.3
