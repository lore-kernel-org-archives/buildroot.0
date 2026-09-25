Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C2AC9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 643EE60E8C;
	Fri, 25 Sep 2026 14:47:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uyvaWGLzFf5t; Fri, 25 Sep 2026 14:47:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6F68F60E82
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347646;
	b=H7js5au56a4lVZ3S7vjmk8ufSLMWvB5Hv0oNV8cp6tbvVHwVzINJCl9P3YQg2xK4AT1r
	 Uczajpm/9abL+fX3wm+Mn9wd6kj56QbMcY/OSZtiyB1vYKaxDikHf+QxqmxeAp9+zqgVx
	 Y7Qsg/BIBjK8uiMFN5YefOVRQ0iWMcQ+R5vgXda346N5wJvcf9UnnKaWRQeTXWOHAP2NR
	 RYumMf9mLz4+jya9ypTaxD3lV75D9e7LKb3AEQkWoWxxFPRnuF9+xxtNudchd03msxBc8
	 OrBh1IyO2IOE29z2jPyxGVdpLA/dgLBb6Zfg3Efu1/amhdPEz/pks1I1vuRV8ed8l+A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347646;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=RKvaUrSKc0mdW1el3u2aRcTNHNtUzL+5K2XgBAKiGYY=;
	b=eVgFgELFK0uABAHraOZiToCB6ju3UK7jz2UXo/cd515NYx3+HnW8/SOIkyn2xcBdPkio
	 AobfLnFAJbubl8WQewNIlhQt6EWJ4d82iqIg7UNELayGTP/9uu6txDejrcIfshkGzgx6v
	 KV7nWzKKTys0FBdwMQKnqeK1VM9QGG/UDClJOZLXuSrHAPwC4NWYqNtkiSxLYyAylBx3f
	 dTRvCXuQLT5/M9AO7++Pzegl3c9wMzwnrYAytagnvEy/MFS5AG2vUXd8rlFAi/0N2W3vH
	 7DKNDxIUvtu85DWBV01l3ppklFT10pqhjVgBBiXnehZFPyRlW4rt+Xp3d955tk62AAg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347646;
	bh=RKvaUrSKc0mdW1el3u2aRcTNHNtUzL+5K2XgBAKiGYY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LLcx5Ugs5rppDXfxpZTYAz7ZAQcHIjQkOMe/M7rLQ2uSJJAJGyTxXG/PRg5IOY4lg
	 tukIaRKP1zzf4mEaWAbmmxKyZz+vaa5p04I8ZcRalCo7Dd41oPVlttwL5PqeRK+wte
	 W5fo0TvwS+j3QrqRBMMolz+/aJTlo5QSONtlks0eziI8g4WBrLbzsdJraAJ+ZeW6Ip
	 qXovrgLWeAW9LgJtrgsAi+FVshUXNnsjtWGhYQRFPEIbCOGfpZeDOV6EzN9ihH3qYg
	 McfEvpdLvWXobKv+dPuOTSbbewg+cRappIcmwraaUvme3mp+2DPrJ6qkIqmoyn+2Y3
	 2l33b0m4YJ2Dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F68F60E82;
	Fri, 25 Sep 2026 14:47:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ED44B334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3F5C40181
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BXk23TnOceKG for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:47:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org B0DBE4016B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347643;
 b=F9otwidTOMiqC4bFK8rdeYHKIPlFyiAPePSJ9YDR1KFmZg/GFVc09L8fi45ZuR/+oG/W
 sz1Z7Rz+4J2eNYTr7s9A646mHEwkQgA7GLWzOxkjaW/Ltm6pCoJLK0jwOW8QzC3WRYYjp
 nB+2FYsFN1MBpPz9F29MkiRYglZqFC2613hY2CGTHAt1oEcvXH0d4zSa85ro8R8BLy5I5
 mhbwvSUr5Pi/Umgtvy+gnb2lf+UgdqX1s6HXxfzUZIaMl+tuh4zX62nLsVqr4AUaLxHNW
 XtXgGLsoiC9FbzlsAzEKs9u6p3dbzyz/NhScVjNm7IpNU15YgK92EnL3xwXmO7tSCdA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347643;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=1w9JOVq8pvvmYp7lPWS6U0PtG9Bjrf++iis2HELfUL8=;
 b=DExg2Gd3wNgE5wV8FzLNtGGgPcDO0vB4k/ecY+asr1MBgQFP/zH9HIxyFSX0QFoVNS2C
 tThuqMa2ICniLCeJStoJdlv5YJkoxoSUyQmJA4erdPw6+BLsLEVoEI3reiH+nzdBsutDg
 8Jk8N3ozKLQj0sSRkhjAwfRYnkdflpbWwFnRpmPYcCKD0PZ53WYCB61RQdhUfS9VgBTy/
 UHGmlhIqoxsisHXlCCtQgrkebVpWHLDWRrNPqdUxV29VC4xbgRwhy5XnrKqKmgXdA77JN
 4k6OmPsSDA6uAWziXo5v78VJZiJ6k/2zWEdz445n6vmpqafdbS3RVZ/Chpi6TmHrqEw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=edUiGPgP; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0DBE4016B
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:22 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e79a408deso5804225e9.2
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347641; x=1790952441;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=1w9JOVq8pvvmYp7lPWS6U0PtG9Bjrf++iis2HELfUL8=;
 b=An6S/PZvsPP/ljz/wQeekC/94Y7C7+Kt56Y2289VXAh42TzSR5Zvzq9yMwwgQuheRY
 alynj+xYV6hrvywDZP1Vn68IrBCkK6pwVcsBCZmeCR5JIOBqOJJW2A2cpIeNQhg9kSLH
 JNywd5MuYUgCQ75JmyJozCKudg7nxXLM8nlVbJv3YcT3kwu2+8GdfjRK5oW43HBZYVDk
 fo2D2PKPa7aqSEmtlBFR6r000tGNwY+/Bm8JjWp/5t04Z2tUCbhiowGPxhCzCpbnghx+
 yODY+REWeeIH8fRQv6YhUewqkxjZ8+L0OXwCgt6CBhXSjySU+OZtA2fX/1U0H00jySkM
 L6/Q==
X-Gm-Message-State: AFuF++lP6Tocpd2YNiRCnOx8N3hY08pHrz43UqQ/fds/++OH8L8qoO5t
 OttPxNYed2HaG77kRCGajE0uqQoWoSBhIR4igR2rjeNnLFfUxObcsR8kyPZ/jSy/ikprq6SMO6d
 TmjjQQxk2Jg==
X-Gm-Gg: AYBFou2EssptlYsWM/fOLF3Vg72qqGqWO9gcTc2JuLMMkqACj7ok1+uuzgavYnqGoZy
 JWWERmvPF3LRRWTw81gZQbl2/uuY7v4vHfyqRB2FJ7tRTtPWDHoDJ9rnnlCDdrUwJaRU24ET3uY
 a9JEgksFUHMQ9NDigDkqUmHbWxDajMaVDIjMBNDeKM3FGSlguzP3m0+notldbkagx3Rkpm2vZls
 Cw7fdsK7jlncHe3vypBZ54KlAVcSSBsSq4YbM9+4Rm9nUmsy83k9h9QSkoNR0uGm5IThpvduGVz
 x4C0eIGwoVIyMPdoTlWkvU9lcEHOlCYuZq+8FYZFVZ1Dui37m06AimBiScRWnxOBEnfqQTreiKG
 CfLk3GE/sEGdyWh20g2w8TuZKIvZM6vuJY3bZDfWtw+uXej2THcw7QleqtdiZ9AMzM+7lb8u9Vy
 dOOsCAgj08mnHIqbXS4BOY8SWRkhzJHIfE/BN7kr07S+yfb4oz6smPRvjdole3XLiJrPdDgDY0L
 GmYgZxnqjDE0RGknOW7XBOqRxyIkrCNuVng6f2Vm7Zn4F/vzBNI
X-Received: by 2002:a05:600c:4e93:b0:49d:243a:e4f9 with SMTP id
 5b1f17b1804b1-49fe66d0727mr113274495e9.10.1790347640802; 
 Fri, 25 Sep 2026 07:47:20 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ff069d071sm79547145e9.5.2026.09.25.07.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:47:20 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:47:18 +0200
Message-ID: <20260925144720.4101006-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260919155845.5776-12-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 11/77] package/boost: remove dependencies
 on Boost.DateTime
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
> Boost.DateTime is header-only since 1.77.0
> The Boost Release Notes[0] didn't mention it but it was introduced in
> the documentation of DateTime in this commit: [1]
> 
> This was bumped in buildroot in d39d8f7cee9b4634e6f490020204f63fae419e8e
> 
> So analog to the "header-only" move of Boost.System we have now to
> gradually phase out the dependencies on this library. Ideally before
> the stub is removed as it now happened for Boost.System in 1.89.0.
> 
> [0] https://www.boost.org/releases/1.77.0/
> [1] https://github.com/boostorg/date_time/commit/33dc6136f193a100c753c819694d6d11e9ab4123
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/boost/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/boost/Config.in b/package/boost/Config.in
> index a9ab4836b5..7b78345798 100644
> --- a/package/boost/Config.in
> +++ b/package/boost/Config.in
> @@ -95,6 +95,9 @@ config BR2_PACKAGE_BOOST_DATE_TIME
>  	  A set of date-time libraries based on generic programming
>  	  concepts.
>  
> +	  This library is header only since boost 1.77.0. Building a
> +	  stub library is still supported for backward compatibility.
> +
>  config BR2_PACKAGE_BOOST_EXCEPTION
>  	bool "boost-exception"
>  	help
> @@ -200,7 +203,6 @@ config BR2_PACKAGE_BOOST_LOG
>  	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
>  	select BR2_PACKAGE_BOOST_ATOMIC
> -	select BR2_PACKAGE_BOOST_DATE_TIME
>  	select BR2_PACKAGE_BOOST_FILESYSTEM
>  	select BR2_PACKAGE_BOOST_REGEX
>  	select BR2_PACKAGE_BOOST_THREAD
> @@ -359,7 +361,6 @@ config BR2_PACKAGE_BOOST_WAVE
>  	depends on !BR2_m68k_cf
>  	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
> -	select BR2_PACKAGE_BOOST_DATE_TIME
>  	select BR2_PACKAGE_BOOST_FILESYSTEM
>  	select BR2_PACKAGE_BOOST_THREAD
>  	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
