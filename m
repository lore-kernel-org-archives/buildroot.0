From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 22:53:51 +0200
Subject: [Buildroot] [git commit] libstrophe: fix detection of libxml2
Message-ID: <20140420205505.2B75C9C838@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c946a78996c25a65861672389a63ac59b3a5a4bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch to libstrophe to fix a typo that prevented a
proper detection of libxml2. This patch has been submitted upstream,
see https://github.com/metajack/libstrophe/pull/46.

Fixes:

 http://autobuild.buildroot.org/results/499/499ffd50ec58b54343d6606c0f1bf7cd04f14e1c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-configure.ac-fix-misdetection-of-libxml2.patch |   32 ++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/libstrophe/libstrophe-02-configure.ac-fix-misdetection-of-libxml2.patch b/package/libstrophe/libstrophe-02-configure.ac-fix-misdetection-of-libxml2.patch
new file mode 100644
index 0000000..7f6610c
--- /dev/null
+++ b/package/libstrophe/libstrophe-02-configure.ac-fix-misdetection-of-libxml2.patch
@@ -0,0 +1,32 @@
+From 816df67088fc590c9e8f8598a1a7e90ff1fc425d Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 20 Apr 2014 21:07:41 +0200
+Subject: [PATCH] configure.ac: fix misdetection of libxml2
+
+A small typo in the detection of libxml2 leads to a successful
+pkg-config discovery of libxml2 to be ignored. As a consequence,
+configure.ac falls back to detecting the host libxml2, which does not
+work in cross-compilation situation. This commit fixes this small
+typo.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index e4f9299..a3e48ee 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -16,7 +16,7 @@ AC_ARG_WITH([libxml2],
+ if test "x$with_libxml2" != xno; then
+   PKG_CHECK_MODULES([libxml2], [libxml-2.0 >= 2.7],
+                     [with_libxml2=yes], [dummy=1])
+-  if test "x$with_libxml2" != yes; then
++  if test "x$with_libxml2" != xyes; then
+     old_CFLAGS=$CFLAGS
+     CFLAGS="-I /usr/include/libxml2"
+     AC_CHECK_HEADER([libxml/parser.h],
+-- 
+1.9.2
+
