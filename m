From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 22 Apr 2019 19:36:12 +0200
Subject: [Buildroot] [PATCH 1/2] package/efl: fix build with gcc < 5.0
Message-ID: <20190422173613.5920-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

__has_attribute has been introduced with gcc 5 [1].

[1] https://www.gnu.org/software/gcc/gcc-5/changes.html

Fixes:
http://autobuild.buildroot.net/results/64ab825048fac1654b0d0698740ddf857fcc0afa/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...-add-missing-__has_attribute-definitions-.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/efl/0001-libunibreak-add-missing-__has_attribute-definitions-.patch

diff --git a/package/efl/0001-libunibreak-add-missing-__has_attribute-definitions-.patch b/package/efl/0001-libunibreak-add-missing-__has_attribute-definitions-.patch
new file mode 100644
index 0000000000..3b70d15293
--- /dev/null
+++ b/package/efl/0001-libunibreak-add-missing-__has_attribute-definitions-.patch
@@ -0,0 +1,48 @@
+From c394fba4c4c820ea2b7200306ff033e4bbc12ead Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Mon, 22 Apr 2019 19:26:09 +0200
+Subject: [PATCH] libunibreak: add missing __has_attribute definitions for old
+ compilers
+
+__has_attribute has been introduced with gcc 5 [1].
+
+[1] https://www.gnu.org/software/gcc/gcc-5/changes.html
+
+Fixes:
+http://autobuild.buildroot.net/results/64ab825048fac1654b0d0698740ddf857fcc0afa/build-end.log
+
+Upstream status:
+https://phab.enlightenment.org/T7818
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/static_libs/libunibreak/wordbreak.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/static_libs/libunibreak/wordbreak.c b/src/static_libs/libunibreak/wordbreak.c
+index 017e0fd091..50c830c7cc 100644
+--- a/src/static_libs/libunibreak/wordbreak.c
++++ b/src/static_libs/libunibreak/wordbreak.c
+@@ -209,6 +209,9 @@ static void set_wordbreaks(
+                 posLast = posCur;
+                 break;
+             }
++#ifndef __has_attribute
++# define __has_attribute(x) 0
++#endif
+ #if __has_attribute(fallthrough)
+            __attribute__((fallthrough));
+ #endif
+@@ -325,6 +328,9 @@ static void set_wordbreaks(
+                 wbcSeqStart = wbcCur;
+                 posLast = posCur;
+             }
++#ifndef __has_attribute
++# define __has_attribute(x) 0
++#endif
+ #if __has_attribute(fallthrough)
+            __attribute__((fallthrough));
+ #endif
+-- 
+2.14.5
+
-- 
2.14.5
