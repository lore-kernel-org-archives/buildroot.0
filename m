From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Jan 2020 15:24:45 +0200
Subject: [Buildroot] [PATCH] package/strace: bump to version 5.4
Message-ID: <ccb63ff10b53069c4a4531234c373fa0a1370661.1578921885.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patch. Upstream commit 509400106aeb fixed no-MMU build in a
different way.

Add patch fixing no-MMU build.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...seccomp-fix-build-for-no-MMU-targets.patch | 40 ----------------
 ...0001-filter_seccomp-fix-no-MMU-build.patch | 46 +++++++++++++++++++
 package/strace/strace.hash                    |  4 +-
 package/strace/strace.mk                      |  2 +-
 4 files changed, 49 insertions(+), 43 deletions(-)
 delete mode 100644 package/strace/0001-filter_seccomp-fix-build-for-no-MMU-targets.patch
 create mode 100644 package/strace/0001-filter_seccomp-fix-no-MMU-build.patch

diff --git a/package/strace/0001-filter_seccomp-fix-build-for-no-MMU-targets.patch b/package/strace/0001-filter_seccomp-fix-build-for-no-MMU-targets.patch
deleted file mode 100644
index 88f075b0ab65..000000000000
--- a/package/strace/0001-filter_seccomp-fix-build-for-no-MMU-targets.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From f1b16bba907a4d37632689d92ad23083feec4891 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Fri, 4 Oct 2019 09:51:23 +0300
-Subject: [PATCH] filter_seccomp: fix build for no-MMU targets
-
-Detect and define NOMMU_SYSTEM correctly to avoid unsupported fork()
-call on no-MMU Linux systems.
-
-Fix strace binary link failure:
-
-.../arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: strace-filter_seccomp.o: in function `check_seccomp_filter':
-filter_seccomp.c:(.text+0x39a): undefined reference to `fork'
-collect2: error: ld returned 1 exit status
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://lists.strace.io/pipermail/strace-devel/2019-October/009159.html
-
- filter_seccomp.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/filter_seccomp.c b/filter_seccomp.c
-index fc582654b7ac..28b46aabe25e 100644
---- a/filter_seccomp.c
-+++ b/filter_seccomp.c
-@@ -21,6 +21,11 @@
- #include "syscall.h"
- #include "scno.h"
- 
-+#if !defined(HAVE_FORK)
-+# undef NOMMU_SYSTEM
-+# define NOMMU_SYSTEM 1
-+#endif
-+
- bool seccomp_filtering;
- bool seccomp_before_sysentry;
- 
--- 
-2.23.0
-
diff --git a/package/strace/0001-filter_seccomp-fix-no-MMU-build.patch b/package/strace/0001-filter_seccomp-fix-no-MMU-build.patch
new file mode 100644
index 000000000000..27f6d1490bcb
--- /dev/null
+++ b/package/strace/0001-filter_seccomp-fix-no-MMU-build.patch
@@ -0,0 +1,46 @@
+From fb4fdb83be36ff5e71426d2bdea81d035cdbd0b8 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Mon, 13 Jan 2020 14:54:15 +0200
+Subject: [PATCH] filter_seccomp: fix no-MMU build
+
+Move the declaration of filter_generators out of HAVE_FORK ifdef to fix
+build for no-MMU targets:
+
+filter_seccomp.c: In function ?check_seccomp_filter_properties?:
+filter_seccomp.c:608:42: error: ?filter_generators? undeclared (first use in this function); did you mean ?linear_filter_generator??
+  for (unsigned int i = 0; i < ARRAY_SIZE(filter_generators); ++i) {
+                                          ^~~~~~~~~~~~~~~~~
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://lists.strace.io/pipermail/strace-devel/2020-January/thread.html
+
+
+ filter_seccomp.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/filter_seccomp.c b/filter_seccomp.c
+index 91f6bc42bce3..da1abc713dfc 100644
+--- a/filter_seccomp.c
++++ b/filter_seccomp.c
+@@ -68,8 +68,6 @@ static const struct audit_arch_t audit_arch_vec[SUPPORTED_PERSONALITIES] = {
+ # endif
+ };
+ 
+-# ifdef HAVE_FORK
+-
+ typedef unsigned short (*filter_generator_t)(struct sock_filter *,
+ 					     bool *overflow);
+ static unsigned short linear_filter_generator(struct sock_filter *,
+@@ -92,6 +90,8 @@ static struct sock_fprog bpf_prog = {
+ 	.filter = NULL,
+ };
+ 
++# ifdef HAVE_FORK
++
+ static void ATTRIBUTE_NORETURN
+ check_seccomp_order_do_child(void)
+ {
+-- 
+2.24.1
+
diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index 2386857c2f39..dfc2143d6597 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/5.3/strace-5.3.tar.xz.asc
-sha256	6c131198749656401fe3efd6b4b16a07ea867e8f530867ceae8930bbc937a047	strace-5.3.tar.xz
+# https://strace.io/files/5.4/strace-5.4.tar.xz.asc
+sha256	f7d00514d51290b6db78ad7a9de709baf93caa5981498924cbc9a744cfd2a741	strace-5.4.tar.xz
 sha256	739b2725197137a04ab48ee6b19da3fdf7e497249e0dedd9f51c11a570401ede	COPYING
 sha256	7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa	LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 5e7a119ba527..5ad249b13c60 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 5.3
+STRACE_VERSION = 5.4
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.24.1
