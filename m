Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4135C7115A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 13:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97551816A0;
	Thu, 19 Jun 2025 13:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B2P4fJkD2a2S; Thu, 19 Jun 2025 13:53:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D506813A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D506813A4;
	Thu, 19 Jun 2025 13:53:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FEC9E2
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 13:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 168CD40088
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 13:53:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NjcUjh9NZZcz for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 13:53:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 34E114005D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34E114005D
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34E114005D
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 13:53:20 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6097d144923so1723760a12.1
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 06:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750341198; x=1750945998;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yRLaaN5ekmjD4iaxulBG15vAKVf2QElHESW0vSzqV1I=;
 b=brV6uja669tuXp/4MlkA+3A9sZxfvcDJVOf5uJM1wtQaylOJutQrVyVvtlG7Dc6/Qg
 3yO8NDGTy7xgwjCjLjYm4Kq2Ij3nr4K/cv3XPHKQaekjxcoBTFXg/rYVhFA4MbWCf533
 beIWV+cqFQGbKgYFcvlyjKRMapYyMwn87IhyeHot1e7cAURNCEqLfgNBmSmEbrU4tTB/
 YWzatfS/ReELS/r7eauZ2GJ32DZ+KqpD6uxFObv5Wgw0ujjo7l33uKI9TWwK9DxtpNpE
 T32YlzgAwTY5LBlnouyouArfSf3PGgMJKfEzwEzdVpjaFnGII5pkqvc0+9NsG/CzR/Sx
 ta0w==
X-Gm-Message-State: AOJu0Yzx6XRHYwHThqtRIxvQohcIg1CmRHH67u1FZedTCPiNqIiIn6oC
 u0SbVNWybJ0qdhGXo01tEFusKmMnuuWnLBj4PzVgG16lWbUU5UBrL3uhU3A+93RepnD6yDzXFDO
 +TexL
X-Gm-Gg: ASbGncvubVutVylIUg1rm2oTiU/ibV+O5PxjY21zGvv5TlMijJpJBzkNA7JVYR9eNAg
 fRsBkZo+jopIsqwSQHyJWoozxzqq+sGoqGvlFto/9AH6GSIOtLy4R58lKDENX//bWvokbM8hhQv
 k9Fun790vh1C4heJr/WOJoCUY3w+zdZFci3SnlLlUc8d675HC20nWFzyY5SBjSVnlTurs3m3GXO
 7V2KR8j60wGrIMGWU8Dt3PevCFhfv71IFv9ApSL9HtQeK3zYO/Y+TQ6qNHA8XGOBjGP8IlkedBM
 Wi9UqVnwm0Xkx1W6z2dj4Wgvn8jNzIWBjXsRJJJb1tSzNOXbg9S2MlxGCgkQp34EsRx9v7ioRWF
 M
X-Google-Smtp-Source: AGHT+IHD2tsmxhTKYDAyCdY8RB4i39tUJ+WG/i3na1ydPp97N15f/ZKcrAga2YEh/Mtq1GnEDhmI3g==
X-Received: by 2002:a05:6402:5247:b0:608:40bf:caed with SMTP id
 4fb4d7f45d1cf-609e3fcda1bmr3008385a12.7.1750341198006; 
 Thu, 19 Jun 2025 06:53:18 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-608b4ae4d18sm10932399a12.76.2025.06.19.06.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jun 2025 06:53:17 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu, 19 Jun 2025 15:53:08 +0200
Message-ID: <20250619135308.406025-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750341198; x=1750945998; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yRLaaN5ekmjD4iaxulBG15vAKVf2QElHESW0vSzqV1I=;
 b=VOc+AuKFGTPOUZV0TQd/DU4QwGqxK7qZrUYTZYcUn4aDyT6GODtVlwBu4lC6RbNlSL
 +gL51mTt4XkDPjoOpg8/szhTObHFPsO6Qgn+abfA0yK9r7QuOpIQXuf/c4TxHo4dmWlB
 1Ojf15Vn2tRea3bpo1zJzmSwxL8IyR9BDXAaEIdvrTf82C6oLst7sesCkhqLTTuCvSxl
 +npKpAd1PJWYt4Xa8lDwYRW2evuWVziAkzYLYbqHjjGjdrNP7AYjwnnR/UBnEzTGHyKN
 0R89yQPwlERYJWUaPFkZhckngWdz/K+G4QQz3B5Cb1FTOSzfEEkhn04QJ3yXL9bnaPvJ
 wbXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VOc+AuKF
Subject: Re: [Buildroot] [PATCH 1/2] package/samba4: security bump version to
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
> Release notes:
> https://www.samba.org/samba/history/samba-4.21.5.html
> https://www.samba.org/samba/history/samba-4.21.6.html
> 
> Version 4.21.6 fixes CVE-2025-0620:
> https://www.samba.org/samba/security/CVE-2025-0620.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/samba4/samba4.hash | 4 ++--
>  package/samba4/samba4.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
> index 86b11b4d1f..6c4205853e 100644
> --- a/package/samba4/samba4.hash
> +++ b/package/samba4/samba4.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -# https://download.samba.org/pub/samba/stable/samba-4.21.4.tar.asc
> -sha256  50acf030db0ce6be1ee8a6c3a7636e54576c60a7f814e64becfa840f7b30eced  samba-4.21.4.tar.gz
> +# https://download.samba.org/pub/samba/stable/samba-4.21.6.tar.asc
> +sha256  681bad60f57959436350751bc89e893b8c106ac882cc7420f93f419e1d188688  samba-4.21.6.tar.gz
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
> index 828de56fc8..7ba0aa3346 100644
> --- a/package/samba4/samba4.mk
> +++ b/package/samba4/samba4.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SAMBA4_VERSION = 4.21.4
> +SAMBA4_VERSION = 4.21.6
>  SAMBA4_SITE = https://download.samba.org/pub/samba/stable
>  SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
>  SAMBA4_INSTALL_STAGING = YES
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
