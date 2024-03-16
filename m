Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73ABFC48BF6
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 19:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11A7B406A4;
	Sat, 16 Mar 2024 19:26:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zxUvas86tfUT; Sat, 16 Mar 2024 19:25:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFA08407FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFA08407FB;
	Sat, 16 Mar 2024 19:25:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 83D5F1BF294
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 19:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 709BC81DE2
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 19:25:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id htjg0nyvHIUj for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 19:25:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E0F4E81CE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0F4E81CE3
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0F4E81CE3
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 19:25:55 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33eee0258abso233288f8f.3
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 12:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710617153; x=1711221953;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d4XuOeZzhKExGLoNHrP9lCuicWNgPIrjwWCR5yaN0W0=;
 b=qxPSya1kmMwvg9cI0MtvYXMga/+YXkdDST2pfK9hllnz1A8/pfUniAzc7sEfFD+OLH
 kLEGHOeaENv8Wnw3FbwjJEISwcI+h3b65SPTFmrsHECsnpLzt+iG89+yA3fM5H5p94mg
 BHHuNADuVJaesQ1fBaZDbBh9099ab/GjJ7JKG07+DEcS6CE1TfzpLZF7JjHjR58tK4yE
 EMfOmhCDVSE5+z2DQ4Dsxgee2p5qlRbCj/ZhccA8BEUjq+J0p8L8vI13W4YGr1X5o5dN
 cLQKydaEVEi0bYeYVE041dVFJId3nhhHV6OOPdUMZ6ZYGcj49Epd9BkJtKc2TOfBMQoO
 XL0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4ahn2T1xYpYhuEZqCEMqaxN5FOIfamKWxJu36uhthTPOiInGh9ncwKk1T14S32LrkVGSxicOfpzV+4oGANd7tbdukh0SScA==
X-Gm-Message-State: AOJu0Yw7Xig8IUlYOGlRPCyGKhf3vGxiIanRXI40ET/NGXt1hewni4P3
 p/FQ3FI+rV/1L/iobByMggwvOAnbzwmWZl+0bnGQNVf8AY0vNPneruDd1M3Sj1Y=
X-Google-Smtp-Source: AGHT+IE62FKjm0GxVlwuFZKV7wE+3IaZsiMW/mMXw7IjzDU4sTgFwXv4h9+7k9LbOR8bvoPxaF63og==
X-Received: by 2002:a05:6000:bc7:b0:33e:19ae:3716 with SMTP id
 dm7-20020a0560000bc700b0033e19ae3716mr4279758wrb.11.1710617153469; 
 Sat, 16 Mar 2024 12:25:53 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a5d4aca000000b0033e03d37685sm5973721wrs.55.2024.03.16.12.25.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Mar 2024 12:25:52 -0700 (PDT)
Message-ID: <113740e8-230d-4ab3-bb9f-12e1bb66cd85@mind.be>
Date: Sat, 16 Mar 2024 20:25:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20240316084335.20839-1-bernd@kuhls.net>
 <20240316084335.20839-2-bernd@kuhls.net>
In-Reply-To: <20240316084335.20839-2-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710617153; x=1711221953; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d4XuOeZzhKExGLoNHrP9lCuicWNgPIrjwWCR5yaN0W0=;
 b=ShbXvVjwJeoHfEyFr/oeW/rsZjxTFuaZ/7qLbNOfZJ8KKq17GDscgfQqaCq5s7Qgsq
 e5K3WXpTlFYA4Aq4WfZoQ5j9Xxv5jNjL+iETvn0TusDcsTKkxvHVhC/zZyK9YApNd1dR
 HGPa9+Mi9EjQ4PnXpKyc3jPycYveGFx2vMvF4UUAgswXt/SoRKi48IwG4VwHHss9seAb
 K2EOvP1LYtcrLfEfhsbkm7QOp1DGbvMa/xiDY8eeDeULYEZhIRxBeVRXp0xoAqpvE6QA
 UFEEfsaMJCskJNQwYlmrWghfZsru8lcXrCFm7CJp+CbzAx1TUogUNWoBhnOGZej57PLw
 K1vg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ShbXvVjw
Subject: Re: [Buildroot] [PATCH 2/5] package/busybox: disable tc to fix
 build with kernel >= 6.8
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/03/2024 09:43, Bernd Kuhls wrote:
> For details see https://bugs.busybox.net/show_bug.cgi?id=15934

  I'm a bit afraid to apply this. Hopefully the issue will be fixed at some 
point in busybox; then, we should probably revert this patch (though honestly I 
don't know what tc is doing in the minimal config...).

  Regards,
  Arnout

> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>   package/busybox/busybox-minimal.config | 3 +--
>   package/busybox/busybox.config         | 3 +--
>   2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/package/busybox/busybox-minimal.config b/package/busybox/busybox-minimal.config
> index 1e7ad1d357..5d2a30806a 100644
> --- a/package/busybox/busybox-minimal.config
> +++ b/package/busybox/busybox-minimal.config
> @@ -955,8 +955,7 @@ CONFIG_PING=y
>   CONFIG_ROUTE=y
>   # CONFIG_SLATTACH is not set
>   # CONFIG_SSL_CLIENT is not set
> -CONFIG_TC=y
> -CONFIG_FEATURE_TC_INGRESS=y
> +# CONFIG_TC is not set
>   # CONFIG_TCPSVD is not set
>   # CONFIG_UDPSVD is not set
>   CONFIG_TELNET=y
> diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
> index 6e8bd2799d..cfd16172fa 100644
> --- a/package/busybox/busybox.config
> +++ b/package/busybox/busybox.config
> @@ -968,8 +968,7 @@ CONFIG_FEATURE_FANCY_PING=y
>   CONFIG_ROUTE=y
>   # CONFIG_SLATTACH is not set
>   # CONFIG_SSL_CLIENT is not set
> -CONFIG_TC=y
> -CONFIG_FEATURE_TC_INGRESS=y
> +# CONFIG_TC is not set
>   # CONFIG_TCPSVD is not set
>   # CONFIG_UDPSVD is not set
>   CONFIG_TELNET=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
