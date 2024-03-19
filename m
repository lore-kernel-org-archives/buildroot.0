Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842B0C54E68
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 21:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34BF240438;
	Tue, 19 Mar 2024 21:40:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZbwWiMTus4T9; Tue, 19 Mar 2024 21:40:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28D9B414A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28D9B414A0;
	Tue, 19 Mar 2024 21:40:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BFB201BF360
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 21:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD53660B45
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 21:40:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id smPExBRUfmRc for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 21:40:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 98CB4608D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98CB4608D8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98CB4608D8
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 21:40:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 13C7A13F838;
 Tue, 19 Mar 2024 22:40:01 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 19 Mar 2024 22:40:00 +0100
Date: Tue, 19 Mar 2024 22:40:00 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZfoGMDMSGCHTqjxJ@landeda>
References: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
 <20240304153253.732708-4-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240304153253.732708-4-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1710884414;
 bh=/wqo7m8ees/lShBQt7ESyh0GqdMdKnkg17r2dDqbiRM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pdrJyMTVE1Qu+sH5/RuSYuNi3cW4/2NyIQB7fzRdEISsS7HukYieYnlB16HEYA0xL
 1cZlWU/6LdU6KJ7enSGFsDKUN6pJiiTygo6be6ZeXx5epkgT+kQFyWHYYaEn+eo6ib
 mz0XNiHaRi2IpSkbT7rlBe6ChAshoLA9ExtAUXvAlj6RrdnnM3iPxeZ8METzxHQ8EV
 fJL6Mlejz9bnIpSAvvxH7JQdoE8ybGby/1P2ReOqDtNCyfTQG5w7+EnmCq8z1Vl/6l
 ppsuzCoBIKjczOSTbfZphQ8e67Zyg3/Kw+7yt/uLJmwVrwtA+9H8wiNHdGF4K6k4xz
 /v9uXRa38zAhw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pdrJyMTV
Subject: Re: [Buildroot] [PATCH v9 03/22] configs/ti_am62x_sk_defconfig:
 explicitly set the ti-k3-r5-loader version
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
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Anand Gadiyar <gadiyar@ti.com>, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2024-03-04 16:32 +0100, Dario Binacchi spake thusly:
> Commit 4b8fddb060fb ("configs/ti_am62x_sk: new defconfig") forgot to
> specify the ti-k3-r5-loader, so do that now.
> 
> When the defconfig was added, the default version was 2022.10, so use it.

Yes, that's a good change, so: applied to master, thanks.

However, this opens a little issue with hash checking. I'll address that
in the review of path 5, which does actually bump the version.

Regards,
Yann E. MORIN.

> Suggested-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> no changes since v4
> 
> Added in v4
> 
>  configs/ti_am62x_sk_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
> index c3ad555a8184..a129e216d25b 100644
> --- a/configs/ti_am62x_sk_defconfig
> +++ b/configs/ti_am62x_sk_defconfig
> @@ -25,6 +25,8 @@ BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
>  BR2_TARGET_TI_K3_IMAGE_GEN=y
>  BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X=y
>  BR2_TARGET_TI_K3_R5_LOADER=y
> +BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
> +BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2022.10"
>  BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> -- 
> 2.43.0
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
