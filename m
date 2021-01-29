From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Jan 2021 09:28:05 +0100
Subject: [Buildroot] [git commit] package/chrony: fix build with kernel
 headers older than 3.15
Message-ID: <20210129082032.AF55C81530@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70e0546a4e328c89740e6077542047077b9e6445
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to make renameat2 system call reference conditional.

Fixes:
http://autobuild.buildroot.net/results/bb6/bb638ed011aea379c7f780187dafe2615753e2ae/
http://autobuild.buildroot.net/results/5ef/5ef11bace60950b35b4a593d734a20df088c79aa/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...linux-fix-build-with-older-kernel-headers.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/chrony/0001-sys_linux-fix-build-with-older-kernel-headers.patch b/package/chrony/0001-sys_linux-fix-build-with-older-kernel-headers.patch
new file mode 100644
index 0000000000..892664f494
--- /dev/null
+++ b/package/chrony/0001-sys_linux-fix-build-with-older-kernel-headers.patch
@@ -0,0 +1,33 @@
+From 5dab78341bd515692f1b9ff8716a911c3ebf9ee1 Mon Sep 17 00:00:00 2001
+Message-Id: <5dab78341bd515692f1b9ff8716a911c3ebf9ee1.1611839550.git.baruch@tkos.co.il>
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Thu, 28 Jan 2021 15:02:40 +0200
+Subject: [PATCH] sys_linux: fix build with older kernel headers
+
+The renameat2 system call was introduced in kernel version 3.15. Fix
+build against older headers.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit a2372b0c3abfc85d11c1684c0fb6370cc329e5c4
+
+ sys_linux.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/sys_linux.c b/sys_linux.c
+index 0b24445e173d..202da845edac 100644
+--- a/sys_linux.c
++++ b/sys_linux.c
+@@ -547,7 +547,9 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
+     SCMP_SYS(readlinkat),
+     SCMP_SYS(rename),
+     SCMP_SYS(renameat),
++#ifdef __NR_renameat2
+     SCMP_SYS(renameat2),
++#endif
+     SCMP_SYS(stat),
+     SCMP_SYS(stat64),
+     SCMP_SYS(statfs),
+-- 
+2.29.2
+
