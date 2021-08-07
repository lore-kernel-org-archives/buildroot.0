Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA0AC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 08:53:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8048610A1
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 08:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8048610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9525140017;
	Sat,  7 Aug 2021 08:53:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JadAPzS98sKR; Sat,  7 Aug 2021 08:53:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90E7B400E9;
	Sat,  7 Aug 2021 08:53:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4D15D1BF2FA
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 08:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CA3740442
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 08:53:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id okfLgzOLIYSQ for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 08:53:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 526CD40444
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 08:53:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f16c:16be:6f47:5c9a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9A0A613F899;
 Sat,  7 Aug 2021 10:53:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1628326387;
 bh=kukR81zWT/znUcUaaNH0ZD2445saFT4yLV8Pr8rU2+g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WFK8XN/3liqnwrhQkP/ojab2FGbwuwlE6uCLQZljUFhCVwmiXZGOZCF3zzwnV5ACo
 K4w6Dqma08/Av/Cp1Zz+OaL2xSqfd72mp/HbnH6GQ1mgnxjn3BfDoDxMgiAOegXtW3
 C7ex5xYglFQQtdfOBJc1C7HDNczOAcs5pw9aCJJVR8rpwqq94hiy1Z4YD4R6uJvl9n
 WcrbYMJPyQxBLZfaQ2EbnQWv3yt1PnlxswosiImEAutMq4XcKa1L91egMJ11VEqsMT
 NNQzvrl1WxSHbs0VnxZZbjSF7UAG5/UC7k2hr5I2TCIT4p4ENBFe/UG0iPzzGOS5RV
 KEPN/qUrOzgnw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 07 Aug 2021 10:53:03 +0200
Date: Sat, 7 Aug 2021 10:53:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210807085303.GU27036@scaer>
References: <20210806184411.4062961-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210806184411.4062961-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/guile: fix build on riscv32
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-06 20:44 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure on riscv32:
> 
> system/base/target.scm:132:16: In procedure triplet-pointer-size:
> unknown CPU word size "riscv32"
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/6705630c1484239ec8b73d57ebc2e2570fbfc8f8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...stem-base-target.scm-support-riscv32.patch | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/guile/0004-module-system-base-target.scm-support-riscv32.patch
> 
> diff --git a/package/guile/0004-module-system-base-target.scm-support-riscv32.patch b/package/guile/0004-module-system-base-target.scm-support-riscv32.patch
> new file mode 100644
> index 0000000000..cadd040f12
> --- /dev/null
> +++ b/package/guile/0004-module-system-base-target.scm-support-riscv32.patch
> @@ -0,0 +1,33 @@
> +From 995a5e1da735b75733f059615c593c330b534d80 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 6 Aug 2021 19:49:37 +0200
> +Subject: [PATCH] module/system/base/target.scm: support riscv32
> +
> +Fix the following build failure on riscv32:
> +
> +system/base/target.scm:132:16: In procedure triplet-pointer-size:
> +unknown CPU word size "riscv32"
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/6705630c1484239ec8b73d57ebc2e2570fbfc8f8
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + module/system/base/target.scm | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/module/system/base/target.scm b/module/system/base/target.scm
> +index 2088cd866..5544e234f 100644
> +--- a/module/system/base/target.scm
> ++++ b/module/system/base/target.scm
> +@@ -121,6 +121,7 @@
> +           ((member cpu '("sparc" "powerpc" "mips" "mipsel" "nios2" "m68k" "sh3" "sh4")) 4)
> +           ((member cpu '("s390x" "alpha")) 8)
> +           ((string-match "^arm.*" cpu) 4)
> ++          ((string-match "^riscv.*" cpu) 8)

Are you sure that a 32-bit CPU will have 8-byte wide words? I would
have naturrally expected them to be just 4-byte wide...

If htis is indeed the case, then please explain that in the patch commit
log...

Regards,
Yann E. MORIN.

> +           (else (error "unknown CPU word size" cpu)))))
> + 
> + (define (triplet-cpu t)
> +-- 
> +2.30.2
> +
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
