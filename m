Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8496CCF9F0
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B23ED8108E;
	Thu, 30 Oct 2025 08:23:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nlWknLaVj3U7; Thu, 30 Oct 2025 08:23:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6C05810B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6C05810B6;
	Thu, 30 Oct 2025 08:23:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A0C4160
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B9AA40FFE
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lAmJSWndc7ey for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:23:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 47F274101E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47F274101E
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47F274101E
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:47 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47719ad0c7dso7007935e9.0
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 01:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761812625; x=1762417425;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v1ZuY2bIrjE+zY+sdbrPrhEoL+gGP6e5ervM0xVsPHI=;
 b=t81dQNSmQIovayStQorQvv/FCArV/UQ8wI1L9z4Y/FwDAitK/Jp3fPusKdaM9N/wRd
 bBwo7tNDLekrAeQiQFTRBjCjQAe0hH0xuBYzoy2ju8q4X6jUrBoYiW7CaVRL+Id6S6nt
 7d4SjkxI+IIknTnq2DL4EBlGewCarbv8Lx6iIqqPN3OUv/ipLp8gvUPaIH9SpUNbOkOW
 +mIIIs595lTd9bzwME9DTmbk5bcfe15+Ttx7Yg5p1PBFhdYSV4docn9QIU7X9aPaAuUR
 AvQPk9+6SDYWogNrRzdfSJmQ9rGb1VxDvTutRPzl4aZb/EUGd2f6FAxUTeTxy2tYhJCs
 zXSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoVq30gb1Ao9Ur+iijCLswFyry1KqhyZg6TruLNbqF4GPNswmdyVYm5dVnDAdhG3Ia7mGqKyiOy2A=@buildroot.org
X-Gm-Message-State: AOJu0YwrOTiWxBDwCOmVKzvzYWVulRmf9vd8KE2ea4Q7TZOuWMJCitEU
 ejtJhNNwJtF0OKQn/JD/+l5cjXoZTBPu9qWBkGwzA3j9YUGJ/8yt08ZFt1tyVEX0fTNrLmHj2PM
 r2UJy
X-Gm-Gg: ASbGncubENX1gHCu8XeoYppkUGBXHyB5No5H9OSJzsuzPS9ZSc2OfBWPEcB9wamBZif
 5U26iVTTezX3CZJ6MjWEerIvb1J09+/p+ys1dkqHmBbvrSLe1y4RBG2HjbmwDbOUzZTuEcKah0E
 bNHHY5q0uIWd8VXEFkQ/K6od9eMUs5BiwiEflMaPQ9xS9ncLEWE2IHHQZv8BpqB/STwvU4Jv70j
 rCWx1KpiMrJ1Xbj85Ute6NC67AEXoItp2GkSotOZ6EKtswW7M8M82O/1VTEj8WUDyfo5irEbctH
 6ceLSuzBDgjSlWBQFROSCTppvI8UUPgVEwa28kjzZwGvMfnpBWQdYC66MnZ59C0SzJPUz28KdNm
 4+umFpN3SN96NjBJ0O1lqB7nSzCrQwPkCCmsXLeTX/gKKyQaliWYNSYeWOmaJuZPX/MoUoDqgr+
 qtK0DjjvBMVlsOgwiFBRRSHN9IMA==
X-Google-Smtp-Source: AGHT+IEQTanTfolBmybAeC9Z9Ezi6CxUCy+vfbKib+5OXdsXV6ykfabP8eUKv6rEA7GWQiHrdcUj0A==
X-Received: by 2002:a05:600c:871a:b0:475:dd89:abc with SMTP id
 5b1f17b1804b1-477267284bemr18597835e9.11.1761812625062; 
 Thu, 30 Oct 2025 01:23:45 -0700 (PDT)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429b6bc5907sm2586179f8f.13.2025.10.30.01.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 01:23:44 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 30 Oct 2025 09:23:44 +0100
Message-ID: <20251030082344.34868-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021194349.56130-1-bernd@kuhls.net>
References: <20251021194349.56130-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761812625; x=1762417425; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v1ZuY2bIrjE+zY+sdbrPrhEoL+gGP6e5ervM0xVsPHI=;
 b=Gn7/qMFtImeulLGZDQ7Nyg9RUL52hGQJDpNP7DFAM/xiKdjC0sMxqDcWRFCVI14LNS
 7pzmLHFKF4s20W7cxy47YUgXntcY34r0ny8JcsuV1r4SXHjee4wKO89EFodHiufnKgdi
 MD7z5ryGuvrLJK/4f+dmz29aIR342mZDTi99WsEQqCOo8lc+PVa86GCm2szXh3g9cSiD
 yYg4CMH2RFKEG6UTii+FhDndVoNE6tsyUYFeEkzVtLEll7LQHE/eKccjN6k5bbDEy5fj
 6yfDRhp7oBQ2fbn4ALm04LJALE9CPwsLeZw9NQ1PaZKTrBwXssFgSw3QH9mFO3S4Eo8h
 KefA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Gn7/qMFt
Subject: Re: [Buildroot] [PATCH 1/1] package/libshout: fix build with gcc >=
 14.x
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
> Fixes:
> https://autobuild.buildroot.net/results/c53/c53b7b613269acddd3467865c11784f59062a943/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.08.x. Thanks

> ---
>  ...001-icy-include-stdlib.h-and-stdio.h.patch | 31 +++++++++++++++++++
>  .../0002-legacy-include-stdlib.h.patch        | 30 ++++++++++++++++++
>  2 files changed, 61 insertions(+)
>  create mode 100644 package/libshout/0001-icy-include-stdlib.h-and-stdio.h.patch
>  create mode 100644 package/libshout/0002-legacy-include-stdlib.h.patch
> 
> diff --git a/package/libshout/0001-icy-include-stdlib.h-and-stdio.h.patch b/package/libshout/0001-icy-include-stdlib.h-and-stdio.h.patch
> new file mode 100644
> index 0000000000..cf3f02bae9
> --- /dev/null
> +++ b/package/libshout/0001-icy-include-stdlib.h-and-stdio.h.patch
> @@ -0,0 +1,31 @@
> +From 3ea67b511bdf4f12b3d5de4d7e133badf8c18d54 Mon Sep 17 00:00:00 2001
> +From: Alexandre Janniaux <ajanni@videolabs.io>
> +Date: Wed, 14 Sep 2022 16:29:22 +0200
> +Subject: [PATCH] icy: include stdlib.h and stdio.h
> +
> +malloc, free, and snprintf had no valid previous declaration, making the
> +build fail with clang.
> +
> +Upstream: https://gitlab.xiph.org/xiph/icecast-libshout/-/merge_requests/4
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + src/icy.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/icy.c b/src/icy.c
> +index 8e83552..4de3c14 100644
> +--- a/src/icy.c
> ++++ b/src/icy.c
> +@@ -24,6 +24,8 @@
> + #endif
> + 
> + #include <stdbool.h>
> ++#include <stdlib.h> /* for free() and malloc() */
> ++#include <stdio.h> /* for snprintf() */
> + #include <string.h>
> + 
> + #include <shout/shout.h>
> +-- 
> +2.47.3
> +
> diff --git a/package/libshout/0002-legacy-include-stdlib.h.patch b/package/libshout/0002-legacy-include-stdlib.h.patch
> new file mode 100644
> index 0000000000..863d8095c8
> --- /dev/null
> +++ b/package/libshout/0002-legacy-include-stdlib.h.patch
> @@ -0,0 +1,30 @@
> +From 1742df325b52eef5af32c40893d821f895dc9d88 Mon Sep 17 00:00:00 2001
> +From: Alexandre Janniaux <ajanni@videolabs.io>
> +Date: Wed, 14 Sep 2022 16:30:03 +0200
> +Subject: [PATCH] legacy: include stdlib.h
> +
> +free() had no previous declaration, making the build fail with clang.
> +
> +Upstream: https://gitlab.xiph.org/xiph/icecast-libshout/-/merge_requests/4
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + src/legacy.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/legacy.c b/src/legacy.c
> +index 3e1d3d7..e0ed961 100644
> +--- a/src/legacy.c
> ++++ b/src/legacy.c
> +@@ -28,6 +28,8 @@
> + #include "shout_private.h"
> + #include "util.h"
> + 
> ++#include <stdlib.h> /* for free() */
> ++
> + int shout_set_format(shout_t *self, unsigned int format)
> + {
> +     if (!self)
> +-- 
> +2.47.3
> +
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
