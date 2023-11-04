Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98430C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 17:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9F70400BD;
	Sat,  4 Nov 2023 17:54:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9F70400BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PL-G9DZfRCk9; Sat,  4 Nov 2023 17:54:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D08F940128;
	Sat,  4 Nov 2023 17:54:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D08F940128
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B66A71BF21A
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9515141926
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:54:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9515141926
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hubW1cHZ3WjH for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 17:54:35 +0000 (UTC)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3157B41920
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 17:54:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3157B41920
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9c5b313b3ffso463442666b.0
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 10:54:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699120472; x=1699725272;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=52Wqa9/2KNPhgnt1I3YChUwntqFmQZAvG5CEdsmWYvY=;
 b=aBDozZFFLUw0uJkQXIiSL2KUxSrmzSjYp0HZM4w1uuUCfMuUqcroRGOURYLS7ETQc1
 dBpfcLI1BegGCCRlw6VFiGOgau6NDx99qHET5+fHms47sxSFQb8NNVEjdCYxV5fKc6V/
 uGHUv2qXh9em4RlLReQzIjzF0gxZDUz1oWCEiqUdAEh3/HMxLbBG61mx5OIdAyUlt6I9
 OjT5f0rzRu8dsVS0HLhjS1J789FLfZb0iWkkfj8FkKSOBv2b6ZI5R5NyelCkKGTCqHz6
 /l4BqFixhdt4xcNHuJQjECSZNufNEiti7G4S/R5ADvV7gE3k+0b6mvJNsjxDJ1bRO9s+
 aVzA==
X-Gm-Message-State: AOJu0YyJx/lRxtfVPKdHhSHk50vproIARhg8PGR6aEULcertdnI9if8a
 wEg8qCZ3zbQKwxjysgOyt8BPQg==
X-Google-Smtp-Source: AGHT+IHtJsifMJqKk8VfWcbQap3yoyaD5uesBziaiaT46gocAQxBq3YJGs2/7t8DJ6nynHM3+oLtpg==
X-Received: by 2002:a17:907:25c6:b0:9bd:f902:9a61 with SMTP id
 ae6-20020a17090725c600b009bdf9029a61mr9685640ejc.18.1699120472417; 
 Sat, 04 Nov 2023 10:54:32 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a170906368100b0099bd453357esm2167290ejc.41.2023.11.04.10.54.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Nov 2023 10:54:31 -0700 (PDT)
Message-ID: <c8a18ebb-1b1c-4e4f-b855-ba1241257a14@mind.be>
Date: Sat, 4 Nov 2023 18:54:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
 <20231026092701.12345-16-adam.duskett@amarulasolutions.com>
In-Reply-To: <20231026092701.12345-16-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699120472; x=1699725272; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=52Wqa9/2KNPhgnt1I3YChUwntqFmQZAvG5CEdsmWYvY=;
 b=Ad6vaLc/gtjcghQkmQrN0mfO0tmjsp1qh9smuPbzMdxs/wsC8qFZi6ANwTp9ieGcPJ
 xE6zCY3aazzzjxvraM9QPfsJ5X7HzlRbJhHpNe5aHUAD4QcANrwuTUIjG7acwicoZBsn
 SQje9TLDI0bZgC+sDgdtfPU7CO50u3dI2T0kvQwxCq6pP5qrGX3EfYoyMTCuA3LuXCY0
 OQODez/8bcu0dNdVXllViPZ771pRJGvNwE3/ZjECyxbudSfE7k2hl/YlAVzZq8czJfMx
 GBXCqc5F53ya6gqlTQFgkh/aBHdw5lxy/vIk+0jdXuGfr0GmNXuiMuXuscHBPEM0i76S
 IHyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ad6vaLc/
Subject: Re: [Buildroot] [PATCH 15/30] package/scons: bump version to 4.5.2
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Adam,

On 26/10/2023 11:26, Adam Duskett wrote:
> Scons is a setuptools package now.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>   package/scons/scons.hash | 4 ++--
>   package/scons/scons.mk   | 7 ++++---
>   2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/package/scons/scons.hash b/package/scons/scons.hash
> index a72fbaee5a..48b5077b2e 100644
> --- a/package/scons/scons.hash
> +++ b/package/scons/scons.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  7801f3f62f654528e272df780be10c0e9337e897650b62ddcee9f39fde13f8fb  scons-3.1.2.tar.gz
> -sha256  72ed889165fb28378cadac14552be4a959f1ebab6b148abb5dd2b49712c3c6f6  LICENSE.txt
> +sha256  ce26aac95d350a79a4192196b0beac3cb24f4ccabce0123eb28d3370f576f072  SCons-4.5.2.tar.gz
> +sha256  2f6ac9a1fc98394d18b80dba9bedb9d5626006d44db3fecf7cf3e21cff7e8b1c  LICENSE

  The license hash changed. Can you report in the commit message why it changed 
(i.e., did something change about the license?)

> diff --git a/package/scons/scons.mk b/package/scons/scons.mk
> index 6b75d3ddca..767cf64b26 100644
> --- a/package/scons/scons.mk
> +++ b/package/scons/scons.mk
> @@ -4,11 +4,12 @@
>   #
>   ################################################################################
>   
> -SCONS_VERSION = 3.1.2
> +SCONS_VERSION = 4.5.2

  That's a pretty big bump. Have you tested if the scons packages (benejson, 
gpsd, mongodb) still build?

  Regards,
  Arnout

> +SCONS_SOURCE = SCons-$(SCONS_VERSION).tar.gz
>   SCONS_SITE = http://downloads.sourceforge.net/project/scons/scons/$(SCONS_VERSION)
>   SCONS_LICENSE = MIT
> -SCONS_LICENSE_FILES = LICENSE.txt
> -SCONS_SETUP_TYPE = distutils
> +SCONS_LICENSE_FILES = LICENSE
> +SCONS_SETUP_TYPE = setuptools
>   
>   HOST_SCONS_INSTALL_OPTS = \
>   	--install-lib=$(HOST_DIR)/lib/scons-$(SCONS_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
