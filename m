From: Nigel Kukard <nkukard@lbsd.net>
Date: Wed, 31 Dec 2008 14:32:36 +0000
Subject: [Buildroot] deprecated ustat() vs. statfs()
Message-ID: <495B8284.3080805@lbsd.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I dont suppose this is the correct way to switch to statfs()?


--- xfsprogs-2.10.2_vanilla/libxfs/linux.c    2008-12-09
23:33:26.000000000 +0000
+++ xfsprogs-2.10.2_remove-deprecated/libxfs/linux.c    2008-12-31
14:30:45.000000000 +0000
@@ -21,7 +21,7 @@
 #include <mntent.h>
 #include <sys/stat.h>
 #undef ustat
-#include <sys/ustat.h>
+#include <sys/statfs.h>
 #include <sys/mount.h>
 #include <sys/ioctl.h>
 #include <sys/sysinfo.h>
@@ -49,7 +49,7 @@
 int
 platform_check_ismounted(char *name, char *block, struct stat64 *s, int
verbose)
 {
-    struct ustat    ust;
+    struct statfs    ust;
     struct stat64    st;
 
     if (!s) {
@@ -60,7 +60,7 @@
         s = &st;
     }
 
-    if (ustat(s->st_rdev, &ust) >= 0) {
+    if (statfs(s->st_rdev, &ust) >= 0) {
         if (verbose)
             fprintf(stderr,
                 _("%s: %s contains a mounted filesystem\n"),
