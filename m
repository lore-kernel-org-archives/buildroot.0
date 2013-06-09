From: Chris Zankel <chris@zankel.net>
Date: Sun, 9 Jun 2013 14:35:44 -0700
Subject: [Buildroot] [PATCH] strace: upgrade to 4.8, supporting now aarch64,
 arc, and xtensa
Message-ID: <51b4f749.c4a9440a.27a8.ffffd1a5@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove 'strace-fix-arm-bad-syscall.patch'. This patch had been integrated
in v4.6 (commit: 9bc6340d2) and was later replaced with a generic solution
in v.7 (commit: 2ce12ed31c2).

Strace still cannot handle non-LFS environments, so a modified version of
strace-fix-disabled-largefile-syscalls.patch remains. The 64-bit syscalls
(sys_truncate64, etc.) are references in the sysent structure but the
functinon definitions are commented out becuase of the missing LFS support.

The workaround for the 'forced lfs mode' doesn't seem to be necessary anymore.

Build tested on arm w and w/o LFS support.

Signed-off-by: Chris Zankel <chris@zankel.net>

diff --git a/package/strace/Config.in b/package/strace/Config.in
index 153bcf6..bbb582a 100644
--- a/package/strace/Config.in
+++ b/package/strace/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_STRACE
 	bool "strace"
-	depends on !(BR2_xtensa || BR2_aarch64 || BR2_arc)
 	help
 	  A useful diagnostic, instructional, and debugging tool.
 	  Allows you to track what system calls a program makes
diff --git a/package/strace/strace-fix-arm-bad-syscall.patch b/package/strace/strace-fix-arm-bad-syscall.patch
deleted file mode 100644
index 3f3144e..0000000
--- a/package/strace/strace-fix-arm-bad-syscall.patch
+++ /dev/null
@@ -1,18 +0,0 @@
---- a/syscall.c
-+++ b/syscall.c
-@@ -1016,6 +1016,15 @@ struct tcb *tcp;
- 		/*
- 		 * Note: we only deal with only 32-bit CPUs here.
- 		 */
-+
-+		if (!(tcp->flags & TCB_INSYSCALL) &&
-+		    (tcp->flags & TCB_WAITEXECVE)) {
-+			/* caught a fake syscall from the execve's exit */
-+			tcp->flags &= ~TCB_WAITEXECVE;
-+			return 0;
-+		}
-+ 
-+
- 		if (regs.ARM_cpsr & 0x20) {
- 			/*
- 			 * Get the Thumb-mode system call number
diff --git a/package/strace/strace-fix-disabled-largefile-syscalls.patch b/package/strace/strace-fix-disabled-largefile-syscalls.patch
index f6bcf96..2117a0e 100644
--- a/package/strace/strace-fix-disabled-largefile-syscalls.patch
+++ b/package/strace/strace-fix-disabled-largefile-syscalls.patch
@@ -1,8 +1,8 @@
 --- a/syscall.c
 +++ b/syscall.c
 @@ -125,6 +125,18 @@
- #define TP TRACE_PROCESS
- #define TS TRACE_SIGNAL
+ #define NF SYSCALL_NEVER_FAILS
+ #define MA MAX_ARGS
  
 +#ifndef HAVE_STATFS64
 +/*
@@ -16,6 +16,6 @@
 +#define sys_fstatfs64   sys_fstatfs
 +#endif
 +
- static const struct sysent sysent0[] = {
+ const struct_sysent sysent0[] = {
  #include "syscallent.h"
  };
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index b172a20..0dce096 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 4.7
+STRACE_VERSION = 4.8
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = http://downloads.sourceforge.net/project/strace/strace/$(STRACE_VERSION)
 STRACE_LICENSE = BSD-3c
@@ -13,13 +13,6 @@ STRACE_LICENSE_FILES = COPYRIGHT
 STRACE_CONF_ENV = ac_cv_header_linux_if_packet_h=yes \
 		  ac_cv_header_linux_netlink_h=yes
 
-ifeq ($(BR2_LARGEFILE),y)
-# strace gets confused when lfs mode is forced, so don't
-STRACE_CONF_ENV += \
-	CFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))" \
-	CPPFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))"
-endif
-
 define STRACE_REMOVE_STRACE_GRAPH
 	rm -f $(TARGET_DIR)/usr/bin/strace-graph
 endef
