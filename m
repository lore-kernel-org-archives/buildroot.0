Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A19C369D7
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 19:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57232608B8;
	Tue, 22 Apr 2025 19:40:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SuALpMpx2pOy; Tue, 22 Apr 2025 19:40:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 769AF6081B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 769AF6081B;
	Tue, 22 Apr 2025 19:40:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C0FA1BC
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 194244051C
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f-ehKqohlas5 for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 19:39:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 331BF410D0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 331BF410D0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:39:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2248286144; Tue, 22 Apr 2025 19:39:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Apr 2025 21:39:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 386e6bb4799471acc61c085fdc6472b2e43b0554
X-Git-Newrev: ffc154197dfff627b58f83267c2ef8c3c38cdadc
X-Patchwork-Hint: ignore
Message-Id: <20250422193957.2248286144@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pixman: fix pixman compilation on
 riscv
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ffc154197dfff627b58f83267c2ef8c3c38cdadc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the riscv vector extension is enabled for pixman, it assumes that
the kernel headers also support riscv vector. Apply a patch that
disables riscv vector in pixman if the Linux headers do not support
COMPAT_HWCAP_ISA_V which pixman requires for vector runtime detection.

This issue exists since pixman 0.44.0, which Buildroot started using
in commit ba2fb599cd002b57fa70e978d91884c98d8aad05.

Fixes:

  http://autobuild.buildroot.net/results/4ecdf5320716ec8b39f09fde3fcbbdcdb557f8ab/

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-enable-RVV-on-linux-if-hwcap-headers-are.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/pixman/0001-RISC-V-Only-enable-RVV-on-linux-if-hwcap-headers-are.patch b/package/pixman/0001-RISC-V-Only-enable-RVV-on-linux-if-hwcap-headers-are.patch
new file mode 100644
index 0000000000..ad1a0902e2
--- /dev/null
+++ b/package/pixman/0001-RISC-V-Only-enable-RVV-on-linux-if-hwcap-headers-are.patch
@@ -0,0 +1,44 @@
+From d0045f1fc32635d9629ea9e361631b07d9ca4140 Mon Sep 17 00:00:00 2001
+From: Charlie Jenkins <charlie@rivosinc.com>
+Date: Mon, 21 Apr 2025 13:08:50 -0700
+Subject: [PATCH] RISC-V: Only enable RVV on linux if hwcap headers are
+ available
+
+Linux 6.4 introduced COMPAT_HWCAP_ISA_V. When trying to compile pixman
+against linux headers older than this, pixman will fail to compile
+because it assumes COMPAT_HWCAP_ISA_V exists.
+
+During meson configuration, do not enable have_rvv if the platform is
+Linux and COMPAT_HWCAP_ISA_V doesn't exist.
+
+Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
+Fixes: 0e424031bda2 ("RISC-V floating point operations")
+Upstream: https://gitlab.freedesktop.org/pixman/pixman/-/merge_requests/149
+---
+ meson.build | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index fdea28f..cb10931 100644
+--- a/meson.build
++++ b/meson.build
+@@ -379,7 +379,15 @@ if not use_rvv.disabled()
+         }
+       ''',
+       args : rvv_flags,
+-      name : 'RISC-V Vector Intrinsic Support')
++      name : 'RISC-V Vector Intrinsic Support') and cc.compiles('''
++      #if defined(__linux__)
++      #include <asm/hwcap.h>
++      #include <sys/auxv.h>
++      COMPAT_HWCAP_ISA_V
++      #endif
++      ''',
++      args : rvv_flags,
++      name: 'RISC-V Vector Linux HWCAP Support')
+       have_rvv = true
+     endif
+   endif
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
