Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A17CCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9141A40C2D;
	Fri, 16 Oct 2026 15:05:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H2GLoahSX1eR; Fri, 16 Oct 2026 15:05:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 95B9C40C2A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163153;
	b=fHuzfKwvw7Hj+uVijMCMyY4IiQpNWOX3luxHGDroxnhaqFl4y/ms3kWvLSb709jAHiMc
	 kDpxcJTD3JzjQnqLBrF/lSl69pHEQy6kilNaXkHy6BXsq+BNw/QUkRT6u0THCLd9zi8ES
	 tMOAoozlHy9k4WX951d8H94xydzjX8yO5xzHzOek7y4r5kYO0sQ4HLNvXjl8pq+wgVrH3
	 Z6mXjhRInTZSaHknEyie+8JsRskinN78qLW2HWGbnf5h8HbwvHJcDpMwQ9mII4t5d3TXX
	 yGXU3bYqQzoIQyCv7QbP0fE4VTOv06+vJhJATe4RtDw2AZWyksVBUzbf7F/JR8goJNg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163153;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=d6dSr937GmhmQYh4/TeGES2JNWnJjHdLASvThFpAYdI=;
	b=V/PtWB7AiD4YlFKqCe1ZqTUPNRJKcWZergDKscpHQsdjrcMAFLmY3sZRVguBT/x0QMx5
	 IdcAnahe8iCa/ZOl9tIbcvuBrGQaAiMth15oZTslNZRnSN7tNAanYPimuicZThtIZ8xSx
	 8Oex/3pVbT9gMHx0qrSgNObsds3DFMn9xk8/hR7+HhR8z2XFlZUM4nBudDU38RNz6DkJj
	 +FsZIdhc2HHVHmBTux28Pf7kc6Auoo8dtG75gm5Hu7CtQCYtSrtxgP2U+raDKFUa20pKn
	 kAagBkTHX+qyC99N7+OoCvj0SeelyXm+k6pYnzWheX4F5/rqUxEOUM1q03PiHpLbjCQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163153;
	bh=d6dSr937GmhmQYh4/TeGES2JNWnJjHdLASvThFpAYdI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XdkPX3Rmu1H+lOitU+FiW/NaTSWWarmOOQNmtcVcHYKh6rYs6fEOS3wznyAOhIvgK
	 ve4t6nWAmTmGXcp9kMzPFk5ycXDnEa71gbko9kFc1bgnDlpIy0ajzaXfS42/PUR+0T
	 A5KtH17K5dr7Xywd9hxcj+T6gsJXhc0yomVF7HNrrZbEygYUXe4g7s50OtoYqwqw6z
	 bNiTjNV/QCtN+U9/TqbiY1ykAYNhWgAVonsMSOViuyMxbzq8cCa0zArNRNvrjGf7wm
	 mQYteJSACkhoDwQln/zvDhJNYk+c1n16s6Gl/uT+M9R1RmetF2bSpfLzg/1A/z+M3f
	 3KC8XwXWfbUSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95B9C40C2A;
	Fri, 16 Oct 2026 15:05:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EF7737AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E15D081753
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j-4AmPDy7pCl for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:05:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B6F85816E0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163151;
 b=K5dctT1Ba19RQROiCQwY18gpMm2x021R6Sxpl1+uFBQ0mbqzrr8Uhm8uqes0OpAwJS5h
 5IFkIv5d3KqZ3WIGDJQOeiyuujjuSzg+sYDqlTwx2jT073gWXe2qQ3xob+Pmjv0Zm0Thz
 /UAuNYO3LSncv+eoKdefvLVflI8jfChaxvebrdWlmh/hHZsS+7JvhJl8trTI881qf6AmD
 TNQIqhzbudOXdvKhQSYY3GCIuSO+3QPuIams1Hf0K6EIX41xpu+nOYD5kFyyLYvVeYTd4
 vtKTs6Gqz4wJ5f5Lt6ilsDqCn3GuqeAHebAB2lQG+zx0/p22Yr6TZHg9GgV/fHgCKAg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163151;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=MKbkwjeoXx0AJmG5wEqeNU6xuC1yD7sLuqm2Ir8Rg9Y=;
 b=deC8+kw28hq5aaPb790bxEeRY9h6PA5SMG6Ies2KuNA3aYNuCwioJntS9/43RhKGj8GN
 JQ0x2XqIUDDULTsHCGRusv9UQ9Kyt+nEc5a8pu8gdn9MTnhWIa9flQVNTkiSnpZq2MGOf
 0IA6glAl6x40HML06YpG6f43NpTcvcrcB3g4vvWbZ4Zk03IxHeBEPukFdTJ9D6xicDh9t
 dQzys28KcirSUFyL9NtGc6b3PbxC+8qBBvxuFkiIPkPLf3kJBKk/Ou3YwDd7vzOUKLJe+
 SLhuabfx7+w3IIg1R8+To6iJdWYZoHaUXNJWwmDoYrRSXXvge2JdaX5c/jpLh8PhRgw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=QpFVENMU; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B6F85816E0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:48 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-48afcfc4bf5so1385282f8f.1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163147; x=1792767947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=MKbkwjeoXx0AJmG5wEqeNU6xuC1yD7sLuqm2Ir8Rg9Y=;
 b=UKilBe2MyzDbmybFlRvNZiVMjETyGjD/8w5zBqdL4RMpW1oEpikJD3PIjFfB3hWDsu
 3WXR8sMkmjKvaKfqR2JPUrmHjMNfko1eZaigqE3CXq0gfh3GabGJxn6TUUQtJOKoLzrJ
 108EYoItEZXt26VhPH+h16pgfXH3D6HrEO90iSHGDzu5dLsIdZ9Vc4K9V/ovtscOtVxf
 q1qlX7Tc+SQJ9UhigiInGC3QXmQ7CEPnnbCXZe4gJfYnPbuW7433UdZWYNch19482v62
 veEOpCvZWWBy/ivrE4ZHuXX9y3qQLbWWKKhI47HuaDBDYNY+vN93UpDbLd+p3QEQzX7G
 pe9A==
X-Gm-Message-State: AFq9FYKS5pAA+RoUev5KmaJpUDOaOl83q+UrGGFeGoNedB440C6vcPnO
 lqbr4tKsxKTUPzxLHQlJRNzutKCnysA3r4FVc53Mi0hig2iAhjyE2cXXWXStNOcDmYtA6uw9972
 7R3uCDP4=
X-Gm-Gg: AYBFou2FTM9gVHaSy8kUJGUvA085w2S7+tAHkMvW7iyyYxLB/C/E/C9FLMD2ayuRvLj
 uWRHFJSIm0ec5Tod0r5Ysn2TcKdg6xBoTVoI9WIk87bWENJR724Dy7b76kPo6s8aUW08HF7AoAZ
 dR+J8ewErk1laQS1c5hIT2XDfjtWWmhT/Vt9fYqCF1k10W5UQCTQBLC/UtjFaVp+Y5n6LEoXmYn
 7Xscx7D5rXmDV60JzXEPrHJLFv7Ser9JPdSCNb0pwHUhSCIZER/9qLSn21jZXxEP+dMHmMmVm50
 UR/KlXZch60E5KevKTT8iIUHP8Oyeo9E03d9l09UDzg1144VlXbIE3G3P4wmtiM1T9Y6VKncBIy
 MpTib/qTsNsO5slaHr5htuUb2LvqFxc3Ap3X10VHT4l6wJZxZm9q58sfH4Fh/gtNgHQlwmlgKnX
 ToUFWaQtbYhshxQRGZlNqbO6Bk7yEjWKDHG82KNw3io1sMt5XFMyqWPZ1AC8gKRWTnkM4QYpGiR
 k2VYpApKcWGfMCLMBbOzylOvVjSlyshdU0ZtuAkjfipCFC1ajH0
X-Received: by 2002:a05:6000:4287:b0:48d:fdc0:65be with SMTP id
 ffacd0b85a97d-48dfdc06675mr4771801f8f.38.1792163146675; 
 Fri, 16 Oct 2026 08:05:46 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd471b06sm6390543f8f.5.2026.10.16.08.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:05:45 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:05:42 +0200
Message-ID: <20261016150545.74967-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261007201836.1696051-1-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/openvpn: security bump version
 to 2.7.8
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
> https://github.com/OpenVPN/openvpn/blob/v2.7.8/Changes.rst
> 
> Fixes CVE-2026-84790 & CVE-2026-88964.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/7447067c49ba9467bb5f924683b2b6cf5f7ad1bd
> 
>  package/openvpn/openvpn.hash | 2 +-
>  package/openvpn/openvpn.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
> index 947922f0c8..9274a853f1 100644
> --- a/package/openvpn/openvpn.hash
> +++ b/package/openvpn/openvpn.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated after checking signature
> -sha256  3ab8f48fd6c26d49ba2333a092433949afdb5c85c0e6a1ff265784fbc04a2463  openvpn-2.7.7.tar.gz
> +sha256  c070d1d2440b5a6fca6c2c68645c98cd492116ac36ef4f0946177115532c8e36  openvpn-2.7.8.tar.gz
>  sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
> diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
> index d910802da7..01c049cd05 100644
> --- a/package/openvpn/openvpn.mk
> +++ b/package/openvpn/openvpn.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -OPENVPN_VERSION = 2.7.7
> +OPENVPN_VERSION = 2.7.8
>  OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
>  OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
>  OPENVPN_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
