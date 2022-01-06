Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CB4C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 15:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAE3C6FC0B;
	Thu,  6 Jan 2022 15:55:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WW-bFVTxYiGC; Thu,  6 Jan 2022 15:55:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B8B46FC08;
	Thu,  6 Jan 2022 15:55:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9689B1BF3F6
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 15:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 674A7832D8
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 15:55:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ATRX9VQHfZGR for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 15:55:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A5D782BED
 for <buildroot@busybox.net>; Thu,  6 Jan 2022 15:55:44 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id v123so2118534wme.2
 for <buildroot@busybox.net>; Thu, 06 Jan 2022 07:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=04FjJW2vqT9RWmNcIWR8bCNrl4V5XEt7VOMnDbloV+0=;
 b=VEhEA5LduHKZdlNamus6XMeFjHKGvOesj/9NxRtaMD9QHwrCU/eEh+2DHZIKky/AkT
 b3p0CrX0eUJT8jIblR0Eb+9QH8GcQDJYYszskeWVeVrmmxXRm3mzGbTn4qskLQ+8Ncn9
 g2H9KORZANP5b0SAKUk/jD1a73PQDdJQA2CW4WJh30wwtBpJL4qMI+Dp6b5Y3/I76PcL
 jMROkFZ/g9BnVUGDNq7a8aAplvgJroJXxqRXzmlaWK0PIJR9Zg0KU2bau0l9i6jZfPB3
 +fJpRvPxu2ppAAB4TSdq90gw/uWqai8qIUwh8SgpMe6r1To82uTUEg4koBz6elgwTiYb
 YXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=04FjJW2vqT9RWmNcIWR8bCNrl4V5XEt7VOMnDbloV+0=;
 b=l8/lkYhnLX20JrqwkMXVt56iUkFvXQvs0Rm8CHZcE/L3OR0O7EopwtPuSHXaWWr2HH
 3B8MLa8EzJqJWHkPNRuwZHew0YWSMrjj/YZVP+N2pQuqpSxansBljB50wsbeYKaoUaje
 AybvMjlQw6pH27+mKK6LekAmTpYtdh5eoGFuw2FsenlEJyi87PlmIPmuwpfi0BBr70y8
 M6Yhi/k/EIBAEZlp5vJ+LyY7GdeTJJt3iaOSdQOTlsSGzEjLOCG43XPTeJwKQHxeaIp3
 BqvZyoIQna8CZ18mPFrLzmhxQ+xau24Tz3usmjvAXPpa2LaEAxzOzMkXZgxlhBI00QgG
 aGqA==
X-Gm-Message-State: AOAM5312hovHp5R17oWjf0b6EhA9an7MT4w86M7go4b3sf+sf4OLN9zZ
 qruTzfbveOWSwN4kQD5Brfs88A==
X-Google-Smtp-Source: ABdhPJxbw5cuyz1x9q0yQ/g8o5eqITC67jXcT4RGtFJz7LerGlwShu0xVGyqbg3LSw8jiLHIFJvHEg==
X-Received: by 2002:a05:600c:1e12:: with SMTP id
 ay18mr7599246wmb.14.1641484542805; 
 Thu, 06 Jan 2022 07:55:42 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id e12sm2455332wrc.104.2022.01.06.07.55.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 07:55:42 -0800 (PST)
Message-ID: <62235760-30ce-66a6-fe64-1ab11d3604e3@mind.be>
Date: Thu, 6 Jan 2022 16:55:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Changming Huang <jerry.huang@nxp.com>, buildroot@busybox.net
References: <20200207083857.28058-1-jerry.huang@nxp.com>
 <20200207083857.28058-8-jerry.huang@nxp.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20200207083857.28058-8-jerry.huang@nxp.com>
Subject: Re: [Buildroot] [PATCH v5 8/9] package/nxp/qoriq-rcw: introduce
 BR2_PACKAGE_HOST_QORIQ_RCW_BOOT_MODE for boot mode
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
Cc: thomas.petazzoni@bootlin.com, heiko.thiery@gmail.com, michael@walle.cc,
 geomatsi@gmail.com, matthew.weber@collins.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/02/2020 09:38, Changming Huang wrote:
> Introduce BR2_PACKAGE_HOST_QORIQ_RCW_BOOT_MODE for the boot mode.
> Because the RCW binary can be stored in different media, for example:
> sd - RCW locate in SD card, boot the board from SD card
> emmc - RCW locate in eMMC chip, boot the board from eMMC chip
> qspi - RCW locate in QSPI flash, boot the board from QSPI flash
> flexspi_nor - RCW locate in flexSPI, boot the board from flexSPI Nor/Nand flash
> 
> Signed-off-by: Changming Huang <jerry.huang@nxp.com>
> ---
> changes since v4:
> no changes.
> 
> changes since v3:
> 1. split this option from board patch.
> ---
>   package/nxp/qoriq-rcw/Config.in.host | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/package/nxp/qoriq-rcw/Config.in.host b/package/nxp/qoriq-rcw/Config.in.host
> index 9bf55894e8..7f5fbb3202 100644
> --- a/package/nxp/qoriq-rcw/Config.in.host
> +++ b/package/nxp/qoriq-rcw/Config.in.host
> @@ -37,4 +37,10 @@ config BR2_PACKAGE_HOST_QORIQ_RCW_BIN
>   
>   	  If this option is empty, no rcw file is used.
>   
> +config BR2_PACKAGE_HOST_QORIQ_RCW_BOOT_MODE

  You introduce this symbol but it is not used anywhere. So what is the point?

  I marked it as rejected.

  Regards,
  Arnout

> +	string "QorIQ RCW Boot mode"
> +	depends on !BR2_PACKAGE_HOST_QORIQ_RCW_CUSTOM_PATH
> +	help
> +	  Specify the boot mode, for example, sd, emmc, flexspi_nor.
> +
>   endif
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
