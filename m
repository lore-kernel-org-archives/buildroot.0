Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A20AC98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 485FF40B5D;
	Thu, 24 Sep 2026 18:57:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RyhCZ02cbXC3; Thu, 24 Sep 2026 18:57:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 466A240CB7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276247;
	b=cchs5WabYEspxNW06u7b6n7jxQojtq68HJWn++xeY8nBaOEIo3JTXpwF+C92Z/yrKq7+
	 7fkiJ6WEe6OEqK9eAlsPhdoTzjjv2Pb9H1A23Bze99FCARgxkBy6kQCm/j55PVY5hfZu8
	 WflrDqEPKuvSRDESMdDHRyyw+EbO91TKa2eFRhcsXMQ9dZcxQkQjkCtWc41KSrf3Qxbqc
	 C+Q4GSMNsyiZR6DhPoHEmpHyAptL7zTItiJgAjeeYSP6N2hFSFfBfg3O60BEwbqBMVSZ+
	 Ptvfdbht905emuuooLlsCq9RteY7AIbCccfjqNA4ia2jQx+11L1MUJIqBxwhgzuvk2A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276247;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=XxSxDBFJXKEuLE0NPeVuOSS7XkTg45KguoQsAAgl15I=;
	b=PxPYqpS5a1VpiUSd4CnaP6Y1k+5gdmnCGqjtOV0vMEz6+LPj/rnmwzikscgbC4jsPIMS
	 2jHI0k3iIDQiwXGLr29o5IBxwiAV3V9YHR4aXEUV9FFrPEST5YdwO/a5jqxGlKo+79rmA
	 0ojT4VyrltuI8JD+1/SK+rBb0NdvODzx8/JomO+Sx8I+kedJ09sKViqjk5ePJLpie5tZc
	 ET6n1/8EBYvByA6HGc4dUDCrS2LL5exxsgUgqPowzsrmZsr1+blZ9/Oy3rCghwD40SCs1
	 LtamVGQiTxd2nGuZsPkTmbe0TgJw/Iw0PTuyzk1dkaciJAJNtbm11c/cuypwU6DFHyA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276247;
	bh=XxSxDBFJXKEuLE0NPeVuOSS7XkTg45KguoQsAAgl15I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HcDVZaqFU/ocuvov+oi68n7vlQ0J/nfmm+FIjusbRAfo9Ncs2kAh9VgNcMPSyKWsM
	 vpZwLLg6acopqfBaXsgdGtoon2sf6FsSV9S9napbkIx7rMhbeJH3S3+mSH0fJznEfw
	 E/nZfJ3Aw5xBaTTNUEj3ROsQkh8CHdyeVI88MebgRX8eA0KhDZ845E9degcu/+s8qR
	 HSW5V6DRXVM0+bFvdZufgVYEhNYHH3+yiPJnwsUATHLOKQWGQdiAGcDM4O7b2FQzum
	 iDP5oP0kS6gVQF5Cy0QC2yhpbR4mIk0pF6Ks9LEnZgE+RZ9SorD/XrsmBeCYTPHfrI
	 /aB2sLw/iUF7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 466A240CB7;
	Thu, 24 Sep 2026 18:57:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 91B80392
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8229640ACE
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PmynIGBMjWE5 for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org ECF1F40AD3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276204;
 b=n9WwDXvZT0eMklP4fo1wVmIhAETPIk7RgsgKPz5dhEcKNmuhIEwQVri/5dKEscCtnwUf
 Vp18us5kjb/JTNNbsn4Twu36ORxBDMLaoGYgfD1ZimJATbkNPp66tfc/eY7RnO0L9lEhQ
 2lUIi/A9l6ZHaCNasxMQUUzQ0/Y9ncBnEI3QscDX89ABCc2xvqs1VaSB6cHkKwDmfwmlZ
 5LHWedCR7rwpX/sF+M1qeFpahKYC5riDoHLFfMxfsobmkEJrdQ20DFQyh04OF6BUs5rBn
 uiJLJmVemfAuTEJQGb0+JyP43X6gluv5L0Q0icAT3WlNZUL4NzURB9UC+UXd/itByTQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276204;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=F0W7muNb6pu4ztEeVTzKL/1btF3PpKLvJr3YD4CHUIk=;
 b=ZnLd0YTC1P6g0NTCAfNRMSZdyB7VUaZDclU0UNFPeydI0Xi9vTniSDybXb9e0lPfH5Oh
 li7DiBRcczVfRwgiNjdLPj8OBQNv/Kxelk8/9wCVuxic9YYJDBnAj+q1jObrnmHi2G+lm
 kJt7qHmBchPsWij51hpuWBmITQayUnl/VJQYBQf/IxMofyNFS9qV5HPwogKf0xRnfAJtN
 yU2PSo5t9O76cxf6qnP0pWtAwdYywuqsRn1UbExCC2TqjIK+S+XZPc5w4qoDdm9oVi4vl
 mY8AJ8LieqBFGgeCVAq1z3YmaqfWyflo+JqOW0bzKc/nnjd07dskusbF52rWoDO/D7w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECF1F40AD3
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9093E98383; Thu, 24 Sep 2026 18:55:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:18:54 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0d4e164503be248290a25843d87e56bb83696004
X-Git-Newrev: 80707542190f3c16c240d84029c98453ee82b72a
X-Patchwork-Hint: ignore
Message-Id: <20260924185533.9093E98383@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/qemu: drop
 x86_core_avx2 exclusion
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
Content-Type: multipart/mixed; boundary="===============2713330068350936028=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2713330068350936028==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/80707542190f3c16c240d84029c98453ee82b72a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Commit 1f7efaf89f03 ("package/qemu: do not support x86_steamroller or
x86_core_avx2") excluded BR2_x86_core_avx2 from
BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS because binaries built for that CPU
variant crashed under qemu-user. This was done at the time of Qemu 4.2,
whose TCG engine did not implement AVX at all.

Since Qemu 7.2, the TCG engine implements AVX, AVX2, F16C, FMA3 and
VAES. In Qemu 11.0.0 (the version we currently package) and 11.1.1,
target/i386/cpu.c has:

  #define TCG_EXT_FEATURES (... | CPUID_EXT_AVX | CPUID_EXT_F16C | \
            CPUID_EXT_FMA | ...)
  #define TCG_7_0_EBX_FEATURES (... | CPUID_7_0_EBX_BMI1 | \
            CPUID_7_0_EBX_BMI2 | CPUID_7_0_EBX_AVX2 | ...)

which covers everything gcc generates for -march=core-avx2.

In addition, the exclusion was inconsistent: gcc's core-avx2 is a
deprecated alias for haswell, both variants select exactly the same
BR2_X86_CPU_HAS_* symbols in arch/Config.in.x86, and haswell was never
excluded. The same goes for broadwell, skylake, zen*, x86-64-v3, ...,
which all enable AVX2 and build fine on the autobuilders.

So drop the BR2_x86_core_avx2 exclusion.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8d80efe017880884272332b97316748208ec2325)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/qemu/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 0997772751..c17e723b67 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -20,7 +20,7 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_sparc64
 	default y if BR2_xtensa
 	default y if BR2_x86_64
-	depends on !BR2_x86_steamroller && !BR2_x86_core_avx2
+	depends on !BR2_x86_steamroller
 	# The Qemu TCG engine does not implement the AVX512
 	# instruction set, so binaries built for such CPUs cannot be
 	# emulated.

--===============2713330068350936028==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2713330068350936028==--
