Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228D1CA5FC4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 10:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBF658122B;
	Fri,  2 Oct 2026 10:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dAq1SmJp6pMY; Fri,  2 Oct 2026 10:33:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E863080F92
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790937183;
	b=R5U//iGt1t76XPYwYBbN2jHk++ovcTQyU/1JMbhkDxVJes0mEjjwVFNBX41KPWj+pDJY
	 B0EwqtceCnn+UzAvJNe22fUKlTAa1XDp9B88F4UYAAlNblAWPWBHqftOCUZMXbTyAT0bR
	 wQ8TAWpLW4ld62CMbqH18sPDgYMwnBy0ODsA0kwHP6Sg0cgRhJysynoQNyf48GUH8pNNZ
	 K4D1saqBkqMZbXy4fkUNNXsZupoCn9P4S/Y9jvhhyUEN9yFijEaqFBZo4AjmlQ3Zj/57/
	 qazTcWp5pgmS+luic1qAXFZsMfqy/5uNIgneFe4ovykEVRJP7AruzI+vQezUkciGAbg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790937183;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Mr+kAMaOIjqUEowYEC6O/TSSjToZIzxPXDTh7AE35NU=;
	b=aXqti6qRJsAZA7eo6c0sTfoSw03wC+F2LEBBiiZ4DdmVRvmqiWq1xlaP/8287tNvD0Ch
	 7/vFRllTdQuREeRRsGxRGMk7sHcHPBEHUJfDEs6ZnXMcjd+zBSNJoznB87qpTI6KSffyb
	 3U+ChSh/67RcFdcmwqCz3epCznEc6vUo1w9gePbr+i8V0B/4cPaNtz+EggfP6ZB4EP9t4
	 +1d6DhrLunLgdZlolesjW9aG3FZEddIoUbkpMFxH5RVQbrmMw8q50ZVwqttIVc3LhWHhs
	 g7aQ++Bfdmwd2LtHGsDlc252C8MHiAxZk98voGoywsUoCoNG1FIzLLMyTMCFn+7ApRw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790937183;
	bh=Mr+kAMaOIjqUEowYEC6O/TSSjToZIzxPXDTh7AE35NU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N/ETAFBhEta1UQgS0MriuAdI2B/CIw6OdwhESKvOUUVg1Vnu/9ZMynuyH4+llkYkZ
	 RwoBR1UN6w5f9eWbbXXhB5hkp5YJu/TwflkxawJ7orF1V31t2QAfV/x17dkLKRArj0
	 xZRbrtmNVDZQtNbyZkweF4cAoGdvDOGWItvSa85Jc+KwltQtIV16kckeW1iqzAwdf9
	 4bxObqOoRWGlzOb1EMvO4VkIjDi9Bswu/X4JHBVo8Yvah1zG/pgPkIiqzLd5m2gux8
	 heqVqazGQmInhxockMeBct2aj1PnP7OSEU0JxCkuxHYlRc/9fH9avb+oDyEKLjLTxF
	 qvofSK3iHyGpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E863080F92;
	Fri,  2 Oct 2026 10:33:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EF7534D
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70D1D81216
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:33:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 52W5XfpHc7ob for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 10:33:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EA5AB80E00
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790937180;
 b=OTK6eAJpapBvMTdtEceRvZlMgzQmv08ZbJpWJINoEwIljhHmsDDRIeyekoJim+s7bLok
 k//t9xbpwKf6bE7X+pvfaQm92z64dDUfe8iZ0g1uE6Xo99+7p+XTOE0wrkQ32ohbbB3Yk
 mPOdIVLjKbH34HDAdI8a66xIBCBwhdEYzfnzFnq2oTNKlJk9Ca65BoEnpDjwxBzFl/um1
 jmIj9Rmbp0kEia72/+J4Tp+fmakZQxa6yRVdpJi+5G0lbZIEVGdJu0MniZKxIPJ2plb3N
 UfeU9zCJOv0BLoJVcFjaWJQiM8Hhvs3zq4hzkKwsHoZfG/hIjDSKA1meeiSPn2FO30A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790937180;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=5NVGduXKpuCvh4MJloYGF+6DDMcZkd/rk4J13mXnJjM=;
 b=p8OXCJOf3oHbRGLUcMGdbzS7xP09vDmlDWy7jMD1y/zim8ydYE2hWEBvKU6oxJKYzLkb
 HDv6g7HRs0J/tKr0IqbRsy5wMSAV5yrXHcHz+Ol/Qi+C6dQPSiyhPLzJK9+NpQtEYyH6p
 sVJ3NOG7Iqt3OZDy37NnTMcdiio2BWlrwODtmyxij+yttsmY51Dvzt8+YQM7ag6Ac//rq
 byp1A5uaw7l7DTCW3qRooFZA8qEUbsHEaiLVitwyLbVTFVC0bthoPOz1iljVaG8sqkmjt
 HFPRRKhB1d4TsakezRohqAt5nm+5lnLxABMJcUZ2lJ+WhYvyi4iOiYrwKF1EBeMpu7A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Aafizf3m; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA5AB80E00
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:32:59 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-4a00d8bec5aso24529055e9.2
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 03:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790937177; x=1791541977;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5NVGduXKpuCvh4MJloYGF+6DDMcZkd/rk4J13mXnJjM=;
 b=TaGgewxWM1DjZCvKQ5RuM1aem6HibU6w6ow87h6Mn8kv8FYmYTPsBGnm6LQnSoQOr6
 i6wh2yhn3uSFWJT0RYJtJaGYK48cPimVrIrtN0IO5ZU41BgWWqWkc1FDIdbxVps7+uP7
 rZv20DvbmTEyDTBCs65y/KAch8hRFkE5r40Z09M2lad//0KJ/daAmrn0Iaes6/Wdp9mc
 W7Aj4VWO4mh5Y0fFAB1yziVULeLJ4KhocIcwhiq9+q965A2SCpKqzgqsvUwZ+SAHu7pB
 Fu88OSa+Xkfjyb04RRSPFbIwi45lKnLaPSMkDmiHwdVeHBDph4KExbxezUL4Sxnsn/qC
 unbg==
X-Gm-Message-State: AFuF++l1Acs/fV9KVDVK+np2i7yBc37q0usgDpBC6WcRJKPnvdku5Up+
 q3NuwzBSffq2ehAn0bU+iUeIN2ms7VWJIbo2M1JI1MOuoazTTfjeYnJKSzcZ/ZK9nEj5RzLUVnk
 nZE1D/n8=
X-Gm-Gg: AYBFou0FAhdpgqW3ScywdZ+V1RCJ+edpQ6TR/bGGRedfzgOGCjR1k3Ks1PuSajBPMyc
 7MiaJwO1oQ+fy4bZJx840p+hmrrnSbNjgGe79BXOif4eWzZAa0aRKJKKNEX4IEsFD6JfsvDPn6G
 T0a9cCqBaYSIw4/hXxuOikgaH//IV0Z3zKQDQm1c4q0xcoCN83b6ILq5H0iz6M6qfugoH2vY1FE
 VaO6mOOgPykZNboqHqQtYw6rkxBNv7jzmcKCcQLTaFtfE/PTCIww1Q5aJgA528TLMfenR/mSv8A
 Ep6FtYj7pj3kL394+Cbe43vgRDqEigKtktVNymZT0V/R3tK911D9TqBO4fpNAjh/d1qf51vp/AV
 n5TrR/WZoNJ89YBPtL7iZqiV8gLyrJWQY4aCMoKdiKulMsrT4/VMsl9Ogp4VFY4x/6OpuIGLGGU
 dMThztFt4959qu/dGnHCNKaTQI+tELFKzYfDASbIDmFwHEQFxv0kvwaZUF933VnJkPD11vmjFj5
 HTThjQKkikT4lM/+HSiktX4LdIAFtk1weSAZaYl2wvJIfArfUY6
X-Received: by 2002:a05:600c:530f:b0:49f:fefa:cfcd with SMTP id
 5b1f17b1804b1-4a0276a2270mr40072915e9.5.1790937177365; 
 Fri, 02 Oct 2026 03:32:57 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a027735be1sm100201795e9.11.2026.10.02.03.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 03:32:57 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  2 Oct 2026 12:32:54 +0200
Message-ID: <20261002103256.77171-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260922214143.1974032-1-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/expat: security bump version to
 2.8.5
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> https://github.com/libexpat/libexpat/blob/R_2_8_5/expat/Changes
> https://blog.hartwork.org/posts/expat-2-8-5-released/
> 
> Fixes CVE-2026-93990.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/562456cf120e30531736b2eb99073c96e3ba8a16
> 
>  package/expat/expat.hash | 4 ++--
>  package/expat/expat.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/expat/expat.hash b/package/expat/expat.hash
> index d8b4eef2f9..262ad4bf0d 100644
> --- a/package/expat/expat.hash
> +++ b/package/expat/expat.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_4
> -sha256  656ae1cc8da3b4ea513bb4e254f33e6243938084c0ec6239da873376b09985a7  expat-2.8.4.tar.xz
> +# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_5
> +sha256  1e727b8933ec51a77a9a9d9afcf8e688bce45d907c13e36ab7393fe36e703182  expat-2.8.5.tar.xz
>  # Locally calculated
>  sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
> diff --git a/package/expat/expat.mk b/package/expat/expat.mk
> index 1e5b738463..be4180992f 100644
> --- a/package/expat/expat.mk
> +++ b/package/expat/expat.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -EXPAT_VERSION = 2.8.4
> +EXPAT_VERSION = 2.8.5
>  EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
>  EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
>  EXPAT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
