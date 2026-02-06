Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DD0EB28E5
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1358612A6;
	Fri,  6 Feb 2026 08:12:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 11NIYkMQpVNb; Fri,  6 Feb 2026 08:12:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F09E1612B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365554;
	bh=bfAoORnqF2N575q2nwerXr03KXX3pG/XlYzBELWWWjs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IGs6tPechRyDMrV0FRpxHceTfDygJMjXoxPzPGzNJb24441DcBSDluMrGpXCvSU1i
	 4QE5L0zMQAq69DzD+jRgY+7MGAUFNptXbUYCF+Xt41BuextvZYFRDVjltmPX8hiVdI
	 xdJ1i+tma6MlZ8E6Nznd91Fg+CMUOypcG6Z3DclhlfYKszikooG1zxVgDg9JblWKEt
	 D7ArOdQveDhF3h3UEd3CFwoUwTCUNnIcniItBl3AP0PJBd+AhgexYY+4ntmRh/V+mF
	 681PJFdNibvdgSNW3SARGYbCyK1wq9rVntfAlGNbkH9QBkqfj8gk4zOUwBfkQZpXX7
	 y8E2vQz/CgyoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F09E1612B5;
	Fri,  6 Feb 2026 08:12:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12467173
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DC7684045
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05k01F8tna97 for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:12:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 00ED584040
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00ED584040
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 00ED584040
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:12 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47edd6111b4so20848175e9.1
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:12:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365531; x=1770970331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AfzhMtONY6LCm9Y4MYwQuaNh1E0QvW9x+zLqB5ygmfY=;
 b=qI5TmZ91VGJcghZdPlmeS0Y8Zter6JneY3/6cxJfUzHOVTtB4TEgpXfBSYZl4s5jtD
 2YJsaL4APpN9/yHcZo+yR6/6wuQo/YUwqKm2OWdTglggoiJUoinAeyt1vjL/3D8VZbfu
 SCDBG5FulATua7VkkC83JgF1C8FUn2dn8dOgXILwqr7IFtHHRrWF5zUps1QCj23OonU2
 e0ZkdZHWNDA8psLoZa6IFtSscDbU5cNQkXjykvefAdmZDraBF9P0Nm1Yijx2zycgCmKp
 EhfqO/N8wchz6YQwDDWHXo8fRchuuaikNR5EflwnW6Zu1SFLQUnSkMJ3uxgbLfa1MDag
 4gxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2gJ3QPOleezzXPMtXueiN7Cmgr0X/w1ASuTAtvx/8Vsnz04K+bqN8Vb0e69xp9caw/R/pVUBmed8=@buildroot.org
X-Gm-Message-State: AOJu0YzerBplp9jDe3esoN/DHOkp7Dd78JxCQZiunVDRaGMzaU/Raqd0
 y9vV0zw0/jFmTDnWJDBjDVTf2DPT7SmqyqMfjajOOTPrgByEGax/8bBzMGCL49Tph/Y=
X-Gm-Gg: AZuq6aIebjcaWpO/xuNmCoYXtXfr31DBYprjANHNbg14izmiIR4PV/7Uit2lwe16zl3
 ppk/ZgigZWPZvbTKYhT0VEhU1XXoYY9koid04Y9kGYRe39UocJ+LAehYGcTfNPLru2ETARWCpwL
 I8t+TOy+mfbbihkpGIHMoWQuk8jI/1Q5Dn26dUB0isD7sQfEkc5anrnIcz76nH8bnsdxnZNLdCw
 NZeiZh9VeDyf7drhbMGGhcUEJRNkw1A6HgtybBC+XLD4Yga29To9ulpP7rrCr5DSdu1nqXfKkC0
 wUOKzPzSUil8NJiO9uGJKR5dp7FZjVh/Yu4X1tH/w6PfLBDTO76TyWZAdtT99fU1oD6n+/hXTWG
 jpm/6YrTOrTk2d1oi57O7SK04ncir60TPfwQUHJ17JiR2qhWCAxdryv/3ycMWVbl6eGwpspppfI
 sCNQo=
X-Received: by 2002:a05:600c:1d8c:b0:480:6873:b2f6 with SMTP id
 5b1f17b1804b1-48320216ce4mr23388245e9.20.1770365530950; 
 Fri, 06 Feb 2026 00:12:10 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d299bfsm101961135e9.2.2026.02.06.00.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:12:10 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:12:10 +0100
Message-ID: <20260206081210.33357-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131175745.2467286-1-bernd@kuhls.net>
References: <20260131175745.2467286-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365531; x=1770970331; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AfzhMtONY6LCm9Y4MYwQuaNh1E0QvW9x+zLqB5ygmfY=;
 b=e/JXlhOLpdrq0AGpD98URlpvzevgHsR2ZbaMjO8PxZRBJXRd57R2OUm9PVPklHLTs8
 3RF2LMBaqJXWOtpoBQ6ec6lrp+d+FxLLbDlS2605NNjzu1dpF5P6ujpCDWFeoL1+0GK3
 UGLR273Gi/1OE/uRLdvJjNa6FJN1+czxxnZjm2xErrucewunQux0BMRW2x6r+h4Icd72
 gq2xPQFSF0HdV0FoNvG5ZxPxkAJsffB0+mBdnBQ/9uIyBzwjuDrR1lbofQ8QsHXZrxFm
 I3lQD7EGfH+uPLceQbxuxee89sBqTerX74xA0+VXVSODHkg7idYdKmhVcei4pnEaKXOw
 q2eQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=e/JXlhOL
Subject: Re: [Buildroot] [PATCH 1/1] package/expat: security bump version to
 2.7.4
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
> https://github.com/libexpat/libexpat/blob/R_2_7_4/expat/Changes
> 
> Fixes CVE-2026-24515 & CVE-2026-25210.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/expat/expat.hash | 3 ++-
>  package/expat/expat.mk   | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/expat/expat.hash b/package/expat/expat.hash
> index 9d99c38a45..7536e7cb1d 100644
> --- a/package/expat/expat.hash
> +++ b/package/expat/expat.hash
> @@ -1,3 +1,4 @@
> +# From https://github.com/libexpat/libexpat/releases/tag/R_2_7_4
> +sha256  9e9cabb457c1e09de91db2706d8365645792638eb3be1f94dbb2149301086ac0  expat-2.7.4.tar.xz
>  # Locally calculated
> -sha256  71df8f40706a7bb0a80a5367079ea75d91da4f8c65c58ec59bcdfbf7decdab9f  expat-2.7.3.tar.xz
>  sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
> diff --git a/package/expat/expat.mk b/package/expat/expat.mk
> index 07aba205cf..215c34e9cf 100644
> --- a/package/expat/expat.mk
> +++ b/package/expat/expat.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -EXPAT_VERSION = 2.7.3
> +EXPAT_VERSION = 2.7.4
>  EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
>  EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
>  EXPAT_INSTALL_STAGING = YES
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
