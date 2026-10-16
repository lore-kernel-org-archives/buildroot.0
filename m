Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A746CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8AA660F2E;
	Fri, 16 Oct 2026 13:10:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ozwqN64oqlu6; Fri, 16 Oct 2026 13:10:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2A1EF60F0E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156195;
	b=kBF8n+B51St3KQHrxuh8TiCqejyWcW6avrPbDE/YbN1n704z0BdMzl4yd4WipYRmf1dJ
	 89JINC6AMcLV+RfsqLzdHe17hOLy0T3AUKMcW4SEEZCKAjkZWA2mD9bOHTdoSi0AABj3a
	 CgfVULVba5UfMExEkNgrtLITR2rHZvFMm7eppsR/BugBIU4ghKf3uy0DN6kEzHVznx1Tb
	 URDBzYjvwiozyTc7mDaN1J+gjFUQcGvxTXjmAI8yzBhw4OhxTmBhXh6l0/oZewZCxP0Qi
	 kkm424hwdfNRPyWiP049QYL+ofB9BTYzQLU3QCjlVLCUampV5T6V46FBPMBSxYh1S3g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156195;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=1u0Yx5yxh/jsw3sWBDb/eOP9QYEz/24sAlXoNnwLne8=;
	b=OidcNeanYAN2MxUZZPGdcBPbT4LNUJaGLS7H9HphCHSAKL6LpOxRXaihBjUX1scr1vxU
	 AT56Xq7JBjrhNEIXA53OD1AN52DG+jCVieoORAF3oEwv0TqlWoYbN8PJnrHk4nalbvJU7
	 oP/HKHyJN8h0n21GYWhfrMsqEIq0+gyVdliw9zltUezHdUvlh7zyJPpoUkIKUP56AH79m
	 td2Ge4RHrCwRVuOVx63aPvkWVgxI0OdRM84fULhxwCBj+HfxJkATds3O+NGjZRBRJ8CjA
	 iwA4H5tGpH6gzLt413fVZYCZojpdJk3BTbdzxfALGI7QJNDkJ/w0dptlZGXE+ofRM+w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156195;
	bh=1u0Yx5yxh/jsw3sWBDb/eOP9QYEz/24sAlXoNnwLne8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qV3XNulOx/KPL0OAdUsfUSVzmrFA04NYoRVsknasfGQm9Lt3jN8kWG8TOKql9NXpb
	 jNqz6kUpFVABYhSWbmnj6OVeV+zE0IcgCiIInwR4PnJ5eGAuuYTl3njZSVz9F3u6a4
	 VyKe8WuXfn/+5/K3PIgpXqwcWZ09DoCcpwjEh5gOS11q7IYEbQy5jpuNniPqnDde8P
	 RTP0eUd5ji86PHY50HZs//KpoTOHugotV2aXCbIfjG/lm2CxEz4sxvf0LOySOy7JwR
	 /kvBdhYC5wy82MJJKvbDS6LTAt3X8+y28+Q7PcXKsHnAv1xotEfWdAoRdrtwvlFl9Q
	 iKOaw9ZP+N71A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A1EF60F0E;
	Fri, 16 Oct 2026 13:09:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D6468F45
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C86EE409F3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7dlCNweXvkw3 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2735D40A01
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156109;
 b=VTEREsfm3rZTg/fd5/TdQv+HwDVMTaYS2XDfkeR0MHT0dFTnPorr9NtGMhx/LwJ3Z66e
 x7pjdUaxMkNyQM+X7lmr1sCpQJPe/4OHrrudvTKdiz90Igvi8BRrdKq6fBEkch+GwhUqI
 AdCT9MwocNZFvo0/WScZKuv2CHyLSeaIQ/gWC2g2bwWph45XMKOTZV4E8ZCVjnOPuvnxl
 9o1JQnn7t7/LsjuhxdAi8KBVnsCfO4ENFOJuCuKO07LNk/nAoIecPMJRg5eCLu+8Nr5Fm
 jLV9da6SaRmFPUH8HJwpX+ha8z2RZ4qRp6w43gjNQYfwVE1YrT6iNVX138MmOQrKU0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156109;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=aso1yAPeitrz712WDzAXLgNmiimT0pI1Fy9ZvFnGTO8=;
 b=AG/MGtglswUARnvNR7+cqRmhuhRWghM31/stk8rqIVgkP9cVe42D000RaOrn5wT7vXec
 BqUdDhkbIn92XodUPcAK+d48AJQ1NIcDguzv3il6YcYbn2mqiwlO7dkEYpz3LwLVqGgQm
 aTTJ7LilR9cIO5Gsq5P3fXM8ThUeQ+5xbAD69xVNnREeb8+3o5XZFL5dXMXa2gQWgdpdX
 7OMFW5nUuuJ33Owf/JKuxLGkDaxETxWeinrlV5Lyc82qxfqjpxy3mSeKjCi+6c/5CY0A2
 z/I9OtplgVUNGKOJG502rxdxue9SIXYAIBtP4BexgvOMDKDb/gNTRI3Ve5Ir1+pTLMQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2735D40A01
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 187E8960D8; Fri, 16 Oct 2026 13:07:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: dc591fd5a9f1c6411b69d0cc9574c0f0e23016d7
X-Git-Newrev: 93978d91e18c8ae864e9e73b78eca8baf1a01b18
X-Patchwork-Hint: ignore
Message-Id: <20261016130708.187E8960D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] linux: always select
 host-uboot-tools for mips
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
Content-Type: multipart/mixed; boundary="===============1172820685048792270=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1172820685048792270==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/93978d91e18c8ae864e9e73b78eca8baf1a01b18
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Since Buildroot commit 40e266ccb9 [1], host-uboot-tools was always selected
for the latest Linux kernel. This change is intended for autobuilders, and
was introduced in Buildroot while the latest kernel was 6.12.

However, further investigation seem to indicate that itb images were
generated for mips for a much longer time. Linux commit eed0eabd12 [2]
seem to enable that image format, and was released in Linux 4.9.

This version being EOL for quite some time, we can therefore assume
any "not so old" Linux for mips will need host-uboot-tools to finalize
this image, and therefore we should select it when building Linux.

[1] linux: select host-uboot-tools with FIT on mips
    https://gitlab.com/buildroot.org/buildroot/-/commit/40e266ccb9
[2] MIPS: generic: Introduce generic DT-based board support
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=eed0eabd12ef061821cbfa20d903476e07645320

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0f7c08d8fb36e6e12522ce6f8012c91ace520204)
[raphael: resolve conflicts]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 linux/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 37c8a4e953..d6e4b01617 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -4,6 +4,9 @@ config BR2_LINUX_KERNEL
 	bool "Linux Kernel"
 	select BR2_PACKAGE_HOST_KMOD # Unconditional, even if modules not enabled
 	select BR2_PACKAGE_HOST_IMAGEMAGICK if BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH != ""
+	# mips always generates an ITB image
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	help
 	  Enable this option if you want to build a Linux kernel for
 	  your embedded device
@@ -32,9 +35,6 @@ choice
 config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (6.12)"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12 if BR2_KERNEL_HEADERS_AS_KERNEL
-	# mips always generates an ITB image
-	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
-	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.246-cip66)"

--===============1172820685048792270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1172820685048792270==--
