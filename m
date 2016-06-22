From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 22 Jun 2016 11:47:55 +0100
Subject: [Buildroot] [PATCH] openmpi: fix uClibc regdef.h include path
Message-ID: <1466592475-44093-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In uClibc the regdef.h file is located under the sys directory. Due to
that openmpi is failing to build with an error like this one:

atomic-asm.S:7:20: fatal error: regdef.h: No such file or directory
 #include <regdef.h>

Add a patch in order to detect when we are building with uClibc and
therefore include regdef.h from the right location.

Pull request sent upstream:
  https://github.com/open-mpi/ompi-release/pull/1241

Fixes:
  http://autobuild.buildroot.net/results/de5/de524cbef057c7c3cb45125ecf62202a2f74129c/
  http://autobuild.buildroot.net/results/165/165bf4156b27ecea0b226550a42560f789659b03/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...se-MIPS.asm-fix-uClibc-regdef.h-include-p.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/openmpi/0001-opal-asm-base-MIPS.asm-fix-uClibc-regdef.h-include-p.patch

diff --git a/package/openmpi/0001-opal-asm-base-MIPS.asm-fix-uClibc-regdef.h-include-p.patch b/package/openmpi/0001-opal-asm-base-MIPS.asm-fix-uClibc-regdef.h-include-p.patch
new file mode 100644
index 0000000..02f0188
--- /dev/null
+++ b/package/openmpi/0001-opal-asm-base-MIPS.asm-fix-uClibc-regdef.h-include-p.patch
@@ -0,0 +1,35 @@
+From 8cb4d489256866038eb6935afea36ee721b14bd4 Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Wed, 22 Jun 2016 11:11:10 +0100
+Subject: [PATCH] opal/asm/base/MIPS.asm: fix uClibc regdef.h include path
+
+Otherwise it will fail with an error like this one:
+
+atomic-asm.S:7:20: fatal error: regdef.h: No such file or directory
+ #include <regdef.h>
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ opal/asm/base/MIPS.asm | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/opal/asm/base/MIPS.asm b/opal/asm/base/MIPS.asm
+index 3dd758c..83c12f2 100644
+--- a/opal/asm/base/MIPS.asm
++++ b/opal/asm/base/MIPS.asm
+@@ -5,7 +5,12 @@ START_FILE
+ #else
+ #include <asm.h>
+ #endif
++#include <features.h>
++#ifdef __UCLIBC__
++#include <sys/regdef.h>
++#else
+ #include <regdef.h>
++#endif
+ 	
+ 	TEXT
+ 
+-- 
+2.7.3
+
-- 
2.7.3
