Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE50C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBE0B419BE;
	Fri,  2 May 2025 11:13:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fjVRi7xGRCuN; Fri,  2 May 2025 11:13:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C988742462
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C988742462;
	Fri,  2 May 2025 11:13:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10442229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC13F60C0D
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tVweofH48K4o for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D8FC60AE6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D8FC60AE6
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 17AC9863AE; Fri,  2 May 2025 11:11:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 13:01:05 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 21be6420f1d9dba6355e2afdb7f4417d47004513
X-Git-Newrev: 4c80e9cd3e1aad53697a7985cbf81ce7ff252753
X-Patchwork-Hint: ignore
Message-Id: <20250502111138.17AC9863AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/pixman: fix
 pixman compilation on riscv
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4c80e9cd3e1aad53697a7985cbf81ce7ff252753
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
(cherry picked from commit ffc154197dfff627b58f83267c2ef8c3c38cdadc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
