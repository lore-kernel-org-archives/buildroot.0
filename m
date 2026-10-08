Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42FFCA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B7E040AC5;
	Sat, 10 Oct 2026 09:28:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P0Bdq2fHmVGz; Sat, 10 Oct 2026 09:28:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 947C340ABB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624489;
	b=EONYeyFnhUuG5SIB5X3U56lghKMdC56YV4N7LbBK0G2agB42qpigXoaW01Hla900rkgf
	 WIvyO9+32+8wk3I3nGeaVsES/32jHxZnOGGw/fsvVHTXeMAaFzbU0PCJs6uObz7Df1FHd
	 kM8EKRRjEQamXrTycXQMcfdiRb5YCpzO1wetfHYEzM+FuYrTivoFMI0ysthUPdlbfHjM0
	 eUlaTD3BtPgyoz89VW/x6gtuYUBVo3Ahkp5PRAKtMbGP3BbIeC8qlTSNjNOAFBvNW61dR
	 hNYX0DjMG1gnJG0xkYdOh6Jvl5qb9AilZBASwdEQrr2ORQT+ywS5JiBIRr5/EX+QNvA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624489;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=zj1L66ABApDgw/55cNrtpAj3gSm2NaZs3DMu0+MWTnY=;
	b=o+tAwpBOcPfptFhFLnjI8V21pW2b+v1rpp8iSmsQgVRWA/5jlofQdasOrG80KSbIvURg
	 FwZiOZSIAogPSdU8KHz7rvg39BTxPoZZ55gDAJKCvvXjW4eITPwzVFz6Kq82CCmX2Lb0P
	 eZq+0eySbBXACl/iKO31cBlqoHfqQXQBCAO0oo4PiCdWUAnHiWU/xUt1mq0G9H9mNwi7D
	 hWNogiRzUDg9IlhcxGEsLxyMWhc5+7YxotthEjE8aV/265Kx6Js67Z5DuLG8AAxDLoSag
	 VelPfTyLi3JDcL18L98VtDhf9fCMS1kRDgy389ObACwzOtAVTcKayYRhR7XUP7KzrqA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624489;
	bh=zj1L66ABApDgw/55cNrtpAj3gSm2NaZs3DMu0+MWTnY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y1OAFKfCOQrysoxuvnAkwsVNcHMMDE7dugDtwf5oo/gHrrZZ1ON5pJBJ8zkZHtvAT
	 XTU1BGgqEGJgCy34UG++ede28D+7R/4GcI03ndvzSpLSBIHb2LFnnwvpcOlqruftNS
	 oD0n2TrIbD94K0gvuL1tRyed7Bqk0meFAsiu9ocNL3tHbCljQFUUbREjiAi4HDmUSd
	 yvImwMgam30SunI3T9gRHgExPp+z4YsXHakqoSIKvVxddcW2x8O8ShFULgfY4nkfCg
	 PM53uy3Dl/z5whOHdIb7IAaO2bfPrsnMpHOoWvvGkjJ7V3lfu8T/hk/2ii0jxrrNnZ
	 xYB4+pQF3mlvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 947C340ABB;
	Sat, 10 Oct 2026 09:28:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CF6D175
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B54DE80F85
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Js9NoXgsCX3i for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5456D8115C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624442;
 b=NT0zSMud/QBvgd8RAqoDaeyImNqUhhciAh2eWTLGcZLWUKHLpfWR7n01SqLVHKv4ijse
 OORtdPm2lVTT4u+88ad3IjxsEY3Y7sVVMWsLAaoPRNqHFtkjhcQ9ezeMsv359xSZInty0
 rB/M+Kj1S+54O7d9RvtbMS3+subuv65XLGclt9ORKl7Rl0KCzq5MeijwWLBSN+KWkKxWg
 9MpkZ6yv1IyUjDnjr9ESN/Uge7BtWkWXCo5dxkWTaO4Katu6mm+iavCAa7PEcxb7WwpRB
 D6YYZOv9cLYu4rOMAIV81UZWTmOvv/QAzzQGyZYHWyml3AzDisNsbSgg+jft/0GNFvw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624442;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=JBiRut45We873vgC1+EXWprPygxB4VypYBel/Iaw0aA=;
 b=kYwPj1hnSRsI5GOBVwm1jmgn4VdvW/6bXkuxBNyyYVbrMDe7qPJ0v1FZdgSD2zg4jFQ1
 RaLBU12MVZ9vJc7ZMMYMgPNlxhwqtqVVStohVFC3yXPfhItSJpPq/XrKztcrP4xRx5yFx
 SmQaT+kC90hU7RzdP1h66HWQapQJ0M0N0zL5Dl3+J6PR4H8Yf5io1T01aajjac4dhTah+
 VWan0RmQQkfPVefKTLQ26KEQblvbHD88eePSX4M10kn4Aaccgp1GyzOSmwHFVs/Wu0XVo
 5Xf7ns3RV5PNMgulWHsACjpImzy3msqz4seSptQ/ABdBz/3n8UUcXPVWPyjC4puRCMA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5456D8115C
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E8F78F0B1; Sat, 10 Oct 2026 09:26:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:26:37 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b2e19f2d75d96e5da1425ea0bf7d95a622fb98f2
X-Git-Newrev: 5cf40d817a0667c40565b26f402f14813c19b724
X-Patchwork-Hint: ignore
Message-Id: <20261010092604.3E8F78F0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] linux: fix pahole
 discovery when BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE
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
Content-Type: multipart/mixed; boundary="===============3909514225072944266=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3909514225072944266==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5cf40d817a0667c40565b26f402f14813c19b724
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Around Linux 5.11, upstream started introducing checks that execute
"pahole --version" for feature discovery (e.g. [1]).

However, when building with BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE Buildroot
only lists host-pahole in LINUX_DEPENDENCIES, so it isn't available for
the configure step when using BR2_PER_PACKAGE_DIRECTORIES. This results
in the host pahole being used (resulting in host-dependent behavior), or
no pahole being detected at all when the build host doesn't have it
(which will then disable Kconfig options that require it).

Fix this by adding host-pahole to LINUX_KCONFIG_DEPENDENCIES.

A similar issue occurs when running "make linux-menuconfig" and friends
because PATH deliberately gets stripped when pkg-kconfig.mk builds
x_CONFIGURATOR_MAKE_ENV. Explicitly pass the pahole path to fix this.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=5f9ae91f7c0dbbc4195e2a6c8eedcaeb5b9e4cbb

Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6c9c2b71e6db0bc9c16747b341439e8bb21bb7d8)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 linux/linux.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index eba22f5de2..a6f8901ba9 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -125,6 +125,7 @@ endif
 
 ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE),y)
 LINUX_DEPENDENCIES += host-pahole
+LINUX_KCONFIG_DEPENDENCIES += host-pahole
 else
 define LINUX_FIXUP_CONFIG_PAHOLE_CHECK
 	$(Q)if grep -q "^CONFIG_DEBUG_INFO_BTF=y" $(KCONFIG_DOT_CONFIG); then \
@@ -383,6 +384,9 @@ LINUX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 # therefore host-ccache would be ready, we use HOSTCC_NOCCACHE for
 # consistency with other kconfig packages.
 LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS) HOSTCC="$(HOSTCC_NOCCACHE)"
+ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE),y)
+LINUX_KCONFIG_OPTS += PAHOLE="$(HOST_DIR)/bin/pahole"
+endif
 
 # If no package has yet set it, set it from the Kconfig option
 LINUX_NEEDS_MODULES ?= $(BR2_LINUX_NEEDS_MODULES)

--===============3909514225072944266==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3909514225072944266==--
