From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Wed, 10 Aug 2016 22:08:36 +0530
Subject: [Buildroot] [PATCH 1/2] mtd: fix build failure with blackfin
	external toolchain
Message-ID: <1470847117-14956-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With blackfin uClibc toolchain, we see following build errors

integck.c: In function 'parse_mount_options':
integck.c:2889: error: 'MS_DIRSYNC' undeclared (first use in this function)
integck.c:2889: error: (Each undeclared identifier is reported only once
integck.c:2889: error: for each function it appears in.)
integck.c:2899: error: 'MS_RELATIME' undeclared (first use in this function)
<builtin>: recipe for target 'integck' failed
make[2]: *** [integck] Error 1

header <sys/mount.h> from this toolchain is missing definitions for
MS_DIRSYNC and MS_RELATIME mount flags. But those are available from
header <linux/fs.h>. Even tests/fs-tests/lib/tests.c uses these flags
and includes both <sys/mount.h> and <linux/fs.h> headers.

This patch fixes above build error by including header <linux/fs.h>

Fixes:
http://autobuild.buildroot.net/results/6a1/6a1bd73cc56cd257fa939702728802b63446473e/

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 ...003-fs-tests-integrity-include-linux-fs.h.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/mtd/0003-fs-tests-integrity-include-linux-fs.h.patch

diff --git a/package/mtd/0003-fs-tests-integrity-include-linux-fs.h.patch b/package/mtd/0003-fs-tests-integrity-include-linux-fs.h.patch
new file mode 100644
index 0000000..c31d39e
--- /dev/null
+++ b/package/mtd/0003-fs-tests-integrity-include-linux-fs.h.patch
@@ -0,0 +1,45 @@
+From 2965384dfa330750e23a52a0edf792487db6a886 Mon Sep 17 00:00:00 2001
+From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
+Date: Wed, 10 Aug 2016 21:01:58 +0530
+Subject: [PATCH 1/1] fs-tests: integrity: include <linux/fs.h>
+
+With blackfin uClibc toolchain, we see following build errors
+
+integck.c: In function 'parse_mount_options':
+integck.c:2889: error: 'MS_DIRSYNC' undeclared (first use in this function)
+integck.c:2889: error: (Each undeclared identifier is reported only once
+integck.c:2889: error: for each function it appears in.)
+integck.c:2899: error: 'MS_RELATIME' undeclared (first use in this function)
+<builtin>: recipe for target 'integck' failed
+make[2]: *** [integck] Error 1
+
+header <sys/mount.h> from this toolchain is missing definitions for
+MS_DIRSYNC and MS_RELATIME mount flags. But those are available from
+header <linux/fs.h>. Even tests/fs-tests/lib/tests.c uses these flags
+and includes both <sys/mount.h> and <linux/fs.h> headers.
+
+This patch fixes above build error by including header <linux/fs.h>
+
+This build error is found by Buildroot autobuilder
+http://autobuild.buildroot.net/results/6a1/6a1bd73cc56cd257fa939702728802b63446473e/
+
+Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
+---
+ tests/fs-tests/integrity/integck.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
+index 8badd1f..31215ff 100644
+--- a/tests/fs-tests/integrity/integck.c
++++ b/tests/fs-tests/integrity/integck.c
+@@ -37,6 +37,7 @@
+ #include <sys/vfs.h>
+ #include <sys/mount.h>
+ #include <sys/statvfs.h>
++#include <linux/fs.h>
+ 
+ #define PROGRAM_VERSION "1.1"
+ #define PROGRAM_NAME "integck"
+-- 
+2.6.2
+
-- 
2.6.2
