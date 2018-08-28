From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Aug 2018 22:43:26 +0200
Subject: [Buildroot] [git commit] atop: fix minor()/major() build failure
 due to glibc 2.28
Message-ID: <20180907111604.8F2717FEB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ffde065d2829d90cddc70f7c2e8f5775e59cbe9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

glibc 2.28 no longer includes <sys/sysmacros.h> from <sys/types.h>,
and therefore <sys/sysmacros.h> must be included explicitly when
major()/minor() are used. See glibc upstream commit:

  https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commitdiff;h=e16deca62e16f645213dffd4ecd1153c37765f17

This commit adds a patch to directly include <sys/sysmacros.h> into
photosyst.c where minor() and major() macros are used.

Patch has been taken from atop upstream pull request:

  https://github.com/Atoptool/atop/pull/35

Fixes:

  http://autobuild.buildroot.net/results/3fc0f18ed94697c404e7ff3751781789170c4fe5/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
[Thomas: improve commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ude-sysmacros.h-to-compile-with-newer-gcc.patch | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/package/atop/0001-Include-sysmacros.h-to-compile-with-newer-gcc.patch b/package/atop/0001-Include-sysmacros.h-to-compile-with-newer-gcc.patch
new file mode 100644
index 0000000000..a80be7b736
--- /dev/null
+++ b/package/atop/0001-Include-sysmacros.h-to-compile-with-newer-gcc.patch
@@ -0,0 +1,52 @@
+From 414127c03669b4eedc85778a7bff80cf601311d8 Mon Sep 17 00:00:00 2001
+From: SjonHortensius <SjonHortensius@users.noreply.github.com>
+Date: Fri, 24 Aug 2018 18:26:58 +0200
+Subject: [PATCH] Include sysmacros.h to compile with newer gcc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Older gcc throws a warning
+```
+photosyst.c: In function 'lvmmapname':
+photosyst.c:1465:13: warning: In the GNU C Library, "major" is defined
+ by <sys/sysmacros.h>. For historical compatibility, it is
+ currently defined by <sys/types.h> as well, but we plan to
+ remove this soon. To use "major", include <sys/sysmacros.h>
+ directly. If you did not intend to use a system-defined macro
+ "major", you should undefine it after including <sys/types.h>.
+     dmp->major  = major(statbuf.st_rdev);
+```
+
+Newer gcc throws an error:
+
+```
+photosyst.c: In function ???lvmmapname???:
+photosyst.c:1482:19: error: called object ???major??? is not a function or function pointer
+     dmp->major  = major(statbuf.st_rdev);
+                   ^~~~~
+photosyst.c:1437:25: note: declared here
+ lvmmapname(unsigned int major, unsigned int minor,
+            ~~~~~~~~~~~~~^~~~~
+```
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ photosyst.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/photosyst.c b/photosyst.c
+index 19cbbe1..50841a1 100644
+--- a/photosyst.c
++++ b/photosyst.c
+@@ -152,6 +152,7 @@
+ static const char rcsid[] = "$Id: photosyst.c,v 1.38 2010/11/19 07:40:40 gerlof Exp $";
+ 
+ #include <sys/types.h>
++#include <sys/sysmacros.h>
+ #include <stdio.h>
+ #include <string.h>
+ #include <unistd.h>
+-- 
+2.17.1
+
