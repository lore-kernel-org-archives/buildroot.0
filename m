From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 24 Apr 2020 17:04:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/libtasn1: fix build with gcc 4.8
Message-ID: <20200424150449.822656-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/0030c903abf6c964806a97067af94a99867a3896

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...orpus2array.c-fix-build-with-gcc-4.8.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/libtasn1/0002-fuzz-corpus2array.c-fix-build-with-gcc-4.8.patch

diff --git a/package/libtasn1/0002-fuzz-corpus2array.c-fix-build-with-gcc-4.8.patch b/package/libtasn1/0002-fuzz-corpus2array.c-fix-build-with-gcc-4.8.patch
new file mode 100644
index 0000000000..e44dd5c8e4
--- /dev/null
+++ b/package/libtasn1/0002-fuzz-corpus2array.c-fix-build-with-gcc-4.8.patch
@@ -0,0 +1,46 @@
+From f633abcfb9cff19efca53aa68ddc96217e7487ae Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 24 Apr 2020 16:57:35 +0200
+Subject: [PATCH] fuzz/corpus2array.c: fix build with gcc 4.8
+
+Fix the following build failure with gcc 4.8:
+
+corpus2array.c:123:4: error: 'for' loop initial declarations are only allowed in C99 mode
+    for (int i = 8; i < 32 ; i++) {
+    ^
+corpus2array.c:123:4: note: use option -std=c99 or -std=gnu99 to compile your code
+
+Fixes:
+ - http://autobuild.buildroot.org/results/0030c903abf6c964806a97067af94a99867a3896
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent yet]
+---
+ fuzz/corpus2array.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/fuzz/corpus2array.c b/fuzz/corpus2array.c
+index fc30524..b2d01ee 100644
+--- a/fuzz/corpus2array.c
++++ b/fuzz/corpus2array.c
+@@ -112,7 +112,7 @@ int main(void)
+ 			printf("  { NULL");
+ 
+ 		if (e.type) {
+-			int add = 0;
++			int i, add = 0;
+ 
+ 			// we leave the lowest 8 bit out
+ 			if ((e.type & 0xFF) == 17) {
+@@ -120,7 +120,7 @@ int main(void)
+ 				add = 1;
+ 			}
+ 
+-			for (int i = 8; i < 32 ; i++) {
++			for (i = 8; i < 32 ; i++) {
+ 				if ((e.type & (1U << i)) && typename[i - 8]) {
+ 					printf(add ? "|%s" : ", %s", typename[i - 8]);
+ 					add = 1;
+-- 
+2.25.1
+
-- 
2.25.1
