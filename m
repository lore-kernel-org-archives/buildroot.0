Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85051C27C4F
	for <buildroot@archiver.kernel.org>; Fri, 21 Jun 2024 20:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B07D81162;
	Fri, 21 Jun 2024 20:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xF9fWLUDDfl1; Fri, 21 Jun 2024 20:55:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 924E181165
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 924E181165;
	Fri, 21 Jun 2024 20:55:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 536F61BF344
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 20:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FAF2401E1
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 20:55:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CsrrFz10zIWC for <buildroot@lists.busybox.net>;
 Fri, 21 Jun 2024 20:55:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 260CD4013C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 260CD4013C
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 260CD4013C
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 20:55:12 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3650f2e540dso1523555f8f.0
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 13:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719003311; x=1719608111;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7rXLgKS3LcoYRjMgm/UZzPvxM+R92smXxYcZtWhv4qA=;
 b=MUDMiM+CVq5b704C2r+9w+2IuFGyOX6AXguRwUGqtlWKp0V+QkEWzVvdrsydwRaQbl
 E41jm/jEXyuuwRPpMYiX4JqxE5W6n5eyKJ3gtq06tFXF/SeXeBovydJgTqEVjwcCaAVa
 IC3NrvMfo9yOHEj9MAfiOlhv4r7Hw61/FNZpnlRmMOC6GQccalGqX7uMzxKNSefEmHFV
 NIkUcz1CTAozgt9cNTszv7ZkQg/pYzy8ugps6LvOD49LiDxXrUcK1/FIWfLFKGVzdigb
 Lglk6moGLZ3gKemUhqAbEqkpn1aVAEz6L/SJr1TqbuWa5uJhg8TsBV9mu5aRplaAfubK
 Owdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUJb2mqe6XXCg8saH6qe7L3PN+FKgpuwuP5wYwzXyTJFa+lVhcoiGDEy0ZlLL6H4zCtU1d0jrbBg7f7KfxTNWYncM5xsSxvA==
X-Gm-Message-State: AOJu0YzyPzHtcPGfdjscQITR1IiYriZE7rkewKIXqmyQxl1lSZIDwXfp
 dCiECqd1HqDlhxSfvnd9VhXRCJ8qnZCGbEZqm6lJ11u93z4LcFYFpkKneEHsTBQ=
X-Google-Smtp-Source: AGHT+IFpvc2yFbqy9hFjE6U7eS7BYV5ZDiEedgWUPzXr3s5JEFuREjjxE/Z9ON6RPN+rIp0XArb9VQ==
X-Received: by 2002:a05:6000:108:b0:360:9641:573a with SMTP id
 ffacd0b85a97d-363193c62dfmr6777912f8f.43.1719003310715; 
 Fri, 21 Jun 2024 13:55:10 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366388c425fsm2739950f8f.38.2024.06.21.13.55.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jun 2024 13:55:10 -0700 (PDT)
Message-ID: <efdd2394-8c34-4a81-af2b-71da24d73d21@mind.be>
Date: Fri, 21 Jun 2024 22:55:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
References: <20240522105100.86613-1-christian@aperture.us>
Content-Language: en-GB
In-Reply-To: <20240522105100.86613-1-christian@aperture.us>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719003311; x=1719608111; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7rXLgKS3LcoYRjMgm/UZzPvxM+R92smXxYcZtWhv4qA=;
 b=FLaFhK5h2isYdurptNd1ifKy03xlQjUSWL2DqpAW0kcKay90k3wQ59TIplMh1yJCpJ
 RlGk0RBxI5kG9i2Dkj8lmwKXYGcZDD01Yui9xrAPCDgKYQa7dzOOOmXTX3FX5uNW41Ji
 jimaFteoKxAVzA8C5/Ybdpg6bHH7ttDbROpkx0+doYSIX8A9BoJMbApr3O8EdnvqsbLf
 hfvJ+glE/uMdzzqhw6cc7Q3takr2WK+QNBWuuhenWbr28Gm++17SdXOpk8xDt9b8qwAS
 g/TVD6d8NSIAe9Q2x/kg0WNS0aBpZzpkTvdcJAX31V0zx1cgLFzRkvkKlTXcJFTAofkI
 +vHA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FLaFhK5h
Subject: Re: [Buildroot] [PATCH v1 1/1] package/rtl8812au-aircrack-ng: bump
 to version 2024-05-22 on branch v5.6.4.2
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/05/2024 12:51, Christian Stewart via buildroot wrote:
> This version adds support up to Linux version 6.9.1.
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash | 2 +-
>   package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
> index 6283cb0f87..ea5ca3c56b 100644
> --- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
> +++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  752d9ae67140966eddc463238fde1f6b86457db22a45f61c13886c3244eaffe1  rtl8812au-aircrack-ng-f23979f0d20aafb563ac71b56fcbc74268c798c2.tar.gz
> +sha256  d08bad19680047cb178d8984bfdd09d9ff7765b8c9ee35a9f8f87676f0c41a64  rtl8812au-aircrack-ng-b44d288f423ede0fc7cdbf92d07a7772cd727de4.tar.gz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
> diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
> index d5571b9d5c..3a7c56a3fc 100644
> --- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
> +++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RTL8812AU_AIRCRACK_NG_VERSION = f23979f0d20aafb563ac71b56fcbc74268c798c2
> +RTL8812AU_AIRCRACK_NG_VERSION = b44d288f423ede0fc7cdbf92d07a7772cd727de4
>   RTL8812AU_AIRCRACK_NG_SITE = $(call github,aircrack-ng,rtl8812au,$(RTL8812AU_AIRCRACK_NG_VERSION))
>   RTL8812AU_AIRCRACK_NG_LICENSE = GPL-2.0
>   RTL8812AU_AIRCRACK_NG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
