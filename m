Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E5EEB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 21:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2E4E81BC2;
	Mon, 26 Jun 2023 21:42:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2E4E81BC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KGAVEyheGKdZ; Mon, 26 Jun 2023 21:42:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09CF481CDB;
	Mon, 26 Jun 2023 21:42:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09CF481CDB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A12B91BF2FC
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 21:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78F05408FA
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 21:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78F05408FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2umlaAcUAGeX for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 21:42:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE2EE408A8
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE2EE408A8
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 21:42:14 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-312863a983fso4387107f8f.2
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 14:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687815732; x=1690407732;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U5BvGKBfe+4zBHTzrpraA4CwaGVdsKEENlmnT3HSxRo=;
 b=j2NsTh6vmywJsLX1V/IjFU6tvBt8X3VryJjGaLur2lah5A8o8H9JCrIMUhTjkqBm1J
 6cL2TK4tQmOBxktnrlE2eZK2k01OCqobcHcqGnosiIXLFoaM7hdp4qh0f3JTtLzRAl1H
 vBmmw85NsBtT5kGgmz42pCP2RR8bFIw1rqna+H6G9wrJ1zVloi5bgws1SLbeyf1bLWmB
 ISLXlx2YF7XCDBFlrMC/6rj6DuG4YVmYXNKfW+fiV9eJVPrbIDyhgJlQAStirtoxvMGe
 6s6PYJhtSASRW4xaQyVQXN7IFqc4V6/nhrAAiVFc2WEM5+JhtjxfOQ6h40L0yBa+sMdD
 LFwQ==
X-Gm-Message-State: AC+VfDwIA/Rzi4Sg0aYiHfPPlqhIot0cG3ZCuUZ2bNIlceJL33vciJpe
 p2iqVPjbBYdHRpRur4oEgvez1g==
X-Google-Smtp-Source: ACHHUZ7qIP4LhehNd6xIDyOKM1AmPQ9Tirsu+3m/Hztfcwwta40PPO6bgVwHwuoxWzzzF+50+H9YCw==
X-Received: by 2002:adf:e711:0:b0:313:efed:9162 with SMTP id
 c17-20020adfe711000000b00313efed9162mr3761822wrm.59.1687815732559; 
 Mon, 26 Jun 2023 14:42:12 -0700 (PDT)
Received: from [192.168.42.236] ([109.142.160.115])
 by smtp.gmail.com with ESMTPSA id
 w11-20020a5d608b000000b00313f7fc35e9sm1575892wrt.63.2023.06.26.14.42.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jun 2023 14:42:11 -0700 (PDT)
Message-ID: <898ad257-a549-95e2-44ae-898a9db5c4b8@mind.be>
Date: Mon, 26 Jun 2023 23:42:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Kilian Zinnecker <kilian.zinnecker@mail.de>, buildroot@buildroot.org,
 giulio.benetti@benettiengineering.com
References: <12221308.O9o76ZdvQC@kilian-aisec>
 <5942184.lOV4Wx5bFT@kilian-aisec>
 <67b3c17a-25b9-1d6f-ee15-86340819c4a9@benettiengineering.com>
 <2685852.mvXUDI8C0e@kilian-aisec>
In-Reply-To: <2685852.mvXUDI8C0e@kilian-aisec>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687815732; x=1690407732;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U5BvGKBfe+4zBHTzrpraA4CwaGVdsKEENlmnT3HSxRo=;
 b=Y4RMWouj/jOfv+ZkdYRo5DOLp3UmXTqzCW0gHTAJtyATqUiVwej6Ct52uimHEJP3jU
 eWx38OYvmODqXvv3svXlwR5bN2BUJBcI4x85GSmU/kw02OnL260tYLl4a8ItnUN7Wxfg
 d8W2TyijGh9Aemtmyz7f0y0INHk2QcrH50auYjfhS5CCrfWQXVQeisJrvcs2Z9k36Z33
 7J9NqKBfe3aX15diNiRNJpVqHTAD+w2mFU2tl3LEp+HOgjq8uuW5CpnM96qAsmUbQsRG
 68MOGO4rb9vhz5UCkpjm/SEdwPxuIR1nPe7AACw+Lq1G0d6ZcQ4NJ5j/4RCgbNk9Ocl5
 NM/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Y4RMWouj
Subject: Re: [Buildroot] Interested in board support for Radxa Rock 5b
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/06/2023 18:01, Kilian Zinnecker via buildroot wrote:
> Hi Giulio,
> 
> I am a little bit stuck at the moment. 
[snip]
> I also added a package/rockchip-rkbin/Config.in:
> 
> 
> config BR2_PACKAGE_ROCKCHIP_RKBIN
>          bool "Rockchip RKBIN binary blobs"
>          depends on BR2_arm || BR2_aarch64
>          help
>            Those packages provide binary blobs for the Rockchip RK
>            SoCs.
> 
> if BR2_PACKAGE_ROCKCHIP_RKBIN
> choice
>          prompt "Rockchip RK platform"
> 
> config BR2_PACKAGE_ROCKCHIP_RK_PLATFORM_RK3588

  This should be BR2_PACKAGE_ROCKCHIP_RKBIN_PLATFORM_RK3588 - it'll work without 
the BIN, but it's not consistent.

>          bool "rk3588"
> endchoice
> 
> config BR2_PACKAGE_ROCKCHIP_RK_PLATFORM
>          string
>          default "RK3588" if BR2_PACKAGE_ROCKCHIP_RK_PLATFORM_RK3588
> endif
> 
> However, I am struggling a bit with the makefile package/rockchip-rkbin/
> rockchip-rkbin.mk. It currently has (uncomplete) contents:
> 
> ################################################################################
> #
> # firmware-rk
> #
> ################################################################################
> 
> FIRMWARE_RKBIN_VERSION = d6ccfe401ca84a98ca3b85c12b9554a1a43a166c

  All the variables have to be ROCKCHIP_RKBIN_ otherwise they don't get used.

> FIRMWARE_RKBIN_SITE = https://github.com/rockchip-linux/rkbin.git
> FIRMWARE_RKBIN_SITE_METHOD = git
> 
> FIRMWARE_RKBIN_INSTALL_IMAGES = YES
> FIRMWARE_RKBIN_INSTALL_STAGING = YES
> FIRMWARE_RKBIN_INSTALL_TARGET = YES
> 
> $(eval $(generic-package))
> 
> 
> Of course this is not yet sufficient. However, I am struggling with the makefile.
> As a first step, I only want buildroot to download the repository. However, if
> I execute "make rockchip-rkbin-dirclean" followed by "make rockchip-rkbin-
> rebuild", it only creates an (almost) empty output/build/rockchip-rkbin
> folder, only containing stamp files. 

  Yes, you didn't define a _SITE to download from (because of the wrong naming).

  Regards,
  Arnout

> Also no rockchip-rkbin folder gets created
> in my buildroot.dl download folder. It looks like buildroot does not download
> the rockchip-linux/rkbin.git repository at all. Do you have a suggestion, what
> I might be doing wrong here? Do I have to implement some hooks in order for
> the git to be downloaded?
> 
> Best regards,
> Kilian
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
