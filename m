Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19F0F436B7
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA91160E2D;
	Fri, 17 Apr 2026 15:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pPJQg9VFtHEL; Fri, 17 Apr 2026 15:24:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC2A960E31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439484;
	bh=VC4RgZwUEKSamsEivT5z5RunpAQHIiL+/jiigB9rteg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=n9QJo0sBw1DyArX9vqFmJNHkBjQceB5X+glObf+AgMtbS+DrOQu2LR5qr0X/E0c41
	 j/Tt3ckHAZ0mKAT8qO8Bd7ys7qNBPE1EuZCv1YQpkrLKec01kCOwhv6WgxAxtcKnnN
	 cRXCvAgGKVAsjI/ki04hvMEuTJ2N+j6+OXC30Lhqbl4dD/nwvEY2s9ReHXkJqTGwNS
	 2WgMRXmo8xn8Qsax4VjnJ5V61pj4HCCWbLwSZPxoZS/JJOY9QHLG2z4JFcfhfDkpAq
	 fR/mWfq+WN841Dafe5uHGB0QExJ/uwKrQgiaICv9zLat3XAkE345NHoXqMxFzP1WKG
	 PNU7mLCdfubRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC2A960E31;
	Fri, 17 Apr 2026 15:24:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B7AC3396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A974460E44
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bhQBCQjWt0zz for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:24:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1014460E30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1014460E30
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1014460E30
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:40 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-48896199cbaso8716225e9.1
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776439479; x=1777044279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Oxac+mnH+KHpBbBcTrcTIX3TIGXd/ppTLwaXGAM4Y/E=;
 b=Dz1oDEQ/0p21Zi+ItydA6dehLnTmazkf4p1bBMr9yaqm8cAhvc3RV4byceidP0TYu8
 jMPH048FwtubjCRiI6cs3BqjYsRqBZ5zOH7nL8ScuoZmGikuK3Dub4JucGOJrx9X8B4k
 V/ZXuVVJiIE/Btb+MXge4iOT/DFSxK4LpBEj8ipgD4o/Fp5MC5u+H8vfRl6+KIgQuNfl
 v/YoHMMWiSq/1Zo0ZnPqwFgtv4+m6gLsNtXWJtntr2sdPAkswExcLx714E/Pb1Po6JFX
 DCPjhcRu8wQNH96yMK03P4ti0yJ4gc5Q1PfwDzMbYiXrqeHA/9LB5aE3df8O1LVt5JVl
 ZrFw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+Qmvi5JKqNASK3j/nHFV4khWOpNdqaTqsWRus4C2TKGI2of3hI8cOSy6XZIjq+ebiYooi5WCKs1yg=@buildroot.org
X-Gm-Message-State: AOJu0YzAh931/fzqSyvH6fdrHJ0Rk1qQG4oPis3ORRj5+31x56Qv559P
 GuHdTTZZfdmZdQuz8rBflPXCZjheXXo9cbks6KNcHYs1RHdLfjDxQiGi66jYPZIRH9o=
X-Gm-Gg: AeBDieuk5kHjuAxWA38UCTZiOvx1cmXd3tDTeTNpvQPWoiyD1021p9p5CkkXll7YdCO
 tDnbVmvh7IB06EDc0pRLtJ9xBvI6eAn7tbyvo7iorjslrkrUXvUsHDuqqYqglQ6uUNcW/Z9LT+i
 HLxlYoqF5Xy6tAxvw/02IKpTkiMvZbG5wqxqXUvjP59SJ61sHlhjOBbAVPL6kbknGgRxReKv6LA
 qXtvRWRUKectp5T2huCS02hYNwmgJ5zjuhsg9QM0OiorvE+BtMuxH2nQQmRjvmEIHrZYGBx5v2o
 W57lejpVXW6R8Z2ndBDHV2JOg9eEdWtah22VeuP4tSijMiW2bCwxk8HbagDSxs0YrOUxH9H28FH
 KgXyIS2nWyBKF/frFY8qLMVqU/LJuykgYS9yQRbeQ4PlTsXa7OmhmHHLn2WRbWGfp9N5BDIMndB
 fwOrN909x3j0WGS4K1kGMNq+OOiJ4=
X-Received: by 2002:a05:600c:8b68:b0:488:7f69:4abf with SMTP id
 5b1f17b1804b1-488fb75405fmr50967995e9.12.1776439478789; 
 Fri, 17 Apr 2026 08:24:38 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1c01cfsm56586825e9.10.2026.04.17.08.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 08:24:38 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:24:37 +0200
Message-ID: <20260417152437.312843-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20250806122510.3950409-1-peter@korsgaard.com>
References: <20250806122510.3950409-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776439479; x=1777044279; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oxac+mnH+KHpBbBcTrcTIX3TIGXd/ppTLwaXGAM4Y/E=;
 b=DZEDPGUpLMz2SD6Y2M34LciwKHOLcQpd2dbD3Oi/NYzVj/J1Jp0b+5Sxm85lJ1DTct
 o+oHXHeG/VPTdJzs3K0TCjiUhkKwFYohv74ZaJGXhULOL9uk5Vj7t1aXNnaTxdTUSE8x
 p0ru6oByhOwQqQzA7cYvLIDJLZY4AXJspHgtiXkPAhxzvVxJ+PKZYYSUUVBsJ76Idrsm
 vX5a11n7iGri4YLtlx2ZbLbzcFX7LzN38G6K2UOWjlyTyNgtaqOMElfok/gLKJwdREXX
 TFIDXGbbvqGKfIQf5mR+fw2DKRiywhkzrmYpi5UtrYHyg4vT2fl8dnq1doG4nUU5CWRD
 Lupg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DZEDPGUp
Subject: Re: [Buildroot] [PATCH] package/libopenssl: bump version to 3.5.2
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
> Bugfix release:
> 
> - Miscellaneous minor bug fixes.
> 
> - The FIPS provider now performs a PCT on key import for RSA, EC and ECX.
>   This is mandated by FIPS 140-3 IG 10.3.A additional comment 1.
> 
> https://github.com/openssl/openssl/releases/tag/openssl-3.5.2
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x. Thanks

> ---
>  package/libopenssl/libopenssl.hash | 4 ++--
>  package/libopenssl/libopenssl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
> index 1675d72fb2..7f3795e1ac 100644
> --- a/package/libopenssl/libopenssl.hash
> +++ b/package/libopenssl/libopenssl.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/openssl/openssl/releases/download/openssl-3.5.1/openssl-3.5.1.tar.gz.sha256
> -sha256  529043b15cffa5f36077a4d0af83f3de399807181d607441d734196d889b641f  openssl-3.5.1.tar.gz
> +# From https://github.com/openssl/openssl/releases/download/openssl-3.5.2/openssl-3.5.2.tar.gz.sha256
> +sha256  c53a47e5e441c930c3928cf7bf6fb00e5d129b630e0aa873b08258656e7345ec  openssl-3.5.2.tar.gz
>  
>  # License files
>  sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index f3521b3cf3..38d04ea924 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBOPENSSL_VERSION = 3.5.1
> +LIBOPENSSL_VERSION = 3.5.2
>  LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
>  LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
>  LIBOPENSSL_LICENSE = Apache-2.0
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
