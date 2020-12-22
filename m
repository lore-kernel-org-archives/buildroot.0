From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Dec 2020 11:39:38 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/tinycbor: fix
 build on musl
Message-ID: <20201222102344.D23F288270@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f15816d79b7c2863a91de7e5b8ee196be95d596
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Fixes:
 - http://autobuild.buildroot.org/results/c23b694442e7f86cbdd14d8789b12e6a8fd26a70

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit eaff5c39c15e3ec071a16c47911f72e9be9168c0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...01-Enable-build-for-different-c-libraries.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

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
