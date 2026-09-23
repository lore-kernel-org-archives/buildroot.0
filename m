Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDE4C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55D8A41147;
	Thu, 24 Sep 2026 18:59:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BStPxVtQuJ4X; Thu, 24 Sep 2026 18:59:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 473CF41166
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276364;
	b=VcfiWEOKeX/QALic82k5UKV2fNAdA0ND5ndOaUPgd55qwxwqs2eugJkE6FTmAMN2KyR6
	 1lHMnqgBVff057Ia+ec5G7bfryxKyZzn0WrxdNg5xVCIUKYm6LX2eVac8TuI0dY5mzypP
	 JPCK6ee9CHI//+bZ7MhyifYsJRaZr495q4NAJNOKDjacE0Y/qiZfjeGAvkiUM4ZHv8kIO
	 bo5FJeJ33p5RJ6aJICzewsfpSN1qj/riYkhyrHnxkCWRHsRhcYt84swhtXzoWdbyLhDeX
	 WwKXT4CSIJfgw+JRAUna6myFopv5ZqKF5YSDpS0N3JkZIIhW7+IrYaX1Ca32rA/KaKw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276364;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=/NCcZR3wPgtgCPvapsYtBQtCEAWBugcHwLAC7NFU58c=;
	b=cor/ZYqALc+MmBpUavEh2auU8rV/vp085pnJ+/TsGdN/Wye0MUF6SdaUg6HoOron5pLr
	 RwyOidrPRVdtwXcVGKIBHG1FeYM3dNj9UWrw4j7eLba+38+uv/x0ZNbgGlyHGCd/teXQw
	 TEQumxiPnKltw+cWFnc/Wv/xOzOxYEa7ZU5D8gQ6KJcpV5RLNO7EYF3n2VCMDYJPrP3yG
	 0BcwRwpz5WHrrwjEplkjNcJMJMl/XrLgxQCmKMa+Vq0pxIw+SLmu8mo9UsDUM1o10MLsE
	 ifWFaiNjIPVNTr6LNpl27NpGcm9FROzRxJfsa+ya7X6FXceRQzYwgO02v3RWCsN5Yrg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276364;
	bh=/NCcZR3wPgtgCPvapsYtBQtCEAWBugcHwLAC7NFU58c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=q0EMHiDUTLa2M0lMQ91EXsZ+CLY6OHl3/X7Rw/IF34Wv2o09hJpLy1LBlwyH+Bd4H
	 XPX+JxbLsLM9bqulf7XV8Km2SIOVQJuAigDpEboFT12ZNUXHUlV+ZG79lhAe0YfC+u
	 OrbnoVdcnQ9YIQSIGCNhv2ua8XHfjx6dtbUDymBbxPbJhni8f33Fn9AWpXi6Fzkigv
	 ssGWoA3wH5DjQneJiq89df5is/mPS/RAxj/EQ1u17BqEP5qaGN68rn7wPDmpqUq1QF
	 UX+JAOlYm2yrdygzGLNgtuPktJGErhJomzltfH1G6M8CVWQfcgeD1yR91KHx+AInR3
	 LyrnhRv08KVvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 473CF41166;
	Thu, 24 Sep 2026 18:59:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F1275332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4A818124F
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lsLoqKH5WEcy for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BC5D881241
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276212;
 b=FCXHb6W7Klo2rYPLaYhJ74pXN/UXGc804JB/6/LC0bE3dminZMtLqnyRAbAfRcS+I1ep
 ud4+3KGqGhr97NCjdQKucnJC1Tjj1gp0i89JapPP6WbF3t74v4y+fsfpoO56VmgILllla
 FKjL+v/bZxosptrxBPaHKSl1bMFYfnxawk8r6T6iJdJ46qlEDuzbHtLu1lDCZd3FxnJNO
 Z26FWNUBPvFdoSv5izDVUiuTxouyJIhPpXV9YVwNsgCpBw+x6X9ag6llDOAtucZ7ZShgF
 0ErHGVzgIY76qYtXExXjycJBtOUeYjK4eamL08lB19Q0U39M2+TW9S1ut4NsAG1QO+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276212;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=FNy/Xg1M6914xETj9Az43BmBkg/5HCFAhdhgIuVnWMU=;
 b=pSMoy88KP8fEsVhcOjsgNnDmvgVYo+tmLFodG8jNSf5bQP/X3O+UyiPYcQOws2YLE0fC
 hG+f5/GoMAxOUAGB9bFM2FnifPO/85PBetnlFTF289QqEpdCTM5VeaULlp5fX8ci0CA1i
 dsDItfRCTb8SCLBkkVCkkyC8NWUvzkEJpL85kla/wm0uRLqdpoe3Qm/XmZRmip8qeG65P
 YppEqsfQjgwC0guhVKU6allsIrfwlLOmhwavDEBM+5CBY0HE76Jx2AhWEVVC4hVtGu1FI
 X2sJfCnzH+qSJc4GFxliqqEbt+79QS2FMu7+KxEaGSho58VTbTtRLYarNj98OgWE+MQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC5D881241
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F9E998323; Thu, 24 Sep 2026 18:55:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:18:56 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 651efc907fc8d9ed1bc283f029f9e6b54fd50159
X-Git-Newrev: 07b358a53963fee0b8cb52e8eb51ea503cb8c24b
X-Patchwork-Hint: ignore
Message-Id: <20260924185542.5F9E998323@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/qemu: drop
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
Content-Type: multipart/mixed; boundary="===============4716599622426212640=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4716599622426212640==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/07b358a53963fee0b8cb52e8eb51ea503cb8c24b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
index e5379e7224..48979fd7ce 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -22,7 +22,7 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_sparc64
 	default y if BR2_xtensa
 	default y if BR2_x86_64
-	depends on !BR2_x86_steamroller && !BR2_x86_core_avx2
+	depends on !BR2_x86_steamroller
 	# The Qemu TCG engine does not implement the AVX512
 	# instruction set, so binaries built for such CPUs cannot be
 	# emulated.

--===============4716599622426212640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4716599622426212640==--
