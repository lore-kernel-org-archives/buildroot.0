Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A40EC3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48BAA81FDA;
	Tue,  2 Jul 2024 07:05:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g3M3vMTYp4Mx; Tue,  2 Jul 2024 07:05:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C65181FD6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C65181FD6;
	Tue,  2 Jul 2024 07:05:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 40FD31BF313
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9C72608E8
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:05:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rw6cLVsrfgTy for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:05:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7AAD3608B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AAD3608B4
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7AAD3608B4
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:05:11 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-425814992aeso12243985e9.1
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 00:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719903909; x=1720508709;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jeD6hlDvHfv3/TsKYGi7RJlhj6DvMmv69N3dJy8tP2s=;
 b=tbi6S0m2kPePgfuxKi0oNPad2n8fVO7KLt6m14ARbNgvamxUpj7xfoyRSSdW8rCKqH
 OjqfyVjFInhCS+F2diiuajjA/QFIxsMzKgmNQg9PRZlabp5bblX4sQcrMiYu6Hw7iVb6
 E2EmEoIrt7cqvINCDVs43yCvDY+LPOc7E6KEMzt+e06XPo6nv62U165Be8r2Z+vw2H0G
 6my2BbbZDFpfZI0mS0swPtl0b5+bxcdTfJxk423L7lkn4ajvVZrImzOsB15Nal0nKeL9
 kGnCk4I/sOmTfJLjy08DOoA4M0N1ni8+AyFP7t2ugQr36zGciTCqpBA0HJrjo5cP9clM
 5s5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnbxDPavd4J/esBV6p6VccddThe7eB5ls05/f1YqSuQFfWYkNRNPtriEk+YIDNZULla6MuHnZS7P/9avvWPj5/vw1cCIORwA==
X-Gm-Message-State: AOJu0YzLXc6TLh91426tJneJuo3KMjESGaLZhlMi0+JMG005EEcBzwnp
 IpW5+La4mD5/piDFIgjuxtGq47987u+7PQ9No1oiYnsraiRYdgUqaSDkbSeoiDcBxH0Vj+1F5fh
 8
X-Google-Smtp-Source: AGHT+IFSohGfeqDFfqe3pxsKebwk61O52qwOu/+k70BUlf2kWVcnM+Ci90uNBcbtEyKwSqALPrk1dw==
X-Received: by 2002:a05:600c:181b:b0:424:aa83:ef01 with SMTP id
 5b1f17b1804b1-4257a00d057mr52994365e9.10.1719903909421; 
 Tue, 02 Jul 2024 00:05:09 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af55aeasm181824815e9.17.2024.07.02.00.05.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 00:05:08 -0700 (PDT)
Message-ID: <228a34b9-d20c-4c0c-beae-32aaa81312e6@mind.be>
Date: Tue, 2 Jul 2024 09:05:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20240701182734.3297884-1-bernd@kuhls.net>
Content-Language: en-GB
In-Reply-To: <20240701182734.3297884-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719903909; x=1720508709; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jeD6hlDvHfv3/TsKYGi7RJlhj6DvMmv69N3dJy8tP2s=;
 b=gnjp9U86QZMd2zPVa4MKUYwadTCTlvCj4WpMhSRYgWIVZB8RfyvKBqBCKEwp0SSKty
 TnNbFGFJDXgxbCAYUDL0Ezjo8GkO+jMxJDkOi47sQYjwSkklwFI2YlurHs/wmBE8fjRk
 YE/yoW7YxzVmnQJkJQc1DKCk4yLD4/JYwbBGF4cZHYF/irH+RG2xusGOmzHAFr9yaize
 GQnSaGWH3ho7/+vZ30EvJhRco/zTTbTOsbJN0WQrTA0K5wsv0EILkyu/pIrXgsBvkVJg
 m+V6H1Ew/47Gx5KO6JURHYLqdkU4yTk1OemBEpu68f8VWXUP2syYLmyQPOfDuA8S+cxK
 DEtA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gnjp9U86
Subject: Re: [Buildroot] [PATCH 1/1] package/apache: security bump version
 to 2.4.60
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



On 01/07/2024 20:27, Bernd Kuhls wrote:
> Changelog: https://downloads.apache.org/httpd/CHANGES_2.4.60
> 
> Fixes CVE-2024-36387, CVE-2024-38472 (Windows-only), CVE-2024-38473,
> CVE-2024-38474, CVE-2024-38475, CVE-2024-38476, CVE-2024-38477 &
> CVE-2024-39573.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/apache/apache.hash | 4 ++--
>   package/apache/apache.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/apache/apache.hash b/package/apache/apache.hash
> index 84248761b9..bd503d84f9 100644
> --- a/package/apache/apache.hash
> +++ b/package/apache/apache.hash
> @@ -1,5 +1,5 @@
>   # From https://downloads.apache.org/httpd/httpd-2.4.59.tar.bz2.{sha256,sha512}
> -sha256  ec51501ec480284ff52f637258135d333230a7d229c3afa6f6c2f9040e321323  httpd-2.4.59.tar.bz2
> -sha512  209da0bbac5e2564d4590302515b35495be6402273ff4024aa93e85e44554c95e053201d606383936425a41e1b5b97e6b40055dcbb385eb691a5029a6f3158c2  httpd-2.4.59.tar.bz2
> +sha256  7b1ec7ec5635da7cb01550513215a90f8b2f52bb7c90cf3e97ede936d3e55b0f  httpd-2.4.60.tar.bz2
> +sha512  c1591389f76699beaa5d32b019729e25f1ed5b828311c82b52f1a4edd5d28b73e697958df384d7628b314521a831dbb0af418bc37cdf031cfe133e53c195d8ad  httpd-2.4.60.tar.bz2
>   # Locally computed
>   sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
> diff --git a/package/apache/apache.mk b/package/apache/apache.mk
> index 1b095c5eb1..39ccc3cf96 100644
> --- a/package/apache/apache.mk
> +++ b/package/apache/apache.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -APACHE_VERSION = 2.4.59
> +APACHE_VERSION = 2.4.60
>   APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
>   APACHE_SITE = https://dlcdn.apache.org/httpd
>   APACHE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
