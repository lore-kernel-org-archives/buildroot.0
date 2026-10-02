Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF93CA5FC4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 10:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96767607FF;
	Fri,  2 Oct 2026 10:33:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8czHcFfXszCQ; Fri,  2 Oct 2026 10:33:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AB3B860828
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790937194;
	b=LWMFpQQH8wsouFOhzptjj7gZ6YPMVcRU7QM+7imK/AI4v3rbQ3Q8hWZFQkDNDBsBsaBL
	 k7egraZeWBYi81fxe8cJUfNnFHvpHAoC3sdozhz1A+mlwlYzrREYsBrcGdOl7Xft/4Gun
	 XnznPrJDTwVAsUlvqg6xpy4z+g2Cx3FeGsc2WiSeTTZcglB3hdjFwG/WW6bodmrJ5vEG6
	 /t5u/Biux37sDfzjFJynOYK/Qps/mpupWnCTQJZPdk3qV/d/l9z9uX/vSL0Q99l6SzR/G
	 CMAZ/FAr4ZZwMhhqYWJ9VItCWmAPdGnq8jHTCybmUsbxObyvpGYTXSx1oisDlkl7PUg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790937194;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=QEVIlKH17Hckb8/VwdgY1x1W+EIext7YBS9CSV4evj0=;
	b=tII1Ov4P5alGtvn0DoKqXHp3ytrFg1Wh7IFJSU+QFcSrQHRDZC8i85Ii0QISOX/vQoCW
	 mYqIgXtNS9gHr8BiEGKf3eR91ZBVruI4gH1Tx4GdIhVWcudz3kXFm8JJWc/WZFUb/j/RJ
	 j2PB8BwMZf5g6n0Am9UJTVU4Hz6ArA/4M6hTtJT6bwgI6YizbOX3zzZbc8qsDNYV1CInz
	 iD+MGdLfll7u5VMmCWkvV5TGwPuREwINOPhLbAuQJQdQyenn/fFfLUiivYY6hoVoXJINO
	 cCaol3fCqp4HeXHEHvWX00aU9mmljD3yL/6Hqz9kzyk/EiMG2FQGyzchSmxqadtWqmw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790937194;
	bh=QEVIlKH17Hckb8/VwdgY1x1W+EIext7YBS9CSV4evj0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iYcM/fQX7YGjrlYzrDGSYTEzOvBR9yw8JEz6T8tgyKTtqeWcw3fBoOBLrFGXQY3la
	 PhTUfHI8qSQsF2CsjI9oXDTsURtChY484MeEUBlmQuusTgXdxAXrxU/f4/uk9fRIYC
	 6tLLcX6a1YWT5PlNiOtnGRsoYD/9RHonkNex6ZQPzOGInjSsa/h5+8CnFIWx20cQ0T
	 saznE6HobphHB49+Bw6BCRbzgU5+3RvYldSaWUN7zHKx9ySi6jHttvxIps9plTHsVZ
	 IeUxXXjtnPyETQCZpC4zfhfi22abSs5s93pfYe2WWpyXdw4ACqz/jPc0HA8W9fWPvj
	 UvVwrX4NOtugA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB3B860828;
	Fri,  2 Oct 2026 10:33:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7551934D
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66F7580F95
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uxmS6WlDSqwe for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 10:33:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5A7CA80F69
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790937192;
 b=r0GitdeHNuM6qHc64g5EjbbjYTK7lBpWOgf0XpUAh3VLE3BM8BHI83MG49ZZgBe7n7pF
 m+24/gaZ11j+tNoFctEXowh/DGZjkq/VKiQgU3MxYR9W53N/33avWSpjRJmsuoq0+kIHW
 kmIs5EV24S4Nz+Le0m7cb3KYupSyQmmZXnZDeWxcoK3/L07V4oTDAa2E4umQuGYu6hRAG
 ugtQJQmZTgFNGFsOY6BX6p9moJPMMsUT80coJSTfOOS0bT7bGPz08V7axDy1SDBSgl9Eu
 uDVM39kNw7d4+bgupFLIPkGn6fWrpFXtkQymZKl3E2xCitqVqfkUls5bmcGXFb4ZELQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790937192;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=J+u9BBFSXiSgc0Iu8cTBx685Ti3wfUsRnK8b2dwHGc8=;
 b=Rqg5TADXi2Qbaeoe9X77u0MMqJIww+w5vvYDA/SDlvn+xZGJhMMLBfnyk4sX1bJ97tvB
 ldxwtzieq9Bv9KYMDbxqYf3CeV+VrtJDgsDZJEnd8qBqdDs98d4Y3+HENQrhgyAPXAZME
 J6FHrRQ8i5/hqUal6E37IzoFgMn4vA4Qh/6Ll8aj47L3L1458CCUlbTYVyKHqjUDWo5iz
 gy+Yr6+GIAAg/4x8qiINvgazPdEwsjtmX5TKVZHnruD0v4kHwtv8ihGj+Pxk8C46RPb7b
 9u0nFw2vn1o+l2r0Kf+G3jJRh/amx3TZqxeLVzSVCz1QlKTyCB1PrJvr+7Ug2zrPZSw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=f36z0ENe; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:30::f;
 helo=mail-wr2-x0f.google.com; envelope-from=raphael.melotte@essensium.com;
 receiver=<UNKNOWN> 
Received: from mail-wr2-x0f.google.com (mail-wr2-x0f.google.com
 [IPv6:2a00:1450:4864:30::f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A7CA80F69
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:33:11 +0000 (UTC)
Received: by mail-wr2-x0f.google.com with SMTP id
 ffacd0b85a97d-482f635552aso5800495f8f.2
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 03:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790937190; x=1791541990;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=J+u9BBFSXiSgc0Iu8cTBx685Ti3wfUsRnK8b2dwHGc8=;
 b=BiUO4R7nfWy1KaMM2VCplAzQnLp0pbNyqyuVSbl19rKo+Bbq82iG8Tl9fnT8azhmbR
 7ceJ8o2oiWUM8KQ3XEdWizjqt53wN2/2Iamcx1TN63sNKmmM6/f4Bu9aL3wm3sotpa4/
 STxEwokRsGCXXJjiy/J9lBmSSsBFDzCCpGKLjEdZmEJPwfUg0VsaimQtRTPv9co2FqwH
 NgxET4NHIGTeb9uOaZdJwPmg5+h8+KdB43AfrXvPz5qHYgQXPUtgV4brahdvzk0lHYHx
 G6Vqvj3rKGcOIfAnY4jQQTVtBN6M3bt7+9utW5XCZmpgxuxLjC30jNX5fXdvoA/intxU
 96qg==
X-Gm-Message-State: AFq9FYLHZ/m/k8g8vsqeXwl3sRr1Yy+rRt2XBEYs0fGt09mDUTUcDSbW
 hdkBhOsVI7aeuPPz3q+iOHP1QAF5rxdH9dJ7PUGeHWNiRT4pu3tpHXow+dUbVPAJ4i7TCXZdMup
 muOElMkE=
X-Gm-Gg: AYBFou1/HYZ2whWQnQZ2waDtltE55ohl127QlDeJacsmDZTkdphTQ4cYwRqDGhJPLd8
 zFrIxYlnvsLgibhBgGgmvdpNJ0FATVf9YBszmQO+mmEvLWSPjsj0b3lapHTNQ9/jpyJyG7OqGtz
 JO9giO45MVFY0AFxdjcjOZ+C8rmat+tvPGnY6ZG6EC2ouA4THKKJbzcx/VQ/ppNc/+oLz20giO2
 h9BHua8+YZBk/HaJl//WeHc7l9+z1WJt7HymaBvItJhrBV+5HIQ4aqXxUIRD2mBHuzLEWQ4jTUG
 M2gvjI22ai55VXrPNosKcD6mclQoHbDeWhsGoBkFDqzRy4R4o3asaf3Ab0ph33wuJGEVSmnJs8J
 9J04ySL+1z8LLh3Hm3hvzb0NE26REYOVp5816OScGgwYtx9z/e8qWlwAw/J4HM9gKAcQdspphL9
 lzF9/WiDpDFyu/tlVJZZAc/r5Ka65HnRqShid9BhW/d5Fxr0LNYbZnbR+H7+VnHr6d3p91CB2AN
 rUzRVZefcNqoAKVCacKtxgU49IW2yK6lZK9GSfRzQ==
X-Received: by 2002:a05:6000:2108:b0:487:8ef:5303 with SMTP id
 ffacd0b85a97d-48b12733f0cmr4135568f8f.34.1790937189752; 
 Fri, 02 Oct 2026 03:33:09 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b380faaf9sm4650709f8f.22.2026.10.02.03.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 03:33:09 -0700 (PDT)
To: buildroot@buildroot.org,
	Adrian Perez de Castro <aperez@igalia.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  2 Oct 2026 12:33:06 +0200
Message-ID: <20261002103308.77252-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260924214149.1533853-1-aperez@igalia.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/bubblewrap: security bump to
 version 0.13.0
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
> While there are no CVEs for this Bubblewrap release, it includes a fix
> to ensure that arguments that receive a path are not empty (which before
> treated those as the root directory: a bit of a footgun!), and that is a
> follow-up to the security fixes included in 0.12.0.
> 
> Additionally, it patches a number of build failures, which fixes e.g.:
> 
>   https://autobuild.buildroot.org/results/2eb2d222daaadc2eb16b42fa2ec102ab0689f038
>   https://autobuild.buildroot.org/results/674413f089ce9b80a59058674b3ef6879e1d389c
> 
> Release notes:
> 
>   https://github.com/containers/bubblewrap/releases/tag/v0.13.0
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/bubblewrap/bubblewrap.hash | 4 ++--
>  package/bubblewrap/bubblewrap.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bubblewrap/bubblewrap.hash b/package/bubblewrap/bubblewrap.hash
> index e150e1495d..43b22dcb5e 100644
> --- a/package/bubblewrap/bubblewrap.hash
> +++ b/package/bubblewrap/bubblewrap.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/containers/bubblewrap/releases/download/v0.12.0/bubblewrap-0.12.0.tar.xz.sha256sum
> -sha256  9760d007363e3abba7c747489910f9f82d9fca53ba3bd3282e396fa3c97a3314  bubblewrap-0.12.0.tar.xz
> +# From https://github.com/containers/bubblewrap/releases/tag/v0.13.0
> +sha256  4734237473c0e5d695e4e9034a34e43b2dbf5164655bd13fa59ae376b2b7a765  bubblewrap-0.13.0.tar.xz
>  
>  # Hash for license files:
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
> index cb31406c8f..dcc3c23d7c 100644
> --- a/package/bubblewrap/bubblewrap.mk
> +++ b/package/bubblewrap/bubblewrap.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BUBBLEWRAP_VERSION = 0.12.0
> +BUBBLEWRAP_VERSION = 0.13.0
>  BUBBLEWRAP_SITE = https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
>  BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
>  BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
