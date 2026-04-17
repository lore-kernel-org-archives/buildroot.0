Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7446F436B8
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A06E81D34;
	Fri, 17 Apr 2026 15:25:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CEndK9kcxD-r; Fri, 17 Apr 2026 15:25:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1529781D35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439543;
	bh=zFUZPzwJ94izVqo4MgYp0C9Gsw9KJgbtRWmtnLgXfKE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=c2pb8/bxzxxVM4ickV8NimxHCAsZ+VriU2xkAMyDvwiA1lkNhuPqyd4h6LqmeOxOX
	 iv884PMabGzP8gdJ8vOjDaQG2BWyiE87elSjJnE1aaIPxGW+pD4kTCVm5K1sLZiivh
	 UN2wCFzx0kdXNcw4JO0p6KGN5p2fdtcHWwp1e9WcOjw0Mf7ky8K5nGGr6AdaPrBkpT
	 qUflnihqWu6J2fYgYMVFMkWbl2Y3+Gz4/Xq6Z5qXNk3N9rpOHamx/vL3Gt5poquNad
	 rkM2S/4lZYl7crTogHZLa2RhfEuf63DiLYKRkshd7uh6960+IX6ha9NqNdli6IGGb6
	 53tw7BKMe/N+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1529781D35;
	Fri, 17 Apr 2026 15:25:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D679B396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCBC840DCD
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WS7k7MhuNuti for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:25:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A712640DD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A712640DD8
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A712640DD8
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:35 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-488af9fdaa7so5932865e9.1
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776439534; x=1777044334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BMXiLLgWgyhDqY8wVXlf2xugRdTKqmnJwBj5DyEipyg=;
 b=J6ULhI2gwrQ3GYt9tslz4FQeuGEifdR5NiE/Pbxi/yxHbe2NRH3xQG08TquJEDKuRt
 h36+0Qx6wCq98fkzwPjGRIn4WasRG6upQSbi6f60yixfUiggdIZVg8DeCmfG5yS1POTS
 B3udkVPDKnDzvs0LlcJNRwlnKunt0GU5ovS/YH+KKTVVUsybK1k85cEq3Vfff/8bsMXn
 GLoweWjFzKcI3cfUiXT/zc9oD9Idp0cFVt/2Mhx79q6+2GIWMzRRtmA491ZGr/IuuqSv
 y6a2grK4hooDFUlt8lHQf2jpuIGskIXmXKSXUHSdeRB4flpYw8axjHryN6isprw8U7b8
 xvuA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8VCfp+6E+IEhqqUT5i+K3a7A9vqyF50E6yTw6I+lMyCUwyL6LmePIKao4lYUPvg+rME97X57uYD6s=@buildroot.org
X-Gm-Message-State: AOJu0YwvGQuYF9pL72qTq1g1MAYY7mFw0EFptVBaB2NjtccHI/JjyJR6
 5X7Utu7YenhYnTdMicWm0ii5OmdWgUJIiTteqOGsd/wfWbj+TOmJ00ZV8+pSvVXQkcI=
X-Gm-Gg: AeBDiescH3ly99SDwiJwwa14W3IePfaM5uNBKrtl+9AihaFGwuhOkJkq4QMuBZW1lE6
 5q818fHF53XZMcr6KLcplglgeX1kqodYFpQe7eyAKr8n4zSVvbSq6DoXJVsPuXNerk4f7g7nIX5
 3UsWwVfBKbd86EmtdGpBm/6vFnAlmkqmTyn1pU+tKDqX7XF4I+CARV8hnjZhucX1jfuH+lbM2A4
 NP1W99GrpS9GWAWvkJeBXmLw4q/sbh2LWaYTo95lJHTIGa/P4TvX8isvmb2+pcYwtLLTLjMcSPB
 azv//jRJN3wU0M4rZdLzSC8B1DYBtuOtfnxPjs7xis2rFg+QZquijwDS03B6YvIxBGLmkLZjmje
 3plzvUUjhdhgmo1tgzxUZdim11ATwss5wP28wmDet2uZHy+DOdyRs9gPLUXDCUyE7+/r3jcjU9Z
 r+S7sYHRodW+deKCJAupFbTMdNghM=
X-Received: by 2002:a05:600c:42cc:b0:488:ffb1:494c with SMTP id
 5b1f17b1804b1-488ffb14a0cmr1614705e9.12.1776439533669; 
 Fri, 17 Apr 2026 08:25:33 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb78becdsm30216575e9.5.2026.04.17.08.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 08:25:33 -0700 (PDT)
To: yegorslists@googlemail.com
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:25:32 +0200
Message-ID: <20260417152532.314435-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410090649.3029441-1-yegorslists@googlemail.com>
References: <20260410090649.3029441-1-yegorslists@googlemail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776439534; x=1777044334; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BMXiLLgWgyhDqY8wVXlf2xugRdTKqmnJwBj5DyEipyg=;
 b=HoHxLK80bXiq7P7wr0fxM/sqG30W0JFA6A+lDXO/xAJzYHEHUUAa8oj5lzPyxl0IqC
 Wj987754c8Iye9yJINkr2d44mfvh7gdsO5YNzRNBy/xvDSC1z6XpaIOIeq98oZvKZzkz
 b3YN59FiPUDNeEelPnpBnjBbP9SAYQb6Pbn7O5ltw7MECOJptsxtJ02BWZ9y4gFP/sMV
 quaCy5KFJHmoqTJQdEyQsHNEvcuRKAPEnAyzkvi6HmElknBbNzKvvsG0Cjwy5f67+OM7
 P1x65OhjbgEav9G/9zS75IzJrcrGKBQbsdKgnnv2BjlCztb7H2P8oTaIlA6nHqWIjRYv
 CltA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HoHxLK80
Subject: Re: [Buildroot] [PATCH] package/libftdi1: enable static only build
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
> libfdti1 provides configuration options SHAREDLIBS and STATICLIBS
> that allow any combination of static/shared libraries.
> 
> Fixes:
> https://autobuild.buildroot.org/results/d7b9a45ccffc1c9e3fd796c3e46ee396b7d88272/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/libftdi1/libftdi1.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
> index 31ffa1aca3..0595ccf963 100644
> --- a/package/libftdi1/libftdi1.mk
> +++ b/package/libftdi1/libftdi1.mk
> @@ -13,6 +13,14 @@ LIBFTDI1_LICENSE_FILES = LICENSE COPYING.LIB
>  LIBFTDI1_CONFIG_SCRIPTS = libftdi1-config
>  LIBFTDI1_CONF_OPTS = -DDOCUMENTATION=OFF -DEXAMPLES=OFF
>  
> +ifeq ($(BR2_STATIC_LIBS),y)
> +LIBFTDI1_CONF_OPTS += -DSTATICLIBS=ON -DSHAREDLIBS=OFF
> +else ifeq ($(BR2_SHARED_LIBS),y)
> +LIBFTDI1_CONF_OPTS += -DSTATICLIBS=OFF -DSHAREDLIBS=ON
> +else
> +LIBFTDI1_CONF_OPTS += -DSTATICLIBS=ON -DSHAREDLIBS=ON
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBFTDI1_LIBFTDIPP1),y)
>  LIBFTDI1_LICENSE += , GPL-2.0 with exception (libftdipp1)
>  LIBFTDI1_LICENSE_FILES += COPYING.GPL
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
