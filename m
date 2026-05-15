Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B07CCD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3343140A73;
	Fri, 15 May 2026 13:34:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xJbLbLpSrNXl; Fri, 15 May 2026 13:34:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F03640968
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852049;
	bh=dZyhL3jNnLFy0/5nxnCqO+ep1YK339QkWhu5S+JmXhE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ciQI+b8ggV33Mr8b7yPTupOQXeo7CGghlWdScDzGmG64or5AA1IWF+o+L3tm6D4RV
	 TznuEpiKfV8x9jHEfchkZZsCCHl6+BK+SMhZkAKhhnlj2uHjMRXELbrZ0C1WDGMUiM
	 Af2hyo7hLfaw6yDFP9Df8D+d04JXCo8X4bvk4ZxtLtqE5TphpkM3NAuXzS6lzmdF5Q
	 PX2JmiIefgLu0wainZhOIhCTz39TwxMRmwGtyJTcYQRa+sYtsACFRtNUHdvNsKZ5r4
	 AGxHNSW9jlieEFu6X5xoDDhXgPQt/5gKYibl8bW4FkJAbdS2sRnkUmvxQhYSEBGzOs
	 P13nX4D6Hx+Xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F03640968;
	Fri, 15 May 2026 13:34:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CF32136F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B519984338
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gcVHa-enHxYy for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:34:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BAB0F84333
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAB0F84333
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BAB0F84333
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:06 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4891e86fabeso105808165e9.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852044; x=1779456844;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DAW42+7cM38fhpPJ6Zz6ydtIs+hgjQRnQhljYmbAZKk=;
 b=GAP+syUB0KO+NXp2wCBga3Y7TdTPiXTv1WOMKwTW+mpE4KI54CGaQrjXZAlAythh02
 CbuV21Xu0Y/NEPLTIUM9A3roX3i32lChnuNRN1DBLGwj4rISbJhglnTydANIjfHwTpvt
 ESwHyow+Ori2SGl5OIJcVi+CGmkp2qk/h+W9GgS0w0yY43aovPhUqIgCxJ8uUaB6+CdY
 TZE3f57Yc6D0HCd2s/R2Q6CmcDFS5Tz92+xqAEjfAr0qBjGqkQzvd0R0gB+Ow3wwN55G
 1CAS7573Xg2VL6snj960fQQKEL2FuwjnpXB4RPB9dSKcASzebNWq+mbO2QGkUhEtjgYq
 nv4g==
X-Forwarded-Encrypted: i=1;
 AFNElJ/C6AD9H58kSfKMKRLK6LCCHTNOwgAqWcx/OpM62MtXprNFJ15O664Pd/WZ7XM3VcMHwatmhQlPUjk=@buildroot.org
X-Gm-Message-State: AOJu0YzU7IN0qAAGdY1aUvWhG+FvVXC3n+DXTLl9ap9zChiPnCDGWFHW
 Z5MhZVSC3YcUDbYGDxEgKZEYbwYy0izytbG0fSGjgsCcmI9fd/e0WC76vfsZjmMbtiCzPGguDwo
 vs4To
X-Gm-Gg: Acq92OHv46jstf3ys6ag6jJLpKJB5nNQV39s+wHRvTkMtn/pwcAq1b8SZzaYBmg1KYy
 Ngz2FtQZdXm7qIsAgMBnL3kM35NqEtghz/Zg0sHg3ApaTgaDCbEDuFYq4gfyyNADa/A099QV1vJ
 eVK7eWgcVbt7Oe+fOgLnQK8xxaj1gTTN+mDluUipFKtF/r4yXM/5BCmcoH7wJGV9A4ROTWMrxzL
 Fg5jQK3/Kk4cI8+U8GJ8kFJ+tZ6xRbu4Barbe+tyQReh28K/Hvj5maibZCbtkfsA4aSX6AQj7OP
 8MydRY2Q1VjSvqT9THW9u1Amsm5DstFZiMyhRoBryHMlERmGqEaB2ceo5EXCs5rftYLQMQDevrd
 +Bn4nKsM7t/wWJ9sbXRU9fxO29B5vRnTojL2vzu+dgT1QKR6LUh1C7HfdPQ65Zv4N9i+zN3bdAS
 nRl9yTY5opmUbXTLZtiQ6gRgWRv/ZJTAe4ieLpUw41ILrw
X-Received: by 2002:a05:600c:a11c:b0:48f:81ea:ebbb with SMTP id
 5b1f17b1804b1-48fe60e4ddfmr39395705e9.6.1778852044566; 
 Fri, 15 May 2026 06:34:04 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe537c788sm60358325e9.12.2026.05.15.06.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:34:04 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:34:03 +0200
Message-ID: <20260515133403.316116-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260425121200.810180-1-fiona.klute@gmx.de>
References: <20260425121200.810180-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852044; x=1779456844; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DAW42+7cM38fhpPJ6Zz6ydtIs+hgjQRnQhljYmbAZKk=;
 b=M5kndWaHqejsOsRs5fS0cICl8PPqValzIwR/6JZHEN0ru0TxQeFwJUZzPotZ/ffqcG
 HoHeOQ+mRNi1vV6hXiuc3/9RYUZSAob2wqNBxd12FB3yNW6xD3GSKD3x0YRM9bEwexId
 JmoNXHPXtgCBxa1Ie7HADbw8aHOAWRLNnmsO3H16pGaIh0tfDWtcOhO/NIunlHAvU6VE
 s1uup+uZr7dO6Ifj3bMipWWirOllyojWn+s3kO72vsAUSiv1qqKr82CDIAvzO7+y5Gyu
 10tA1wKfRwadUK+ZtfsM3EbhDGAIjefFHUkRSzCWBZ6bnKcp5b3pNMeesfP8+NQ1qMTj
 ns4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=M5kndWaH
Subject: Re: [Buildroot] [PATCH 1/1] package/python3/Config.in.host: remove
 select on BR2_PACKAGE_HOST_OPENSSL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> There is no such option, and according to the commit history never
> was. If BR2_PACKAGE_HOST_PYTHON3_SSL=y the build adds host-openssl to
> HOST_PYTHON3_DEPENDENCIES directly.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/python3/Config.in.host | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/python3/Config.in.host b/package/python3/Config.in.host
> index f3fcd63567..28fc0dbaf8 100644
> --- a/package/python3/Config.in.host
> +++ b/package/python3/Config.in.host
> @@ -24,7 +24,6 @@ config BR2_PACKAGE_HOST_PYTHON3_CURSES
>  
>  config BR2_PACKAGE_HOST_PYTHON3_SSL
>  	bool "ssl"
> -	select BR2_PACKAGE_HOST_OPENSSL
>  	help
>  	  _ssl module for host Python3.
>  
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
