Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077C1C98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C866E8110D;
	Thu, 24 Sep 2026 18:57:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id davuz-D33Gke; Thu, 24 Sep 2026 18:57:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D080B81115
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276250;
	b=GlOxdGAp6jDimA63PBHDW2TXjpmrhZIOKpR1CuEou80pjomDrcAE101fkTRhPZmtbeAf
	 6iFAl7BZeVA4jLXTHVjNX8SGfF2k3AAffu/sUhG93ey0hMs51vgUZBugyKq1INd8ONIXO
	 kgTA5kkR7npynTzEbyYCz8Kbq/w+nIE66QHtwox2eHTTMcFcOsaLi6IHXyYsDbRZXnqUg
	 BddgO3tnRXs8VUiVw3oY+p1VXlJrC5Rl3jbldauQhyUDqjfCbEXJJNu7OajkMnCpuhmEd
	 hVcXzwe7iBqhRhr5eF4FsJItwDK4cxGDumBv395Jj4oDdE/nJ9nUAzh4aqJ8nStOckQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276250;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=TdRayR3QgiWTb4BnCr2Z02OIX5TdkcYmBRq3smN5G0s=;
	b=RJqqAJ+Em4w87xiYB9m8fWlQM+QXl7bXoeyad4B4l0+FfrCWmrCixQmMbOqjcbSeC89l
	 sRNTLW1Qsf8Akd1aHjZBQ+mxM9btTzHzSzTAE/7bp6Y0TsJHyuPOJ6fMyt/CsZVj9KO4A
	 j0M2NkPF+6hPj1URdPgRPyMCQUfBdfjlQ+JfZteH015OzQbreKzubnuRpEkYE+qKnxGFK
	 2cyuA2he0PRV95ZdbR0W270R2NTja4t5tG315FDIuBlvWMaaq7oBGpGAtTYcw4/M/rv1u
	 q3bZMMLVh28K+WgAtqA72E9w4vVy7eSS0p9TjFQt3qoE7WLwBdjd1tApFQOgq/ffpAg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276250;
	bh=TdRayR3QgiWTb4BnCr2Z02OIX5TdkcYmBRq3smN5G0s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=R0arIJ6ViLersjd3CzsED26e0sRlTEP48LmN+mgt8z7szWm7NRqVMliQnG/y0gYzm
	 BFWeKeWmpm6rj/i0TOhWJwbZmzcrp+NqmHgfnysaN7bQhbyPpgQsSfXF8R1oiQ004h
	 Fbdx+d7B48vamt2K+wWq86wRffA+GU6gmexN4uSxWlqvrAmYQQyDy7RHuXGUxye4Ts
	 oARO1EnRaR6Z3K3rADmuSuZ0ibXG3uLU8Fpaaufn4q/Y7eKI12V3YRbjQdBrI0vXB0
	 npBA/n2/c9EFKuAntK5LHi3Vdotk5SetW/lKQXprqja32xtKH3O0umh7HQmw4lR6Xg
	 JbvulIrV5bqLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D080B81115;
	Thu, 24 Sep 2026 18:57:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AE1A3417
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91BC040ACB
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yE36OklvFVHS for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 03C7040AC8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276203;
 b=DF4qnWt18DI0Cjoaq3m9ObdbtzpfGxiYEoxyXMDFVAmQRaFTA8efzAnBodT1QXhmgprF
 TGXfTtabs+704BI5gfjfDKATK3KSd6IbMfCFTTk7xgL0LJO+2h9bKDolX/vVvUhjcuTxs
 mbSHZCVbhUskSfFYFchMtAjdI9qbiBhPmoraOYEJ+GRdPwks/DkRsM8G6NlCJ9tcF+3Kh
 pnMbbaBZYkoVr5r/scaH8CsRMTfWS8mpewcP+rewfDd5L/Ek+o3bNCuGfZOo+s84DWvKB
 IQZX6lQ8fiGp3GgTRCrDU4oNaIR7ep7Zrhr030Ke5JCiSobvSBzyKtAdlUnEXh2L7Cg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276203;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=WqPOIHGq7ynSjPPu5baSe3iyZlCNRnK7r7T9/2X6SqI=;
 b=Hl/BF4zAbcmVOVsAC3aMMimIOlDBT8eLh2shLCmOXoxnnpacfdNklGrRj82qurZoggRI
 N9KgN5GpS/tKkznUBnNI8hubUFsB7nPikY8Hm5BiP5YugiOYPZvhR3+IbR5jbMAFa1yXM
 V4Zh/8vdwo/46FpHkQENyg8lmNdtjz/gYQ+ldrsiw88fVwA1kIOQU5DNqQbV2Vb+is7Uc
 cT2Ue/InS4el31rLenfwm5lVvBXOB8czIIkgZwgC3ZAAmmOhykHYYtGYqgg2sIsPykgDy
 uj8XIc2p+yBzJ5sslNEzUq4kcSLfuiPqKG5SiRtC6feJ+nAsJFGENCn/bbrq7pIRkuA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03C7040AC8
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9BF3A98385; Thu, 24 Sep 2026 18:55:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:05:18 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: af569d7cf36ee1f14cbc867a902c1b499714d62a
X-Git-Newrev: ee3f34791dd08d01cdd7c0be7101a88e8b4d443c
X-Patchwork-Hint: ignore
Message-Id: <20260924185532.9BF3A98385@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/qemu: host-qemu
 does not support AVX512 CPUs
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8433609632818664005=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8433609632818664005==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ee3f34791dd08d01cdd7c0be7101a88e8b4d443c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Building gobject-introspection for an x86 CPU variant with AVX512 fails
when g-ir-scanner runs the freshly built target binaries under
qemu-user:

  qemu: uncaught target signal 4 (Illegal instruction) - core dumped

The Qemu TCG engine implements AVX, AVX2, F16C, FMA3 and VAES since Qemu
7.2, but it does not implement the AVX512 instruction set at all [0].
Therefore no -cpu value passed through
BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS can make such binaries run, and
user-mode emulation is simply not possible for these CPU variants.

Mark those CPUs as unsupported by host-qemu, the same way it is already
done for x86_steamroller and x86_core_avx2. This relies on the existing
BR2_X86_CPU_HAS_AVX512 symbol, so all AVX512 capable variants are
covered, and it disables gobject-introspection and nodejs, which are the
two packages needing host-qemu in user mode.

[0] https://gitlab.com/qemu-project/qemu/-/issues/2878

Fixes:

  https://autobuild.buildroot.org/results/7ed7f9c36dae1ddb965a0f0021db6cd319927b47/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c2bd6148c62dbc4068ea5d53c6e95ffdf6352f0c)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/qemu/Config.in.host | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 4db114490a..0997772751 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -21,6 +21,10 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_xtensa
 	default y if BR2_x86_64
 	depends on !BR2_x86_steamroller && !BR2_x86_core_avx2
+	# The Qemu TCG engine does not implement the AVX512
+	# instruction set, so binaries built for such CPUs cannot be
+	# emulated.
+	depends on !BR2_X86_CPU_HAS_AVX512
 	depends on !BR2_powerpc_620 && !BR2_powerpc_630
 
 config BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS

--===============8433609632818664005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8433609632818664005==--
