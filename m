Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7935AC9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E25F60DAD;
	Fri, 25 Sep 2026 14:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MfYEa1DZcDCp; Fri, 25 Sep 2026 14:45:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 637F760DBF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347523;
	b=HNsYyhh2HZkivjuIyabNZ1PNKl4OrkhHI58OLFFJJ0yMhKrjB3011YOIeB7m56LvkGEG
	 9heFOfqYgB7t7JRVDnHI8hV3JBHDsBVutY0AuXfiLTaO+EZylMhOJC5vrnoEYQRIwmkwE
	 XXtG6LgHVJDh1mCP3IsLNq6uftYwX6IyxOCRbLZtJHHl6xPwzwNLwdERbiZYe2AZiQECh
	 TKLDVpEaeMqtKRpVVcqGRS/NQWbYwrCk4N4CVXlMv/O3IwjMoubRtUELCLA1pDjOPnSQb
	 0mIrgOzXzbOk2TNKD+vlRPyM71keGFR8ykrs9b9c3Wi/xWuryXaU8zDHWkYdQCk7CqQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347523;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=CnFawdfEn0LkGVvDfDDi1ypyNlTo9wkn6Rv0NRtkLBk=;
	b=I0Crbs08B5rR9u1yTD5xxExQ7liO+UfCND61Pa4dZS3KXg205dR4hyvSKkngil9qVS9i
	 FjEMvY9YMUVXhWXAqHJ5v0LDr1xEo8bF1aEycWh7qzZkK4p3/H+4ywLT6Ziu4X/Z4XBKC
	 WM++uHFtwsmhw4wilPvUYn8293+8T7L22uzSB5PRnG6i46zPTsJoBsv/p3Y8PnYUD4xBS
	 8IMs/cElOEPBr/Ne2lH5Izq1dwJu7TV6d0zFDaxf9MZP89iqgpCrbhBc95d8cdpyc9lSM
	 Q0XmKZDs1ZlNNKsp2ChcV9ucCjYTUqlYDdbQkpkpbt2Jmrq1rsU5WDZx0yegieUiuuw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347523;
	bh=CnFawdfEn0LkGVvDfDDi1ypyNlTo9wkn6Rv0NRtkLBk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QhDlMWrMEJy9N7ZszMgcqQ+pB55hY4KWdJmusIyPA3PZHnH9q4nbJh2LbdzNJEWcw
	 piviORXPKvPZ1wJq3c1CAwqeObtc4CXhb8QROVB99sTkvQ5Q582Z/P76FcUiQtWsVf
	 +sFXo7+gvLx0/EeNaUPipxfQCV+bWnVTNpZ5Dj2ZAlZVgq9OAvCG0k2gXFyVb3nXv3
	 E92pKDiDN/J8EYVzVZiMlqSebQrYFTnKWOzh04sHSFXd3yQs7hiMEPhNu01OEZ0VTX
	 z2aJQFw1bnBxUxyEV9xA7pa6bnG2eiFX3BwdOTBwteVeRxcJSxCL1IVFXombdZzIa1
	 i31ziUsPNcZnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 637F760DBF;
	Fri, 25 Sep 2026 14:45:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D5C3B334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC11381322
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kT8azuP-5dbF for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:45:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DA3CF8135C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347520;
 b=qsVAUPH8oX3n7WYT4V+vfJLf+SVdFXVWrgJTNv183fAIL1JOcj2MCj/Y1gtjjcFv8o5U
 7nykmSfNYLaFDPUkNKY2ls9Rmq23uYzI0HD/frDZSbjZlzEJ9TDDwvHx03p+7lcZdh8H1
 l5SFA0fLTNoBOchW5N9YvgI2y0y3yGEyhaEhlMTTyT6W90OE76UrWQKVbjNb6qz4PIWa7
 edAmPM+KFmmrdv7mdJqgLaqt/kNF3uE9cv/QNX/TNK4VtCiOtRxe5JS8UmSVp0C7u+WkD
 pdwqqla5rnx1ElFZVOou4qAtTIQCgok1laXLZcB7cDAgIr5WDQ908izr3yjTCcu6+IQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347520;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=LdK1XnrWQXGgpUT6x3GtwjBIIsXjOW4PQfUGTwPiyAM=;
 b=HS9ib/Qb5G8KoyCFvAnGO4bzOCiFeToEiDegLbOZg30fgFJC+oOWvRH7wYRjSxnE1/6S
 MP37/UpKSHBDf9NLaLdWMpAAuy7PLHTDM0lZK5cgIgKb1nGLIm+u7BWdjMTUy0dIeDjnQ
 R+iXkIko/GOpoM5IN/Q3RtQuyAdheIdDx5Wwro6wHc32aMKnNsd1ksKMNifatnyov7X3G
 juH19AW76aPp6ivEVSkN1mY/lcSbbjm9vBEJMJfm5Xf4JkeJ/6FFdq5Sk5bUlXMhyMXk9
 M13hWrAWpV8RlY8uKT8LgvKVH2bslM6AYHXMqWnvoRfkTJx+o9MdV64KHOhxha2irIQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=dcMuxv2X; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA3CF8135C
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:19 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-486e1a044c5so796154f8f.3
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347517; x=1790952317;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=LdK1XnrWQXGgpUT6x3GtwjBIIsXjOW4PQfUGTwPiyAM=;
 b=FBFpG/fJ4WhL2Cs0rVJOG0zrQAqQXCW6j8leTs5Zk+G68OcApGDmOzNzvayBp2jwM/
 GH/AiXrVv2UUrTTOV31nBumpkceBTuHKBb9s6hz0iQ+YdYtFIESrAENobiJx7gHVaGNK
 2Vvjb7LsR9tvI75TFt+bVWg54x5yaPM4iUBynOg20UG9ydO5BAHKGRBWmopAZT+8krgK
 TCLiYbAnRujae0zkT605Z0wHaAGEDvFnZ0ftXeJ450L//dD6VgmOBtJ1iLSvhw7bVaA4
 bknno2C9WIiGzMXdOheY3MS8hfVLTtwzKG0MjjLycCNj2ouRbqz1px+krh4aaExby+qI
 AiHA==
X-Gm-Message-State: AFuF++mpwoAfO/IzvKEWuqj5E3MgLKoHKeD8/dU1IXqFgEVQyFmT9Kz2
 5/YpgjbM9fLA2qZE3iI+A4AZiLi41vpAfw0RpMeR3UsmkhUCbXjrOro666QwbO9sgwjasJPSQNe
 XOqF0r0P2mg==
X-Gm-Gg: AYBFou2R4rAZDZrSTGQaH22Io+QzMvDFUVNAythVC2OnwqprejnkvHs5QYZAbTa1qR+
 zgjno5xRqbbKlzfxyKgnQzN4eqdOKqvzPh/5ESiZODheZzB9sQ2QQoSrnhmrLXbxklWJllYLh8u
 5HDotwV2Y4yTiePmViApd5Cn1YNRcZZTE6HLBVok3YpPeczmjyprQ2+sFSveUzM+0dh2Q6X49KC
 GcSH5ulHnjvPWdB/QmNWr69qkw/c+YuQJlvNyfaTjAydOIKbzhJa3zb/B6v5FLGGsTULfCZ0jsY
 8+xJOp1X2XzQRZ7s63WO16XL2F1YFmvsxZkqsx4ZzYJgAL9DHdsW70ijpx7jCuo1iDimKHDqSOw
 oTQDqtg0ul86P/hKnoeh+gmuKgWUJ2xu+OIsJh3scwlPpl82qjoVH9EgMeK4wHJCUhYOWLh3Ncf
 +lSKBaZz/V3abPwE8NBwFgUPvGTJSzWbk9unxG9jJteICzN6mA/0yt8CZsGNY8TlGSbFTdQAYfb
 STwX+3Ma56mFWRH+1P0/f9G/2gvsGBAurZ628qvGQ==
X-Received: by 2002:a5d:5e03:0:b0:487:370:c511 with SMTP id
 ffacd0b85a97d-488717147e2mr10697534f8f.8.1790347517340; 
 Fri, 25 Sep 2026 07:45:17 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a648895sm7447370f8f.28.2026.09.25.07.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:45:16 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:45:14 +0200
Message-ID: <20260925144516.4097493-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915111218.1918981-1-thomas.petazzoni@bootlin.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/gerbera: propagate icu's dependency
 on !BR2_BINFMT_FLAT
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
> gerbera selects BR2_PACKAGE_ICU, which depends on !BR2_BINFMT_FLAT,
> but this dependency was not propagated to gerbera. In practice this is
> not an issue because gerbera depends on BR2_USE_MMU, and only noMMU
> platforms can use BR2_BINFMT_FLAT. But for the sake of completeness,
> let's propagate this dependency.
> 
> Note: in the Config.in comment, we handle it like an architecture
> dependency, like is done in package/icu/Config.in.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/gerbera/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/gerbera/Config.in b/package/gerbera/Config.in
> index 3078d2017f..0219216276 100644
> --- a/package/gerbera/Config.in
> +++ b/package/gerbera/Config.in
> @@ -8,6 +8,7 @@ config BR2_PACKAGE_GERBERA
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_USE_WCHAR # fmt
> +	depends on !BR2_BINFMT_FLAT # icu
>  	select BR2_PACKAGE_CXXOPTS
>  	select BR2_PACKAGE_FMT
>  	select BR2_PACKAGE_ICU
> @@ -32,6 +33,7 @@ config BR2_PACKAGE_GERBERA
>  
>  comment "gerbera needs a toolchain w/ C++, dynamic library, threads, wchar, gcc >= 8, host gcc >= 7"
>  	depends on BR2_USE_MMU
> +	depends on !BR2_BINFMT_FLAT
>  	depends on BR2_TOOLCHAIN_HAS_ATOMIC
>  	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
>  		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
