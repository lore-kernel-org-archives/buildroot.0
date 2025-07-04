Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B595C83F09
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2F3260BBB;
	Fri,  4 Jul 2025 06:46:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pjzlk_Pi-GVb; Fri,  4 Jul 2025 06:46:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BB5060B71
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BB5060B71;
	Fri,  4 Jul 2025 06:46:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B4627AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D6D340FA6
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3xD6kQK1J4vM for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:46:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2B13240F8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B13240F8C
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B13240F8C
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:46 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-453608ed113so6201985e9.0
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611604; x=1752216404;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=35j5pusnIv7anu/yfx350nUsJfiiX4Cjah6Gx6lBe+s=;
 b=qVgiuKGOZdibb8PIW6TLDRci15DeAqc1fCpYO56vpVqWvuPy4TBQAst+CWwzq9vr8e
 MBF4XqRTvk54SrVHo0L0n2uxLkEOY7nQRnPwgzj9BwjbkZEGZd/96Wecxw2k+PEqoyyg
 Q9IfU+AH6zFZTc2348Fzqa6HQU9UVGL6EZkqnmK/9O6AcdV0f81ONHxpUIqFmWzdYnE+
 TK8GVgzqUpwXOhwJj1jHIEc7aUUDICPP0fhJkaRk3OwVHpNi2/CuYm2YrlTpPUs0E7es
 DmShk/heU2hwSoDHxcSES1XbuNimw7R38TWXpyZD6EaQWVA9665R0AcFIHzC+AHgKVVZ
 dF5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0E38qTk5gxkKdqsx/wOyQbfJNJWoklgTpD4YetdmleU/YqSdfWbCQuGYuZNi/Vo9wUxHJpDKRD2M=@buildroot.org
X-Gm-Message-State: AOJu0Yz3fRlc35ruZUzAbwoO3QgqAhKDXwAtcEpmvmjBv7W5Tluw2aJu
 HsGhkppRXiu1p7QZD+TmaMSN81FW4bX8jEsgDwcNDXJhxr/UpLTPjAOQljtRjEARjmg=
X-Gm-Gg: ASbGncsS/QMRoDmuypmg4AQMN97Kel8J6pH8jeYwou06f7uf7qr9YXmDNminPKWbN4l
 40kRBiXLKcFOo+xa2ttNxVZ82ExnG1BaNup0tExioa0d1Ynfwg1rM0pFVl+b2JOaFsUyusfOgHy
 9+TeIIIQ/5z1XsqaQaRpvUuuL7nwqQYQmtw3L7gfkg5aaZ37PitOVgKmRUkipgznSu0XcqJMvH1
 z1GyW31XZdiZoA6FkBR8t6kzyUVguqpGp/nhe3BfI86QbInvinfbu2Z1UPhXp0vFlKQI7PXeIfX
 1FqHGboyhb5lSwK1Ijq7kupZIl4hU6SjumhcVu4cY+MY0TWB5jOFe+p8IDNZ4IXOev2ZjW0MPa7
 NAsJWQtejwg==
X-Google-Smtp-Source: AGHT+IGTSnP1AsC7GbJEgacpIGS6haYno2cuznTLiJdRc/fgJqMHHhhOrEmar4t+VZeLkUB6DAQBUA==
X-Received: by 2002:a05:600c:4e46:b0:44a:b478:1387 with SMTP id
 5b1f17b1804b1-454b30d9516mr14756965e9.17.1751611604245; 
 Thu, 03 Jul 2025 23:46:44 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47285c903sm1660073f8f.90.2025.07.03.23.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:46:43 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:46:43 +0200
Message-ID: <20250704064643.4064017-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250624170834.2819257-1-peter@korsgaard.com>
References: <20250624170834.2819257-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611604; x=1752216404; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=35j5pusnIv7anu/yfx350nUsJfiiX4Cjah6Gx6lBe+s=;
 b=LyiisyDked5WOIVldzyIXP7VquQbN0mvJdiMZbvZRR3LtijQPu94hHIPh4Ds9ZW/HY
 4hgDp1HXH4VbyBnNCY0eKdYs0j5lAgRoAHC4wSabCF+54tD2cbWy3kNklZcPnVKj0FhM
 y60PUm0ZN0Fo5dVbW0QugZrgghriQ85E/A3Qw6nhmlMMMqHiXrrKkgNe5GMgA6xK+feV
 6DT1G2kOIYs+tX8A7EKT8pJ6r5LnMWSH4dBUwbu0ZuYIywhr92CSbIx+Ve4tgizYTyml
 nWTgyh3xPe4Sxouq+XBYLEQlKersnNcyUTjmGjTFaiIq0qq6TeNc6iT09W3YKCMoHnw8
 AEYw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LyiisyDk
Subject: Re: [Buildroot] [PATCH 1/2] Makefile: sort unexport lines
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
> The list of environment variables to unexport has grown organically over the
> years and is no longer sorted. Sort it alphabetically for clarity.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x. Thanks

> ---
>  Makefile | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 26db176674..a052628ac7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -407,27 +407,27 @@ ifeq ($(BR2_HAVE_DOT_CONFIG),y)
>  # Hide troublesome environment variables from sub processes
>  #
>  ################################################################################
> -unexport CROSS_COMPILE
> +unexport AR
>  unexport ARCH
>  unexport CC
> -unexport LD
> -unexport AR
> -unexport CXX
> -unexport CPP
> -unexport RANLIB
>  unexport CFLAGS
> -unexport CXXFLAGS
> -unexport GREP_OPTIONS
> -unexport TAR_OPTIONS
>  unexport CONFIG_SITE
> -unexport QMAKESPEC
> -unexport TERMINFO
> +unexport CPP
> +unexport CROSS_COMPILE
> +unexport CXX
> +unexport CXXFLAGS
> +unexport DEVICE_TREE
> +unexport GCC_COLORS
> +unexport GREP_OPTIONS
> +unexport LD
>  unexport MACHINE
>  unexport O
> -unexport GCC_COLORS
> -unexport PLATFORM
>  unexport OS
> -unexport DEVICE_TREE
> +unexport PLATFORM
> +unexport QMAKESPEC
> +unexport RANLIB
> +unexport TAR_OPTIONS
> +unexport TERMINFO
>  
>  GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
>  
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
