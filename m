Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20ACC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 13:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C90B400CF;
	Sat,  8 Jan 2022 13:49:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fTzeTsa8csTl; Sat,  8 Jan 2022 13:49:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23AC340103;
	Sat,  8 Jan 2022 13:49:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C405A1BF301
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B94928149C
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:49:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n5ns3gUNxFPp for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 13:49:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95D9B813C1
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 13:49:22 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v6so16769219wra.8
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 05:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=k1S5E2yg3jOYrBi8lWCt1x+8EZwvdREkLsAtLxnEZQY=;
 b=eVrGQZbd6YzBZIPLaevD7FtPhUtYA1WWVRZ2My/qz6NFWj922Ts5j7jjvJDsIuz0Zo
 nJEbRFjQ78Nh3bQ3M4tXA/GyvgMsQMQd8a3lJRWN9B6rnG8x9uW8/v1+qE8SrvEGtopf
 2j0lJ+dQ2/q9jHOMxIsc5lKj6d83Euhg0oDotiI0ogTPPFiCIEniXJfmgWfI3CT10vQK
 n1RxpJ58A8JtrGWVx57wDozCdq+n6SeDtU4DvKMDJVG49oAZAXzUvYKSHFfNqtMbyGz4
 X1F52SgNqP9Xp0vkjuymjCE3XZ36DNoMyp+p2JSNhXNwvMSrezvbnB+Gs6C+RJjd273V
 ZiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=k1S5E2yg3jOYrBi8lWCt1x+8EZwvdREkLsAtLxnEZQY=;
 b=M5e7Ozk479hV4vBHsp/k9VVJg5FJzvx6YRjuK1QiqmY5VCIieKd9qNvthl4Mtp9bGy
 +I9GASJBPCModMOsK9JKmERSPN5DJDM800tFi+GmwqOZ5o0TIZ9XY2/ANIWfZQ1QeO5G
 S7R1v2OOYrCe7BycoLCjLej1Jtz2DTROlB7YaE5npsQKWiGWbmd4IGKS0cjZl+/PCm7M
 1xxFhgcd1rdQoSh27JkgOCox5Il4BcAcTv01jAT30E4eMw1yw2Su7rWLQl9Ee428e1SG
 tf4PeMbMSDSFtfl3JSg0dlyejVDXxTT/ZK3UkFk0rQMBEDzGV43/6DAdvWCIp8WzeB50
 t8lw==
X-Gm-Message-State: AOAM532ugHAsIiQJj3LZe49A6GL1fx4DnA3yFeS+qPRk1Og8iSE2ctHc
 Pa/hDcibLvfP36hvy9tSty9MuQ==
X-Google-Smtp-Source: ABdhPJx5cqLI++o2keVaxTBRU991aZO1KSZcP1+ZyX8PPOvz9DIycAdoAx5QJtQkbZ3/fhiiIjRRDg==
X-Received: by 2002:a05:6000:508:: with SMTP id
 a8mr48784453wrf.578.1641649760844; 
 Sat, 08 Jan 2022 05:49:20 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id n12sm1823997wrf.29.2022.01.08.05.49.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 05:49:20 -0800 (PST)
Message-ID: <e465f71f-d772-2ab0-bdb0-6172a5ab8029@mind.be>
Date: Sat, 8 Jan 2022 14:49:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Brandon Maier <brandon.maier@rockwellcollins.com>, buildroot@buildroot.org
References: <20200415220032.140083-1-brandon.maier@rockwellcollins.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20200415220032.140083-1-brandon.maier@rockwellcollins.com>
Subject: Re: [Buildroot] [PATCH 1/2] toolchain/toolchain-wrapper: Handle
 debug info paths in gcc7 or below for reproducibility
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
Cc: matthew.weber@rockwellcollins.com, Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/04/2020 00:00, Brandon Maier wrote:
> In GCC8 the flag -ffile-prefix-map handles cleaning up both the __FILE__
> macros and the debug info paths. In GCC7 or below we are manually
> handling the __FILE__ macros, but not debug info paths. Use
> -fdebug-prefix-map to clean them up.
> 
> See for more detail: https://reproducible-builds.org/docs/build-path/
> 
> Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>

  Both applied to master, thanks. Sorry it took so long for such a simple patch.

  Regards,
  Arnout

> ---
>   toolchain/toolchain-wrapper.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
> index 09dda17890..7d55050135 100644
> --- a/toolchain/toolchain-wrapper.mk
> +++ b/toolchain/toolchain-wrapper.mk
> @@ -26,6 +26,7 @@ TOOLCHAIN_WRAPPER_OPTS += -Wl,--build-id=none
>   ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
>   TOOLCHAIN_WRAPPER_OPTS += -ffile-prefix-map=$(BASE_DIR)=buildroot
>   else
> +TOOLCHAIN_WRAPPER_OPTS += -fdebug-prefix-map=$(BASE_DIR)=buildroot
>   TOOLCHAIN_WRAPPER_OPTS += -D__FILE__=\"\" -D__BASE_FILE__=\"\" -Wno-builtin-macro-redefined
>   endif
>   endif
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
