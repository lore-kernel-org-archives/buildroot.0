Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE817C98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDD8E813ED;
	Fri, 25 Sep 2026 14:46:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KRc3KSdqxFiD; Fri, 25 Sep 2026 14:46:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E4AED813E7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347583;
	b=KxvdHE+GS3x0Fhv1TGT5wZr96j9h5aRyqPnUWfVXTu9ounLkhDmJcVvCJo5P5N0ReErD
	 uZIEh7NzSSB8CrIPB6hkKHIx49hG00NNDhol/Nlyqu/seO2KHvq8g4y8/5DVKMYT1cOfF
	 uSHthe8NB5JapcNBbeKeTLaWj9jZfEHwHWNonjR17quFMQ4clYtbsYpOcfAwkC2UvaXpQ
	 L8Pmp9RU+qAxbs3N0ig82KJ4y8hRJKxT6aR4m3nQHCONpb532BgQQ0cUUFfqoqw50uzdG
	 BZTVJcDnZJSjnbgd9C4d+6xUjJSoNf4fu0T76jbRHhFZfuZ4s8FJGzCGHWrODdVXodA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347583;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Lnu8OJUp4xVpO/Cb3jTBgvLjqR3WRnhWKH5bfQRzox0=;
	b=UFFhuGKnRYyLPctkRi4GFsNo2mnAS7So68XmjX6oiY6uXOIlfoM6dz01mmZ6MJLCN2Jw
	 m7JAM5JchrUIJ4KT8526AhoqlGpCsuriKTePNoofrg8sVLVbMgWnOWVDFYOYC+l4rEM7C
	 Sb6OzEWcQPQK99EAEbedujzzNYmcM0aMcQB+WIONlStkiAjXe+8ak8gs2x525+SjWzvc6
	 EwSbJFpY12jEk+bIpe6FGkPHZEOTyTed+dhOnIMtrV/jAfMcvZzwSkhCHiFufb9aJ1CrR
	 5MJ1808JHu6tgyjKi94dPDE6vFoxZQ0Us5gakiVUx6QjagB/RtC9zrwEc4t79PNjokA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347583;
	bh=Lnu8OJUp4xVpO/Cb3jTBgvLjqR3WRnhWKH5bfQRzox0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MPfGndjXnLepcmPNKwZl+11DE0oJZufiXa2aEhVm+BjsPuTogOHyUVK9+nENEH3zc
	 Dn5jm2joH1bIQ1IeIRSsgSPWJLQAeUlvQyJCjB/7KXGg3wprmbVxWnkPryvuJ7wiMQ
	 PkRnE8Mx8Z0rxR06nZojDKk2cwfWH9H+wr+qDRJO88gRwjQvPav/8VxHEpXtx0dvUz
	 2eXYIr/UqU/FdDGGRfOv9DUm8Vgf90ftMQ5DM+2+ljawVpJ9TsxVWRa507UPFmZDka
	 HM/vapqx/SQ32bc+buFa1g1alr7fpq/5QilkcyhU9eCOOg7JTH2znkYImCgPxObRAV
	 ggQUAlBqvIWPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4AED813E7;
	Fri, 25 Sep 2026 14:46:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F0349334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEDB660DAD
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p99PnDlJTkB1 for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:46:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 897C060E49
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347581;
 b=h+pLSf1Qt+6nWWR+KKA5Cf2on/58nhX6A1/ym9phTiZFEexhxlhQkZVsvIzw1dl1bCHz
 eR0I6chY/FYNXelteNFHnn70/n2CgbQNLKz7/Odknnp6FX6Iv5QvYNSBR9+IfPdwKfMgw
 QNUHAAS89w9gQsHLg3nDblI4ER3E9q38+KT5+yoZHZNtMJr5A6beHXc8BFbMrE7h6ucjq
 lk8y+vTafLW0fCENuNIE/unO6rWpJ/mvc+0TCdtw8k+SegqeIClR1TuznUvHoq5w1N0E0
 EwfbkL/e9cq3poiMM0NDxeZ/mIjc03t7wFEsQ4ZeAyJKh3IpBkSfonOBaBdBKHJLsLw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347581;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=rGGQLSUdzY1f/N3s/oWR0fPX9j8iJbOKkleTnCE3RGg=;
 b=iCCQ1F7gX85L5TBe4ZBMsJwc1qGIjjWA4K3iilt83+kntIoJAgC9We9tg8eGLsWN4l+l
 YTW/HURkIDZUzAzigsgTw8cNLZXEiOrAyUgfT6LolMn/XQVl/rOj9MhJh2mtYeLM231GP
 h5r0IB4uhhM7i7YFeYLaey7c8YIMUSydFQYVy4kvkRTgSz4PUYnptAgBvvo13ToRrj/Rh
 IOr9YSE0YX/WTiWgaC1Nugr3CgIHZuQxjrXPB9TR0Dk50KnM1Z1aoNf0lru1D8edrTN/M
 WxLNW6BJdgAJMD/tj23atceHUy3xzK81oQXya/kdRZ7f0+ewgUGnbmy8ZTkhQL+UbRg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="Mjino//3"; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 897C060E49
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:20 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e721b5503so10114315e9.0
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347578; x=1790952378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rGGQLSUdzY1f/N3s/oWR0fPX9j8iJbOKkleTnCE3RGg=;
 b=zo5n17Cs8qi4mPbTrsNhhvx4IL2/sjN1ycE4s4Ru2WeRFaeSxemEqi9xPfYrGq+mU4
 ZraYQfaOeci57cKknmMSf/PpjSdT/ILk2mspNPAb0ZrI9mKwcLxeI2kE8pe/+RDhfT/x
 Ah7dCjvh7uJBhFB6R0UOEABv/6qX5krh00zOy2j1329lcarbPae+ZN0gq+76LyEY2u7a
 KGFag4Q4pff2mvcRt1nZ5FaOGPOt6mAthZk+rj9lMbKrhod0TcGDSVCYPpmWT7GBQkhC
 vRzCUSI06Anltk3VhdXRUWHNZjLtxLl/d6ytmFaemWzNfQEDP8yIWMULbMrzpQ6Nv6nL
 epRw==
X-Gm-Message-State: AFuF++mtpMJeIEs7NYdCZhGZnwE2ctH7PHN4hH6Lu2qTfZJ4C8V8BzFN
 d0Q+qymhDAn9sRnz4h0zrvCtvS8z2nxtfOEwl37h3+6ix9ahwgQN4lCh/WFj1K2ijhNcJKkM0iV
 Ck/sNg9OHXA==
X-Gm-Gg: AYBFou0ghjnkVZKZGn5l2aBdxI66/uDMAArwH4kQFAbiMVG+03SqQhMvcS+zcqtS0VB
 NFdotRmoFlP3tYU51ECl5d6ZZv0JH6iC+j3eDSXhFUrz9494bp69aommnQnqxj9YsrhCoiyWGVk
 /UA5lLNSuUtRfwoSWiPB2a150n03WvCSXJZJBvnIOTN3Pda+iGYn2QfhYU8aesXSJmIxfxNfmbS
 jXiYWHok4VCSCjblyHoSxPl4xm+iWIrjjYGuSBVU1sy6o6xogd66aHpJVwZmxwmsCRvzmoLn4zH
 p1ezIEwkkfrLebXA0GJGjLjqf9dIHM6qvMBhMz3LjBQAfNqBsp835/RqehffBVnwJH7Us8+tAWK
 GSe2p1FhCj+mRmn2tIpTKq6+j/575sUneGxWKE1MDObmD5QUNmkpzZ4KLb/k1NB6RZ7tyw99ncP
 0UCdwMXFnEINQIS8mxpntmorH12rxOAbJbq0uHjy1RXgNpwbFFwqTQSLktH5teD+yFJHKNfA6DS
 A9cm1x7HAjMsLHjvErnE0OHFn0pyHG9VGc5YCxbbw==
X-Received: by 2002:a05:600c:6290:b0:49e:799a:8969 with SMTP id
 5b1f17b1804b1-49fe6707bb7mr115363335e9.30.1790347578382; 
 Fri, 25 Sep 2026 07:46:18 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ff04440e2sm61892805e9.0.2026.09.25.07.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:46:17 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:46:13 +0200
Message-ID: <20260925144615.4099065-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260916205245.2349520-1-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/2] package/ghostscript: link with
 libatomic if needed
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
> Fixes:
> https://autobuild.buildroot.net/results/eed/eed88a2a77cb8c4ff8c59bac5091221e6873004c/
> 
> The build error occurs since 2024 so a backport to LTS branches should
> be considered:
> https://autobuild.buildroot.net/results/1ab/1ab4767c1198838c3e3d126cdba790197d102053/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> v2: added first build error recorded by the autobuilders
> 
>  package/ghostscript/ghostscript.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
> index 250c851b28..08e2667981 100644
> --- a/package/ghostscript/ghostscript.mk
> +++ b/package/ghostscript/ghostscript.mk
> @@ -37,6 +37,11 @@ GHOSTSCRIPT_CONF_ENV = \
>  	CFLAGSAUX="$(HOST_CFLAGS) $(HOST_LDFLAGS)" \
>  	PKGCONFIG="$(PKG_CONFIG_HOST_BINARY)"
>  
> +# Uses __atomic_fetch_add_4
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +GHOSTSCRIPT_MAKE_ENV += XTRALIBS=-latomic
> +endif
> +
>  GHOSTSCRIPT_CONF_OPTS = \
>  	--disable-compile-inits \
>  	--enable-fontconfig \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
