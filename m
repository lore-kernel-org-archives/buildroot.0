Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3770BC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:33:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF03C610A1
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:33:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF03C610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D56540314;
	Thu, 21 Oct 2021 20:33:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7HH7_umjtYky; Thu, 21 Oct 2021 20:33:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB3D04029E;
	Thu, 21 Oct 2021 20:33:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8BB311BF318
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BF01832D9
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:33:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6swO4BB0D-ZJ for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 20:33:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A458C8272D
 for <buildroot@busybox.net>; Thu, 21 Oct 2021 20:33:47 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id t16so5673690eds.9
 for <buildroot@busybox.net>; Thu, 21 Oct 2021 13:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=pjfHtHT/OPJSvTuzBYua19hYBclL8RV9cesh/z7VO7I=;
 b=SNPVY5vAAls9K6vZLCUmgfTTGOTx06/u2dgdsGjvdTzYHB9UAe1ipwaRDWXwoGPTCV
 rzNPeYBgRKbrDt482Q9QCy2pR14I2iZ6vJF+LwVtYVYv/M+whx/MKcjYzb8ANrDgHfkr
 L+pn0fpY3zWk/puahURXajfXE2YN5TTW7MVxezs8NbZMvEX2zZncY5ytJv3RfqGBptHI
 VerSoBckaX+/oFGJMhKEht/i5MhzKkYaV0ApGHzs9AqClY4H6D1EI5jkEcCZxC6Ds19U
 amvjLZCI4qEPuX7QqFe2N2ZKtu+5EOiu0B26kYdkKG6g1Fscu4VFjgcV4HSa3qZhTyig
 1fBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=pjfHtHT/OPJSvTuzBYua19hYBclL8RV9cesh/z7VO7I=;
 b=L8w/r+qdbdu7+1vtAq0JHuTSt5NnbVpp6b/tJsVuyssBXt3QKePAzP8hIh4F2jwB15
 U+w6WLZ+hGfnMEKBh+WBxKDzbGJup9jZcD5/dbT53kzHmb2CjcWLyYMVsK5ZyyQ7sG32
 tITrVE9sMLguIHug/hXdlh+70CwnmUXyvQ+eT4Y0IueijqM+daJj9PQ5Vmyv4Vi9/GT9
 AFgUKmHBwjAtGPuhRBFfR+LqdPADkfC0JMC4mpFvNDZFATgGA3PUKGNoH/QFc0+rjYKX
 FAiN8aB/4eOrLfqc9XdQUP1ROXrTD3V9fYKYKeBNGpwUhQ7l4Zisx934swfdl2DSgvWL
 RoPw==
X-Gm-Message-State: AOAM532g9oMJ+g2vWSirD6MXA/2VgE6d595QjPjMEJcrQSpPa1jIfjRH
 5+h2hnQaFlAIST4gqCWNNJjq9w==
X-Google-Smtp-Source: ABdhPJzxcYdFn943VU2DIPwXUWHj0OY4Fxac1uNDNC+KpfxHh9SP1assleYRKzAJdAu2cWNTFXK2nQ==
X-Received: by 2002:a05:6402:4248:: with SMTP id
 g8mr10559174edb.126.1634848425761; 
 Thu, 21 Oct 2021 13:33:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id q23sm3057682ejr.0.2021.10.21.13.33.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 13:33:45 -0700 (PDT)
Message-ID: <72bebd21-2942-3870-f0d8-dd681a737e09@mind.be>
Date: Thu, 21 Oct 2021 22:33:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20211012164822.233962-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211012164822.233962-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/libatomic_ops: bump to version
 7.6.12
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/10/2021 18:48, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libatomic_ops/libatomic_ops.hash | 6 +++---
>   package/libatomic_ops/libatomic_ops.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libatomic_ops/libatomic_ops.hash b/package/libatomic_ops/libatomic_ops.hash
> index 3fca4a8c5..991c3fbe8 100644
> --- a/package/libatomic_ops/libatomic_ops.hash
> +++ b/package/libatomic_ops/libatomic_ops.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256 e6b0909cf4e63cec693fe6c48191ce864c32c5113e16c3f517aa2a244b46992f  libatomic_ops-7.6.10.tar.gz
> -sha256 f0e630c0ca489767033da5a0c869fb4231db522c5ff479ce55a853a923a00f69  doc/LICENSING.txt
> -sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> +sha256  18091d5f3cb7008b0432016390ff437b9d1d76c10b92c8e63ff63f0c1331b030  libatomic_ops-7.6.12.tar.gz
> +sha256  f0e630c0ca489767033da5a0c869fb4231db522c5ff479ce55a853a923a00f69  doc/LICENSING.txt
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
> index cc890a7f2..96b8e1a40 100644
> --- a/package/libatomic_ops/libatomic_ops.mk
> +++ b/package/libatomic_ops/libatomic_ops.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBATOMIC_OPS_VERSION = 7.6.10
> +LIBATOMIC_OPS_VERSION = 7.6.12
>   LIBATOMIC_OPS_SITE = $(call github,ivmai,libatomic_ops,v$(LIBATOMIC_OPS_VERSION))
>   LIBATOMIC_OPS_AUTORECONF = YES
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
