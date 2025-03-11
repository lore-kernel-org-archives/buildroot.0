Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D95C282EC
	for <buildroot@archiver.kernel.org>; Tue, 11 Mar 2025 20:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 489F68144A;
	Tue, 11 Mar 2025 20:02:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Ry5ugcYHgJ4; Tue, 11 Mar 2025 20:02:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1862181443
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1862181443;
	Tue, 11 Mar 2025 20:02:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F4981DB
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 20:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40DFD405D6
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 20:02:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7lTjSNtFma9u for <buildroot@buildroot.org>;
 Tue, 11 Mar 2025 20:02:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DF2840104
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DF2840104
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 20:02:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88E2282DFB; Tue, 11 Mar 2025 20:02:31 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 11 Mar 2025 20:59:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c653dd19f531f66601faf109db1817b0b2141be
X-Git-Newrev: ae884111d27d3c9fd22383fc1b4bb61ed7f075fd
X-Patchwork-Hint: ignore
Message-Id: <20250311200231.88E2282DFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/elfutils: handle missing
 user_pac_mask on aarch64
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7405865375360211180=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7405865375360211180==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ae884111d27d3c9fd22383fc1b4bb61ed7f075fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] "package/elfutils: bump to version 0.192"
elfutils fails to build on Aarch64 with toolchain including Kernel older
than version 5.0. Error shows:

    aarch64_initreg.c: In function 'aarch64_set_initial_registers_tid':
    aarch64_initreg.c:61:24: error: storage size of 'pac_mask' isn't
    known
       61 |   struct user_pac_mask pac_mask;
          |                        ^~~~~~~~

elfutils 0.192 introduced a Aarch64 pointer authentication support in
upstream commit [2].

For reference, the user_pac_mask structure was introduced in Kernel
upstream commit [3], included in Kernel v5.0.

This is fixed in the upstream [4] so bring that patch in.

Fixes:
- e.g https://autobuild.buildroot.org/results/5156901a73be52ce8ffbf10729e6852499a300be/
- 4/6 of the failures here: https://autobuild.buildroot.org/?reason=elfutils-0.192&arch=aarch64

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/5eb734766b24de5fce6e586897cd4827f8855442
[2] https://sourceware.org/git/?p=elfutils.git;a=commitdiff;h=64e3b451ad2cec8d45661b1816e3d2dc4431f3ca
[3] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=ec6e822d1a22d0eef1d1fa260dff751dba9a4258
[4] https://sourceware.org/git/?p=elfutils.git;a=commit;h=52a747a316042e70a22acb489df9e51bfc6bf2d5

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0003-define-user_pac_mask-if-needed.patch      | 97 ++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/package/elfutils/0003-define-user_pac_mask-if-needed.patch b/package/elfutils/0003-define-user_pac_mask-if-needed.patch
new file mode 100644
index 0000000000..2753a23094
--- /dev/null
+++ b/package/elfutils/0003-define-user_pac_mask-if-needed.patch
@@ -0,0 +1,97 @@
+From 52a747a316042e70a22acb489df9e51bfc6bf2d5 Mon Sep 17 00:00:00 2001
+From: Markus Mayer <mmayer@broadcom.com>
+Date: Fri, 21 Feb 2025 11:19:34 -0800
+Subject: [PATCH] aarch64: define struct user_pac_mask if needed
+
+On Aarch64, Linux is using Pointer Authentication Code (PAC) for pointer
+authentication.[1] The struct "user_pac_mask" has been part of the Linux
+kernel since version 5.0 as part of this feature. However, older kernels
+do not define it.
+
+Therefore, we want to check if the definition is present in the kernel
+headers and provide one if it isn't. This ensures two things:
+
+* elfutils will continue to compile against kernel headers from 4.x
+* binaries built against older kernel headers will still be fully
+  functional if used on a newer system
+
+For reference, the build error that is being avoided looks like this:
+
+[...]
+  CC       aarch64_initreg.o
+aarch64_initreg.c: In function 'aarch64_set_initial_registers_tid':
+aarch64_initreg.c:61:24: error: storage size of 'pac_mask' isn't known
+   struct user_pac_mask pac_mask;
+                        ^~~~~~~~
+aarch64_initreg.c:61:24: warning: unused variable 'pac_mask' [-Wunused-variable]
+make[4]: *** [Makefile:831: aarch64_initreg.o] Error 1
+make[3]: *** [Makefile:547: all-recursive] Error 1
+make[2]: *** [Makefile:463: all] Error 2
+
+[1] https://docs.kernel.org/arch/arm64/pointer-authentication.html
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=32684
+
+Fixes: 64e3b451ad2c ("aarch64: extend dwfl_thread_state_registers to handle PAC")
+Signed-off-by: Markus Mayer <mmayer@broadcom.com>
+Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
+Upstream: https://sourceware.org/git/?p=elfutils.git;a=commit;h=52a747a316042e70a22acb489df9e51bfc6bf2d5
+---
+ backends/aarch64_initreg.c | 21 +++++++++++++++++++++
+ configure.ac               |  8 ++++++++
+ 2 files changed, 29 insertions(+)
+
+diff --git a/backends/aarch64_initreg.c b/backends/aarch64_initreg.c
+index 5ec45ea60..a6badbb45 100644
+--- a/backends/aarch64_initreg.c
++++ b/backends/aarch64_initreg.c
+@@ -47,6 +47,27 @@
+ #define BACKEND aarch64_
+ #include "libebl_CPU.h"
+ 
++/*
++ * pointer authentication masks (NT_ARM_PAC_MASK)
++ *
++ * Defined by Linux kernel headers since Linux 5.0. Define it here if kernel
++ * headers are older than that, to ensure this file builds regardless.
++ */
++#if defined(__aarch64__) && defined(__linux__)
++
++#ifndef NT_ARM_PAC_MASK
++#define NT_ARM_PAC_MASK 0x406
++#endif
++
++#ifndef HAVE_USER_PACK_MASK
++struct user_pac_mask {
++  __u64 data_mask;
++  __u64 insn_mask;
++};
++#endif
++
++#endif /* __aarch64__ && __linux__ */
++
+ bool
+ aarch64_set_initial_registers_tid (pid_t tid __attribute__ ((unused)),
+ 			  ebl_tid_registers_t *setfunc __attribute__ ((unused)),
+diff --git a/configure.ac b/configure.ac
+index e57d39275..3298f7fc7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -777,6 +777,14 @@ if test "$sys_user_has_user_regs" = "yes"; then
+             [Define to 1 if <sys/user.h> defines struct user_regs_struct])
+ fi
+ 
++AC_CHECK_TYPE([struct user_pac_mask],
++              [has_user_pac_mask=yes], [has_user_pac_mask=no],
++              [[#include <asm/ptrace.h>]])
++if test "$has_user_pac_mask" = "yes"; then
++  AC_DEFINE(HAVE_USER_PACK_MASK, 1,
++            [Defined if struct user_pac_mask exists.])
++fi
++
+ # On a 64-bit host where can can use $CC -m32, we'll run two sets of tests.
+ utrace_BIARCH
+ CC_BIARCH="$CC $utrace_biarch"
+-- 
+2.43.5
+

--===============7405865375360211180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7405865375360211180==--
