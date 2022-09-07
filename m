Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCF0C38145
	for <buildroot@archiver.kernel.org>; Wed,  7 Sep 2022 12:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7B7860AE0;
	Wed,  7 Sep 2022 12:26:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7B7860AE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E3lbnPBZK4eW; Wed,  7 Sep 2022 12:26:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29DDF60AE7;
	Wed,  7 Sep 2022 12:26:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29DDF60AE7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 622FF1BF59E
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 12:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BE52408B6
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 12:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BE52408B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G2qBhKtJ-qdn for <buildroot@lists.busybox.net>;
 Wed,  7 Sep 2022 12:26:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33E78408B4
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33E78408B4
 for <buildroot@buildroot.org>; Wed,  7 Sep 2022 12:26:31 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id gh9so8069597ejc.8
 for <buildroot@buildroot.org>; Wed, 07 Sep 2022 05:26:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=KYrESJOPuWFsflB0Y++9G1qyuFEfC9RTvHUhGY2keV8=;
 b=Xr4sqZxcosuVOGk9Tg/6Us7+1N5OQW7ntps1dP+F8C1r7AqYNLG5A0oP7Gw/C6ON7P
 sRxBsgM3ItfpiuYvR2HZfazUfYngWjpFoeRWLYZw3s6kM8YcTOKlTPEvqJtJhycLt5Uf
 oUwO6d3y6YQIz5uhrAxGXoz51eSGx2DruGPiyP2I+xXJ0c8YFNJ5/otDg3TC/HqAj++Q
 Pbw3xxEz9PtDUxgOjE8CiauBD/rWM2bVE/P2BzSASOUsgOTYuo66LsUBbit3liLQ27zS
 IVnDqctaHfzll4UbAyI6x0W2XYCf3ovVJ+IPEEByXC+CQhTI8PB2lysZ9GPH1x/4fnUn
 qsew==
X-Gm-Message-State: ACgBeo02BaPJRc4o+vCBXCFLPSAh7G2yaBxSPJBiLfuC+slvZG5ydOOp
 CA3G4fUKtBGrdk/6STLhEA0T+mb6YPFQMw==
X-Google-Smtp-Source: AA6agR66mQL1LbeKJqwiivxORtQqiQRZpKdFMT1kzA4Nue25EJ4JlGfRG0ewphHJcJW0CBeuzzfA5A==
X-Received: by 2002:a17:906:eeca:b0:730:6880:c397 with SMTP id
 wu10-20020a170906eeca00b007306880c397mr2158447ejb.593.1662553589326; 
 Wed, 07 Sep 2022 05:26:29 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 lb26-20020a170907785a00b007708851c6f0sm484219ejc.146.2022.09.07.05.26.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Sep 2022 05:26:28 -0700 (PDT)
Message-ID: <91856098-4b98-970b-667c-d05681ff0299@mind.be>
Date: Wed, 7 Sep 2022 14:26:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, buildroot@buildroot.org
References: <20220902063939.2761040-1-dario.binacchi@amarulasolutions.com>
 <20220902063939.2761040-2-dario.binacchi@amarulasolutions.com>
 <f2bc336a-b07e-3f17-4a13-226be75eba64@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <f2bc336a-b07e-3f17-4a13-226be75eba64@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=KYrESJOPuWFsflB0Y++9G1qyuFEfC9RTvHUhGY2keV8=;
 b=Rw2oPBvnKS8CidkhPQIZThwKqrnpHPbJkbZhFqMHWfeKpxpHIpEzik2aWTPRjpmjLI
 MoQ/Mh2U0nSNIC/BwajTB0HH0wq9YKMsgY/xP8MqDm9Mr3s3Dp7rw8b71o/YGQSgeq/r
 h7AEd9Rvs7F81ZuIjIhnVu+Msb4d2AN7sqiKE4vk9MwNLXOlM2EsfDbioKh5CwxGBBct
 kC1npVjKhUtOoQu6J7/MuWd9R5DMkizzW/Ny8O6kyMHlp/PfY2TNK3mRkdzVc4FIHI3K
 11h79SMJLItbv4N5CoGIS5YgctMBdavKI7O8i7LS72w1/KhA79jKq1TByldQAphzJXry
 HZJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Rw2oPBvn
Subject: Re: [Buildroot] [PATCH v4 1/2] configs/imx8mn_bsh_smm_s2_defconfig:
 new defconfig
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
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/09/2022 23:04, Giulio Benetti wrote:
> Hi Dario, Michael, All,
> 
> On 02/09/22 08:39, Dario Binacchi wrote:
[snip]
>> +# CONFIG_CRYPTO_DEV_SUN8I_CE is not set
>> +# CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM is not set
>> +# CONFIG_CRYPTO_DEV_QCOM_RNG is not set
>> +CONFIG_CRYPTO_DEV_AMLOGIC_GXL=m
>> +CONFIG_INDIRECT_PIO=y
>> +CONFIG_CRC_CCITT=m
>> +# CONFIG_CRYPTO_DEV_HISI_SEC2 is not set
>> +# CONFIG_CRYPTO_DEV_HISI_ZIP is not set
>> +# CONFIG_CRYPTO_DEV_HISI_HPRE is not set
>> +# CONFIG_CRYPTO_DEV_HISI_TRNG is not set
>> +CONFIG_IRQ_POLL=y
>> +# CONFIG_DEBUG_INFO is not set
>> +# CONFIG_DEBUG_INFO_REDUCED is not set
>> +CONFIG_CORESIGHT=y
>> +CONFIG_CORESIGHT_LINK_AND_SINK_TMC=y
>> +CONFIG_CORESIGHT_SOURCE_ETM4X=y
> 
> This ^^^ produces a very shrinked Linux image, but here in Buildroot we
> usually want a generic defconfig or fragment that makes the boards
> working.
> 
> Then I ask you to only add the mandatory CONFIG_* needed for the board
> to work correctly and drop all the CONFIG_* that optimize for size or
> build modules to speed up Linux loading.

  I don't think I agree with that. There are many boards where we don't use a 
full v6_v7_defconfig. It's true that it's annoying that we need to have such a 
large kernel config in Buildroot, but I do think it's a good thing to have it.


> The goal is to be generic and let the user to have all enabled by arch
> default and just in case tweak Linux configuration. And in that case the
> user will have a complete defconfig. This is instead a fragment only
> where you usually add few CONFIG_*.
> 
> Try to check the other *.fragment under buildroot/board for that.
> 

[snip]
>> b/board/bsh/imx8mn-bsh-smm-s2/patches/linux/0001-dmaengine-mxs-use-platform_driver_register.patch 
>>
>> @@ -0,0 +1,45 @@
>> +From 7ec9f1a48b1041f1bc11ed0f858245fd2626f4e6 Mon Sep 17 00:00:00 2001
>> +From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>> +Date: Sun, 22 May 2022 17:40:15 +0200
>> +Subject: [PATCH 1/2] dmaengine: mxs: use platform_driver_register
> 
> Patches must be git formatted one by one, 

  Not actually one by one - just generate thim with "git format-patch -N".

> this to have no patch number.
> The reason is that if you later remove some patch only need to rename
> the file name index. So please re-generate all patches one by one so the
> subject becomes [PATCH] without numbers.

  Note that the check-package script will warn you about this issue.


  Regards,
  Arnout

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
