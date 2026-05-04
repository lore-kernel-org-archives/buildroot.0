Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD74ACD3430
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B30C46157A;
	Mon,  4 May 2026 14:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rRexIhDTBlCI; Mon,  4 May 2026 14:48:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C73C36152A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906092;
	bh=StOzOUI80hdAhCK2Qjc6AIW5BIgx5lDqZa0S3UvcpAs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qWz63fhTOkfD23zAHEy7xXKtRVSOWX0kpUhIRIPH7KjqCiQIcTByZiEvn+/JLRn+D
	 vjaDlWYryk+EZTlbjfAXbRsuAwh/v7JR4nMMYyEXxBphasRH4Z8/1xBLNSQ3qMO7e6
	 3mxb5SLB3T6cqIScM55A2q758pL9LCVR/sIoS2Jf2mnUfJztGaqb8D9pe6rudBdczM
	 nZamdgk0l6wyeLH48WFhGg5XrszGMqSzJr9zwGu9uYmy9TsfWTeol3Zj92A71qtUnV
	 6PWn0zYim5gGtP5fxGJpun5ixP5KO+lgpecJGF0a8ukbmVmZ6fZY0GIDiekySH/Voa
	 MDJu9kjmKi/+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C73C36152A;
	Mon,  4 May 2026 14:48:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C3CF3190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9E99845D6
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zbyATQwJYzOg for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:48:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9F96B845DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F96B845DD
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F96B845DD
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:10 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4891e86fabeso52342055e9.1
 for <buildroot@buildroot.org>; Mon, 04 May 2026 07:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906089; x=1778510889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4SS7XEcCjxueeyIqA62hO2D9AgmT1F8A4lUi2KPmA1w=;
 b=WjLbvHS98UQGevEtEj9liniM4Egq/hVEMhfaBMs5/10Gndc40Xm06r8AsG4CIm6RAM
 AB/NhqEqYcncI2/N0g/R50XeGUDz1VxyCflkPXcLXjvdExWlO0sIWxkodIJCeisXetyy
 fCVw1Qyg8ZgVG2p71qXT2ZYFNyXD1MzeFCf8WD2X9paLZXMmutiU46h7ywv1JMtbkp3/
 O2aH0sg8j6TZon1gF9E1mXyJ35ldA/t9nUUYGCzDBszXO8NtCN6U+ESpOrxESl4KzkRl
 b3blrablsqIhYJ6V5hdpxfRtdRhuiQYk+zRKgxuHV65afWDMcG/0tbNAQNbnnGLtk+79
 ANKw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8hN31+l0pJFL2PUni5XOYOAfdbDE1zpo3V3JpYZ4DS3eA1Gj6Aso5Dqamm8nT5xIH23eVifWW7Q6E=@buildroot.org
X-Gm-Message-State: AOJu0Yz02HWTl0WbP97TkP6anpfw0/1oeQpiOMYzRK3pIPS2jJXI+6Ec
 Tyu291f3GSlnM8+z1GXzyb4b4hlWVxKcGOUvX1bVV7n6ty43kMuzM3YGsnjT5thguoA=
X-Gm-Gg: AeBDietAsob1VlboW/4m6xgLzapKMEcJIuLAOFkviD/LnQNZ8qI9UIFE1/qamfDX3zb
 6j0vTWSdc3pqzBcoNr8LTSa56gGnu7f6UTrYMkUquq5pAmwRmmCzsGJ0vvI3w/MBUlzL+nZJ3mC
 QdYQlb3lxUAeDsVqZhUSrb0iNERWlDtGc029GQa8UUypMRxFSRObRRwGwfgjljob2Wl5ndA0q5I
 89t0hbnfoS53DIEQTHVd+WGit2nP7NS2X2CgylIh24YY4jcyq2gDcoVU+AKVVCanzMjEbpHlted
 jlk1GK815t7ABMgG+ExxsSufGtO/PDxtuATvvQa9imuMH+AX6CsTaRAv8cZp3rnbCQs0Axwuxu8
 Gl1ekwzIsPyNVwfBNUuXoDFabc9RPHMtTK+hxZs7ykpU33dPdSOtqSSpBEVGO99DkTRXYCtuHD5
 CNywWvcKQc92qvEiszACBiFcfuPQ==
X-Received: by 2002:a05:600c:a402:b0:486:fba7:b150 with SMTP id
 5b1f17b1804b1-48a9865f7c3mr122850745e9.15.1777906088686; 
 Mon, 04 May 2026 07:48:08 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8ebc4201sm443791655e9.15.2026.05.04.07.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:48:08 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  4 May 2026 16:48:07 +0200
Message-ID: <20260504144807.10989-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260420175839.3705382-1-bernd@kuhls.net>
References: <20260420175839.3705382-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906089; x=1778510889; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4SS7XEcCjxueeyIqA62hO2D9AgmT1F8A4lUi2KPmA1w=;
 b=XTcGJ1kONf/zwk8XB6Qso2izDeBvm+TLYkUJCgb82pIUREShPd0K84/ChskfFVOOva
 0bBZ0wKJ2Nvc5WCS/BtB9oEkr2Q4cDIae+Xn2lnX0DhGdREcqs5WNPpCvk48dHdwJS1D
 lPQmixNb4ue//qDFxE0WnSCCMQX5PI+Oa711FGdUr+soo59HZ/QDzsPK18qbKaOXM84u
 5zLtp3LYFtLBN0s4LX3RKkcgNvrjBb1KS5jIrqK9MawFSq4OiCAuTMgwfZo4X3F8Mvq6
 RhaOLQPNw/Y7C6BjIGlJnm3NY0CUwOWMaWSJU4luS/FT6156hhSS3+Rh6tHcEKeF9d1z
 2BzQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XTcGJ1kO
Subject: Re: [Buildroot] [PATCH 1/1] package/libpjsip: security bump version
 to 2.16
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
> https://github.com/pjsip/pjproject/releases/tag/2.16
> 
> Fixes CVE-2025-65102:
> https://github.com/pjsip/pjproject/security/advisories/GHSA-w5vr-39x7-h8g5
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  package/libpjsip/libpjsip.hash | 2 +-
>  package/libpjsip/libpjsip.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
> index e85d1f47b4..65f52bf3b1 100644
> --- a/package/libpjsip/libpjsip.hash
> +++ b/package/libpjsip/libpjsip.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  8f3bd99caf003f96ed8038b8a36031eb9d8cd9eaea1eaff7e01c2eef6bd55706  pjproject-2.15.1.tar.gz
> +sha256  3af2e481d51aaa095897820fa2ee26c30e530590c6ca56d23e4133bbdad369eb  pjproject-2.16.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
> index 69b3c1cffc..8cea8e3abc 100644
> --- a/package/libpjsip/libpjsip.mk
> +++ b/package/libpjsip/libpjsip.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBPJSIP_VERSION = 2.15.1
> +LIBPJSIP_VERSION = 2.16
>  LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.gz
>  LIBPJSIP_SITE = $(call github,pjsip,pjproject,$(LIBPJSIP_VERSION))
>  
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
