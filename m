Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77E4EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9948C6141F;
	Fri, 13 Feb 2026 19:37:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8C44aGB4vIhl; Fri, 13 Feb 2026 19:37:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3F2361506
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011441;
	bh=nfsbEqnIlv4rY5MGonaiUXzMtPpuKsZxpNliNSX9b+o=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZMVxwbvLj90htxi2X5q6/+Q6/fGQQzQXypRs+DZdZc/wxIcrMNw6ELqbF/ODAgUQa
	 evzZOOCVfxoFm6WXieGdkXWr111jRh37f6Qiz/XF1I6kLk6t3Hi/bAeZWPKp7p6xXk
	 LRttvl9NsHkZx2oLymLxmgZQPmJxC7ipLn52bKPszmg280Z2D8LcS9EAsq7B0I0NmI
	 6q5I4afo9EZjlGZ2O4KIXH/NyDCwqvyrW08i6CxENWsmb2BnQj8mhfN1g/tHnKoVV3
	 p1MFz2fy3X/yxTJynmJ8IsUrWf0gK22nn/ewuD7va5n3TwxrYNBoqO/I4d1UmIV73J
	 hSH+iDhIH7lCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3F2361506;
	Fri, 13 Feb 2026 19:37:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F2AD69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B85CA41F1B
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UKXMbbJn2sko for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:36:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 888DF41F04
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 888DF41F04
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 888DF41F04
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:49 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48068127f00so12888485e9.3
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:36:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011407; x=1771616207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3HGcTV6Dd2eEmUqEOUfA9/lq1OIn9aYKz8TSE6o8jGo=;
 b=oGnOs3Ckb7fkAXTMU7bF7/MPc0e9UkRPaZZGZ72kFgGPsTn5tmTibhPrczA4bYMwHn
 RXT01cA2j0pf/aNbsNSeKVttftmM4oeX8D4BKU0Vnf8yAZ67dTnhmJlp9Bw2co0YWAx8
 7r/cmZ7ePOR03+EW0f3iZ00F6mu2gpiXNjPx4693lyhnYQkqhI2yh4yXoGwNhh+aj7sn
 0RWc0B9IM8M9BZlBFUB4qrO9uCYyBaCRq5PqJoW1Y9K1WT6QYr8ESRgQD40IKv61VA0s
 N4y6Pp2u2Ko5LxFlBektj3OkIsQtHP4o8SBXJMt6oqMkG0kem8TfXMgp21ehz1SAqnjn
 6qRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5L+nvE+3+t2YcIHFUm0hNmmPmDWPtohOpKBHmjFity65ebedlZudULQ+fhh6IYjtIsuklygYeG8Q=@buildroot.org
X-Gm-Message-State: AOJu0YwlqGzhEJxm6KAAHLjzxpnAxgtubaDMgKi5TMBKUN0lbJtpGVvx
 gS0BMz43iRRM3085e1vxDMx8f3AIYYOU8LxXn1jEuXT08XDxz1QVMNI3EBny3NBB27p9lTBYsaC
 89dLw
X-Gm-Gg: AZuq6aL0TikZUiUj1oWWO1aUkpjn9FXtfn+sB987b8tvYUi0IjMq3pMaN8+j0CMRfiX
 Zwbg0o9elnnXgfvnGZoH0nAmR+RO7sAxKVmMSQH26MaS19XeFEsQAsW2jeOdWHUCl5Ez7GyZhJn
 tsiQh6n5qOp4kcsKt9V3yQ+DhEjwtY0KnBX+FJT8BEspS7svs3IdI5dIpmHdIgaasYRTuwq3JIg
 guywgkg1PbszQg6BfKx25QR1VvEDD4yUykyBHlZM5KIgpcm0Vw+HfvxBiLmZJ4NOiSfGaLxWiZx
 ZRWPkBSOaeZvjxEYIcMo3Jw0TONTa1ahpqRs5eP+nYsl2FES4sAsVbBdy1vUNt+acTjU7i2jjPo
 lIEl/p3bZdQWcFV5NG93ii27TtmzAxm21YoTn1Lhu++u8Ab/HG6tq4J1DBPKhv0sAhkxF8WlxYk
 rjkebeWcnlId/+WUI=
X-Received: by 2002:a05:600c:8b61:b0:480:6b76:dfb4 with SMTP id
 5b1f17b1804b1-48373a083d7mr51040545e9.8.1771011407267; 
 Fri, 13 Feb 2026 11:36:47 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48370ac3564sm66093005e9.5.2026.02.13.11.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:36:46 -0800 (PST)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:36:46 +0100
Message-ID: <20260213193646.38125-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251226181215.6817-1-dario.binacchi@amarulasolutions.com>
References: <20251226181215.6817-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011407; x=1771616207; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3HGcTV6Dd2eEmUqEOUfA9/lq1OIn9aYKz8TSE6o8jGo=;
 b=hQIFa2aQ/9fKLDtAtOVAwFLDwl9v29uSdwJe9C5Bd+gBJJcyizVYfxRnj0fGGT6vR4
 akvOg1yC+IijOxDQXxCBhsbYd2P5vl6UWi9eQovuuSTzA+nfs069SD8RVez3p61WynUk
 BFdTriO+wrsGTzdihcdzx27zkLmZ6AW099kR8QNd1f+fGodYoBTCJ/ip4ypEySHY3Q2K
 lRxAa/FR+TmsKvZrPrcNPcKjzJNTog2oWGLE1ysVIqGSn96BUyUis3r9ICiZ0i8osqq5
 nyY9Hlm3koi4FNcel2kcYzegm2IRs9wHuksGOU3xsX1PQbnQtXjbSj+FgbfP8I0SDLxY
 3NQw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hQIFa2aQ
Subject: Re: [Buildroot] [PATCH 1/1] package/libbsd: fix build with uclibc
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
> Building the package with uClibc raises the following error:
> 
>   Configure: error: unknown ABI selection for time_macros
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2025.11.x. Thanks

> ---
>  .../libbsd/0001-build-add-uClibc-case.patch   | 31 +++++++++++++++++++
>  package/libbsd/libbsd.mk                      |  1 +
>  2 files changed, 32 insertions(+)
>  create mode 100644 package/libbsd/0001-build-add-uClibc-case.patch
> 
> diff --git a/package/libbsd/0001-build-add-uClibc-case.patch b/package/libbsd/0001-build-add-uClibc-case.patch
> new file mode 100644
> index 000000000000..e826c8e5662f
> --- /dev/null
> +++ b/package/libbsd/0001-build-add-uClibc-case.patch
> @@ -0,0 +1,31 @@
> +From da488ba5efe20b115e030c9212403358ff313d0a Mon Sep 17 00:00:00 2001
> +From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +Date: Fri, 19 Dec 2025 12:08:39 +0100
> +Subject: [PATCH] build: add uClibc case
> +
> +Building the package in Buildroot with uClibc raises the following error:
> +
> +Configure: error: unknown ABI selection for time_macros
> +
> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +Upstream: https://gitlab.freedesktop.org/libbsd/libbsd/-/merge_requests/32
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 2a15d720f9db..55cbb2d7837a 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -148,7 +148,7 @@ AS_CASE([$host_os],
> +     abi_vis=yes
> +     abi_wcsl=yes
> +   ],
> +-  [*-musl*], [
> ++  [*-musl* | *-uclibc*], [
> +     api_time_macros=no
> + 
> +     abi_accmode=yes
> +-- 
> +2.43.0
> +
> diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
> index 557b49fca6ff..4cc207618820 100644
> --- a/package/libbsd/libbsd.mk
> +++ b/package/libbsd/libbsd.mk
> @@ -11,6 +11,7 @@ LIBBSD_LICENSE = BSD-2-Clause, BSD-3-Clause, BSD-5-Clause, \
>  		MIT, ISC, Beerware
>  LIBBSD_LICENSE_FILES = COPYING
>  LIBBSD_CPE_ID_VENDOR = freedesktop
> +LIBBSD_AUTORECONF = YES
>  LIBBSD_INSTALL_STAGING = YES
>  LIBBSD_DEPENDENCIES = libmd
>  
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
