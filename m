Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB9DC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:00:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8617060F22
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8617060F22
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 548F740330;
	Wed,  4 Aug 2021 01:00:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9aE2z_316doK; Wed,  4 Aug 2021 00:59:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BA4F40672;
	Wed,  4 Aug 2021 00:59:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4BC941BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0592840FB4
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BD76WbVTg4_0 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B15DC40EAA
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0F52A87E2D; Tue,  3 Aug 2021 21:10:24 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 12:02:24 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e5da0067fbf887cd3d33f1d5a2e653091c261eef
X-Git-Newrev: 4d8ee4456a805c3ef626918abb6e4c49379ac0ec
X-Patchwork-Hint: ignore
Message-Id: <20210803211024.0F52A87E2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gcc: fix libsanitizer
 build with Linux 5.13 headers
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=4d8ee4456a805c3ef626918abb6e4c49379ac0ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Starting from 5.13 Cyclades async mux support is dropped from linux kernel:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f76edd8f7ce06cdff2fe5b6b39a49644c684a161

But gcc's libsanitizer uses <linux/cyclades.h> header.
This issue is fixed by:
https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=745dae5923aba02982563481d75a21595df22ff8

gcc 9.4.0 has already been released with the fix, so we only patch gcc
8.x, 10.x, 11.x, the ARC and C-SKY versions

Fixes:

  http://autobuild.buildroot.net/results/7f2056d05f4e05fcb95e2606583e95fac8bf3aef/ (gcc 10.x)
  http://autobuild.buildroot.net/results/116f40c22946952a8190ccba85d26913d9786e52/ (gcc 11.x)

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0004-Remove-cyclades-from-libsanitizer.patch   | 125 +++++++++++++++++++++
 .../0001-Remove-cyclades-from-libsanitizer.patch   | 125 +++++++++++++++++++++
 ...nitizer-Remove-cyclades-from-libsanitizer.patch | 121 ++++++++++++++++++++
 ...nitizer-Remove-cyclades-from-libsanitizer.patch | 123 ++++++++++++++++++++
 ...nitizer-Remove-cyclades-from-libsanitizer.patch | 121 ++++++++++++++++++++
 5 files changed, 615 insertions(+)

diff --git a/package/gcc/10.3.0/0004-Remove-cyclades-from-libsanitizer.patch b/package/gcc/10.3.0/0004-Remove-cyclades-from-libsanitizer.patch
new file mode 100644
index 0000000000..ee6e349a6c
--- /dev/null
+++ b/package/gcc/10.3.0/0004-Remove-cyclades-from-libsanitizer.patch
@@ -0,0 +1,125 @@
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
+
+Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
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
index 0000000000..ee6e349a6c
--- /dev/null
+++ b/package/gcc/11.1.0/0001-Remove-cyclades-from-libsanitizer.patch
@@ -0,0 +1,125 @@
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
+
+Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
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
diff --git a/package/gcc/48152afb96c59733d5bc79e3399bb7b3d4b44266/0001-libsanitizer-Remove-cyclades-from-libsanitizer.patch b/package/gcc/48152afb96c59733d5bc79e3399bb7b3d4b44266/0001-libsanitizer-Remove-cyclades-from-libsanitizer.patch
new file mode 100644
index 0000000000..9e6c4cfd03
--- /dev/null
+++ b/package/gcc/48152afb96c59733d5bc79e3399bb7b3d4b44266/0001-libsanitizer-Remove-cyclades-from-libsanitizer.patch
@@ -0,0 +1,121 @@
+From 0d2ee4f3a8cd3516f2c5c2f06373f8a32fd77b9d Mon Sep 17 00:00:00 2001
+From: Tamar Christina <tamar.christina@arm.com>
+Date: Fri, 21 May 2021 12:16:56 +0100
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
+libsanitizer/ChangeLog:
+
+	PR sanitizer/100379
+	* sanitizer_common/sanitizer_common_interceptors_ioctl.inc: Cherry-pick
+	llvm-project revision f7c5351552387bd43f6ca3631016d7f0dfe0f135.
+	* sanitizer_common/sanitizer_platform_limits_posix.cc: Likewise.
+	* sanitizer_common/sanitizer_platform_limits_posix.h: Likewise.
+---
+ .../sanitizer_common_interceptors_ioctl.inc           |  9 ---------
+ .../sanitizer_platform_limits_posix.cc                | 11 -----------
+ .../sanitizer_platform_limits_posix.h                 | 10 ----------
+ 3 files changed, 30 deletions(-)
+
+diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
+index 6c5fda09fbf..8f9314142b6 100755
+--- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
++++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
+@@ -358,15 +358,6 @@ static void ioctl_table_fill() {
+ 
+ #if SANITIZER_LINUX && !SANITIZER_ANDROID
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
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
+index 9866cc9e17a..5277407aec7 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
+@@ -156,7 +156,6 @@ typedef struct user_fpregs elf_fpregset_t;
+ #endif
+ #include <sys/user.h>
+ #include <sys/ustat.h>
+-#include <linux/cyclades.h>
+ #include <linux/if_eql.h>
+ #include <linux/if_plip.h>
+ #include <linux/lp.h>
+@@ -439,7 +438,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
+ 
+ #if SANITIZER_LINUX && !SANITIZER_ANDROID
+   unsigned struct_ax25_parms_struct_sz = sizeof(struct ax25_parms_struct);
+-  unsigned struct_cyclades_monitor_sz = sizeof(struct cyclades_monitor);
+ #if EV_VERSION > (0x010000)
+   unsigned struct_input_keymap_entry_sz = sizeof(struct input_keymap_entry);
+ #else
+@@ -806,15 +804,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
+ #endif // SANITIZER_LINUX || SANITIZER_FREEBSD
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
+index b6f90eb3a74..ae3a938344d 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+@@ -949,7 +949,6 @@ struct __sanitizer_cookie_io_functions_t {
+ 
+ #if SANITIZER_LINUX && !SANITIZER_ANDROID
+   extern unsigned struct_ax25_parms_struct_sz;
+-  extern unsigned struct_cyclades_monitor_sz;
+   extern unsigned struct_input_keymap_entry_sz;
+   extern unsigned struct_ipx_config_data_sz;
+   extern unsigned struct_kbdiacrs_sz;
+@@ -1294,15 +1293,6 @@ struct __sanitizer_cookie_io_functions_t {
+ #endif  // SANITIZER_LINUX || SANITIZER_FREEBSD
+ 
+ #if SANITIZER_LINUX && !SANITIZER_ANDROID
+-  extern unsigned IOCTL_CYGETDEFTHRESH;
+-  extern unsigned IOCTL_CYGETDEFTIMEOUT;
+-  extern unsigned IOCTL_CYGETMON;
+-  extern unsigned IOCTL_CYGETTHRESH;
+-  extern unsigned IOCTL_CYGETTIMEOUT;
+-  extern unsigned IOCTL_CYSETDEFTHRESH;
+-  extern unsigned IOCTL_CYSETDEFTIMEOUT;
+-  extern unsigned IOCTL_CYSETTHRESH;
+-  extern unsigned IOCTL_CYSETTIMEOUT;
+   extern unsigned IOCTL_EQL_EMANCIPATE;
+   extern unsigned IOCTL_EQL_ENSLAVE;
+   extern unsigned IOCTL_EQL_GETMASTRCFG;
+-- 
+2.31.1
+
diff --git a/package/gcc/8.4.0/0003-libsanitizer-Remove-cyclades-from-libsanitizer.patch b/package/gcc/8.4.0/0003-libsanitizer-Remove-cyclades-from-libsanitizer.patch
new file mode 100644
index 0000000000..b4c14acfef
--- /dev/null
+++ b/package/gcc/8.4.0/0003-libsanitizer-Remove-cyclades-from-libsanitizer.patch
@@ -0,0 +1,123 @@
+From 29210b168cc458480f71b242ad964ecd79214e38 Mon Sep 17 00:00:00 2001
+From: Tamar Christina <tamar.christina@arm.com>
+Date: Fri, 21 May 2021 12:16:56 +0100
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
+libsanitizer/ChangeLog:
+
+	PR sanitizer/100379
+	* sanitizer_common/sanitizer_common_interceptors_ioctl.inc: Cherry-pick
+	llvm-project revision f7c5351552387bd43f6ca3631016d7f0dfe0f135.
+	* sanitizer_common/sanitizer_platform_limits_posix.cc: Likewise.
+	* sanitizer_common/sanitizer_platform_limits_posix.h: Likewise.
+
+Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
+---
+ .../sanitizer_common_interceptors_ioctl.inc           |  9 ---------
+ .../sanitizer_platform_limits_posix.cc                | 11 -----------
+ .../sanitizer_platform_limits_posix.h                 | 10 ----------
+ 3 files changed, 30 deletions(-)
+
+diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
+index a68534c5a0a..85ab53e7430 100755
+--- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
++++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
+@@ -361,15 +361,6 @@ static void ioctl_table_fill() {
+ 
+ #if SANITIZER_LINUX && !SANITIZER_ANDROID
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
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
+index 5c720b2e700..17f2c78b389 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
+@@ -157,7 +157,6 @@ typedef struct user_fpregs elf_fpregset_t;
+ # include <sys/procfs.h>
+ #endif
+ #include <sys/user.h>
+-#include <linux/cyclades.h>
+ #include <linux/if_eql.h>
+ #include <linux/if_plip.h>
+ #include <linux/lp.h>
+@@ -464,7 +463,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
+ 
+ #if SANITIZER_LINUX && !SANITIZER_ANDROID
+   unsigned struct_ax25_parms_struct_sz = sizeof(struct ax25_parms_struct);
+-  unsigned struct_cyclades_monitor_sz = sizeof(struct cyclades_monitor);
+ #if EV_VERSION > (0x010000)
+   unsigned struct_input_keymap_entry_sz = sizeof(struct input_keymap_entry);
+ #else
+@@ -831,15 +829,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
+ #endif // SANITIZER_LINUX || SANITIZER_FREEBSD
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
+index 9c1429623ab..9f05c4e9ea7 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+@@ -1004,7 +1004,6 @@ struct __sanitizer_cookie_io_functions_t {
+ 
+ #if SANITIZER_LINUX && !SANITIZER_ANDROID
+   extern unsigned struct_ax25_parms_struct_sz;
+-  extern unsigned struct_cyclades_monitor_sz;
+   extern unsigned struct_input_keymap_entry_sz;
+   extern unsigned struct_ipx_config_data_sz;
+   extern unsigned struct_kbdiacrs_sz;
+@@ -1349,15 +1348,6 @@ struct __sanitizer_cookie_io_functions_t {
+ #endif  // SANITIZER_LINUX || SANITIZER_FREEBSD
+ 
+ #if SANITIZER_LINUX && !SANITIZER_ANDROID
+-  extern unsigned IOCTL_CYGETDEFTHRESH;
+-  extern unsigned IOCTL_CYGETDEFTIMEOUT;
+-  extern unsigned IOCTL_CYGETMON;
+-  extern unsigned IOCTL_CYGETTHRESH;
+-  extern unsigned IOCTL_CYGETTIMEOUT;
+-  extern unsigned IOCTL_CYSETDEFTHRESH;
+-  extern unsigned IOCTL_CYSETDEFTIMEOUT;
+-  extern unsigned IOCTL_CYSETTHRESH;
+-  extern unsigned IOCTL_CYSETTIMEOUT;
+   extern unsigned IOCTL_EQL_EMANCIPATE;
+   extern unsigned IOCTL_EQL_ENSLAVE;
+   extern unsigned IOCTL_EQL_GETMASTRCFG;
+-- 
+2.31.1
+
diff --git a/package/gcc/arc-2020.09-release/0002-libsanitizer-Remove-cyclades-from-libsanitizer.patch b/package/gcc/arc-2020.09-release/0002-libsanitizer-Remove-cyclades-from-libsanitizer.patch
new file mode 100644
index 0000000000..051d4db341
--- /dev/null
+++ b/package/gcc/arc-2020.09-release/0002-libsanitizer-Remove-cyclades-from-libsanitizer.patch
@@ -0,0 +1,121 @@
+From 1557c3d919623a95c2aa090d3018c31401f63f88 Mon Sep 17 00:00:00 2001
+From: Tamar Christina <tamar.christina@arm.com>
+Date: Fri, 21 May 2021 12:16:56 +0100
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
+libsanitizer/ChangeLog:
+
+	PR sanitizer/100379
+	* sanitizer_common/sanitizer_common_interceptors_ioctl.inc: Cherry-pick
+	llvm-project revision f7c5351552387bd43f6ca3631016d7f0dfe0f135.
+	* sanitizer_common/sanitizer_platform_limits_posix.cc: Likewise.
+	* sanitizer_common/sanitizer_platform_limits_posix.h: Likewise.
+---
+ .../sanitizer_common_interceptors_ioctl.inc           |  9 ---------
+ .../sanitizer_platform_limits_posix.cpp               | 11 -----------
+ .../sanitizer_platform_limits_posix.h                 | 10 ----------
+ 3 files changed, 30 deletions(-)
+
+diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
+index 490a04b2181..42e43a04441 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
++++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
+@@ -366,15 +366,6 @@ static void ioctl_table_fill() {
+ 
+ #if SANITIZER_LINUX && !SANITIZER_ANDROID
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
+index aa845df4dde..badf6a401cc 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+@@ -130,7 +130,6 @@ typedef struct user_fpregs elf_fpregset_t;
+ # include <sys/procfs.h>
+ #endif
+ #include <sys/user.h>
+-#include <linux/cyclades.h>
+ #include <linux/if_eql.h>
+ #include <linux/if_plip.h>
+ #include <linux/lp.h>
+@@ -443,7 +442,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
+ 
+ #if SANITIZER_LINUX && !SANITIZER_ANDROID
+   unsigned struct_ax25_parms_struct_sz = sizeof(struct ax25_parms_struct);
+-  unsigned struct_cyclades_monitor_sz = sizeof(struct cyclades_monitor);
+ #if EV_VERSION > (0x010000)
+   unsigned struct_input_keymap_entry_sz = sizeof(struct input_keymap_entry);
+ #else
+@@ -809,15 +807,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
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
+index d82fd5e4005..dc6423bc297 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+@@ -974,7 +974,6 @@ extern unsigned struct_vt_mode_sz;
+ 
+ #if SANITIZER_LINUX && !SANITIZER_ANDROID
+ extern unsigned struct_ax25_parms_struct_sz;
+-extern unsigned struct_cyclades_monitor_sz;
+ extern unsigned struct_input_keymap_entry_sz;
+ extern unsigned struct_ipx_config_data_sz;
+ extern unsigned struct_kbdiacrs_sz;
+@@ -1319,15 +1318,6 @@ extern unsigned IOCTL_VT_WAITACTIVE;
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
+2.31.1
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
