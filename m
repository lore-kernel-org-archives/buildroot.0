Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6956BC98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35FA460D95;
	Fri, 25 Sep 2026 14:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ueDd_jfobMv5; Fri, 25 Sep 2026 14:45:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4606A60D9A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347502;
	b=OVaXsUlsQamSMelaIpf6/GJfJL6ExGwRkXC5HaA8lzaABwYIcawyS08Ka2bTDftHL4lR
	 7MHYh/emaZpZ4UcmpbDYIcSVVsUshOZwAe/R4LDYJjx/qVg2Sb3GbgsI1QcsGC8PAEVQy
	 mXHsU15qe4gVcdWu6Bx8+cW7eI6rnvvFCv1kY+4uB7uk1tKDp+dN4RuBL/McT0Tebmo20
	 rgZryi9Su40FqYtfhV+e3MTY6ZLcA1LdF1X4vvz2mU5NY7t8k6elK5Ab1KjgtXAjv32Vc
	 P4dvyY0Vm3tW6MO2hH8QeBxMi84G15DdluO/CLb7VlHT1PP/cINCZ6Q6lwendxjQ4qw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347502;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ru3KUxCJkvc75RrN1bbXzs4NeqXQGDisOboevxcxlN8=;
	b=Y8Mttj/MppnY0ZqY2mqliEOKFGYffzEcd2AZGKQA9xedILlp9Z50rvfQhe35FtQrpqBw
	 +s6RIzC4n0ddY/Jzyj8IDBHyaHpgkeRHIH2xrIVMnosJ6Bj5Meb8coQXpXLx5+PA1YdQ9
	 3VhlKK83q5PsCECPkOgfPdSrAE/KUn06rKUAqlT3LT4n0KyBZhUOaPdOrzA5Ibd5+oS/x
	 kRQgFy0k5MHly7ZdzPyh/Ui+TlMqSUi7FSDYAjS2dyGXeVrJQRV5hFUEz8ZiMaMzeBAbb
	 h1VWEdIOnU0laNxa/ITfIjcQRz2KqQ5wnEh4QeFaUyrYe6nw5lTM98os+UumkQ6nqLA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347502;
	bh=Ru3KUxCJkvc75RrN1bbXzs4NeqXQGDisOboevxcxlN8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qPlLhzLaQt3LEH5jKp0aqh5pyF+Vr0y9o8RXVPZkbzeyglL6sV5jrGHPGtvxBazxV
	 nGffQG9haQ6kP5gX0IthuTnq/wxIUI6Z70ehfXOzDi+o4kaIXsk5Gn2WSl3DbA0NcY
	 0LMgK9VpPfFB5A7xOa9HV+y5adHvQMOkguNLHjHjN0NZVg88KiwPRpd8/IpAj5jrWh
	 AzMAYNKlcOJeZJj+FE5E+HuWeSarZPBYH7SOEUD2P+H/XPOCKuoLa6229Q07+l4W2F
	 LDRHp9yEglQNHDNqaAphwpIa+wAk5W49mnxemElvJiMwK09DH/fTwIFXag2Z2ZZv1+
	 0WOUkU4YymDGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4606A60D9A;
	Fri, 25 Sep 2026 14:45:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 18BCD334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2CCE40475
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rEBsHSsjs5mi for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:44:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org E0F2E4016B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347497;
 b=DtwYOyr4bbYFz1y/3V9010tnCgOL1BaoSTa4x1LGioQb+v5yUuQf5R/iuyXrB4HQdMQV
 plWTV+2YpLNCUD1wxxjKND77EOQ/cj63glMNN5re9UE2eCc9hVViiAIacquM5pE+b7d0g
 lYQ0NfQBvVhU/aBSQ7YNVK9t7KFqWpP60/qLxw5KKJ3ee0HK+/y0rdYZG+ql2iTm3VnqC
 zOjDYTY9iXiYUCAO8aLpXnOYT3wu6oZeMiypAzKuRC0DW/Z8Xfzh82Y1j/JSZRvw91Oah
 LkxWXJj6qcN+3X50buWJYYNBeCeaf3XVFkXm0R3v6zWxSGYtQSQjFxtPtFKsZ/2hQBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347497;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=/mysao55Zs6JFcrJnl3QS2b35f697coj7/mC9SXUJ64=;
 b=nw3SAzBvRkcHJMKuK/NGppReRzekSeMv7ymtUjrLBGwm8pxZu9aokHjL8kcZWjFmP2rX
 uUuA7pzj0oKaJFrNbklkPSPyGDHPjw+cMTMIAboFelQANwc+MkcrY8Q7P0x1iRDyCMF2j
 KVDFghoX1a4u2lrXWFZzT29I7cCCmOEAz8yCd7H388q9uJqgYU7K5vwGRIv/IEXn2LXay
 V8m45nMXxOAdV0zy0n0pHUTA38/VrStzhYu+yjE5+Rm9V+XCp6rnjn5cjMl8LzI+EGHjO
 j4Au9NEXhF4WK2mc4RrO+arCght2WUg3B/ePNgqf0V5Qo2xzqCDu53sFaFpRN3W8jYg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=RoWC04bV; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E0F2E4016B
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:56 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49ff23af865so6502315e9.2
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347494; x=1790952294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/mysao55Zs6JFcrJnl3QS2b35f697coj7/mC9SXUJ64=;
 b=jIkfPSd9EgKnj9aNqA0ACDbcIstAKPyd6jZo/hDbodEgOEUYHR/Ugqj1st44auf2FD
 UCswA+1bR1F9k2WCHNy9pcAV9M6QiE1tdp+6O08fuhWEP2+W3uuIhPBc3Q4zt/xPveeL
 fZvrbZwWCQa4IRqZ3gzP71COfF0rYif2S7issiQjREsmsNRYln5x3d2V8hczsX+G7h2P
 bDzbgSCnaX6uHCYb1iNDCmkHtGU+XfomWxBYEpVR9tsdeL/YCPcLmfGpv9/60poHmO8m
 y6gEY1gmrnuOHea+WmN2Q6y/HOpMPUseFpcn0SBkNOzctGA63TyxOyBAsY8ecUBcWdOE
 l8eA==
X-Gm-Message-State: AFuF++k5r0NNuI2aepwfpGTpF4DLvwvsvoceCfngcRyg/CeGO9EaLDsX
 HzIDRfMtNHCBypvszBUD1HViFb76XgdIh8bb1xmho37lge1cmIOKHpTnDV0HFLBeSOVkJwxH7Ee
 xHuwt2Z3zgA==
X-Gm-Gg: AYBFou18/ifwyQq9PMKAWkC5Lr55RgE7Wu2LHsyIWRbCc63pcSoGsc1wooEe9JFRnMB
 f+RfmLK1oDqLGnG8bz7amm2IFy+kdXipVExKdjqq4ODZGYTlG1XvOH+6vwhpaStrRN9DnPWQibt
 dlEkuQb86s1ddsYA1Z0zYFcMqOa/5iuk/J/wxa4ANMcDClEw5OlF1Ya8SBCHuUkIInJlUKohgIM
 yPrMGxPPBdVjkWqoEKMH83vM+60SjJVvK4W8VgxV5I9DlJQiT7j05ir2/48hkUH8inE86UrsFZr
 uNi3M7It8D3/wVNR+0I151iABJS/ISE3CxkykbCRYH1wWX4segSTbwWi2rjX7N/qY0KDl1OJCma
 TMIC5fVEWha7BXPAPdSEukmYn6x2tvx/zAcqG5O0PijcmM0DbdxXb/mjaNksu8AB07XfKi9zqIn
 /ZDWpQatHKFD1cf7fTO8NFociw1unylzLlPNH51rnQKQA9bBbLx5pIFmBVw7iNKVCXl6QmUt+yQ
 BYTODYjDZF+XKWprN2LNbrTrCqpgaP/zY8Gfb3aS45qPI6mHmJm
X-Received: by 2002:a05:600d:6454:10b0:49f:e80c:3d66 with SMTP id
 5b1f17b1804b1-49fe80c3da4mr70305215e9.29.1790347494266; 
 Fri, 25 Sep 2026 07:44:54 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ff27eabc1sm67333925e9.15.2026.09.25.07.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:44:53 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:44:51 +0200
Message-ID: <20260925144453.4096895-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260914220237.3170059-1-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: security bump version
 to 1.23.4
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
> https://github.com/strukturag/libheif/releases/tag/v1.23.4
> 
> Fixes the following CVEs:
> 
> (CVE numbers will be added when assigned.)
> 
> CVE-2026-XXXXX (GHSA-vg7w-rp49-4fc2)
> CVE-2026-XXXXX (GHSA-xrp2-63fq-jm8q)
> CVE-2026-XXXXX (GHSA-prgh-72vc-3xmc)
> CVE-2026-XXXXX (GHSA-fqpw-fj22-78w4)
> CVE-2026-XXXXX (GHSA-4rv4-953r-p24q)
> CVE-2026-XXXXX (GHSA-rhgw-q5g8-xjh2)
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commit/26f96b8a018c60927e1922d74520aa6f6384c5d2
> 
>  package/libheif/libheif.hash | 4 ++--
>  package/libheif/libheif.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
> index 6001e84ce9..78f59f6b67 100644
> --- a/package/libheif/libheif.hash
> +++ b/package/libheif/libheif.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/strukturag/libheif/releases/tag/v1.23.3
> -sha256  11c1179e0e4bec33624b87f22ec42c1e993a40d946d44d26f9c431cf1456a863  libheif-1.23.3.tar.gz
> +# From https://github.com/strukturag/libheif/releases/tag/v1.23.4
> +sha256  d0c02b4b0e978f34a1974b6f3eea7975a537bf7a9195ffeea38e7242ff316fdd  libheif-1.23.4.tar.gz
>  # Locally computed:
>  sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
> diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
> index 1614dafc74..3428646016 100644
> --- a/package/libheif/libheif.mk
> +++ b/package/libheif/libheif.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBHEIF_VERSION = 1.23.3
> +LIBHEIF_VERSION = 1.23.4
>  LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
>  LIBHEIF_LICENSE = LGPL-3.0+
>  LIBHEIF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
