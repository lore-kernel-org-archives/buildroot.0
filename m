Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101F8C88E72
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 09:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C93B0607CE;
	Thu, 17 Sep 2026 09:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rX2MvwfSAeTf; Thu, 17 Sep 2026 09:14:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org DE63C6082E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789636481;
	b=XAOpHzy4w4QjLwfbZOcBx+CSZOcNsT14DU2LwVXlIZ33kwA3/6uk0E01CdMyWbpCJS+L
	 +mGgR7EGyS4H3Ry1TTsCLwqvOpCwAO2lSd9KPaeC8qWO3x6j0DFnsRzec3W7zYll7RclM
	 BMzzuec21GAkL3EjJyRV99vpgmee7iehPq2nivY7dgwwX0fez5f20rnb636asBNrtnvHx
	 wzHqDvQmlcSXJHxrs8ZSgx196DtuZQVgTOqg7gL0M88Z+NLGjY0Gd9s8FcYE8MIVgwSFG
	 1adC8XedBPAzt+Qhxz4U/He4iJ8ZRORyeC3Iqo14sNvhuOtr/WlGedBtShkD+R+6rTQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789636481;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xKObrUzpVoxE+3sGGLtPzSvoPvjz3felgKeaDRqHf4w=;
	b=mJH7FcIEHVJstn671r/Wpy/yIy977a28yYYAcsOLzaSCp5HZSLwxBXQnVQpE/JMr5m1r
	 WMJIO4XsLy+yanVqujb54FvzQNhNKUHDe9QLC9hdT/BQw66PDQZdlNyBg56heUdJrdspE
	 vIGc8yE5nkniZHSy095Hopj+Gwkfchcj35LEywMl0BR4WtJpSX4wKoB3kXi8NA1jv6j5y
	 q1UNNFuW5leUcL3XNcWEWb2cVrPkwCqahXW6CjTvMzgmYnqaNnyZBoLK0L63BSGq06Xv4
	 lxwUMn4TkxJF/0gtWOfX/SikpTXAVE6Vs3i/ARBlHbiRIOmc6bcS7dDYiL6DQP2kuYg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789636480;
	bh=xKObrUzpVoxE+3sGGLtPzSvoPvjz3felgKeaDRqHf4w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=erAq4E1C4y+DENRCDD5+rK3+klj+LkM3zhDtuxUtcHed7xOJx88dZbPNrIGXQ5RXb
	 S2KMjPbicQJPnAomhuoPv2ki9RdMXEE1ArZ5x3z3hUy5isg4j/6H7wYuhgdOIM8vuQ
	 lalpE+lsTZPIaecfbAx95Djh50tH+cZHkVcS3XFGSnxznm4T1Yhv3q/tmjULC72EEW
	 isPIs7kOa2sXApmz5kMPzm39OZjACkDo10janMPVWA0FiSUyIUROHPZ4TuJR44TNe4
	 /u2FcidtjZZsAyGJ7T2RMogoBN5tsxcdXGQwNBw/W0vY71cyqYDz/X9tG/0kcqUsOF
	 +O7XIgjxinjoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE63C6082E;
	Thu, 17 Sep 2026 09:14:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 62AE3362
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 544F180EE8
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HSqDhPkFlEou for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 09:14:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9FF0680ECE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789636478;
 b=VVnJSzmKsXExk1L/epRh5lWbrpFXwfdt4oNcCsVOm6KyZf/lpio8rH0bXrZx6PIbXk0a
 M+/vtk/w7j1hUXeetlXPOkKX5PuhLtxAt8Xqy+LNCfVzxO150OXIUgCr7AR2/xcz/UJPQ
 6rsE6t5mnCmoLnaS6lE3ndKcZVQ/juU5FRK5cfhTRNHIMdRP+PSwPK0hZoWhWm2vbTXYl
 1n9U4RJpbNirStLiiB5C9eraQ4dkvXTE35IeJt56ub8aSWT0NIgzzHrsldJLblzxnLR8w
 g3Hn1szfqupjZG/WH8HeG4Op0+jh/UXK6cpYVCxMxRLy3w4QaDEUlV7IXwJHnOAI1mA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789636478;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=WSRJe++2y0Q4GIsPT/MU+Jp5uXCWmGdB3Nmg62WDdBQ=;
 b=gwM+tvEaDRWBq2YCrCeXFL28WJhgiHRONDyifTUZTkUD9qUC2P5nme5NDfICA3Gdpz2F
 InPp308KMnie+5JnJSnXFuax3mH2r5nx2Wf++44CcCVLSLxN3aRdF7brXp8Ph/xwz4Wbv
 F4KgF32t6zepXjkSFn/eSFkP8C9eOoA8kHdIp19GO3HhOtiXTbOBh5GSV168z5P0fIv9X
 MwscpQIStYm8i/dfe8dioq04/CC/mgpWuXqN5EdbFGad1niIgcw/tgVajKcHMG7HFGMga
 vc2sZZVDRr0YrXTElfUoZXtEXBEiBrXMFurln7ZVvlGqigXz59NZBIOwzGO0rKOGjKA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FF0680ECE
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:14:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC75A96D2E; Thu, 17 Sep 2026 09:13:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 17 Sep 2026 11:13:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: feb628adb03c6df435753a1dc84a336ff7ff9ec8
X-Git-Newrev: 8d80efe017880884272332b97316748208ec2325
X-Patchwork-Hint: ignore
Message-Id: <20260917091331.BC75A96D2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: drop x86_core_avx2 exclusion
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8d80efe017880884272332b97316748208ec2325
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
