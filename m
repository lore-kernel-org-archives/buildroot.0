Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24421C433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:49:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C106860EE4
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C106860EE4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AF19405E1;
	Wed, 17 Nov 2021 21:49:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Evf-FjzCi1Nb; Wed, 17 Nov 2021 21:49:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D44B440600;
	Wed, 17 Nov 2021 21:49:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 85B721BF307
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70FCF80C56
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:48:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5HEuAkm8xs4g for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 21:48:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E3EB80EFA
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 21:48:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 03A528D5BC; Wed, 17 Nov 2021 21:44:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 22:36:52 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 84a8aa98101a0a18355f5c03e65816e23024a7cb
X-Git-Newrev: 033c0b01514fd7a91463273b16f15e9b89a46bfc
X-Patchwork-Hint: ignore
Message-Id: <20211117214412.03A528D5BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/gdb: fix musl
 build on riscv
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

commit: https://git.buildroot.net/buildroot/commit/?id=033c0b01514fd7a91463273b16f15e9b89a46bfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Fix the following build failure raised since gdb 10.1 and
https://github.com/bminor/binutils-gdb/commit/bf84f7066626c78884436e1c39fb60f04c665f21:

../../gdbserver/linux-riscv-low.cc: In function 'void riscv_fill_fpregset(regcache*, void*)':
../../gdbserver/linux-riscv-low.cc:140:19: error: 'ELF_NFPREG' was not declared in this scope; did you mean 'ELF_NGREG'?
  140 |   for (i = 0; i < ELF_NFPREG - 1; i++, regbuf += flen)
      |                   ^~~~~~~~~~
      |                   ELF_NGREG

musl fixed the issue with
https://github.com/ifduyue/musl/commit/e5d2823631bbfebacf48e1a34ed28f28d7cb2570

Fixes:
 - http://autobuild.buildroot.org/results/16b19198980ce9c81a618b3f6e8dc9fe28247a28

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: use upstream repository for commit references]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9d77dae55778eef05a90718f49914cf6eb3d6fc6)
[Peter: drop 11.1 patch]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gdb/10.2/0007-fix-musl-build-on-riscv.patch    | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/package/gdb/10.2/0007-fix-musl-build-on-riscv.patch b/package/gdb/10.2/0007-fix-musl-build-on-riscv.patch
new file mode 100644
index 0000000000..34ab08a97a
--- /dev/null
+++ b/package/gdb/10.2/0007-fix-musl-build-on-riscv.patch
@@ -0,0 +1,60 @@
+From c3fdbc0a24c83246f951ba79c7167547da979ae5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 10 Nov 2021 23:14:54 +0100
+Subject: [PATCH] fix musl build on riscv
+
+Fix the following build failure raised with musl:
+
+../../gdbserver/linux-riscv-low.cc: In function 'void riscv_fill_fpregset(regcache*, void*)':
+../../gdbserver/linux-riscv-low.cc:140:19: error: 'ELF_NFPREG' was not declared in this scope; did you mean 'ELF_NGREG'?
+  140 |   for (i = 0; i < ELF_NFPREG - 1; i++, regbuf += flen)
+      |                   ^~~~~~~~~~
+      |                   ELF_NGREG
+
+musl fixed the issue with
+https://git.musl-libc.org/cgit/musl/commit/?id=e5d2823631bbfebacf48e1a34ed28f28d7cb2570
+
+Fixes:
+ - http://autobuild.buildroot.org/results/16b19198980ce9c81a618b3f6e8dc9fe28247a28
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ gdb/nat/riscv-linux-tdesc.c  | 5 +++++
+ gdbserver/linux-riscv-low.cc | 5 +++++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/gdb/nat/riscv-linux-tdesc.c b/gdb/nat/riscv-linux-tdesc.c
+index 837b1707e0f..667c013006a 100644
+--- a/gdb/nat/riscv-linux-tdesc.c
++++ b/gdb/nat/riscv-linux-tdesc.c
+@@ -31,6 +31,11 @@
+ # define NFPREG 33
+ #endif
+ 
++/* Work around musl breakage since version 1.1.24.  */
++#ifndef ELF_NFPREG
++# define ELF_NFPREG 33
++#endif
++
+ /* See nat/riscv-linux-tdesc.h.  */
+ 
+ struct riscv_gdbarch_features
+diff --git a/gdbserver/linux-riscv-low.cc b/gdbserver/linux-riscv-low.cc
+index 8bf97ea4aa3..1142dbc7b16 100644
+--- a/gdbserver/linux-riscv-low.cc
++++ b/gdbserver/linux-riscv-low.cc
+@@ -30,6 +30,11 @@
+ # define NFPREG 33
+ #endif
+ 
++/* Work around musl breakage since version 1.1.24.  */
++#ifndef ELF_NFPREG
++# define ELF_NFPREG 33
++#endif
++
+ /* Linux target op definitions for the RISC-V architecture.  */
+ 
+ class riscv_target : public linux_process_target
+-- 
+2.33.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
