From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 5 Oct 2019 16:15:42 +0200
Subject: [Buildroot] [git commit] package/strace: fix no-MMU build
Message-ID: <20191005141255.85F27885F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6966778214b8ea9950dcc62581a17ce0b876ce1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch removing fork() call when building for no-MMU targets.

Fixes:
http://autobuild.buildroot.net/results/d0300e9536cb470480d59eb7d64a3727d45d67bc/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...lter_seccomp-fix-build-for-no-MMU-targets.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/strace/0001-filter_seccomp-fix-build-for-no-MMU-targets.patch b/package/strace/0001-filter_seccomp-fix-build-for-no-MMU-targets.patch
new file mode 100644
index 0000000000..88f075b0ab
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
