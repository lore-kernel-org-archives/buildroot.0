From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue,  4 Jul 2017 18:58:22 +0200
Subject: [Buildroot] [PATCH] skalibs: fix bashism in type sizes patch
Message-ID: <20170704165822.12867-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of using a Bash-only variable substitution feature in the patch
to determine type size at build time, invoke `sed` to make it portable.

Fixes:
http://autobuild.buildroot.net/results/023/023d71356376bea13d16c43898a0347e41cd19b9/
Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 .../skalibs/0002-No-runtime-tests-for-type-sizes.patch    | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/skalibs/0002-No-runtime-tests-for-type-sizes.patch b/package/skalibs/0002-No-runtime-tests-for-type-sizes.patch
index 694b5d0..b1fdcfb 100644
--- a/package/skalibs/0002-No-runtime-tests-for-type-sizes.patch
+++ b/package/skalibs/0002-No-runtime-tests-for-type-sizes.patch
@@ -1,4 +1,4 @@
-From 2596155d76e4f2a3eab45ef7d095ade996b8b2a5 Mon Sep 17 00:00:00 2001
+From 91045c0f5fa8f126fa7a407e467b6d941e7ef602 Mon Sep 17 00:00:00 2001
 From: "Van Bemten, Lionel (Nokia - BE/Antwerp)" <lionel.van_bemten@nokia.com>
 Date: Thu, 18 May 2017 19:38:46 +0200
 Subject: [PATCH] No runtime tests for type sizes
@@ -11,14 +11,14 @@ This improves support for cross-compilation.
 Signed-off-by: "Van Bemten, Lionel (Nokia - BE/Antwerp)" <lionel.van_bemten@nokia.com>
 Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
 ---
- configure | 74 ++++++++++++++++++++++++++++++++++++++++++++++++++-------------
- 1 file changed, 59 insertions(+), 15 deletions(-)
+ configure | 75 ++++++++++++++++++++++++++++++++++++++++++++++++++-------------
+ 1 file changed, 60 insertions(+), 15 deletions(-)
 
 diff --git a/configure b/configure
-index 5fffc34..115fea3 100755
+index 8ba948e..b129556 100755
 --- a/configure
 +++ b/configure
-@@ -154,25 +154,69 @@ choose () {
+@@ -154,25 +154,70 @@ choose () {
    fi
  }
  
@@ -84,7 +84,8 @@ index 5fffc34..115fea3 100755
 -    caps=$(echo $key | sed s/:\$// | tr a-z A-Z)
 -    echo "#define ${package_macro_name}_${caps} $value" >> $sysdeps/sysdeps.h
 +  for t in "unsigned short" "unsigned int" "unsigned long"; do
-+    findtypesize "$t" "${t/nsigned /}"
++    abbr=$(echo "$t" | sed -e 's/nsigned //')
++    findtypesize "$t" "${abbr}"
    done
 -  ./output-types | grep -F signed | while read key value ; do
 -    caps=$(echo $key | sed s/:\$// | tr a-z A-Z)
@@ -104,5 +105,5 @@ index 5fffc34..115fea3 100755
  }
  
 -- 
-2.9.3
+2.9.4
 
-- 
2.9.4
