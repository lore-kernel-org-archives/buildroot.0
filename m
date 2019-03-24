From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Mar 2019 09:09:04 +0100
Subject: [Buildroot] [git commit] package/keepalived: fix build with kernel
 < 4.1
Message-ID: <20190324081038.6CC30825A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=432b2da1266ae0691ebec4403bebc7bacc14e82e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/a33433abeb122cfb15f7f21ab777e84040bdcb8b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...global_parser.c-fix-build-with-kernel-4.1.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/keepalived/0001-global_parser.c-fix-build-with-kernel-4.1.patch b/package/keepalived/0001-global_parser.c-fix-build-with-kernel-4.1.patch
new file mode 100644
index 0000000000..0c395b5101
--- /dev/null
+++ b/package/keepalived/0001-global_parser.c-fix-build-with-kernel-4.1.patch
@@ -0,0 +1,37 @@
+From 50e7b848feb7976c58c70edc64bf1056050aa1a3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 22 Mar 2019 09:18:44 +0100
+Subject: [PATCH] global_parser.c: fix build with kernel < 4.1
+
+NFT_TABLE_MAXNAMELEN has been added only in kernel 4.1 with
+https://github.com/torvalds/linux/commit/1cae565e8b746f484f1ff1b71d2a1c89d7cf0668
+
+So define it to 32 if it is not defined
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a33433abeb122cfb15f7f21ab777e84040bdcb8b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ keepalived/core/global_parser.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/keepalived/core/global_parser.c b/keepalived/core/global_parser.c
+index 65442408..eec82e8a 100644
+--- a/keepalived/core/global_parser.c
++++ b/keepalived/core/global_parser.c
+@@ -60,6 +60,11 @@
+ 
+ #define LVS_MAX_TIMEOUT		(86400*31)	/* 31 days */
+ 
++/* For kernels < 4.1 */
++#ifndef NFT_TABLE_MAXNAMELEN
++#define NFT_TABLE_MAXNAMELEN 32
++#endif
++
+ /* data handlers */
+ /* Global def handlers */
+ #ifdef _WITH_LINKBEAT_
+-- 
+2.20.1
+
