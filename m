From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Thu,  1 Jul 2021 11:47:18 +0300
Subject: [Buildroot] [PATCH 1/1] package/gcc: fix libsanitizer in gcc 11.1,
 10.3 for linux 5.13
Message-ID: <20210701084718.1788688-1-fido_max@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Starting from 5.13 Cyclades async mux support is dropped from linux kernel:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f76edd8f7ce06cdff2fe5b6b39a49644c684a161

But gcc's libsanitizer uses <linux/cyclades.h> header.
This issue is fixed by:
https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=745dae5923aba02982563481d75a21595df22ff8

Right now just gcc 9.4.0 has this commit and 8.4.0 is proposed to be deleted.
So we need to add this patch for 10.3 and 11.1 to fix build with linux kernel 5.13.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 ...04-Remove-cyclades-from-libsanitizer.patch | 123 ++++++++++++++++++
 ...01-Remove-cyclades-from-libsanitizer.patch | 123 ++++++++++++++++++
 2 files changed, 246 insertions(+)
 create mode 100644 package/gcc/10.3.0/0004-Remove-cyclades-from-libsanitizer.patch
 create mode 100644 package/gcc/11.1.0/0001-Remove-cyclades-from-libsanitizer.patch

diff --git a/package/gcc/10.3.0/0004-Remove-cyclades-from-libsanitizer.patch b/package/gcc/10.3.0/0004-Remove-cyclades-from-libsanitizer.patch
new file mode 100644
index 0000000000..d686fd7cc5
--- /dev/null
+++ b/package/gcc/10.3.0/0004-Remove-cyclades-from-libsanitizer.patch
@@ -0,0 +1,123 @@
+From 745dae5923aba02982563481d75a21595df22ff8 Mon Sep 17 00:00:00 2001
+From: Tamar Christina <tamar.christina@arm.com>
+Date: Fri, 21 May 2021 10:30:59 +0100
+Subject: [PATCH] libsanitizer: Remove cyclades from libsanitizer
+
+The Linux kernel has removed the interface to cyclades from
+the latest kernel headers[1] due to them being orphaned for the
+past 13 years.
+
+libsanitizer uses this header when compiling against glibc, but
+glibcs itself doesn't seem to have any references to cyclades.
+
+Further more it seems that the driver is broken in the kernel and
+the firmware doesn't seem to be available anymore.
+
+As such since this is breaking the build of libsanitizer (and so the
+GCC bootstrap[2]) I propose to remove this.
+
+[1] https://lkml.org/lkml/2021/3/2/153
+[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100379
+
+(cherry picked from commit f7c5351552387bd43f6ca3631016d7f0dfe0f135)
+
+libsanitizer/ChangeLog:
+
+	PR sanitizer/100379
+	* sanitizer_common/sanitizer_common_interceptors_ioctl.inc: Cherry-pick
+	llvm-project revision f7c5351552387bd43f6ca3631016d7f0dfe0f135.
+	* sanitizer_common/sanitizer_platform_limits_posix.cpp: Likewise.
+	* sanitizer_common/sanitizer_platform_limits_posix.h: Likewise.
+---
+ .../sanitizer_common_interceptors_ioctl.inc           |  9 ---------
+ .../sanitizer_platform_limits_posix.cpp               | 11 -----------
+ .../sanitizer_platform_limits_posix.h                 | 10 ----------
+ 3 files changed, 30 deletions(-)
+
+diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
+index 7f181258eab..b7da6598755 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
++++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
+@@ -370,15 +370,6 @@ static void ioctl_table_fill() {
+ 
+ #if SANITIZER_GLIBC
+   // _(SIOCDEVPLIP, WRITE, struct_ifreq_sz); // the same as EQL_ENSLAVE
+-  _(CYGETDEFTHRESH, WRITE, sizeof(int));
+-  _(CYGETDEFTIMEOUT, WRITE, sizeof(int));
+-  _(CYGETMON, WRITE, struct_cyclades_monitor_sz);
+-  _(CYGETTHRESH, WRITE, sizeof(int));
+-  _(CYGETTIMEOUT, WRITE, sizeof(int));
+-  _(CYSETDEFTHRESH, NONE, 0);
+-  _(CYSETDEFTIMEOUT, NONE, 0);
+-  _(CYSETTHRESH, NONE, 0);
+-  _(CYSETTIMEOUT, NONE, 0);
+   _(EQL_EMANCIPATE, WRITE, struct_ifreq_sz);
+   _(EQL_ENSLAVE, WRITE, struct_ifreq_sz);
+   _(EQL_GETMASTRCFG, WRITE, struct_ifreq_sz);
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+index 35a690cba5c..6e5c330b98e 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+@@ -143,7 +143,6 @@ typedef struct user_fpregs elf_fpregset_t;
+ # include <sys/procfs.h>
+ #endif
+ #include <sys/user.h>
+-#include <linux/cyclades.h>
+ #include <linux/if_eql.h>
+ #include <linux/if_plip.h>
+ #include <linux/lp.h>
+@@ -460,7 +459,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
+ 
+ #if SANITIZER_GLIBC
+   unsigned struct_ax25_parms_struct_sz = sizeof(struct ax25_parms_struct);
+-  unsigned struct_cyclades_monitor_sz = sizeof(struct cyclades_monitor);
+ #if EV_VERSION > (0x010000)
+   unsigned struct_input_keymap_entry_sz = sizeof(struct input_keymap_entry);
+ #else
+@@ -824,15 +822,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
+ #endif // SANITIZER_LINUX
+ 
+ #if SANITIZER_LINUX && !SANITIZER_ANDROID
+-  unsigned IOCTL_CYGETDEFTHRESH = CYGETDEFTHRESH;
+-  unsigned IOCTL_CYGETDEFTIMEOUT = CYGETDEFTIMEOUT;
+-  unsigned IOCTL_CYGETMON = CYGETMON;
+-  unsigned IOCTL_CYGETTHRESH = CYGETTHRESH;
+-  unsigned IOCTL_CYGETTIMEOUT = CYGETTIMEOUT;
+-  unsigned IOCTL_CYSETDEFTHRESH = CYSETDEFTHRESH;
+-  unsigned IOCTL_CYSETDEFTIMEOUT = CYSETDEFTIMEOUT;
+-  unsigned IOCTL_CYSETTHRESH = CYSETTHRESH;
+-  unsigned IOCTL_CYSETTIMEOUT = CYSETTIMEOUT;
+   unsigned IOCTL_EQL_EMANCIPATE = EQL_EMANCIPATE;
+   unsigned IOCTL_EQL_ENSLAVE = EQL_ENSLAVE;
+   unsigned IOCTL_EQL_GETMASTRCFG = EQL_GETMASTRCFG;
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+index ad358eef8b7..cba41ba5494 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+@@ -983,7 +983,6 @@ extern unsigned struct_vt_mode_sz;
+ 
+ #if SANITIZER_LINUX && !SANITIZER_ANDROID
+ extern unsigned struct_ax25_parms_struct_sz;
+-extern unsigned struct_cyclades_monitor_sz;
+ extern unsigned struct_input_keymap_entry_sz;
+ extern unsigned struct_ipx_config_data_sz;
+ extern unsigned struct_kbdiacrs_sz;
+@@ -1328,15 +1327,6 @@ extern unsigned IOCTL_VT_WAITACTIVE;
+ #endif  // SANITIZER_LINUX
+ 
+ #if SANITIZER_LINUX && !SANITIZER_ANDROID
+-extern unsigned IOCTL_CYGETDEFTHRESH;
+-extern unsigned IOCTL_CYGETDEFTIMEOUT;
+-extern unsigned IOCTL_CYGETMON;
+-extern unsigned IOCTL_CYGETTHRESH;
+-extern unsigned IOCTL_CYGETTIMEOUT;
+-extern unsigned IOCTL_CYSETDEFTHRESH;
+-extern unsigned IOCTL_CYSETDEFTIMEOUT;
+-extern unsigned IOCTL_CYSETTHRESH;
+-extern unsigned IOCTL_CYSETTIMEOUT;
+ extern unsigned IOCTL_EQL_EMANCIPATE;
+ extern unsigned IOCTL_EQL_ENSLAVE;
+ extern unsigned IOCTL_EQL_GETMASTRCFG;
+-- 
+2.27.0
+
diff --git a/package/gcc/11.1.0/0001-Remove-cyclades-from-libsanitizer.patch b/package/gcc/11.1.0/0001-Remove-cyclades-from-libsanitizer.patch
new file mode 100644
index 0000000000..d686fd7cc5
--- /dev/null
+++ b/package/gcc/11.1.0/0001-Remove-cyclades-from-libsanitizer.patch
@@ -0,0 +1,123 @@
+From 745dae5923aba02982563481d75a21595df22ff8 Mon Sep 17 00:00:00 2001
+From: Tamar Christina <tamar.christina@arm.com>
+Date: Fri, 21 May 2021 10:30:59 +0100
+Subject: [PATCH] libsanitizer: Remove cyclades from libsanitizer
+
+The Linux kernel has removed the interface to cyclades from
+the latest kernel headers[1] due to them being orphaned for the
+past 13 years.
+
+libsanitizer uses this header when compiling against glibc, but
+glibcs itself doesn't seem to have any references to cyclades.
+
+Further more it seems that the driver is broken in the kernel and
+the firmware doesn't seem to be available anymore.
+
+As such since this is breaking the build of libsanitizer (and so the
+GCC bootstrap[2]) I propose to remove this.
+
+[1] https://lkml.org/lkml/2021/3/2/153
+[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100379
+
+(cherry picked from commit f7c5351552387bd43f6ca3631016d7f0dfe0f135)
+
+libsanitizer/ChangeLog:
+
+	PR sanitizer/100379
+	* sanitizer_common/sanitizer_common_interceptors_ioctl.inc: Cherry-pick
+	llvm-project revision f7c5351552387bd43f6ca3631016d7f0dfe0f135.
+	* sanitizer_common/sanitizer_platform_limits_posix.cpp: Likewise.
+	* sanitizer_common/sanitizer_platform_limits_posix.h: Likewise.
+---
+ .../sanitizer_common_interceptors_ioctl.inc           |  9 ---------
+ .../sanitizer_platform_limits_posix.cpp               | 11 -----------
+ .../sanitizer_platform_limits_posix.h                 | 10 ----------
+ 3 files changed, 30 deletions(-)
+
+diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
+index 7f181258eab..b7da6598755 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
++++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
+@@ -370,15 +370,6 @@ static void ioctl_table_fill() {
+ 
+ #if SANITIZER_GLIBC
+   // _(SIOCDEVPLIP, WRITE, struct_ifreq_sz); // the same as EQL_ENSLAVE
+-  _(CYGETDEFTHRESH, WRITE, sizeof(int));
+-  _(CYGETDEFTIMEOUT, WRITE, sizeof(int));
+-  _(CYGETMON, WRITE, struct_cyclades_monitor_sz);
+-  _(CYGETTHRESH, WRITE, sizeof(int));
+-  _(CYGETTIMEOUT, WRITE, sizeof(int));
+-  _(CYSETDEFTHRESH, NONE, 0);
+-  _(CYSETDEFTIMEOUT, NONE, 0);
+-  _(CYSETTHRESH, NONE, 0);
+-  _(CYSETTIMEOUT, NONE, 0);
+   _(EQL_EMANCIPATE, WRITE, struct_ifreq_sz);
+   _(EQL_ENSLAVE, WRITE, struct_ifreq_sz);
+   _(EQL_GETMASTRCFG, WRITE, struct_ifreq_sz);
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+index 35a690cba5c..6e5c330b98e 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+@@ -143,7 +143,6 @@ typedef struct user_fpregs elf_fpregset_t;
+ # include <sys/procfs.h>
+ #endif
+ #include <sys/user.h>
+-#include <linux/cyclades.h>
+ #include <linux/if_eql.h>
+ #include <linux/if_plip.h>
+ #include <linux/lp.h>
+@@ -460,7 +459,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
+ 
+ #if SANITIZER_GLIBC
+   unsigned struct_ax25_parms_struct_sz = sizeof(struct ax25_parms_struct);
+-  unsigned struct_cyclades_monitor_sz = sizeof(struct cyclades_monitor);
+ #if EV_VERSION > (0x010000)
+   unsigned struct_input_keymap_entry_sz = sizeof(struct input_keymap_entry);
+ #else
+@@ -824,15 +822,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
+ #endif // SANITIZER_LINUX
+ 
+ #if SANITIZER_LINUX && !SANITIZER_ANDROID
+-  unsigned IOCTL_CYGETDEFTHRESH = CYGETDEFTHRESH;
+-  unsigned IOCTL_CYGETDEFTIMEOUT = CYGETDEFTIMEOUT;
+-  unsigned IOCTL_CYGETMON = CYGETMON;
+-  unsigned IOCTL_CYGETTHRESH = CYGETTHRESH;
+-  unsigned IOCTL_CYGETTIMEOUT = CYGETTIMEOUT;
+-  unsigned IOCTL_CYSETDEFTHRESH = CYSETDEFTHRESH;
+-  unsigned IOCTL_CYSETDEFTIMEOUT = CYSETDEFTIMEOUT;
+-  unsigned IOCTL_CYSETTHRESH = CYSETTHRESH;
+-  unsigned IOCTL_CYSETTIMEOUT = CYSETTIMEOUT;
+   unsigned IOCTL_EQL_EMANCIPATE = EQL_EMANCIPATE;
+   unsigned IOCTL_EQL_ENSLAVE = EQL_ENSLAVE;
+   unsigned IOCTL_EQL_GETMASTRCFG = EQL_GETMASTRCFG;
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+index ad358eef8b7..cba41ba5494 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+@@ -983,7 +983,6 @@ extern unsigned struct_vt_mode_sz;
+ 
+ #if SANITIZER_LINUX && !SANITIZER_ANDROID
+ extern unsigned struct_ax25_parms_struct_sz;
+-extern unsigned struct_cyclades_monitor_sz;
+ extern unsigned struct_input_keymap_entry_sz;
+ extern unsigned struct_ipx_config_data_sz;
+ extern unsigned struct_kbdiacrs_sz;
+@@ -1328,15 +1327,6 @@ extern unsigned IOCTL_VT_WAITACTIVE;
+ #endif  // SANITIZER_LINUX
+ 
+ #if SANITIZER_LINUX && !SANITIZER_ANDROID
+-extern unsigned IOCTL_CYGETDEFTHRESH;
+-extern unsigned IOCTL_CYGETDEFTIMEOUT;
+-extern unsigned IOCTL_CYGETMON;
+-extern unsigned IOCTL_CYGETTHRESH;
+-extern unsigned IOCTL_CYGETTIMEOUT;
+-extern unsigned IOCTL_CYSETDEFTHRESH;
+-extern unsigned IOCTL_CYSETDEFTIMEOUT;
+-extern unsigned IOCTL_CYSETTHRESH;
+-extern unsigned IOCTL_CYSETTIMEOUT;
+ extern unsigned IOCTL_EQL_EMANCIPATE;
+ extern unsigned IOCTL_EQL_ENSLAVE;
+ extern unsigned IOCTL_EQL_GETMASTRCFG;
+-- 
+2.27.0
+
-- 
2.31.1
