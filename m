From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 27 May 2021 15:09:54 +0300
Subject: [Buildroot] [PATCH next] package/strace: bump to version 5.12
Message-ID: <0c9146933584e404a875a2bd2867bfe9187a25a0.1622117394.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...et_syscall_info-disable_ptrace_getre.patch | 33 -------------------
 package/strace/strace.hash                    |  4 +--
 package/strace/strace.mk                      |  2 +-
 3 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 package/strace/0001-disable_ptrace_get_syscall_info-disable_ptrace_getre.patch

diff --git a/package/strace/0001-disable_ptrace_get_syscall_info-disable_ptrace_getre.patch b/package/strace/0001-disable_ptrace_get_syscall_info-disable_ptrace_getre.patch
deleted file mode 100644
index 1367d2985a0f..000000000000
--- a/package/strace/0001-disable_ptrace_get_syscall_info-disable_ptrace_getre.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 84536a993417f3bfff4a54830fa34a3f91f5716e Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 11 Mar 2021 06:43:26 +0200
-Subject: [PATCH] disable_ptrace_get_syscall_info, disable_ptrace_getregset:
- require fork()
-
-These helper programs require fork(), so they are incompatible with
-no-MMU systems. Make the code depend on HAVE_FORK.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://lists.strace.io/pipermail/strace-devel/2021-March/010421.html
-
- src/disable_ptrace_request.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/disable_ptrace_request.c b/src/disable_ptrace_request.c
-index 57163e77f0f4..715006941572 100644
---- a/src/disable_ptrace_request.c
-+++ b/src/disable_ptrace_request.c
-@@ -41,7 +41,8 @@ init(int argc, char **argv)
-  && defined PR_SET_NO_NEW_PRIVS \
-  && defined PR_SET_SECCOMP \
-  && defined BPF_JUMP \
-- && defined BPF_STMT
-+ && defined BPF_STMT \
-+ && defined HAVE_FORK
- 
- static unsigned int
- get_arch(void)
--- 
-2.30.1
-
diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index e4fe690f612e..f7a634000ca6 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/5.11/strace-5.11.tar.xz.asc
-sha256  ffe340b10c145a0f85734271e9cce56457d23f21a7ea5931ab32f8cf4e793879  strace-5.11.tar.xz
+# https://strace.io/files/5.12/strace-5.12.tar.xz.asc
+sha256  29171edf9d252f89c988a4c340dfdec662f458cb8c63d85431d64bab5911e7c4  strace-5.12.tar.xz
 sha256  f847d5ef26ad1151ca63bb88536b23a4cac5040c67917f3d5ee7ea1316e2b736  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 013bfdcd5547..810f55e82b44 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 5.11
+STRACE_VERSION = 5.12
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.30.2
