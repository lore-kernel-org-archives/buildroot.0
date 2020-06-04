From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  4 Jun 2020 13:40:19 +0300
Subject: [Buildroot] [PATCH] strace: bump to version 5.7
Message-ID: <4f8ce0c199f730641f988fbc2841c3145b9fa759.1591267219.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch.

Fixes:
http://autobuild.buildroot.net/results/ca298d6543c07efbf77f2adeb4832bbac00ae73f/
http://autobuild.buildroot.net/results/f26a4f2bb5a9b25739e55be5e5ded2b83a0937ac/
http://autobuild.buildroot.net/results/53d6dac4047742ae2acd682a0dd97d986ba611bb/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
The build issue affects 2020.05 as well.
---
 ...yscall_info.c-fix-build-without-fork.patch | 56 -------------------
 package/strace/strace.hash                    |  4 +-
 package/strace/strace.mk                      |  2 +-
 3 files changed, 3 insertions(+), 59 deletions(-)
 delete mode 100644 package/strace/0001-ptrace_syscall_info.c-fix-build-without-fork.patch

diff --git a/package/strace/0001-ptrace_syscall_info.c-fix-build-without-fork.patch b/package/strace/0001-ptrace_syscall_info.c-fix-build-without-fork.patch
deleted file mode 100644
index 596524e4f4b3..000000000000
--- a/package/strace/0001-ptrace_syscall_info.c-fix-build-without-fork.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From ba0d1193b31e8822744ae250d8e984dad32e7e49 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 14 Apr 2020 13:45:29 +0200
-Subject: [PATCH] ptrace_syscall_info.c: fix build without fork
-
-Build without fork fails on:
-
-ptrace_syscall_info.c:33:27: error: 'expected_entry_size' defined but not used [-Werror=unused-const-variable=]
- static const unsigned int expected_entry_size =
-                           ^~~~~~~~~~~~~~~~~~~
-ptrace_syscall_info.c:31:27: error: 'expected_none_size' defined but not used [-Werror=unused-const-variable=]
- static const unsigned int expected_none_size =
-                           ^~~~~~~~~~~~~~~~~~
-ptrace_syscall_info.c:24:1: error: 'kill_tracee' defined but not used [-Werror=unused-function]
- kill_tracee(pid_t pid)
- ^~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/ffc81d3798379a9c34c7a708ebbdea27409f755d
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream: https://github.com/strace/strace/commit/897f3d053305ae2fb8e99371b4effb9b3f5c0000]
----
- ptrace_syscall_info.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/ptrace_syscall_info.c b/ptrace_syscall_info.c
-index acea27ec..0bfd91c5 100644
---- a/ptrace_syscall_info.c
-+++ b/ptrace_syscall_info.c
-@@ -20,18 +20,20 @@
- 
- bool ptrace_get_syscall_info_supported;
- 
-+#define FAIL	do { ptrace_stop = -1U; goto done; } while (0)
-+
-+#ifdef HAVE_FORK
- static int
- kill_tracee(pid_t pid)
- {
- 	return kill_save_errno(pid, SIGKILL);
- }
- 
--#define FAIL	do { ptrace_stop = -1U; goto done; } while (0)
--
- static const unsigned int expected_none_size =
- 	offsetof(struct_ptrace_syscall_info, entry);
- static const unsigned int expected_entry_size =
- 	offsetofend(struct_ptrace_syscall_info, entry.args);
-+#endif /* HAVE_FORK */
- static const unsigned int expected_exit_size =
- 	offsetofend(struct_ptrace_syscall_info, exit.is_error);
- static const unsigned int expected_seccomp_size =
--- 
-2.25.1
-
diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index 720f358c5b99..0337558244ee 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/5.6/strace-5.6.tar.xz.asc
-sha256  189968eeae06ed9e20166ec55a830943c84374676a457c9fe010edc7541f1b01  strace-5.6.tar.xz
+# https://strace.io/files/5.7/strace-5.7.tar.xz.asc
+sha256  b284b59f9bcd95b9728cea5bd5c0edc5ebe360af73dc76fbf6334f11c777ccd8  strace-5.7.tar.xz
 sha256  6370eb67db918210944a8511a6995ebe9567852f26b4f15a01e5c8cf2aef7c46  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 5c101419f411..ec88690f24a7 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 5.6
+STRACE_VERSION = 5.7
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.26.2
