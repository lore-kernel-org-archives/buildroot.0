Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85A9C27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 14:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9147C8133A;
	Sun, 30 Jun 2024 14:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E-YzSmYUMDF5; Sun, 30 Jun 2024 14:56:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5609781368
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5609781368;
	Sun, 30 Jun 2024 14:56:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B4221BF35A
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1458C405DE
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yYsWOC5fx91i for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 14:56:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BF9B840541
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF9B840541
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF9B840541
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 14:56:50 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4256eec963eso15180925e9.1
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 07:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719759409; x=1720364209;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w13NH5/xgS+AgeijcQVjmMf2fv21t8elwfvGyYLS/OQ=;
 b=OOLxrutqGzo18A4SUNUmTWmm1aaIdIa0rXMiyxJPZquShbuHcE7Up3aZxiH+3G/dF5
 49S0qmrzf6/xxwE0xIwIgxnBiPgDT13aVFltOdOIxg4K8JIvNPOOvGl73vTr61mtBWnf
 zo35IiAvqBUWs17KcJdl4wZ+/tgok6w4+hiA8k6len9w/2vBQvyT9We+JtAumOcB9Bot
 KE3jfV40TaU5wvqM8heu5tdf8FmSKaThDxPHzplrdu3hB0BpkNayia/ikRKgD7RIZ0/G
 2oWzn9cZngO3wuLXpssf4wYEbM/vE1C5UzSX6EE/yOKU8DX9sk7GDuj9pyq9J1W9Z4i2
 y+uQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPjLwEAfK3lLhmspFZIfx4ViGK5khoYv1a9AleVEhSYbk6JFfj8ct2wgK2sf1AvHzu9ILnK/OODBhqlnCVGxtBAg58SMO+DQ==
X-Gm-Message-State: AOJu0YyrdEzDf93c1VXq+U68aEVNKvPwMz9GNOaPSGrIKVFnobvXPBz6
 2zTHTHgHbaqWlpgEH09ckBxOLKKIgV5aquZ4Vqfja+9MqNtcKVgCQdjV37dBYiQ=
X-Google-Smtp-Source: AGHT+IHvJWBU+aAqop5ej1fXxRnIJXssjWbeCZ8CLZSTP/5LrASUc3n0AiZ2G9bcQsmwtYX3ZlA1Rg==
X-Received: by 2002:a05:600c:4304:b0:425:6262:1cc2 with SMTP id
 5b1f17b1804b1-4257a07569dmr27208585e9.34.1719759408698; 
 Sun, 30 Jun 2024 07:56:48 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af376easm114496935e9.5.2024.06.30.07.56.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jun 2024 07:56:48 -0700 (PDT)
Message-ID: <c1a8fc2c-492b-491e-a1ec-5edbcb75ad90@mind.be>
Date: Sun, 30 Jun 2024 16:56:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20240629214731.202318-1-giulio.benetti@benettiengineering.com>
Content-Language: en-GB
In-Reply-To: <20240629214731.202318-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719759409; x=1720364209; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w13NH5/xgS+AgeijcQVjmMf2fv21t8elwfvGyYLS/OQ=;
 b=L7o6mzUnWWVHFN6ZmCdF7iRizRLV2gOKko3wG5hA3JjVB7bz3RFr/8IyhrugprtX1e
 24RUZyn21f9oIydSv9UGc3lHI9ZtDnOTW1gVadkpMErc9hpLzaxRqN35xqS3kwKSiURa
 bc7JVlRDpW3HkYWdUK9qan3rTjs9cv4H3oH/8Czln6rIe1ONRuFj6QPog3fMInwq1u6+
 /gE59OSFPxauGovO+DhgaYRBWohNx2/Ls9IV1uyS8kv082xdWfHvBomIRXbXRjK6xFtb
 dd3mCNjt3y5+QnU6MuQeiAwn88TJxJra9RXPl9M0myihKcvSMQPzxsqPDibc6bdfIALz
 Ne/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=L7o6mzUn
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.101.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/06/2024 23:47, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libnss/libnss.hash | 4 ++--
>   package/libnss/libnss.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
> index 1a69398f0d..ccc5951929 100644
> --- a/package/libnss/libnss.hash
> +++ b/package/libnss/libnss.hash
> @@ -1,4 +1,4 @@
> -# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_100_RTM/src/SHA256SUMS
> -sha256  1e35373ce9cb5b776f678bb341b0625c437520d09ebd91d1abd622e072e38d88  nss-3.100.tar.gz
> +# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_101_1_RTM/src/SHA256SUMS
> +sha256  f20e8c5daafd89419d229ec8c54100a5c320dce1467377c9dfcd5e4d8446b468  nss-3.101.1.tar.gz
>   # Locally calculated
>   sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index 5cdc494b16..60ffc92b1b 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBNSS_VERSION = 3.100
> +LIBNSS_VERSION = 3.101.1
>   LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
>   LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
>   LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
