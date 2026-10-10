Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D4DCA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EC3C409CE;
	Sat, 10 Oct 2026 09:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eSvmTsJJO1p1; Sat, 10 Oct 2026 09:24:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8FD86409AF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624258;
	b=JoQ2DTK6w/SLZOGwH75DcC53mFwzXI/7zQ925Lt8ZBclByJJ5cGW7/ovbjgZIjziaw1i
	 ybs8B0TFHNr2NS9BWVAFQoAAltUUBaoEL/xQCsfGWbHWrC4p2sfJuDkkQHO2eEtd8b+pS
	 p0GgyWuDzSgeZct9D8pIGNQyVL81S7pSZGbtyfgPPUzK9URzLKxuwNslaq1LqypNAdgsh
	 ZzKn+pf4KkvyPAB5C2Qf076aWNl1cqTu4unyHbvlQ+P2EPsbPVe+3rX5mc/cT83h9p7F/
	 jWF+IhEKDatLqQQBBNE3UmGc5KccKXVsEHGNyoKWUCjdSax6yRZUqjZIuL3PZ/1NwwA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624258;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XVinsDdX8Ef3AwQmhwzlyQZbnl4X8MiVdnZk1oMUNlU=;
	b=tZRg7eNMa66sk2y4niPEgNbp40rnhNfJiUZPxAPE7ZnYM6pjf1h5d+OEToVE3kTl8BJi
	 GZbFs9Q8byypQMqWg9Jw6e38FJpKVVMdbjICuwXwNbXMpfysB2hmoT+Zr4ZqH5M20ts8S
	 ri0mdear9aNiAT96mwM5qz2OQh/m3ON1R1KZCh3Cyab/7Wk2h5QL6xKehqnUY/OA3/vcQ
	 lWJfvPyh+9NoscwyJVokzsNNBCxAnXEmsOoIkGb8dnklNWaq5fGQOlSSWKN0cjCpr1AQL
	 MXA6KKyk5odNau82o04LLupLwLyGisaGVorPtqcHNZnmb3/JA2XNPIQrrRj+QNxy9pQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624258;
	bh=XVinsDdX8Ef3AwQmhwzlyQZbnl4X8MiVdnZk1oMUNlU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=j2lC3Y0DKPTMzLMQ8zNm374J+qRQD/7xmR5ylFWr+tgh/b2buqXrUBUOJ88HuXkU1
	 mtlEWx92TOVhPUBU+Ub/LJVlCV9QTZoEF83B43TMKzJl78kDmEMArGhCkN7IuRFRB1
	 cQqwAMAQqnGXbtIrbP1WAQG3TLgBwWkm5hBl/qv4lhPIjHf404F4tROZ21eP7Js4yH
	 o4FKke/Dn+kzdlIndtL0lTpJiZZXOW9ltW5ablXT7ff18kmXqfvVKcUzaVZc9EfQtK
	 KodyifZZDei+G79sm8lLYkLlOvIaygadaV60v6oU0faR/+V584r4e6u3HtdgeuY77x
	 SpnxV9xXcZOTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FD86409AF;
	Sat, 10 Oct 2026 09:24:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CD36A356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEBDF60A75
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZJIgOPUjbw9 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:24:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A84DF6090B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624256;
 b=EP3Y6ZIlx+gqw51L8zQUvAoGXzvJv7YKSuhanS3FXsnevwitgmstGfB4/mreJ51FQmvl
 UrK7C3BgBxtpSva6TOraG6dZzxY1RHSFAwAoyYS8au3NuD6+rZwXOJc1EfJPLdBz0T+6G
 byAtTBM7hAZZNyyLS+SMKiaNK0/qUk8SkA+iaE4/nImBpxN7wgv7I5/yyyNyo/pZBMial
 Hay5PBN+4Qad7dZgu+FoXYHZVRGByVTFaebKBPL0kyKhaazFqFpMHl+k19FJLXs+OLv2b
 JILbHaqKU0PqlL7KqG9JIq17tkgjX/pTGz6OIH1y7EvLka1Dnh7XKFPiGDikYugCdAg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624256;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=QvhE7gHwfvlg6hWOhN8VOOok67kHs6f8KGYuZ0YyMAs=;
 b=Ln8zo4tchwmpXQwVHfBcAchMSvhgH2+G1S4vN0AviioIHaleAclVJOvGKwE8yQTghs2X
 p8h566iVjICRkBbbRndrFyjg4TtGuDZYAgQ+MzT5L47LlCwxae45r25fOODdGooG8PCqt
 rlid2v1SOhc/Qtej2EhkbXAEHi3dW91Or2q/ekhF6E1fvq5ZrtJmZoew2l4J0n30cUt+a
 X43b3RjGl+q98Xtn11MD8DdnRCWOs620RSYtkA79wSCIt4ZTBE29KQWh2eh6q5QmMWZ3I
 LCw/dNut7bktJkuxjnlG4VrCARmJGrowF51jQjNCDXzLK/7FYOHY5CYmNFeoBVA/eiA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SPJ5Dwwi; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A84DF6090B
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:15 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-48afcfc4bf5so453498f8f.1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624253; x=1792229053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=QvhE7gHwfvlg6hWOhN8VOOok67kHs6f8KGYuZ0YyMAs=;
 b=EhFGZTWeTWeRAEicSvN8W3QyPGh7492Hab6TOli+M+FhNBw121Qxm71YpYjZ1NV0tM
 F14Mn8LRW0Z/egwJJigMWdspWhJ2k9hOfq8HZuyK7XdG65+u/v7AnIoPp1uitpHkBxzd
 l5Qil74UXjMUtZr55xay0fX0T6+HufLId9IaXKKoSBiNMRkQT0w3g6371GhE5TyYi9R/
 Sg2CW7PAGfNsY4RP5p7z3eTW7qnFdsHT0rTOIEWaf8etxwj0xhUe4goEX/h4sDwTWf0Q
 nSI/YMU7fir/CARX2JdLNf9dcv1WDP5+EhKjo/kZp/SXdnqAheczV3PyrwL/sX81clDo
 pDeA==
X-Forwarded-Encrypted: i=1;
 AKwUvBypR523L5jLUj21GCKe84dhRRap6if6wxVWlw9RVbP4SWvgsbHK+/aVpz4CXlGp9nIH8EOsyfcnghg=@buildroot.org
X-Gm-Message-State: AFq9FYJp2D007pUxTJ9HKGVRV/EUBuQjfD/q1SdGyhMTgxLy4ZuFwy+N
 FcIkGzVzx9jRh1Zs7vz8L6p6+MSxhokRC7/UQVkXQ6LvaFjRcj6O3HR+uGy/JOlOgjI=
X-Gm-Gg: AYBFou2NezHurFDvjEXRZz4zyeB75PmVqSwrUJSWF7kznCpbR+sc3ifFdcIDAy9oyj5
 JKHeUSZTIWZK9otMPx36hA7NGE0pGQKEZu8v+4hbwu3MmmTVT1/XJjy6knMDRDJOCEHz6a7naTO
 vBaEGVl7ZWEckgvkIlZCsZLFZEeFIPuMDkwVvI0g/xU51eXSEGSj7o1ofGwH/AdRCq8O33/V9tS
 ur/aJZHTEbFcdmoJx8eMoaW9nrSqtEV+Ef1/uUcwu3M+O804mhDgbGZy6yzSLe4H+mF0+zWq5Qs
 e5DoOhICocnKK259CtNQzTu+em9gRQIbUS/wMTsj6gJtSY2mRovcwAEnFdJ3Klv8y0Jrp5alJ/b
 7Fw1XMlpCZqCEvCqAElIu9SJxfYS6oh84Zu+29n3pTRlSPGAOuq8S9Kc8h6+QBTreNHtPyBfxaF
 2ohfs4v8IvQ1siLh5ZKQuVfjt9bjiPxi9xO6m2Pm44HAyRgxRFHcfMNm3hCq0EpkxLSFQL5DN+H
 fpkuA6ZyGgJaJVduQEW0EzdEjNkF8scwxu0GgY9auxwZOsbUOjVt2cb
X-Received: by 2002:a05:6000:2685:b0:48c:6724:b67d with SMTP id
 ffacd0b85a97d-48dbacddb35mr7498404f8f.38.1791624253226; 
 Sat, 10 Oct 2026 02:24:13 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9ad56a6sm7572192f8f.52.2026.10.10.02.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:24:12 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:24:12 +0200
Message-ID: <20261010092412.139969-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002214711.1164231-2-bernd@kuhls.net>
References: <20261002214711.1164231-2-bernd@kuhls.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/libpng: security bump to
 version 1.6.59
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
> https://github.com/pnggroup/libpng/blob/v1.6.59/ANNOUNCE
> 
> Fixes CVE-2026-46675.
> 
> Switched to sha256 tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/1960fa5d39cb8d9fb6c2a51e6af0c664e23b84ab
> 
>  package/libpng/libpng.hash | 5 ++---
>  package/libpng/libpng.mk   | 2 +-
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
> index c387ffbf02..8c3647b8f9 100644
> --- a/package/libpng/libpng.hash
> +++ b/package/libpng/libpng.hash
> @@ -1,5 +1,4 @@
> -# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.58/
> -sha1  6263409a6907d180e7b990827ca84ee944c6cc17  libpng-1.6.58.tar.xz
> +# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.59/
> +sha256  d80dd2a38a37f803cb9b6ac7b14bd6e74ddc3b654780a8380bdf93523fdb4389  libpng-1.6.59.tar.xz
>  # Locally computed:
> -sha256  28eb403f51f0f7405249132cecfe82ea5c0ef97f1b32c5a65828814ae0d34775  libpng-1.6.58.tar.xz
>  sha256  bdb0a645ea18c60507d0368379b1ac5474b92255fcc2d115e07486a7672ba526  LICENSE
> diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
> index 1915941b82..eeedd81f8a 100644
> --- a/package/libpng/libpng.mk
> +++ b/package/libpng/libpng.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBPNG_VERSION = 1.6.58
> +LIBPNG_VERSION = 1.6.59
>  LIBPNG_SERIES = 16
>  LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
>  LIBPNG_SITE = https://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
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
