Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC948C87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B321C80DA9;
	Thu,  7 Aug 2025 18:24:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JFK4KepfCeKL; Thu,  7 Aug 2025 18:24:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A8EE80CD3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A8EE80CD3;
	Thu,  7 Aug 2025 18:24:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5963510A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E575140087
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qfyQ8s4HmhzU for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DE97A40057
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE97A40057
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE97A40057
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:29 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-459ddb41539so4691265e9.2
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591068; x=1755195868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XouMLL4zqH5Dz5NjyM7NvVQD4qwEn0IUlA+AJ0vHchw=;
 b=KEJOvDHc/KryVs8WvFAtcCCKhLrdwGGuWvI+X8yNCf3gyVUjYaDzja8Wpa1h1MnbEp
 1rvXzkMcU7t3GJDk7nJWf37RFD0Thg8jidCn6p2b+Z5OAwcMHZHsnEThHjXwsZZJ6yLs
 HlE25kc09FZU72n9MTDveAMCHUHsyBqLsMEGnrcm5hkh3AFRpCjNKEeO8fqyCIIOHIC4
 rlbF+Jv2xZf+1VMO5doXwX9zLvTfviiFe2LfGbzAyObv2Bhe1hsdUKUYXBInTMwgUjno
 4GFdRssct7GaYqXgFkRqbPugJx6IHNVifE1KW0zwvWv2d6jgq8lK8Y55CNx3DKBbwcx5
 5nUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVC10z2cko9R4CUxGuueIf0BE0iFuYn8nXMuNgpCTS+33PVkN4YXuywYNwBPCSJBkuRfqhdszL1Fp8=@buildroot.org
X-Gm-Message-State: AOJu0YwMrFOCf3SWX8AxdzMriFCJDQfPCFeE8OjYmWrOBeoomPhZi/xZ
 KcbHM8DikI0xifPQB2tzAk3+O+HGM9wGVo7VeiVpVrkr5PBNmmP5ZWuZgrEz9bwFOZJ1qa6fzFb
 H/pvf
X-Gm-Gg: ASbGncv0Y5JQbDvhE0/RYpw4jGFq+kyqBaNTV85kXz4Uqw2ALRzECTVX7Ql8UudlMP8
 nTBRRiKeSMG+sTQepONFzz06MCCpcqjI+mreUoNe3ZV+TwDQb33Qn61xe5d3trIlPl4+22oOgsZ
 JeEiBBNDP96mMcBwPLSjZRt3JBSy/8Wmb+bdFEECIu6V4fibBKNHPoMglDe9f1sCEmCkwGAXbhn
 SsNRy905CvfVucH18fAbfJI6P+u+me12dO0jpVX7J3EBeJ8EYx3RQqLpWEhZo2T1IldMLPQKhzN
 lok+bjnhdF7ycW+YCN+F/UdcE1k3Z2ObOSHtzJZE+J38AAOVzpKBm0BfCOlBzJNWCc2P1Bnp1gD
 2vmYWKxAlVSvRmQ==
X-Google-Smtp-Source: AGHT+IHAivOXlUXZqdnUsTYQcq00GJlkKi+cAdGJJ/IrzwpnDAYoWpk9p+8AezFub8fvfpgRjWXo1A==
X-Received: by 2002:a05:600c:1d22:b0:43c:f8fc:f697 with SMTP id
 5b1f17b1804b1-459f4ebc19bmr197875e9.9.1754591067944; 
 Thu, 07 Aug 2025 11:24:27 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e075047fsm78372775e9.1.2025.08.07.11.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:27 -0700 (PDT)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:27 +0200
Message-ID: <20250807182427.725456-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <aIPkLxHygRDs7WVw@waldemar-brodkorb.de>
References: <aIPkLxHygRDs7WVw@waldemar-brodkorb.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591068; x=1755195868; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XouMLL4zqH5Dz5NjyM7NvVQD4qwEn0IUlA+AJ0vHchw=;
 b=et2c3cuXKFGgamZMG7vQSHeXiakolth4kx5WOR+wbClBukQwkiWTjsTrrOlX1HkZJc
 V1plvLO9FjVjIkekbRQP0VMkXbRmKyRCfdyi3bTxGRpr20d6uRxMXXLTtlbHzIsl7DAn
 AOB+ybTmJCpw1tyGPpr1kFVgPW5G3EVvv2DuHM3TZRUJ0Geh3Je8C/1MH8joxfaaoCFh
 bZGT7GxXNfS610CCy3WGwC+q0+RRGuAEChhnRSBK3MZK7JjN36S1lPTDLkfAoe0OCfi2
 Rv02QlZtE9SmAhrz/yBHyOCnNV4Hhxa/XI2w4q+/V/0t58Vn6lEYOf24+rzwYuGkWYFe
 q3dg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=et2c3cuX
Subject: Re: [Buildroot] [PATCH] package/uclibc: update to 1.0.54
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
> See here for release notes:
> https://mailman.openadk.org/mailman3/hyperkitty/list/devel@uclibc-ng.org/thread/FCUVZRWXEWHOREQPCR5OZGGS3R5WVK2Z/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/uclibc/uclibc.hash | 4 ++--
>  package/uclibc/uclibc.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
> index 35a4b4b962..8d8b333958 100644
> --- a/package/uclibc/uclibc.hash
> +++ b/package/uclibc/uclibc.hash
> @@ -1,4 +1,4 @@
> -# From https://downloads.uclibc-ng.org/releases/1.0.52/uClibc-ng-1.0.52.tar.xz.sha256
> -sha256  881da473784f95cc8290bb0780c0afc810ca28d575e33d5afd5e7153b29aa136  uClibc-ng-1.0.52.tar.xz
> +# From https://downloads.uclibc-ng.org/releases/1.0.54/uClibc-ng-1.0.54.tar.xz.sha256
> +sha256  d1ecf65cc2217dd4118a4dafc1abf27c585b5cb578f3bd7991fc640b79643ff2  uClibc-ng-1.0.54.tar.xz
>  # Locally calculated
>  sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index eb36de8e95..1e49463dd4 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -UCLIBC_VERSION = 1.0.52
> +UCLIBC_VERSION = 1.0.54
>  UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
>  UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
>  UCLIBC_LICENSE = LGPL-2.1+
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
