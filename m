Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59057C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 21:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 106A74165E;
	Wed,  5 Jun 2024 21:30:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j6ba5CYSjwKY; Wed,  5 Jun 2024 21:30:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8F7F41675
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8F7F41675;
	Wed,  5 Jun 2024 21:30:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D5B01BF5A8
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 21:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26A674165E
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 21:30:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FkSIPo0vVX5j for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 21:30:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0DB5F4042C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DB5F4042C
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0DB5F4042C
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 21:30:16 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-35dc1d8867eso291003f8f.0
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 14:30:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717623014; x=1718227814;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GsjngW3AQE4tjJPZ1/dx6zNDpFFW79/Uv8S00/UJLCw=;
 b=WsNoaGn7CgFqYXE5jMnpqwxQTMXaQO0MS31EK+P7jBe/kvU43rLns5RLZmBhh8TBFM
 c8UoXcgkgoOdVldWTwNq9YoLDQ7b5zLpG6uW+o9OdDX8yS2M0RyRE4fBW3qRnuYN1RpH
 nndNLSpDXom68M3BuU04I7pnmcsTwECPSXPTs7rqAMM1WgYvu6dWlJeb9wCLpsBdAeSd
 W573AvPS/iDMB4RJr4U6N0F2Vb/JZLsGUlpBuM6LdA7sbtEc9kxqKxvAIozi5T0OmmPP
 FlL/QHkmOU6rB4FmLdpxuFBNQad3fZJHGHyekjln26f7R//trfWoJGeGm2axkGNMeo7b
 35MQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUq6CkZmjGxN+na8utRUPUFn38EsqdFUgmpVoqZedf6L1tQ7LcbxH9fLzTodDdFkg1beXl5uWW05TCQ8Daoqr+JgQGMZYWodA==
X-Gm-Message-State: AOJu0YwZ2s3wClv2BtphkDeJhseEyW4t9rqLu4GjKp1JaC7u2t+xAkbE
 j7PCW/lWjG1a/fzfnrbQFbggtzfOe3MI/3hMZWTO70YQERM1Cm+vi5/olTFsO2M=
X-Google-Smtp-Source: AGHT+IHG9UMmApVBbWF9nJffSvdgyqcbo8d5Jxej6IghkIQpbuSo8p5bXZbjiMANywdPGtcI9WD9Rw==
X-Received: by 2002:adf:f9d0:0:b0:357:e5a0:fbf9 with SMTP id
 ffacd0b85a97d-35e84070d90mr2499511f8f.19.1717623013708; 
 Wed, 05 Jun 2024 14:30:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd064bb21sm15768549f8f.102.2024.06.05.14.30.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jun 2024 14:30:13 -0700 (PDT)
Message-ID: <6bb02561-9c19-4ce0-8a3c-80d18e8652d0@mind.be>
Date: Wed, 5 Jun 2024 23:30:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1717609998.git.yann.morin.1998@free.fr>
 <0e71798f007c322ba6d3c1c140b37b5c3c4d4857.1717609998.git.yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <0e71798f007c322ba6d3c1c140b37b5c3c4d4857.1717609998.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717623014; x=1718227814; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GsjngW3AQE4tjJPZ1/dx6zNDpFFW79/Uv8S00/UJLCw=;
 b=AQK8i/6o6n/LUOg1K+qnGQT2GDPzbowuJ6HRoCdPuL+QlLb8iHvh7TeZAiFQHAsF5T
 MUFfFesID0I7beokztfbjUrgY65bhnSoHC4HMSo9h+6lu4z1viP3+hlAYiiC4ezECHbT
 vZoFoIhv03jYp2GiMxIfTeD+AbzNhWPOBN2/g0ahVBnMjLrKK7EMWXD5EHI7JjpTAFXW
 tlZGTB7Mj8t8G0erPp6vScwcc8WrjxfrdTALWTbucfQIydo12ZIXqgh0DpXUPdK3R4Wc
 bCl2Mu/a6la2WsmBpzUCohO3pDjRZTAjiuW9Il8sPZHSKTeFGumNema5hwe9H56Nei56
 0tNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AQK8i/6o
Subject: Re: [Buildroot] [PATCH 05/10 v2] package/pkg-download: export TAR
 for download backends
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



On 05/06/2024 19:53, Yann E. MORIN wrote:
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>   package/pkg-download.mk | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index bec213fb71..a78532ce8b 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -109,7 +109,9 @@ endif
>   
>   define DOWNLOAD
>   	$(Q)mkdir -p $($(2)_DL_DIR)
> -	$(Q)$(EXTRA_ENV) $($(2)_DL_ENV) \
> +	$(Q)$(EXTRA_ENV) \
> +	$($(2)_DL_ENV) \
> +	TAR=$(TAR) \

  Same here, added quotes.

  Regards,
  Arnout

>   	BR_NO_CHECK_HASH_FOR="$(if $(BR2_DOWNLOAD_FORCE_CHECK_HASHES),,$(BR_NO_CHECK_HASH_FOR))" \
>   		flock $($(2)_DL_DIR)/.lock $(DL_WRAPPER) \
>   		-c '$($(2)_DL_VERSION)' \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
