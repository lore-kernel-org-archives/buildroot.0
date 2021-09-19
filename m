Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB73C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:22:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FCE161268
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7FCE161268
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B06F40413;
	Sun, 19 Sep 2021 12:22:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 69da_xTpThnr; Sun, 19 Sep 2021 12:22:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A49D740418;
	Sun, 19 Sep 2021 12:22:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 66E3D1BF2F3
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 563A7606EE
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:22:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FQKwHks1rxRb for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 12:22:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66858605A5
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 12:22:32 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id c22so49361392edn.12
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 05:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=PQN9srLgCZIpSLY3eP0HchC0VaWlYl/9+lq9njzZn98=;
 b=OmnHEn5obA4FfKdcczdaCp7ROezOSbG19s1i3890LCvAEnQvp1adhzMagFFpRGqhPE
 1fD1S5C3Ieto7Oohgb10Z1/pD1hT+kzgAYrL2ZNG9P8r6YQx58MBDK0f9a5l/7V7/aQY
 Aav7DcXNMK0xBf00RhK78+9a57FGGc6tY5XYBywUzhnCy/PjceysPLLtP5wuEWdUYTS3
 aSJ3oiLhPT0MiU2aXQgSpWQ4A5uY4yMemiqJq0oxewn7rnacwBs6uAcXlNDGfXBg7ece
 sW1XO5KK2qQo08uPBIQj8j67L2tLqdF84ues8pS3hqOU2tJLr4YqgCVhMN/BE5HZ/ntm
 BSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=PQN9srLgCZIpSLY3eP0HchC0VaWlYl/9+lq9njzZn98=;
 b=tAd3BxDP7ZY/I8u1np92GJRNQ9WH09joCyhy5QwBvGvIfTaHjGjvnk0zqnrVr6Olw2
 /BH7rxaqgZ2LjRw8cwN4BEnT8+OVA2K4CFrmOc5ldDa5iaNEp5+Z/GMGxRFctj+ie1rN
 hV5Z3kqmkiqVyueg9lQD5tAuiSMV6W/lw9+Nevw+P7V2PjNChrQ2+aDbnG52kSO+KB7G
 UjBlq/9zWzsjLOuy6KzwN1vRDcwifSrS1fIvzgV2o40SsWSLrGYRasFlxp2d3Wd5sl0G
 znjlAGjCPpp2LDZI1qP1zafq3vTtiPT661+lhnjCa597j9w0AtCUXyzNGtochtVbZB0M
 XeRA==
X-Gm-Message-State: AOAM533SyDfDmJlgjNX2QFUdA7nCH5aBaHJntBMLo41tA5bATsMdaoBf
 /nCXsEjnyRX+5fGo761u61yrTsnbFUlORQ==
X-Google-Smtp-Source: ABdhPJzMow7zES6NSlVsp+S0Atkietd/j1JG+6x66Vcj1hOlBe/ug8QWW+tS67cNL1YHIHD9Hnq3bA==
X-Received: by 2002:a17:906:7754:: with SMTP id
 o20mr9875069ejn.475.1632054150668; 
 Sun, 19 Sep 2021 05:22:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id n11sm5634256edr.51.2021.09.19.05.22.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 05:22:30 -0700 (PDT)
Message-ID: <6d31bff7-4b5f-9d69-f53b-c93a459e2354@mind.be>
Date: Sun, 19 Sep 2021 14:22:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Chris Packham <judge.packham@gmail.com>, buildroot@buildroot.org
References: <20210907084345.6192-1-judge.packham@gmail.com>
 <20210907084345.6192-2-judge.packham@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210907084345.6192-2-judge.packham@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/3] package/micropython: Bump version to
 1.17
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 07/09/2021 10:43, Chris Packham wrote:
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
>   package/micropython/micropython.hash | 4 ++--
>   package/micropython/micropython.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/micropython/micropython.hash b/package/micropython/micropython.hash
> index fe47ee09c4..d5045e8f27 100644
> --- a/package/micropython/micropython.hash
> +++ b/package/micropython/micropython.hash
> @@ -1,3 +1,3 @@
>   #locally computed
> -sha256  542eb120df8d9eb6f200bcd856294e143813adea9dda0d7189405c218d4b16f7  micropython-1.14.tar.gz
> -sha256  9c6089e26c8638a0645bcb0db2c85051f82de8022dcd07fb22baa0c5f9362085  LICENSE
> +sha256  c21dbf8144237b3dbe3847c9ad5264cd0f3104eb078c810b3986004cce8fcd70  micropython-1.17.tar.gz
> +sha256  59b1f0947a87c90d0d29dbe2c8deb3d1f8263bbbd2fb5ebcc79a649cff6dfcba  LICENSE

  If the license hash changed, then the commit message must explain why it 
changed. Usually it's a false positive, like the year has changed, but here we 
in fact encounter the very reason why we have these license hashes: we have to 
update our LICENSE variable!

  The change is simply adding the license information of code that was copied 
from other projects, but it means we have to mention these other licenses as 
well in our _LICENSE variable.

  Could you submit a patch that updates the license information? Please make it 
a separate patch, since it has to be applied to the stable branches as well.

  Regards,
  Arnout


> diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
> index fa28da9be3..9ddcbd9712 100644
> --- a/package/micropython/micropython.mk
> +++ b/package/micropython/micropython.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MICROPYTHON_VERSION = 1.14
> +MICROPYTHON_VERSION = 1.17
>   MICROPYTHON_SITE = $(call github,micropython,micropython,v$(MICROPYTHON_VERSION))
>   MICROPYTHON_LICENSE = MIT
>   MICROPYTHON_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
