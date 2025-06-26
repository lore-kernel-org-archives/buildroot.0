Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58425C7EE30
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C5B64077C;
	Thu, 26 Jun 2025 19:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8J-DS_3YNsxR; Thu, 26 Jun 2025 19:55:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 392E4406A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 392E4406A7;
	Thu, 26 Jun 2025 19:55:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CE7810A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ECC7406F8
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8lG97dmPFcTZ for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:55:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4363040647
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4363040647
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4363040647
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:55:08 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45363645a8eso10323035e9.1
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750967706; x=1751572506;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TVpmAucmdSyeO0V995DPG3SdTiQpCejmSuORBzDDaQw=;
 b=c+tzJkwOcAGdxwgvyorg4+Ife7WL9hkejOfUNCxCEkdR3rnCmQxGel819beib9jP9I
 jzG7G+2qbdWiVtzmTMw1BKkjk7p5ysHxrleg9Ir7d2jZitkA3eoTm+TpnThTB2GDAdEd
 NxSF1N9aY6vuobuhXYG6rgYgddBLpwa5Vmrh7AsarvEARa5Ya4vpteQrrly06To2IE01
 zID9g8aDWI4NBS3zYTMXtwhS7I8/TKnwV45OcWixle5KrJM+CSWVQlYVuFQiyj9weBiK
 7Ff8JS5YCKRxKqCvxrrpKatZLcBjyOsD+LQOyprYLtfWG3kK0f5ox2QzMfxE/yZUD7gr
 mCTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKT8oXpj+Br7W/VkXi9f9A46of2VpATMmaGONMpkynrtjwtbZkp63vch8w1jM/UeODOqRLdvunN2Y=@buildroot.org
X-Gm-Message-State: AOJu0Yy9qeRu18+jzNr944VGcpdvZV7PbKDaFiszdlQynyow2y3dO+xG
 0UW9Drfz9tCbgCAKWI4w6cmZGj23ubJbSL5qay1OwVW/6l9NYPyuS1tXrFj2vcbN/8b3vSwChNj
 aclP9
X-Gm-Gg: ASbGnctWj9xQNm1/Uob/wu88/BNVFQOiBAxDCS/3zXx9e4Xu+Lfr/0i9q47LxtJ8R3h
 m2D1zPIJ/RAGDT6F2AgxL28Q8cxZdrZ0NCEmpNSe4G9EH60kmlh2D+07K0WhxpicLOKyX2pjPA8
 mbQKG77NJKoZJMbVYVu2hFdaIzT7+smjluqGhe2ZMl9NJixww3E9RD02xi26R84FL/TRtdG24MT
 S5oAd4SSl83kZsGV2C6TWRNM0glVAZfzoJCnYO65sj3KHu5W54o4ZcSPbGzdH78rLdHJ2idPvWT
 3OixG1yaZRsfGTqD1nevyYz5R0BJENq/vV5ErrChIHlE6QASuAYJovh9NA/b3/SS286/7Ctc5qJ
 CLBglLBQXiuP8guiWUif6lJM2U/r1hqSt
X-Google-Smtp-Source: AGHT+IFSEO5tr3QNBAKhPAFc/u5C+gX55je/RVDQrQL6eP0KOvn/AulzY3p9D5tTjfgVwUpELAFvgQ==
X-Received: by 2002:a05:600c:83c6:b0:453:c39:d0a7 with SMTP id
 5b1f17b1804b1-4538ee2a73cmr5189685e9.5.1750967706389; 
 Thu, 26 Jun 2025 12:55:06 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453823b75cdsm57260755e9.32.2025.06.26.12.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:55:05 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Jun 2025 21:54:57 +0200
Message-ID: <20250626195457.15978-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619195132.1986901-2-giulio.benetti@benettiengineering.com>
References: <20250619195132.1986901-2-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750967706; x=1751572506; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TVpmAucmdSyeO0V995DPG3SdTiQpCejmSuORBzDDaQw=;
 b=QNpMVWm1GZi8FFyjit8Tv5ggxpD2EsUQZHwibED9OfnvbSIk8bOBzDRpcTrTZ71uik
 VuM/jHAnhXRspgePLdbMncGZ2fAZ8DP4aJtMawJWGR9CO5K2SI912eCVPuujz6U9MbYJ
 03MWVSa6cRGzz6PMf8fczhHGRikQk0kFrvyP4bFrcNsFQfhftCig34Gw/sIeAQJTCY9y
 7ULs3LeBFPAwuE37NhOwxVm0nmkmDPR5+aqZjiMtsOzFAwhMlEgqWV+Q4IcoVBR3HHHZ
 wgnKLyCNBL6T6rJLFTeM9WNqp9UU21QATK1xf46KlHjvGk/DCMOZ/2LrlWo7nFP341wW
 R/Hg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QNpMVWm1
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

Applied to 2025.05.x. Thanks

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
