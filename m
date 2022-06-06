Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D931FC433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 09:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B5EE40FDF;
	Mon,  6 Jun 2022 09:32:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BUMwXhrXMqiP; Mon,  6 Jun 2022 09:32:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 876E1408B8;
	Mon,  6 Jun 2022 09:32:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 165691BF982
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 09:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00FA760ECE
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 09:31:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EryZDNM1yMWL for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 09:31:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 206CA60AF6
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 09:31:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 43E1786C75; Mon,  6 Jun 2022 09:20:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 11:26:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 211a4848b73303b246f82f1aff899748dcfe902f
X-Git-Newrev: 2bee0f34598d64a983a30ab7999bf4305f957377
X-Patchwork-Hint: ignore
Message-Id: <20220606092003.43E1786C75@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/diffutils: Fix build on ppc32 with
 musl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2bee0f34598d64a983a30ab7999bf4305f957377
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sigsegv.c: In function 'sigsegv_handler':
 sigsegv.c:225:75: error: 'mcontext_t' has no member named 'uc_regs';
 did you mean 'gregs'?

  ((ucontext_t *) ucp)->uc_mcontext.uc_regs->gregs[1]

Musl defines pt_regs differently to glibc. Backport a patch from
upstream gnulib (the source for this file in diffutils).

Fixes:

 http://autobuild.buildroot.net/results/1b40146436eb2b3500d0d8faef96b3374f8e5cda/

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-support-for-Linux-PowerPC-32-bit-with-mu.patch | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/package/diffutils/0005-sigsegv-Add-support-for-Linux-PowerPC-32-bit-with-mu.patch b/package/diffutils/0005-sigsegv-Add-support-for-Linux-PowerPC-32-bit-with-mu.patch
new file mode 100644
index 0000000000..16e0941f6c
--- /dev/null
+++ b/package/diffutils/0005-sigsegv-Add-support-for-Linux-PowerPC-32-bit-with-mu.patch
@@ -0,0 +1,58 @@
+From 6f2f006185cdeeda997d19d651379bfc6887e394 Mon Sep 17 00:00:00 2001
+From: Joel Stanley <joel@jms.id.au>
+Date: Mon, 6 Jun 2022 17:14:12 +0930
+Subject: [PATCH] sigsegv: Add support for Linux/PowerPC (32-bit) with musl
+ libc. Reported by Khem Raj <raj.khem@gmail.com> in
+ <https://lists.gnu.org/archive/html/m4-patches/2022-03/msg00000.html>.
+
+* src/sigsegv.c (SIGSEGV_FAULT_STACKPOINTER): In the Linux/PowerPC
+32-bit case, handle musl libc differently.
+* modules/sigsegv (Files): Add m4/musl.m4.
+(configure.ac): Invoke gl_MUSL_LIBC.
+
+Backported from http://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=2d830e4a792fcd9f614ed08a7f18584b8b21d23b
+Signed-off-by: Joel Stanley <joel@jms.id.au>
+---
+ lib/sigsegv.c | 25 +++++++++++++++++++++----
+ 1 file changed, 21 insertions(+), 4 deletions(-)
+
+diff --git a/lib/sigsegv.c b/lib/sigsegv.c
+index da70ffa5fda1..da64d7d0b617 100644
+--- a/lib/sigsegv.c
++++ b/lib/sigsegv.c
+@@ -227,11 +227,28 @@ int libsigsegv_version = LIBSIGSEGV_VERSION;
+ #  if defined __powerpc64__ || defined __powerpc64_elfv2__ /* 64-bit */
+ #   define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.gp_regs[1]
+ #  else /* 32-bit */
+-/* both should be equivalent */
+-#   if 0
+-#    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.regs->gpr[1]
++#   if MUSL_LIBC
++/* musl libc has a different structure of ucontext_t in
++   musl/arch/powerpc/bits/signal.h.  */
++/* The glibc comments say:
++     "Different versions of the kernel have stored the registers on signal
++      delivery at different offsets from the ucontext struct.  Programs should
++      thus use the uc_mcontext.uc_regs pointer to find where the registers are
++      actually stored."  */
++#    if 0
++#     define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.gregs[1]
++#    else
++#     define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_regs->gregs[1]
++#    endif
+ #   else
+-#    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.uc_regs->gregs[1]
++/* Assume the structure of ucontext_t in
++   glibc/sysdeps/unix/sysv/linux/powerpc/sys/ucontext.h.  */
++/* Because of the union, both definitions should be equivalent.  */
++#    if 0
++#     define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.regs->gpr[1]
++#    else
++#     define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.uc_regs->gregs[1]
++#    endif
+ #   endif
+ #  endif
+ 
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
