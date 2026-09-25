Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0C4C98326
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C4AE60E76;
	Fri, 25 Sep 2026 14:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cGygWshggKRu; Fri, 25 Sep 2026 14:47:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1ECB060E7E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347643;
	b=qZES8vGecuLB7cAlgVAgse5/HlHslnjdgGkfjc39JM2YKszHWVQkEOq/mrI4dm4sPuQV
	 7pVn1QY/qn2owRLlJVznKHaboD8hRb/AT0a97PeQHVybnIsMe4g+JSqfiDOiz+bKhCS8z
	 bRMff41WQxDtCngPwErV8//20p7Aa/+1oLfneOWRKO9ovVOTdQbBzMB+JoiCjHjQXAVdI
	 d67MQi/Pd0NxoDVV7tdH9an2pceO+nVTpoiW7sp3VN2jCm5a0Eisah1K2W87f969PssM9
	 pU1IQHTCtzDJhsSyDyPnLtTuIWQzF6kkXhEXWZtmOV/G8sBIzkqf2OvG7bkqIJuMNZA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347643;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=R5omzxdNjUy+gjhatJqCo0d37BIgc7WtrQ6cyQzTE8c=;
	b=P3h+LTB+izJhPIyrF9RrKXT4kOlfstXUHqf9rvWUKIDSaYakh+b4q7Yt25paiLCTR8Ni
	 c2XdDTOVW1PAJ3SRXquCb8qZ7r3i5rpE2QGzy1Wc4p4hLZhz9igUYSVaTNvRRNQDYgLZT
	 62McFV+V8KT/qggLw0z5F9EtVqitw5/5N1hwgR7IPelv29wAtRQKUG8EISZqCSNOLcJKj
	 kkkDarAw2Seqeyt7YoggilQIDEtgnud+A6+KllTHNWXvjuZOklspF9+1oXchb5JkWBA4X
	 hsMlv1P2x2HBoTJCqBiFsyrhmZwG2FQGWq727wK47liv/503efvLhmMOWmvtwrsUM5w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347643;
	bh=R5omzxdNjUy+gjhatJqCo0d37BIgc7WtrQ6cyQzTE8c=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UXDnTixttdk8Ik6bHGm6KsIgGfkbNtqRnlOb/iJRkDbmRg4hwl+IikllBC7znNSQS
	 Hl4Aq3FoeHIFTAbp0vTjZLp1Sl4bQYRCx2UF/zVG20Mon1NvtG/Do8LSjloHzfJUHf
	 WLH1zdbVKnOghhwaw7YsGwGoK/4i10/SmDhw9EmtzToH+Os1OwI9LV10lzFczV9Rqm
	 xUUQmbZDY4P0liUz6IOwwhIhmi97naLkL8Jpg2GqQXs5CLU4qjgKvmgNnXsnVAvYXS
	 aQU0ll7mi0UHKHtY0uF6K6JBG82YHVqd5yc5RvKmz8nR1+1V9UWe+gQPWTieu1fbiZ
	 bg6HbkqK5ro+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ECB060E7E;
	Fri, 25 Sep 2026 14:47:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 95A00332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8740460E5B
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DDIsow_KFrK5 for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:47:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5373C606C4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347640;
 b=gbRaDJJdsIRNwpbP27bScMfer8AAV4hT7ymq8Aw6U5AT60XNmKcc8y3jUz9h2DYzA8ZZ
 KsKvBrXqtjIBBeXAzWBTd3gFbFXXO5Ui0dXRh5xAwiKr8KjgtA0X2uOsR1ANFmAvYZiw8
 H/H3cmndd73pveHTBDc3WpTppuTIcnHD3AtWE5RFMn9FoqRxCRDC+Jcy57YzJjEMXCFFm
 QZnLRPUxiNSQLIaM92H+n7ytuYNFGpojjn+QRb9VfRFsa8uuJGTlUiLMeKioiuXngc41J
 RibA+qkVj+WX21qKJCeVGfGN/srfANL8Go2qq8oW/q4gSCASlMQy3CdbmQGNY1LVHNg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347640;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=mwF9VlmkGbaPhKn6aXdC2WZ40TP9VnnoYHFkK+3UAcE=;
 b=pVBgRKn+HmAsnGmOhkMXT8VJs5Cj9fL9Xw0YrDEjkfd7ffGb6wG4mmOoGT7iThTWnSRZ
 7JF5mOUFkb1VYRHZvvWXy18FUrO9xen4KCQb2G3XNMX4wDlnjDlko+96MFf5NcZ2ZFwmT
 tO9at3nE7l04K+9fJ1wRIW8FTOyczI6edNDm511TJnO9yQMNX2y0RotDAN7gGImfHT7N/
 75YFDFDwpmosq7D0l81B/ebY7KlID/dD1QC8F8KaLEjJMQtjdQGCdQ//+1mdeS5DJdCTV
 d/q5OgHme2fRKpaiJ/+ZQ2WIpwRCdBhTnXjt5SyXyKraiIKa2SUs4rEBpQHb0hTDfXQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=AocjsNxj; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5373C606C4
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:19 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49cd4ba9f68so11035695e9.1
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347638; x=1790952438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=mwF9VlmkGbaPhKn6aXdC2WZ40TP9VnnoYHFkK+3UAcE=;
 b=r300tCZRB405G6AOY34sPKc+HWhB8xNugpgV0FKo5Wet/qQ3QTVlY97DMeDi63YZb6
 rGveuYSgZOUy+UjtfF0wmA+2EnnUnjMwJCfBrNRb6BhDnl5p36lNjdfqsZUC8U9o07jI
 FZ6o/L/UJ5A0vUWP5/QrX9uWC/ArsjZVe75Pt2sxY9ceiLP7tzy02GEAgdYduV2We4Qf
 vxlTwK6NgroC78YtUbUVRMtmjgbVyFs0ESwDusxfrxXfr7dM9zSmFHphn2nwXdpIInb3
 GLv+9gXFPv9MAikaozDJ++ZQ8J76PMzFMvB3vtQlJDheoqrDz4x/kZ/No2VWZtOjQfh1
 Wvyw==
X-Gm-Message-State: AFuF++nHJCG3fTjbtd9cDgk4SFPFexeoXvpfbS98doXYY+RKC6lAHbo9
 5PGIUUaZI37Ij+WoSKvDJ5aFpFds/lLXeNC5ZGI/JFQg4y6yqq+TweIGoYfy6IRon+2sBY2DOqJ
 DWOeLZuej2g==
X-Gm-Gg: AYBFou039bPicphFMSwUfX7b6V5EVFiyzwz/Ohr9W5TumdP/lNRRCh9X4tiuNP0UDcI
 eCaQj3Dfqot6XPPZd19M8eL5BC6x8uCG+dSYMrqDK7fmps02gPMb+j44ylER+i3Lrpx+y6q+uEO
 Dh+TVaFooQql7OECII/h4aZ+CyxyXRUXJhv+QlVPcLiKghMpyseirXDta8LSKdmybkEdc9MyFJA
 LDWirKM7ACultfFb0cdDdRfyF24J/ML/7tuoXImmgw6q/dzJPjWB6AF0n1OoYrUQ4gcL73QDyn3
 nCkPbvk18KqnSP4jzt4L9lR6JGVGAnYwDIDcsvVuuPkKjfyBMD6oar7Rswu0SYBM8MjCFwhlO6s
 ZHYjKU7AEs9JxaVVVQQ4dw0V9qnEUCNmmGwlPnty3h09z5XSyGfcP3vm6fdlZVlt77eA8fio+KH
 yambBTDWZNBM3TdJmn0BtlhAhOp39Ad0kMv+EKRlS2AiGclxaluwIQMlXfqYNrGJKTlT/ZWpYyg
 X5SahbGKHGucuIThqRljpZSpfjleYEE+lfl2yAW6A==
X-Received: by 2002:a05:600c:1989:b0:49d:16df:8521 with SMTP id
 5b1f17b1804b1-49fe66ab9d1mr108267955e9.4.1790347637995; 
 Fri, 25 Sep 2026 07:47:17 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fedec53c4sm93392415e9.4.2026.09.25.07.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:47:17 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:47:15 +0200
Message-ID: <20260925144716.4100918-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260919101008.1338862-1-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/{glibc,
 localedef}: security bump version to 2.44-48-g1f5026241
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
> Fixes CVE-2026-8674:
> https://gitlab.com/gnutools/glibc/-/commit/1f5026241027260e9280039698bca031484c82ad
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.08.x. Thanks

> ---
>  package/glibc/glibc.hash       | 2 +-
>  package/glibc/glibc.mk         | 5 ++++-
>  package/localedef/localedef.mk | 2 +-
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
> index f541a8d8f8..b32fdada8d 100644
> --- a/package/glibc/glibc.hash
> +++ b/package/glibc/glibc.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated (fetched from git)
> -sha256  440f4e6d5b787369c1af241de7ca0692731fff3a0c3d279a98e8827a6ccba5d1  glibc-2.44-40-g30950ce64dbc29db0aedf1d46b6b8eb70b360f0c-git4.tar.gz
> +sha256  d55ac4dbe32f36310d7a4b9a38d3796666fe323581825cc530f2000a2209947a  glibc-2.44-48-g1f5026241027260e9280039698bca031484c82ad-git4.tar.gz
>  
>  # Hashes for license files
>  sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 3cddf7c1e3..6e306c7f2c 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -7,7 +7,7 @@
>  # Generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
>  # When updating the version, please also update localedef
> -GLIBC_VERSION = 2.44-40-g30950ce64dbc29db0aedf1d46b6b8eb70b360f0c
> +GLIBC_VERSION = 2.44-48-g1f5026241027260e9280039698bca031484c82ad
>  GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
>  GLIBC_SITE_METHOD = git
>  
> @@ -40,6 +40,9 @@ GLIBC_IGNORE_CVES += CVE-2026-80489
>  # Fixed by 2.44-39-g0b4e41fc51e6aba6216a908961b49b0622b47fa0
>  GLIBC_IGNORE_CVES += CVE-2026-18374
>  
> +# Fixes by 2.44-48-g1f5026241027260e9280039698bca031484c82ad
> +GLIBC_IGNORE_CVES += CVE-2026-8674
> +
>  # This CVE is considered as not being security issues by
>  # upstream glibc:
>  #  https://security-tracker.debian.org/tracker/CVE-2010-4756
> diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
> index 6904e147d9..f20a05aead 100644
> --- a/package/localedef/localedef.mk
> +++ b/package/localedef/localedef.mk
> @@ -7,7 +7,7 @@
>  # Use the same VERSION, SITE, and LICENSE as target glibc
>  # As in glibc.mk, generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
> -LOCALEDEF_VERSION = 2.44-40-g30950ce64dbc29db0aedf1d46b6b8eb70b360f0c
> +LOCALEDEF_VERSION = 2.44-48-g1f5026241027260e9280039698bca031484c82ad
>  LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
>  LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
>  LOCALEDEF_SITE_METHOD = git
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
