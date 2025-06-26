Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E28C7EE31
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 234114190A;
	Thu, 26 Jun 2025 19:29:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DtTVTdDvYpNM; Thu, 26 Jun 2025 19:29:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68E114190B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68E114190B;
	Thu, 26 Jun 2025 19:29:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E683C10A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCDE181DAB
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:29:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N1pu8TtfLTlm for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:29:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E77DD81CA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E77DD81CA3
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E77DD81CA3
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:29:10 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a4fea34e07so681807f8f.1
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750966149; x=1751570949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2h17wc8I+hQektW1YeW6WsfX3jhUrKvUhTLI0eEhPWI=;
 b=gmwofvmwlkiYvMYMtgf2UpN7XW7v7Et/DQhFL6mqHGdtC+rmFG4oStakrlkZ2CSRgz
 Nz6NRBfAs2n8LC5v1Zgeq3q5ow+0IkJC4GIm8XJ3olaXJfhsNdAvRHjiO1skgcjQxEU0
 RRu4It6bss/J3XzJFm/Jdq6Y9G2F58vaePINyfgpaPKePAAYYGLgS6yWJ8zIwTNehxz0
 Ioowg1AXQiqmOTB1pGb+VEeMOpLGaEPDt3I0h1etbEXPFKSGCL/wCCpbpwYmpKK+EZ6D
 +BmPSq+C94028Ek7qpgWorjYPnx6frIaUUXIHLd/eknmaLbhUxGIYm5qCCHIsqNwPQu6
 DhfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrlYQYQbjfUGqJ2ci2lYFrv02tINoxympefVUC4IB2WKfV8NgSIKjk0MPYVu0wY4hUwUdNNjBKMEk=@buildroot.org
X-Gm-Message-State: AOJu0YxAw7+7336qe7XOKwaJosPPGYpTpx4Ir71sCuzhQvMEvRzLlwqM
 mpanZjqHNvmMTs0HqbwdqOynObho0FVtaf5OosbiwMujg1ZVyY7osif7U80zyh9ADXM=
X-Gm-Gg: ASbGncvfFg9Nfmd0OoyI/8BYnReMhwz7XPbPe7P+OyurFYiTL6HoiJYlrP3AeVcNT89
 ocJGg6k4uPp3qlKwx7h61/d8zC5xqcgcOSmo4h/6Tc9QehIuql4tT3URpit0VPsBSM/oLR4tH3l
 6YFZxveLxDwHYQlSvOfOTZXW0FbFojjm0VHS9nlefqF1RqcU4SMXNto6Q4jUzj4+MBHJAnFmlwJ
 JMY7QZWbr0Fdav8lqCWJ8KwKYtOq0A54WoS+CPKvCS8TCMR1zrwlsJu2R+g1LNNDgRo8ZMsCwJ0
 XFUg1xec7eifDuBan5zzv0P14oJfZFHnlV2Vxahsx0EJRU0Ykq37hy8YQshCGruxTc1IDO4eXp5
 atanzCm9RHSVbxEBWsNRNanEj2CvWu1hT
X-Google-Smtp-Source: AGHT+IG6JHXvHi9CdsfD659Mir0jLqMr9bFSJ5MbaZ5IjK2+nWqZ1myIZ0XOo70Ziu40KJmcm5G+Yg==
X-Received: by 2002:adf:9cc2:0:b0:3a4:ee40:6c85 with SMTP id
 ffacd0b85a97d-3a90334192bmr563747f8f.54.1750966149040; 
 Thu, 26 Jun 2025 12:29:09 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a3fdfa6sm29059065e9.22.2025.06.26.12.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:29:08 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Jun 2025 21:28:59 +0200
Message-ID: <20250626192859.11805-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619195132.1986901-2-giulio.benetti@benettiengineering.com>
References: <20250619195132.1986901-2-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750966149; x=1751570949; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2h17wc8I+hQektW1YeW6WsfX3jhUrKvUhTLI0eEhPWI=;
 b=SPoJI4QC9Lzhnb/giyajHW6Ir5JkJpUexaR3N/nzl+0cBtQ9aiLs3HrgGO7ctZeJ0f
 bwqQjP0CSqmwg0DVFPcwsUuFCgMAUrJVSW3L95s4TwuQ6pHvj6kCEfYSol/BK21AwJW5
 lesbCbMc+T0ZdMyawNj4KggW+nas2YCpa3JkJvyvM+5aoUDMLa6j3vhK/iJTl6207Xuy
 lkDj/FHUGy8RmofxHsdm7CoTR1OcGP7kCxPvh5S9E1V+0iX4pRurV700x9ah0UghnEeB
 nL0j70zujSXqJgEwaHW3Ta0MUDip+othuX/kTJLsjm8enrpfHfN4w2z1KzS+8uhvLH9W
 YGZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SPoJI4QC
Subject: Re: [Buildroot] [PATCH] package/libblockdev: security bump to
 version 3.3.1
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
> This version fixes CVE-2025-6019, see:
> https://github.com/storaged-project/libblockdev/blob/3.3.1/NEWS.rst
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x. Thanks

> ---
>  package/libblockdev/libblockdev.hash | 2 +-
>  package/libblockdev/libblockdev.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libblockdev/libblockdev.hash b/package/libblockdev/libblockdev.hash
> index dd6f8b1a27..38450c656d 100644
> --- a/package/libblockdev/libblockdev.hash
> +++ b/package/libblockdev/libblockdev.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  c4738e1abedefffe886521f9f0e7a9306c6f50f7691d88e011438c88608bdfa7  libblockdev-3.3.0.tar.gz
> +sha256  a2e2e448a19d420480b8cce5e0752197482a65cb62a9ed55d88b237da36600d1  libblockdev-3.3.1.tar.gz
>  sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
> diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
> index 265cee2e28..ecee8dee24 100644
> --- a/package/libblockdev/libblockdev.mk
> +++ b/package/libblockdev/libblockdev.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBBLOCKDEV_VERSION = 3.3.0
> +LIBBLOCKDEV_VERSION = 3.3.1
>  LIBBLOCKDEV_SITE = https://github.com/storaged-project/libblockdev/releases/download/$(LIBBLOCKDEV_VERSION)
>  LIBBLOCKDEV_LICENSE = LGPL-2.1
>  LIBBLOCKDEV_LICENSE_FILES = LICENSE
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
