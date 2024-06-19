Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFD9C27C53
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 20:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B41644036F;
	Wed, 19 Jun 2024 20:17:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PlI96WzGm6Ay; Wed, 19 Jun 2024 20:17:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 864F641576
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 864F641576;
	Wed, 19 Jun 2024 20:17:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D12FC1BF846
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDEF7401FE
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:17:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W0hYoaYVHrim for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 20:17:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6F4DC4036F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F4DC4036F
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F4DC4036F
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 20:17:45 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-421d32fda86so2525385e9.0
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 13:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718828263; x=1719433063;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4AZHD2v6utOf1dQyMLtyiH44HxnDyT47++XfBCVHIJg=;
 b=f8d4Fdp8R3+TGEAJqT39B+8/wDM0+seLLKqM4I+aw+MVmqYPbNL1qYq5XpZ33ufjWZ
 IntQq30ZK4jLXdISUy+CuaQlKIEdz5j4kn3ZdgOG2g+5hixs90dsW0Zsm5NHoofgTrQS
 A+nlnfjqHkiv95ZopLY4IUAahuV9WGvMLGbXS9zznfi13j16huz8+K48dhJ0M2Q5rDtc
 3knGJHAUARy96QmTgtNk6h3/nItT/eVswjVzqcqycsLBck9q1hiKlIZ2PLzPNrvBAQ1R
 v550UQRPaDFLGHf6Nab9hyKKNaV7uZwz2LmDPlGeYMUx3I0L5EZ6qtFeSgWK4O9xcT/5
 0F9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcE+CHIVEKSJxbbWtKMKLhc3KXymUO4Pe9QU+iGBsAkBcsPfUo0D7fyfeyrQMbuCldPWblXonnu4gtF6u+QQha4TtRE4ZGxw==
X-Gm-Message-State: AOJu0Ywh0WzCO5HT9EQEzh9JZ83uHVWyvb2R8oijFGmGmrq9yezssTtZ
 6s65cW7DuAkMS07PQ3npLpQkXrTqMzWWJjqBqxZP4bHwMbNOU7+7vlfhSnpiMujQ18aBbaTl8+5
 P
X-Google-Smtp-Source: AGHT+IFCDyBtCmpBjDfLoKjODl5YdNuF3nwQf7RkHTDsCowvvU2A1TNu63zkBTM00iUMmwJGAy1uXQ==
X-Received: by 2002:a05:600c:6b15:b0:424:784c:b134 with SMTP id
 5b1f17b1804b1-424784cb1dfmr24156865e9.6.1718828263293; 
 Wed, 19 Jun 2024 13:17:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d21264fsm1189335e9.44.2024.06.19.13.17.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 13:17:42 -0700 (PDT)
Message-ID: <1a62ef67-44cf-4dbf-9f54-83175c2061a4@mind.be>
Date: Wed, 19 Jun 2024 22:17:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240605063158.2385945-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20240605063158.2385945-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1718828263; x=1719433063; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4AZHD2v6utOf1dQyMLtyiH44HxnDyT47++XfBCVHIJg=;
 b=fqCOwG8zmKlFybXxVRabdnw8Cbh4SKZ+i4NvzxuoXiJQQ3dY5iwigv6HW9iP0C97ie
 MSf4eydIwghO74w7+votrlEVuFhOHCnHv+TSXOofPkI7s2xqRpmqNNcSaKu5fd+41/l3
 Nirc/iPtSKqw9IwPh34qA88W3TdmP7qr3+EBPqpGk7RgJMG8uGmEGhPsrs8331Dpc6Wx
 D0W7PNvl/Ux+SlZra8dpD+HXFH/JOG824UzSjV4vPg75dQxm/F2VPqUwuUINhFUZguz0
 hhAm/NtvIwcfO5Q7j6h8QQoeBopi6ZtqwPYoJivfkO5lxYT06PbU+WkpJCuRM+0tMB1A
 pHXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fqCOwG8z
Subject: Re: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.182
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
Cc: linux-amarula@amarulasolutions.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/06/2024 08:31, Dario Binacchi wrote:
> This is a hot fix for version 1.5.181.
> 
> Release notes:
> https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.182
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/uuu/uuu.hash | 2 +-
>   package/uuu/uuu.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
> index 787bf7d48705..9dc286c41ffc 100644
> --- a/package/uuu/uuu.hash
> +++ b/package/uuu/uuu.hash
> @@ -1,3 +1,3 @@
>   # locally computed
> -sha256  5e3bab017cf1b7a6a85d0cd46c0de6660de9b93fb24b0a21d8ecc4fb9f663e2c  uuu_source-uuu_1.5.181.tar.gz
> +sha256  723d3da358e6af974a056e3adbcb105fac9dad4b87544de0d22b8c974a8037aa  uuu_source-uuu_1.5.182.tar.gz
>   sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
> diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
> index 056b2a8c52db..63556b9938a8 100644
> --- a/package/uuu/uuu.mk
> +++ b/package/uuu/uuu.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -UUU_VERSION = 1.5.181
> +UUU_VERSION = 1.5.182
>   UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
>   UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
>   UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
