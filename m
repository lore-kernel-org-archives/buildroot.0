From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 22:43:41 +0100
Subject: [Buildroot] [git commit] package/ltp-testsuite: fix build with
 glibc 2.28 or uclibc-ng 1.0.30
Message-ID: <20181101214212.4DD91880D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39721cf1869328ace6f3b898cba09145c9132757
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LTP fails to build 20180926 with both glibc 2.28 and uclibc-ng 1.0.30,
due error in m4 macro check:

In file included from /home/rclinux/rc-buildroot-test/scripts/instance-0/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/sys/stat.h:446:0,
                 from ../../../../include/tst_safe_macros.h:26,
                 from ../../../../include/tst_test.h:85,
                 from statx05.c:27:
/home/rclinux/rc-buildroot-test/scripts/instance-0/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/bits/statx.h:87:5: note: expected 'struct statx * restrict' but argument is of type 'struct statx *'
 int statx (int __dirfd, const char *__restrict __path, int __flags,
     ^~~~~
<builtin>: recipe for target 'statx01' failed
make[5]: *** [statx01] Error 1
<builtin>: recipe for target 'statx05' failed
make[5]: *** [statx05] Error 1

This patch requires to regenerate configure.

Fixes:
http://autobuild.buildroot.net/results/69566d0c728970a6dd6a793b08c5804df3cc00eb
http://autobuild.buildroot.net/results/3c53ddfaca70b490a401c9123602965f3803cd0a
http://autobuild.buildroot.net/results/8fb63f627a4ba55afea49ad0566064d20021889a
http://autobuild.buildroot.net/results/496a1b40d378eaca98e532c03afb47e5291427b3
http://autobuild.buildroot.net/results/47abceeda8044029b6d3200f3877d4d2c494202c

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Reported-by: Florian La Roche <F.LaRoche@pilz.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-statx-fix-compile-errors.patch            | 35 ++++++++++++++++++++++
 package/ltp-testsuite/ltp-testsuite.mk             |  3 ++
 2 files changed, 38 insertions(+)

diff --git a/package/ltp-testsuite/0002-statx-fix-compile-errors.patch b/package/ltp-testsuite/0002-statx-fix-compile-errors.patch
new file mode 100644
index 0000000000..6ddd2c9054
--- /dev/null
+++ b/package/ltp-testsuite/0002-statx-fix-compile-errors.patch
@@ -0,0 +1,35 @@
+From a945304b6a2286d0665c70250cc5475eb07fd21e Mon Sep 17 00:00:00 2001
+From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
+Date: Wed, 26 Sep 2018 11:15:45 -0300
+Subject: [PATCH] statx: fix compile errors
+
+struct statx is only defined in sys/stat.h when _GNU_SOURCE is defined.
+The testcases do define _GNU_SOURCE, but not the m4 struct check.
+
+Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
+Acked-by: Cyril Hrubis <chrubis@suse.cz>
+---
+ m4/ltp-statx.m4 | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/m4/ltp-statx.m4 b/m4/ltp-statx.m4
+index 44303d30c..5f79a94cd 100644
+--- a/m4/ltp-statx.m4
++++ b/m4/ltp-statx.m4
+@@ -23,6 +23,11 @@ dnl
+ AC_DEFUN([LTP_CHECK_STATX],[
+ AC_CHECK_FUNCS(statx,,,[[#include <sys/stat.h>]])
+ AC_CHECK_HEADER(linux/fs.h,,,)
+-AC_CHECK_TYPES([struct statx],,,[[#include <sys/stat.h>]])
+-AC_CHECK_TYPES([struct statx_timestamp],,,[[#include <sys/stat.h>]])
++AC_CHECK_TYPES([struct statx],,,[[
++	#define _GNU_SOURCE
++	#include <sys/stat.h>
++]])
++AC_CHECK_TYPES([struct statx_timestamp],,,[[
++	#define _GNU_SOURCE
++	#include <sys/stat.h>]])
+ ])
+-- 
+2.19.0
+
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index da039bddae..9001316fbd 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -75,4 +75,7 @@ endef
 LTP_TESTSUITE_POST_PATCH_HOOKS += LTP_TESTSUITE_REMOVE_LDD
 endif
 
+# 0002-statx-fix-compile-errors.patch
+LTP_TESTSUITE_AUTORECONF = YES
+
 $(eval $(autotools-package))
