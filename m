From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  4 Oct 2019 10:13:06 +0300
Subject: [Buildroot] [PATCH] package/strace: fix no-MMU build
Message-ID: <e6e29275479f13cca01265870eb003908a0dd0f1.1570173186.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch removing fork() call when building for no-MMU targets.

Fixes:
http://autobuild.buildroot.net/results/d0300e9536cb470480d59eb7d64a3727d45d67bc/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...seccomp-fix-build-for-no-MMU-targets.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/strace/0001-filter_seccomp-fix-build-for-no-MMU-targets.patch

diff --git a/package/strace/0001-filter_seccomp-fix-build-for-no-MMU-targets.patch b/package/strace/0001-filter_seccomp-fix-build-for-no-MMU-targets.patch
new file mode 100644
index 000000000000..88f075b0ab65
--- /dev/null
+++ b/package/strace/0001-filter_seccomp-fix-build-for-no-MMU-targets.patch
@@ -0,0 +1,40 @@
+From f1b16bba907a4d37632689d92ad23083feec4891 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Fri, 4 Oct 2019 09:51:23 +0300
+Subject: [PATCH] filter_seccomp: fix build for no-MMU targets
+
+Detect and define NOMMU_SYSTEM correctly to avoid unsupported fork()
+call on no-MMU Linux systems.
+
+Fix strace binary link failure:
+
+.../arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: strace-filter_seccomp.o: in function `check_seccomp_filter':
+filter_seccomp.c:(.text+0x39a): undefined reference to `fork'
+collect2: error: ld returned 1 exit status
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://lists.strace.io/pipermail/strace-devel/2019-October/009159.html
+
+ filter_seccomp.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/filter_seccomp.c b/filter_seccomp.c
+index fc582654b7ac..28b46aabe25e 100644
+--- a/filter_seccomp.c
++++ b/filter_seccomp.c
+@@ -21,6 +21,11 @@
+ #include "syscall.h"
+ #include "scno.h"
+ 
++#if !defined(HAVE_FORK)
++# undef NOMMU_SYSTEM
++# define NOMMU_SYSTEM 1
++#endif
++
+ bool seccomp_filtering;
+ bool seccomp_before_sysentry;
+ 
+-- 
+2.23.0
+
-- 
2.23.0
