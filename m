Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60126CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E77D060FEB;
	Fri, 12 Jun 2026 11:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XlMKR6UZYtXD; Fri, 12 Jun 2026 11:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB5926108A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263454;
	bh=6Jae7PPwrGPm9IcP/+iZ9V4EKVP5FYt++faJoYflTGI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aPj3pLyS64lddtIxY0/SlsjwKEYrjf0xv9B8TI/yFNZUUTr4qdTDV6wiYDugatiwv
	 ot+BdG69qbhAdyKYkNqFQC/+NhDtJjsuALL/Gs5MxIyYJy0V2DoHp+KRtzHEq/sWf7
	 Pp8LwYPcGg8tP7HiAlM45Ck5iC/MbCMvKhIiAsCTMOD0ir48RBJ/KHt1S89xpC4l/M
	 JFEsbA/IRF/MinsmhHh6go6XvzQd5ePgkIOQ2JTQgoZ8cvRFuFoSoPK5UEqeVvMJr4
	 akUxxn7OJc30D0U2xuejhNU+rHqVYh6eTtJh50F+Wwdw8Ef8K7uu/5lu05k2QPSRY3
	 qtma15fU+Gasw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB5926108A;
	Fri, 12 Jun 2026 11:24:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D764F4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3219540678
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kE2O8tuPa6OF for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:24:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60F7F40658
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60F7F40658
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C63D880EC; Fri, 12 Jun 2026 11:23:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 10:09:08 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: cf50153786c99a674ecac9372c6ff78a50c12556
X-Git-Newrev: bdfdeea8e1cd6a87565cc738e32ff221e1f33f35
X-Patchwork-Hint: ignore
Message-Id: <20260612112349.2C63D880EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/opencv4: respect
 LoongArch SIMD selection
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bdfdeea8e1cd6a87565cc738e32ff221e1f33f35
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
(cherry picked from commit b9d10eed1f580bdd66a554b405122d624f38142d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
