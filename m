Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388DDCD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 117B1842B6;
	Fri, 29 May 2026 08:30:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vhsYWms2zu62; Fri, 29 May 2026 08:30:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A77C842B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043408;
	bh=poNkL6gf8+VcFiTz8SwUNy7W7yJCbQ/UAfcFOrERV28=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LEICxmXjCpLkYgkYRLQA2VMlo0ZDD6pm7Q/bTdCy69ESTeJHQsbFqpVqzE6bNDN4H
	 9VhmQktw/2TZYAXm5xg7aA1Rb/zIOtVq/dgYC7ZJUbVVWo733lFFvuX+MLK2P/LgwV
	 cVxfh1yHLS1mFKHaLqDWwTEHtgSU0HZU+Xj9OO4FrMH1B8nLNi3jbjAu5x2XCqtbUz
	 +JC+pAogV4DT8GMNi/m7CSZL1zvDUhwMgvWCbc5V+30PU0uKSAcLKSwW90tP44NG4D
	 hh1EkbeenPWdjkbM3ddKR9x4J/mkUG3gmU/B+xRlA6xLi0zRbO86y845JL7lIKdrSi
	 Pi4QdIReOrKaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A77C842B8;
	Fri, 29 May 2026 08:30:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C1A3288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D75D406F3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JJBk54vhc2WP for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 206E24070D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 206E24070D
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 206E24070D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:05 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-49050bfe053so42488035e9.3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043403; x=1780648203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=joHkBjroMuVvn1ocCcckqS/zKTdbWIaDLqQwkQSY79E=;
 b=Orzn1el6nlmjffEz7sPEXK18yA1hIMuvIruLph56cdz3AfPBeAs+D2dyIrQHkgBODT
 Pd8izj3EVOlCSv1YUbzfvm9nTbl+tB6GgLfxf/4DvCN2TuH5lH1OSlQ+paIyMLgpNF7S
 sX9XeGwNvQCnA2oHoSggwWbFt9TCQp5i9y8jT0pUADNabLDoSQgcv3aOL+DJtMc0M/Q4
 1yZcvf/bVs9+OyaqEUJwq1hkffS5LyPP1YD0Dn5KUZFM00++MAjNkayl/IHKngRDAgjL
 Q+gGEjM8mxdx7AXRBXqho91LHV4Z9TuaKn33CVOWOlPmr3+pGwSZOwVNTe0Lcv4TVD3u
 kEIg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+tYfO4MegwxT7Ja4RmB21FyY6GbSNOf7mLgEr7vl7GvU5YRybxTiP23lyN+u8HH6tRWjC98abIn6Y=@buildroot.org
X-Gm-Message-State: AOJu0Yzem21yoo2nTboBAQPIPZ/LqexUkM+dMRlflN3fPfFKIyUkTG9A
 90Gp1AEJofQ7/JXVGk+sAVOvDNTTdQmgMOUUakhZsmI9Dru1+spyo7GB5zjcTDrKGyI=
X-Gm-Gg: Acq92OHANwQN2nYZTv4VDUqlUj59yktrxujs+qyF1JW6BmHgC/j2+eM8RdGGfs40+94
 jSMt/UY4vXHlXwscWWF+nq2FqIqe7Wmbv/rvGUmuRQcoamehdi0+0tzmRcfbymcjUTvGX8I6Ih3
 yE34Xa7CrDNAlxRuBNBIF0xpPAv9oz7bi96GwvEl/VuB3eUabIVkWygdPrwbvnWqbrmoJOtavJS
 cOKy9uRybvvRW317/Jvji0QsfcNx9dbRnJJMoNzPJNp32Aqij8KO0ld+VTntOOBr/FXGZ7G3OSs
 k9DkSLf2UgfnVQzTKXkOL+vc42wSwVCxFUa2fMAzvxHhb2ja04i7M33G2il+5B8kpoRnOFA9jkw
 2kLyUnWxQx83XLvL+xc6WoSHSia2i+1w5buCW7gUpKhyGB1E2Fu+raqtSYuLBqUm+mUi8Jy8J59
 /s845+BFhhXjUPQ+Air8rDKEHJf5rMdSDXEmmS5b2268/WymRTFm+4MHKZrA==
X-Received: by 2002:a05:600c:6219:b0:490:9df1:f0cf with SMTP id
 5b1f17b1804b1-4909df1f29bmr22830635e9.2.1780043402930; 
 Fri, 29 May 2026 01:30:02 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34a03f8sm2016513f8f.7.2026.05.29.01.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:02 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:02 +0200
Message-ID: <20260529083002.58550-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260209203227.3837422-1-bernd@kuhls.net>
References: <20260209203227.3837422-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043403; x=1780648203; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=joHkBjroMuVvn1ocCcckqS/zKTdbWIaDLqQwkQSY79E=;
 b=EIu93NPbMLeDi5+XOpVnZsKEwzT8gfcpZdZd84L5ji5n+JCR+zvxNCfSlgIQcN+oXd
 RESggIC3ApzbgldtcpQ0ZYQmVi54MH0yxv6cDrmQedjmMReFTXU2GpXhVpSbhjwk8CLQ
 Fx+8CqGbh0Wxl3UbIk+3xuTlZTWUiATKFiO6bx/YbtI4Huy+xKNzzHUzGfrCaC3p457Z
 /r3ZL29s2OUNy1skWkAQE54ouz1nKyCKgkv+5+pWDCQiba9KjtJajN1FBXFX2fWceNh/
 T9wSb/Z7QjYRJ/UcE9HtrUOTO+imq44BYHIJhoTKN1g0dBdtvpNOLeBiC3MzNB907R2l
 WrEg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EIu93NPb
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: bump version to 1.21.2
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
> https://github.com/strukturag/libheif/releases/tag/v1.21.2
> 
> Use sha256 tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/libheif/libheif.hash | 3 ++-
>  package/libheif/libheif.mk   | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
> index 3da82e3e27..0daabcb5dc 100644
> --- a/package/libheif/libheif.hash
> +++ b/package/libheif/libheif.hash
> @@ -1,3 +1,4 @@
> +# From https://github.com/strukturag/libheif/releases/tag/v1.21.2
> +sha256  75f530b7154bc93e7ecf846edfc0416bf5f490612de8c45983c36385aa742b42  libheif-1.21.2.tar.gz
>  # Locally computed:
> -sha256  9799b4b1c19006f052bcf399c761cc147e279762683cefaf16871dbb9b4ea2a1  libheif-1.21.1.tar.gz
>  sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
> diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
> index acd302d847..b96dca4d98 100644
> --- a/package/libheif/libheif.mk
> +++ b/package/libheif/libheif.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBHEIF_VERSION = 1.21.1
> +LIBHEIF_VERSION = 1.21.2
>  LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
>  LIBHEIF_LICENSE = LGPL-3.0+
>  LIBHEIF_LICENSE_FILES = COPYING
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
