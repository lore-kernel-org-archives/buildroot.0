Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB41F01832
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 12:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ADF780683;
	Fri,  6 Mar 2026 12:46:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2_0SkOxVolx; Fri,  6 Mar 2026 12:46:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82ACF80707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772801200;
	bh=05xdVC663ObQlg/jad7psaSFiVmzFK+CTdeZx3aZs6U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sThXm56wgw/wrAjNvCFCd0vIv6ibtF2YC2j1LYgvBSlUokeQU88AHs2IEJjiQhrRY
	 VxoCarGZOcDH68VeFB1NYjBg1cBeHBUCKHMCIybqOCbweI9IuMJxHpeISl8hQy8waB
	 KX+QUIxVlXtbQ/JjwyVMQaxRTJhtMib2vcaw0zTC3lGN9wYCs0s/erkAO4KyglR1tf
	 DLGVJH0QfTTuN2MMjaUCC3wSc7vw+OtYjEY9ttxqFF4UP5slxBnAnSY9UsKew48au5
	 rtO9UXX//jXENr7E03dTcHNkqwo4FlfsLC5SJx1wIm8WrbvW6E+eA578nBnsBNTTLd
	 Vmg04yJN6nKHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82ACF80707;
	Fri,  6 Mar 2026 12:46:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 67772339
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 12:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58F0F409B9
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 12:46:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SaHyu9xM3eaV for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 12:46:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C5CD7405CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5CD7405CC
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5CD7405CC
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 12:46:36 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-439b9b1900bso4104444f8f.1
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 04:46:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772801194; x=1773405994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oNsLaUvwXdrm5ghsjMaeNpxNHSpklaXAjiVPrGD5/04=;
 b=wz8gtMwi28/Rs6yvknPYIhdJkAFApTbT04nFHTA+mlqLP5RgyWfdk+RtgnHRtxTCqG
 s+kTuWxGJV3hehGaQLZMzZR/ODWYkmL3Psuf3P7AxFYMF0UQjLa5bhBFR4tVVjN66foI
 hC23Qu5r+xuV6OrDC89N5WckkoLckTTvpo3/ftytzaKgqeSxznTpyivh9ln0kc2u/ns2
 lKyQi+Mb3YLyH37E/lnbmEmkK6GTpHJEa3hoSSDRlsjHaIMuqS3EZAY5qS83KT7M2jIL
 PNLf/fwY5ODdZT92pd1Mo4b8DmSw6XaUfzlH4eamr2IKqMeX8MzWUsdEJKVg6M/T9NaM
 7NdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVV5GyKR2eOKTWc0fJKojdG6FAtgRiduNH2cPxKEhtSCBbR7QtQ3LsKU69fqi/YbscKitPY+itFDow=@buildroot.org
X-Gm-Message-State: AOJu0Yye8epSGlq3i95uzGUttqudKsqWwpgnPk0bvyE1uRn3WjShWCWm
 EhgYBAv/t6+AT+ZwuEOBAT1aNpVR4mILjFS892+uBy9cTD0xXGxU+zrbGWz4Dq/FNij/hPc1vH7
 b0iHM
X-Gm-Gg: ATEYQzxWD71Gh368JHylTVUWdkqXdOBek5comiHbXG6hOcgVD/XMxFNiEmrrUC2bx8S
 OdHONZ7rq6KfAGvYewf6gPZavxah9G1NjRq1Cxl7WUVU68snYo58mkBlEnIIM96TWAhZLUG5gtf
 ZQy5G/ISY7LqMACtkBgFBvyV14ACwaloQ2VxP6sYx513yHLSNkTVNnKDHiEN1f7ZcemHw5nS/0C
 RoPHIdS0oHH5K3Sa7nUFZhFzHRT4fAGebu4MtR/TnkzWri5GP2JwmR3Tqa84dixLgtb1nl+2NrP
 1JkXLvZelZf6eMpvdt+WSy+LsEVZQFDP8tPlkvbnXuWrLLGpMD7y34Me9acLgUAcJmna3/QfCZ/
 5lNsbfWCyc8Sevt6kykzPqBrN5QB6xlCbto8jQ4C1klYKVtjuf+fpXdfas4OAon8RwVrzkvycdq
 d09RnVn56ohPEpfv8=
X-Received: by 2002:a05:6000:2c0c:b0:439:b541:a088 with SMTP id
 ffacd0b85a97d-439da8a2e9fmr3087723f8f.54.1772801194304; 
 Fri, 06 Mar 2026 04:46:34 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae2ba66sm3080843f8f.20.2026.03.06.04.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 04:46:34 -0800 (PST)
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Pedro Aguilar <paguilar@paguilar.org>
Date: Fri,  6 Mar 2026 13:46:33 +0100
Message-ID: <20260306124633.143362-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225175138.2965145-1-paulk@sys-base.io>
References: <20260225175138.2965145-1-paulk@sys-base.io>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772801194; x=1773405994; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oNsLaUvwXdrm5ghsjMaeNpxNHSpklaXAjiVPrGD5/04=;
 b=Kl2UfjgDJjUYihmUp7tZFsOaHZ6Dt5u02QjRT9hYqJluEpwEf/Z/YYTZdjkIYH1fYC
 TA6sogkaMr2DOYJqRNIVKyZ1SUf6BFBnLhYALbVLEPDtBQp7gorjTa/nICrADCjkoClw
 QumYCg7UyWl5aXX4uiqMNKfnrGQaQwBz9vqMzMFf6eVJDedze5zrW82GTEYRe5GeNF9J
 KlOZLQFhUNi44RDq1Ns+S3tqm8FUIZNaylL6eJh/fO0x3y0ewP/akHKeDR+DNwOdpAEG
 zmFwNSMY5EqCMLZbdF15b6mi3GisDb2h2U8hnLgEkzwcA48I4Zb5B9qIzASg7yPC551X
 Ro+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Kl2UfjgD
Subject: Re: [Buildroot] [PATCH] packages/libunistring: bump to version 1.4.2
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

Hi Paul,

In reply of:
> This minor release contains a fix for building with host glibc 2.43,
> which fails otherwise.
> 

I'm looking at this commit to maybe cherry-pick it for the 2025.02.x branch.
I'm running a host with glibc 2.43 and didn't manage to reproduce the build
issue. Can you point me to the commit that fixes it or an error log.

Thanks,
PERALE Thomas

> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

> ---
>  package/libunistring/libunistring.hash | 4 ++--
>  package/libunistring/libunistring.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libunistring/libunistring.hash b/package/libunistring/libunistring.hash
> index f86b6f94b02b..ef2f3da34147 100644
> --- a/package/libunistring/libunistring.hash
> +++ b/package/libunistring/libunistring.hash
> @@ -1,6 +1,6 @@
>  # Locally calculated after checking pgp signature
> -# https://ftp.gnu.org/gnu/libunistring/libunistring-1.4.1.tar.xz.sig
> -sha256  67d88430892527861903788868c77802a217b0959990f7449f2976126a307763  libunistring-1.4.1.tar.xz
> +# https://ftp.gnu.org/gnu/libunistring/libunistring-1.4.2.tar.xz.sig
> +sha256  5b46e74377ed7409c5b75e7a96f95377b095623b689d8522620927964a41499c  libunistring-1.4.2.tar.xz
>  # Locally calculated
>  sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
>  sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LIB
> diff --git a/package/libunistring/libunistring.mk b/package/libunistring/libunistring.mk
> index 1abbfde6da9e..57333a35bffc 100644
> --- a/package/libunistring/libunistring.mk
> +++ b/package/libunistring/libunistring.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBUNISTRING_VERSION = 1.4.1
> +LIBUNISTRING_VERSION = 1.4.2
>  LIBUNISTRING_SITE = $(BR2_GNU_MIRROR)/libunistring
>  LIBUNISTRING_SOURCE = libunistring-$(LIBUNISTRING_VERSION).tar.xz
>  LIBUNISTRING_INSTALL_STAGING = YES
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
