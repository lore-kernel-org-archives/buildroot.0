Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9E9F436B9
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6B9360A3B;
	Fri, 17 Apr 2026 15:25:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dRS_Ad0O2Sel; Fri, 17 Apr 2026 15:25:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA9D960E3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439535;
	bh=XhcMNXW9QtCCveCJjhw6iW5BFz6NFdR4OaXyvsomLRA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dRbWSpEH6AWzsTnrXgmvGI+iO8tTn4RGRVAF3s0389HnZvi7OW8+ij9EaGyqiXl2q
	 EtNKGzd6AvlXdG95gm+2P2HUXujJqE9uW5qqcgEpNiYviXAPPBS5NI0Cff2pZM9yK3
	 /aYbAin+Xy9Tz9ndTzmMf1efkldktXW40Tgoxtjah31sem5O174MNKJ6YqYSO/r/I4
	 tkXscsWkpmhLYHaCek7SlcCFZw0ISsKUblZ+xrqblAgXphQ3/KpeSElZjvNJ2QL2DH
	 zd5Wr7vynev1v4cre4BwnAHgfailUifkjPZq3MmARam3/YUxzfZVt7q6nHVkvo5jQT
	 kp1Bd0/c/21vQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA9D960E3D;
	Fri, 17 Apr 2026 15:25:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CE880259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B452B60E3D
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uREYyi356isp for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:25:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9971A60E9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9971A60E9F
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9971A60E9F
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:30 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-488a9033b2cso9566435e9.2
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776439529; x=1777044329;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=miO13KQg953GkPdLURPQdkMf1AKKRjhx25C73lifvow=;
 b=abk14zeH8Xyql2Q8c9QWCC28xXaqEvT/JNl/8CVMrIE0fFWgI83ouwpo43equyXxuQ
 5OchyLxftC6r28/d2dlpL/HkWT5xOO1pYkn2+Kw8sxf6KrRj2T0vZ7++hT2PRUhiTAyU
 nnyil0nYa90YFzhGYfSgZdlAlfwnotCVwagVOzTIFwnTvaq8FTieNCwm+crgODukbSZB
 1rIPFq1bsioNIA0eDix4mhnlMhjedMmDHHhfc3M4mawOlyoNPYKK2rfPZtfgwx0pnmlO
 6tfjWCfkXrSlCw1No5fpa7Zu1Buy08GtgSAE5DwbZ3CpQmuh3RafIo1LGoAqWlQq1R//
 7oZw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9yT81ZHU5aCyRjHwkiIpf3dxe9+bUjUtMQmZREKoT233zTw0vjgpC6CZncjs9eiERQyvxpycNH8Eo=@buildroot.org
X-Gm-Message-State: AOJu0YwBdVeaaveD4+DTpXLsIwrE7iUYfBC7iNGPcVjC7qMJJCD+7N2y
 TdTO2qhGH3NeuupueBOCB0A3N4/1wM82+SoGuyPvhqBQeF4BD6iGprJgJhoTsDDbS2E=
X-Gm-Gg: AeBDieuJIWRnB71Wini6T3NhBNzV0wMiBFUhitEb3NeXWQBzKrFWD85OOuw1Epm6jbl
 C6onIUP4EpbFSiwMWJnrZsJxFSci9gmbM/uBAYB04DTVwL+al8D1ek1KGOe09kKz7BgmDZ2dT3s
 dCzuQ/thnHzCwj0HqSZ1xWwsT8hgnbh8ciPyx42Fz7hpFfYk8D5eKxrKaWp7k1K6Zt4eidNFXzh
 BfPe8ohmAgEtPdIsD+NZndWTMt1attDqTG15WACZi3dcmO+/rlLzfMsOp6I+ocjHKVmqoLXE0cN
 U7wnRac8uwLq074hYmnxRYPOFAj7GH3TqCWHlqu+3JRFADxOcU74hg+z6UN8aZk8gugON8ccZfQ
 01nuFRvEbV9YoCwzqt+DZE9NXOXF2Jnz5ufQvqhpZ58whA7x34MYwEXmHUBuZaaRi4rD3vBb0W2
 9kZoIm71rKrGftAYbSxm2zgE8DaZKnG8bzrB/a0g==
X-Received: by 2002:a05:600c:a318:b0:488:a2ac:a340 with SMTP id
 5b1f17b1804b1-488fb7579demr37181835e9.12.1776439528606; 
 Fri, 17 Apr 2026 08:25:28 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e4eec9sm4941012f8f.34.2026.04.17.08.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 08:25:28 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:25:27 +0200
Message-ID: <20260417152527.314132-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402180332.2779951-1-bernd@kuhls.net>
References: <20260402180332.2779951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776439529; x=1777044329; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=miO13KQg953GkPdLURPQdkMf1AKKRjhx25C73lifvow=;
 b=Dj2cqB3l5SJSnfR/QATO5OJRzgv/fU0kR9wygy8mYYg7/7i3AnVNkCoW6/fOxWOegv
 40lWU8MkmKakNWY3QDGJCrpniBHfPuWl8k8GBD6XrDDuATcD259qgWUTjh0GF10Ngnbo
 WapmcN4DR7LI0ldzK/FDM7KHxQQ5GQDHgiIwcOhyZWHcwRBvXCD7GL/FcG0illOe5V4Q
 Ql25WahkrjWPdcq89mGWyJgp/myLklCvqwwy68INgPyeD07IO9e/WnWBrNGNdlfy7sOU
 UKMsXSfv0//cELjtdYCMATU9dedfLZ8tDvXLfwRTHZ6RnYVyECCjtNIA/Ybw6xpBiQB4
 eFUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Dj2cqB3l
Subject: Re: [Buildroot] [PATCH 1/1] package/libmicrohttpd: bump version to
 1.0.3
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
> https://lists.gnu.org/archive/html/info-gnu/2026-04/msg00000.html
> 
> Switched project URL to https.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/libmicrohttpd/Config.in          | 2 +-
>  package/libmicrohttpd/libmicrohttpd.hash | 2 +-
>  package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
> index 8477ef6668..4ce089bf6b 100644
> --- a/package/libmicrohttpd/Config.in
> +++ b/package/libmicrohttpd/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_LIBMICROHTTPD
>  	  GNU libmicrohttpd is a small C library that makes it easy to
>  	  run an HTTP server as part of another application.
>  
> -	  http://www.gnu.org/software/libmicrohttpd/
> +	  https://www.gnu.org/software/libmicrohttpd/
>  
>  if BR2_PACKAGE_LIBMICROHTTPD
>  
> diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
> index 59c87a738d..bd5d0b3e8b 100644
> --- a/package/libmicrohttpd/libmicrohttpd.hash
> +++ b/package/libmicrohttpd/libmicrohttpd.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  df324fcd0834175dab07483133902d9774a605bfa298025f69883288fd20a8c7  libmicrohttpd-1.0.2.tar.gz
> +sha256  7816b57aae199cf5c3645e8770e1be5f0a4dfafbcb24b3772173dc4ee634126a  libmicrohttpd-1.0.3.tar.gz
>  sha256  7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
> diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
> index 335234c14b..b74a7a1338 100644
> --- a/package/libmicrohttpd/libmicrohttpd.mk
> +++ b/package/libmicrohttpd/libmicrohttpd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBMICROHTTPD_VERSION = 1.0.2
> +LIBMICROHTTPD_VERSION = 1.0.3
>  LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
>  LIBMICROHTTPD_LICENSE_FILES = COPYING
>  LIBMICROHTTPD_CPE_ID_VENDOR = gnu
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
