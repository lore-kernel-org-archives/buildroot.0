From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Sep 2015 23:39:54 +0200
Subject: [Buildroot] [git commit] udisks: fix build with newer glibc versions
Message-ID: <20150907221137.CCE8E7FA68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8be99506fbc6ba2bde9094f4ca1497d79a1b8a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport an upstream patch to fix the build with newer glibc versions.
This is how the failure looks like:

job-drive-detach.c: In function 'sysfs_exists':
job-drive-detach.c:44:15: error: storage size of 'statbuf' isn't known
   struct stat statbuf;

Fixes:

  http://autobuild.buildroot.net/results/ab3/ab36c2a1d2ca41a4d9ec6bab7d8d45678dbc5dcd/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-fix-build-with-newer-glibc-versions.patch |   29 ++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/udisks/0001-fix-build-with-newer-glibc-versions.patch b/package/udisks/0001-fix-build-with-newer-glibc-versions.patch
new file mode 100644
index 0000000..336fc44
--- /dev/null
+++ b/package/udisks/0001-fix-build-with-newer-glibc-versions.patch
@@ -0,0 +1,29 @@
+Fix build with newer glibc versions
+
+This patch has been backported from upstream:
+
+http://cgit.freedesktop.org/udisks/commit/?h=udisks1&id=9829152b12a8924d2e091a00133ed1a3a7ba75c0
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From 9829152b12a8924d2e091a00133ed1a3a7ba75c0 Mon Sep 17 00:00:00 2001
+From: Alexandre Rostovtsev <tetromino@gentoo.org>
+Date: Fri, 29 May 2015 21:09:39 -0400
+Subject: fix build with newer glibc versions
+
+https://bugs.freedesktop.org/show_bug.cgi?id=90778
+
+diff --git a/src/helpers/job-drive-detach.c b/src/helpers/job-drive-detach.c
+index eeafcab..d122a1f 100644
+--- a/src/helpers/job-drive-detach.c
++++ b/src/helpers/job-drive-detach.c
+@@ -18,6 +18,7 @@
+  *
+  */
+ 
++#include <sys/stat.h>
+ #include <stdio.h>
+ #include <string.h>
+ #include <errno.h>
+-- 
+cgit v0.10.2
