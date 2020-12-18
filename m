From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 18 Dec 2020 22:47:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/tinycbor: fix build on musl
Message-ID: <20201218214740.622346-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/c23b694442e7f86cbdd14d8789b12e6a8fd26a70

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...able-build-for-different-c-libraries.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/tinycbor/0001-Enable-build-for-different-c-libraries.patch

diff --git a/package/tinycbor/0001-Enable-build-for-different-c-libraries.patch b/package/tinycbor/0001-Enable-build-for-different-c-libraries.patch
new file mode 100644
index 0000000000..40f9288604
--- /dev/null
+++ b/package/tinycbor/0001-Enable-build-for-different-c-libraries.patch
@@ -0,0 +1,39 @@
+From 085ca40781f7c39febe6d14fb7e5cba342e1804b Mon Sep 17 00:00:00 2001
+From: Ricardo Crudo <ricardo.crudo@gmail.com>
+Date: Sat, 30 May 2020 22:03:01 +0200
+Subject: [PATCH] Enable build for different c libraries
+
+The open_memstream.c was using GLIBC macro definition to test if the
+library is building on a Linux box. This makes impossible to build
+tinycbor against other C libraries, as musl for example.
+
+Signed-off-by: Ricardo Crudo <ricardo.crudo@gmail.com>
+[Retrieved from:
+https://github.com/intel/tinycbor/commit/085ca40781f7c39febe6d14fb7e5cba342e1804b]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/open_memstream.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/open_memstream.c b/src/open_memstream.c
+index 18f3de8..3365378 100644
+--- a/src/open_memstream.c
++++ b/src/open_memstream.c
+@@ -38,7 +38,7 @@
+ #ifdef __APPLE__
+ typedef int RetType;
+ typedef int LenType;
+-#elif __GLIBC__
++#elif __linux__
+ typedef ssize_t RetType;
+ typedef size_t LenType;
+ #else
+@@ -101,7 +101,7 @@ FILE *open_memstream(char **bufptr, size_t *lenptr)
+ 
+ #ifdef __APPLE__
+     return funopen(b, NULL, write_to_buffer, NULL, close_buffer);
+-#elif __GLIBC__
++#elif __linux__
+     static const cookie_io_functions_t vtable = {
+         NULL,
+         write_to_buffer,
-- 
2.29.2
