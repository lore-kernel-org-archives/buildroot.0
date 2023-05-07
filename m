Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6912CC77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 21:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 180E6417D9;
	Sun,  7 May 2023 21:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 180E6417D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oEd5EKPM79GE; Sun,  7 May 2023 21:36:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3478C417D2;
	Sun,  7 May 2023 21:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3478C417D2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 199551BF2C4
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3760400D6
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:35:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3760400D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MX5G2ZnRtbx2 for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 21:35:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B74F641793
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B74F641793
 for <buildroot@buildroot.org>; Sun,  7 May 2023 21:35:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7bde:4dbc:bac0:54b7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id C5B8A2003A4;
 Sun,  7 May 2023 23:35:52 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 23:35:52 +0200
Date: Sun, 7 May 2023 23:35:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Etienne Carriere <etienne.carriere@linaro.org>
Message-ID: <20230507213552.GR252090@scaer>
References: <20230502154713.1490788-1-etienne.carriere@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230502154713.1490788-1-etienne.carriere@linaro.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683495355;
 bh=7MaptHHdRLHGEBW2ILQgO2RV9RMIauV5ykyZuQUr+A4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QZjvJ7Q3qvElRQQ17Hx6RFPXaZjx2MnW9CLJMDzQ0I0v4ueRS9KaC0YjbZ4mmp5Nq
 OmkJXzpLsQv/yCi1x+GtvR/3LadU+fZYMQf2oFaJAat5UzBSoQGQwmiX3CrV7o3BEU
 ZT9FuV4a4dJj/iL7EcM1rDjToz5A3jTAmMDDMgIOHrjJWa25IsZdF/hp6Qxr5Go3C2
 4iLOx79xZu/tkmN5IPHqmdXkqR0tqe+9mzdGeeY2Km0iphXvwwmkMnhs9NkAy7uyAd
 sDsfAWnNNIkdtOQg3OgJvMh0ZOscdo7evQOJjpmUUQKXA7Bgi2WJR/T08vo3DTsuCZ
 U5qySSataaZPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QZjvJ7Q3
Subject: Re: [Buildroot] [PATCH 1/6] configs/qemu_arm_vexpress_tz_defconfig:
 don't embed optee-benchmark
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Etienne, All,

On 2023-05-02 17:47 +0200, Etienne Carriere spake thusly:
> Package optee-benchmark is no more maintained by OP-TEE community
> hence don't enable that package in qemu_arm_vexpress_tz_defconfig.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>

Whole series of 6 patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  configs/qemu_arm_vexpress_tz_defconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
> index 576c441154..b24fab5e42 100644
> --- a/configs/qemu_arm_vexpress_tz_defconfig
> +++ b/configs/qemu_arm_vexpress_tz_defconfig
> @@ -40,7 +40,6 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="BL32_RAM_LOCATION=tdram"
>  BR2_TARGET_OPTEE_OS=y
>  BR2_TARGET_OPTEE_OS_NEEDS_DTC=y
>  BR2_TARGET_OPTEE_OS_PLATFORM="vexpress-qemu_virt"
> -BR2_PACKAGE_OPTEE_BENCHMARK=y
>  BR2_PACKAGE_OPTEE_EXAMPLES=y
>  BR2_PACKAGE_OPTEE_TEST=y
>  
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
