Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDEEF36BA6
	for <buildroot@archiver.kernel.org>; Sat, 11 Apr 2026 07:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 464886102E;
	Sat, 11 Apr 2026 07:25:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 18aG2vaP8qQq; Sat, 11 Apr 2026 07:25:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A1CA61079
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775892326;
	bh=6NTkjY/0jJY6MKKgLhozGn5g50SGydgii0xSXaf1rlk=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=D0hD8Hg+6rnXxhiumuey3u6h0H+dOlAQnSbp4bRjegtMXmt57njVxceo/qxJB0HIG
	 tnEG+n0hy1TgeGeVDRTuO0JTFtvB4ih/9kAAeD4zhLu2X+6mbUop0HIvvtSyI0v9Gp
	 whsGxZk259LjoNrlf7GRztYDh6sqeF+nbLWMx5PsEqR2QmIvhFEPWW4Jx7lfdilucv
	 7vs3GyNHGsSqFpUfIOcBaanjYvHZZpETvlZyFqjn0KAgdxQFwkiygGdufEeV4CPOBE
	 FKnmehtXB4ZvbqJp68d2cErREQOBFNAoBkaQFrYsrvpen3J5vkFjMGcppHBPf20zXd
	 oUlCnTb2UH/4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A1CA61079;
	Sat, 11 Apr 2026 07:25:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 603FC194
 for <buildroot@buildroot.org>; Sat, 11 Apr 2026 07:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51FBC83D13
 for <buildroot@buildroot.org>; Sat, 11 Apr 2026 07:25:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YBx6Gl-qFIZ2 for <buildroot@buildroot.org>;
 Sat, 11 Apr 2026 07:25:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5D32F83CCB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D32F83CCB
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D32F83CCB
 for <buildroot@buildroot.org>; Sat, 11 Apr 2026 07:25:24 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-43cfd96354aso1673872f8f.1
 for <buildroot@buildroot.org>; Sat, 11 Apr 2026 00:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775892322; x=1776497122;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Rnheu9mIdd/eaZGnWJ7aEFpNAvAmPPFdk40ZZFL0QK4=;
 b=G4WEdtLPH9Cmbf7TYkOs6VbgXfsp3/goEAc5lKkiy8nOR+lWYg/cIJCCOVfkpaktS2
 ZFXZuaMZvXwLIIFp8kgtEMEq+QrBmO/XjVIx7kvVIWTV5a3nhB3w1zJ1v1srCCcvjRFv
 VLtAVdPgko1HnFYpIO1e+XADGZXCltAfgcgOAHmPNGR/81YsTKpy1YU5YEDqu1GwK3B8
 YJ+k6kKYqHp0IyVGLi/4rF+BlcvZT7tex34cHaSpaFxCSfNa+Gx8ZvBZRqFGkgYo/7Z0
 MRlkpBJ27w44SqprsZYGe1N1esXWblC6kGZdhvBLqxMynP+PP+myPyjb/F0n0frhy3qJ
 f9/g==
X-Gm-Message-State: AOJu0YxOtnVvzUoYqgfLfpBTzYannMgcaJtw2SAina14v/CqYfSu1/Su
 I73tivloGNJAR92DSBaW7HSCST1fnMlkWJdrKLsN1arsr6Hx1REjB+LouX/DnQ==
X-Gm-Gg: AeBDieux10KDBTpL4uxWTvvO71yNOSHwSePJKGtd8Cw+qA2V/dAFNkGIWXvh9sSygRT
 CDdjzvYpTKIpW/QiZ02GTVYNJ5gnf/3fHSd9HVxD6/uKwq6Pg8BvX72mbJDzXm6gUJoE8Pap5Hg
 PCPP50X9GfwSTyFmTUkfmI8LZIkVS50GjuGprlVYVSpkmYtao+HN5PcJkwwJclagQ1X/JWmyiN0
 RemL/45INxjjuFe+Zf34/J0sn2WW1GlPpSl64hxoZoYrxvo+4RAkiQumQ1ox+AEi6vIpsdpBxCc
 ea3FRrrxOUrXep6K09lHlfTnor3Q13yWvu+JA+dlvng2ghS1YAr6a0YcfgbGqLOsK2OV/ozIIyO
 3i3UHe+nOqFbk5I/D+J2pf0JhGWq+hrLIpzJSgqsinfvP2gZeMqN11pIwUBr68Yv34K9AaETSZf
 18ZAkJ0UEBealOr2J+p17qj6cozDcSl5n3AtveS8hruVKfSHDBOCgTqWjEETEX8nHeszEHEU5c6
 GwqgQ==
X-Received: by 2002:a05:6000:2906:b0:43c:f90b:5661 with SMTP id
 ffacd0b85a97d-43d642cb5f7mr8569281f8f.50.1775892322225; 
 Sat, 11 Apr 2026 00:25:22 -0700 (PDT)
Received: from pevik (cst-prg-2-237.cust.vodafone.cz. [46.135.2.237])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e50289sm14032504f8f.28.2026.04.11.00.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Apr 2026 00:25:21 -0700 (PDT)
Date: Sat, 11 Apr 2026 09:25:19 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20260411072519.GA179902@pevik>
References: <20260408193359.4047938-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260408193359.4047938-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775892322; x=1776497122; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rnheu9mIdd/eaZGnWJ7aEFpNAvAmPPFdk40ZZFL0QK4=;
 b=OrkNnnL39705p8MN0G9nQLe46q7l8sTol7iGMBhSTEqYuZCOpK4+JLKkp9M4o6mycM
 LqYz2zBzLv0aveyHd25EgfAitx1qXR/5BWCYG2lEdJFxxzMFOsR3qQ/hTe+hR/CFoTz6
 5RqC/wv9980soJniXlNg2qkgWiifjHEYcKSBsuc8mHrs7+7ILtKgUNtw2jNRLaG+uebg
 kiSNRd528LFLmgOiAWtabQ0Vz7H/U0ew1xedKumOC+P7SPcb/XolgnHa92VEe/YQWjvL
 8h6sUvcR0UKbQVVkuRdEB/v/Uu0cRVd5ew99Qbz7Tyk+GUBZDKtHjnon5yqcl4Uyf9rx
 Tv9g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=OrkNnnL3
Subject: Re: [Buildroot] [PATCH v2 1/2] package/libnl: enable host package
 variant
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

> host-libnl is needed for host-nfs-utils.
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * drop HOST_LIBNL_INSTALL_STAGING = YES as pointed by Thomas Petazzoni
> ---
>  package/libnl/libnl.mk | 3 +++
>  1 file changed, 3 insertions(+)

> diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
> index a0441b7835..b1254d2ba0 100644
> --- a/package/libnl/libnl.mk
> +++ b/package/libnl/libnl.mk
> @@ -13,6 +13,8 @@ LIBNL_CPE_ID_VALID = YES
>  LIBNL_INSTALL_STAGING = YES
>  LIBNL_DEPENDENCIES = host-bison host-flex host-pkgconf

> +HOST_LIBNL_DEPENDENCIES = host-bison host-flex host-pkgconf

I would personally reuse already defined variable:
HOST_LIBNL_DEPENDENCIES = $(LIBNL_DEPENDENCIES)
but I know that's not how is usually in Buildroot defined.

Kind regards,
Petr

> +
>  ifeq ($(BR2_PACKAGE_LIBNL_TOOLS),y)
>  LIBNL_CONF_OPTS += --enable-cli
>  else
> @@ -27,3 +29,4 @@ LIBNL_CONF_OPTS += --disable-unit-tests
>  endif

>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
