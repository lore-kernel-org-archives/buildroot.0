Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE10CD6E60
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 19:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3897060684;
	Mon,  1 Jun 2026 19:01:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HsmBPJkATeOF; Mon,  1 Jun 2026 19:01:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D5FB60678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780340478;
	bh=f57VNRLptnwACYi3E13xgVF6/3kVbuu4f9tXTBr2D4g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hYikDdsb28wGI6xIliD1bs4pov+VXnfHSsbpdq5xmuUKfHY3uZDC3S/qDQ1Cac5HJ
	 cDOD1FqMKwhEyye6ZQ380uI8UURJEnJiFBPErR4ydiu7/jiEf8AGQ1479an51QPXrh
	 MleHKh8AuZrazNk1VIS/Lhcqvlcp1HaeaabbZvutd3zs40IryC5kn4Z3YbdGkIO5cA
	 a0iA3lFHN/yTImHJEmW0bEVXzVcIyWr5OqQXSDf7B0q4C2mSksPe3i3uRxOZIOWDYA
	 ixL7VxnzvX8GI6pI/oq7UIGwJRgI7pqgFLVZ31eOTJDwtUOFOp61tOM2eD97qUsr5f
	 ZMtnPIliutrgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D5FB60678;
	Mon,  1 Jun 2026 19:01:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 281B5F4
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95904407A1
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GuEBaz4CvAyA for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 19:01:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49802407AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49802407AE
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:01:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D9138780D; Mon,  1 Jun 2026 19:01:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jun 2026 20:53:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ccf15ef72b01398fa6e7063c470492742ca9f8bc
X-Git-Newrev: b9d10eed1f580bdd66a554b405122d624f38142d
X-Patchwork-Hint: ignore
Message-Id: <20260601190101.2D9138780D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencv4: respect LoongArch SIMD
 selection
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b9d10eed1f580bdd66a554b405122d624f38142d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

OpenCV probes the host compiler for LSX/LASX by trying to compile a
small test program with '-mlsx' / '-mlasx'. With Buildroot's toolchain
this probe succeeds even when the target CPU lacks the matching ISA
extension, and the resulting libraries then contain LSX/LASX
instructions. This causes SIGILL at runtime on, e.g., the LA264.

Map Buildroot's BR2_LOONGARCH_SIMD_* selection to OpenCV's
CPU_BASELINE / CPU_DISPATCH knobs:

  BR2_LOONGARCH_SIMD_NONE  -> no baseline, no dispatch
  BR2_LOONGARCH_SIMD_LSX   -> baseline = LSX,  no dispatch
  BR2_LOONGARCH_SIMD_LASX  -> baseline = LSX,  dispatch = LASX

The block is gated on BR2_loongarch64, so the existing auto detection
remains in effect for every other architecture.

Signed-off-by: Pengji Li <wjjsn@qq.com>
Reviewed-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/opencv4/opencv4.mk | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
index 695355c308..0e2567eb6f 100644
--- a/package/opencv4/opencv4.mk
+++ b/package/opencv4/opencv4.mk
@@ -120,6 +120,41 @@ OPENCV4_CONF_OPTS += \
 	-DENABLE_NEON=$(if $(BR2_ARM_CPU_HAS_NEON),ON,OFF) \
 	-DENABLE_VFPV3=OFF
 
+# LoongArch: OpenCV probes the host compiler for LSX/LASX by trying to
+# compile a small test program with '-mlsx' / '-mlasx'. With Buildroot's
+# toolchain this check succeeds even when the target CPU does not have
+# the matching ISA extension, and the resulting OpenCV libraries end up
+# containing LSX/LASX instructions, causing SIGILL at runtime on CPUs
+# such as the LA264.
+#
+# Trust Buildroot's own LoongArch SIMD selection (BR2_LOONGARCH_SIMD_*)
+# as the source of truth and translate it to OpenCV's CPU_BASELINE /
+# CPU_DISPATCH knobs (OpenCV knows LSX and LASX on LoongArch):
+#
+#   BR2_LOONGARCH_SIMD_NONE  -> no baseline, no dispatch
+#   BR2_LOONGARCH_SIMD_LSX   -> baseline = LSX,  no dispatch
+#   BR2_LOONGARCH_SIMD_LASX  -> baseline = LSX,  dispatch = LASX
+#                              (LASX implies LSX; OpenCV's own upstream
+#                              combination matches BR2's choice above.)
+#
+# We only enter this block on LoongArch, so the existing OpenCV auto
+# detection still applies for all other architectures.
+ifeq ($(BR2_loongarch64),y)
+ifeq ($(BR2_LOONGARCH_SIMD_NONE),y)
+OPENCV4_CONF_OPTS += \
+	-DCPU_BASELINE= \
+	-DCPU_DISPATCH=
+else ifeq ($(BR2_LOONGARCH_SIMD_LSX),y)
+OPENCV4_CONF_OPTS += \
+	-DCPU_BASELINE=LSX \
+	-DCPU_DISPATCH=
+else ifeq ($(BR2_LOONGARCH_SIMD_LASX),y)
+OPENCV4_CONF_OPTS += \
+	-DCPU_BASELINE=LSX \
+	-DCPU_DISPATCH=LASX
+endif
+endif
+
 # Cuda stuff
 OPENCV4_CONF_OPTS += \
 	-DBUILD_CUDA_STUBS=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
