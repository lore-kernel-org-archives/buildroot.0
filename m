From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Apr 2020 21:58:25 +0200
Subject: [Buildroot] [git commit] package/strace: bump to version 5.5
Message-ID: <20200401194701.9AEA38A533@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=58ca39b726d2dd4fcb9803a872f067ea5ea3920a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch.
Strace 5.5 now is compatible with glibc-2.31 and
Linux kernel headers < 5.3.

The copyright year was updated in COPYING, so update the hash.

Fixes:
  - http://autobuild.buildroot.net/results/dd7ec26396412375941eaf43daf755d61a68458b/

Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
Cc: Baruch Siach <baruch@tkos.co.il>
[yann.morin.1998 at free.fr:
  - add autobuilder reference provided by Baruch
  - fix hash for COPYING
  - two spaces in hash file
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-filter_seccomp-fix-no-MMU-build.patch     | 46 ----------------------
 package/strace/strace.hash                         |  8 ++--
 package/strace/strace.mk                           |  2 +-
 3 files changed, 5 insertions(+), 51 deletions(-)

diff --git a/package/strace/0001-filter_seccomp-fix-no-MMU-build.patch b/package/strace/0001-filter_seccomp-fix-no-MMU-build.patch
deleted file mode 100644
index 27f6d1490b..0000000000
--- a/package/strace/0001-filter_seccomp-fix-no-MMU-build.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From fb4fdb83be36ff5e71426d2bdea81d035cdbd0b8 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Mon, 13 Jan 2020 14:54:15 +0200
-Subject: [PATCH] filter_seccomp: fix no-MMU build
-
-Move the declaration of filter_generators out of HAVE_FORK ifdef to fix
-build for no-MMU targets:
-
-filter_seccomp.c: In function ???check_seccomp_filter_properties???:
-filter_seccomp.c:608:42: error: ???filter_generators??? undeclared (first use in this function); did you mean ???linear_filter_generator????
-  for (unsigned int i = 0; i < ARRAY_SIZE(filter_generators); ++i) {
-                                          ^~~~~~~~~~~~~~~~~
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://lists.strace.io/pipermail/strace-devel/2020-January/thread.html
-
-
- filter_seccomp.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/filter_seccomp.c b/filter_seccomp.c
-index 91f6bc42bce3..da1abc713dfc 100644
---- a/filter_seccomp.c
-+++ b/filter_seccomp.c
-@@ -68,8 +68,6 @@ static const struct audit_arch_t audit_arch_vec[SUPPORTED_PERSONALITIES] = {
- # endif
- };
- 
--# ifdef HAVE_FORK
--
- typedef unsigned short (*filter_generator_t)(struct sock_filter *,
- 					     bool *overflow);
- static unsigned short linear_filter_generator(struct sock_filter *,
-@@ -92,6 +90,8 @@ static struct sock_fprog bpf_prog = {
- 	.filter = NULL,
- };
- 
-+# ifdef HAVE_FORK
-+
- static void ATTRIBUTE_NORETURN
- check_seccomp_order_do_child(void)
- {
--- 
-2.24.1
-
diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index dfc2143d65..5b645ebe7e 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/5.4/strace-5.4.tar.xz.asc
-sha256	f7d00514d51290b6db78ad7a9de709baf93caa5981498924cbc9a744cfd2a741	strace-5.4.tar.xz
-sha256	739b2725197137a04ab48ee6b19da3fdf7e497249e0dedd9f51c11a570401ede	COPYING
-sha256	7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa	LGPL-2.1-or-later
+# https://strace.io/files/5.5/strace-5.5.tar.xz.asc
+sha256  9f58958c8e59ea62293d907d10572e352b582bd7948ed21aa28ebb47e5bf30ff  strace-5.5.tar.xz
+sha256  6370eb67db918210944a8511a6995ebe9567852f26b4f15a01e5c8cf2aef7c46  COPYING
+sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 5ad249b13c..569a822e42 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 5.4
+STRACE_VERSION = 5.5
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
