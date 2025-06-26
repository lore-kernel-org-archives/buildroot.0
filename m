Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD3AC7EE31
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69FA96079E;
	Thu, 26 Jun 2025 19:29:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZrxC6gYu5-zh; Thu, 26 Jun 2025 19:29:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9300860784
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9300860784;
	Thu, 26 Jun 2025 19:29:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AB70154
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CA6B81344
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:29:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lTquQEBb27f9 for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:29:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B25DF812EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B25DF812EB
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B25DF812EB
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:29:01 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a4e742dc97so1708538f8f.0
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750966140; x=1751570940;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i4MFnbcabVDSvQV6bamiNFY3sbYk7LQUM41b0i/8zNo=;
 b=DQ/YausUkWK0PhTTItV6We8MrHD5vfnmey2nW3xkCmj42w31gUktk4n37u1HaIZ/j4
 1hT0IQ0Fd1bfTiNzkaTfJourCwAcROKL/iHhCRc38d31TA6OXtZ5uFXVBvJLen5qedYZ
 2Ff1aHndDc/dqZdKyAol/31f7G4j8RzF+vLG6Ym/eu8ulTybDA27fVdURudPUFS9ngdU
 L0Y82VBY/4ZiUF1jeHOHNiBfx2Aq8FTRowOmrkfmGFKmqhbLP8Ws1T8E02YwstdpGory
 WElBUe1ZgqTkI5yzXbG4uXjUyY5WPeMVFScRFyMgaV/iRBX9yhNcEflFUIeUtqfEvwbM
 /FTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMcs8cMZMDSu4B9xJIXAvx1onMqy6NRifu5Ds9CgYFNskrj0E4ZQt4YwKdQZaJKc2z9MIEKZIHrXc=@buildroot.org
X-Gm-Message-State: AOJu0YwWp3iIWmR9q4Uxb8/X2CE61dleVcN1f5qOWDipzGCz/Sl2GE0Z
 ZnD/BKxzUcgHGZhyoWLU3dhHMwEXOaKI8ISQwYmVyt+24y6U66A7vLg3BW4zK9Mi8rmUnOJTDAd
 SucX6
X-Gm-Gg: ASbGnctE8ZJ7VOa6NzblkIfCWi7NNWubRxB999gRcXSAeoYvVHGr278JodwrXagQ72l
 oZLyNO5T4K5osv9vCOmiIvVVd5N1Kz+Z5VmdMlsO0a7ZmpjXr4w+J4x/UMpo6FYHdPdJiPJk8ap
 7aXlWeIv677eKDYN2Ha3AAR4GWT2UQj++AYRQetg8RhY3mi/SvgTTfEk8MxiWDWmKAjfB0txMzY
 N64WY+q0ziF14LSTfxf2e5kRFzbY96ucnl1cso8ZU6BRwW2xxi/l+L3Jq/XD9Yfm5zPrKVP0lUT
 j0KvPJQY/MBJAUSS7kIP/UOB3zP82gyAFuVYg3s++5PgDwQYpB15ccRRk3pP/vjuZ5wKnHdcpOS
 pI9jBUZ7yxRqFPOrYVOElYy9CnX9ZCK4j
X-Google-Smtp-Source: AGHT+IGHeIScf/NQJxxvwcST7Yz/iOXqkYfObfWLN6EegdKUkF+hDtT1n9Jv7sNzz+h19Z7tORwdlA==
X-Received: by 2002:a05:6000:1789:b0:3a0:b565:a2cb with SMTP id
 ffacd0b85a97d-3a97fcd271amr281272f8f.1.1750966139651; 
 Thu, 26 Jun 2025 12:28:59 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e5963csm663173f8f.79.2025.06.26.12.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:28:59 -0700 (PDT)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Jun 2025 21:28:50 +0200
Message-ID: <20250626192850.11750-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618212357.189395-1-romain.naour@smile.fr>
References: <20250618212357.189395-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750966140; x=1751570940; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i4MFnbcabVDSvQV6bamiNFY3sbYk7LQUM41b0i/8zNo=;
 b=VPAQQdmbUq+egJl2rjTbmxvZAjJfHlM/TJAcA72yv99jW1KmCwkpVCoLRPO+7ZK7eb
 uswgMPBsGjgpfUmEuOFFs37tniKEB++O7biHHlS0GQHq4ObuFw3i13zK/HMeuoXU/Fjf
 vuYXWuaSSnrX+bXapcjEttxXw6SAxnDEVXtKS6VmiOoTuB/ZPm0WLhcZZo1BgXWSg6fh
 7R1PYCrCXvj8LKuSrR+qe2tG0mxrl/NdyUowoYW9MVSPKbnv1XxVdJLsZZOPYW9thrM9
 LtWevOQW81/1nq93xMuILHrDB7T0NIsI9xgRy0ZQvr+6tLsjeL8S3nYQXSH2HkhhjAYm
 alQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VPAQQdmb
Subject: Re: [Buildroot] [PATCH] package/squashfs: update URL to source
 archive after Github changes
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
> The squashfs 4.6.1 archive hash has been changed suddenly two weeks
> ago by Github without any intended changes from the squashfs maintainer
> [1].
> 
> The orginal squashfs 4.6.1 archive has been manually uploaded again.
> 
> Update the URL to download the archive that match the expected hash.
> 
> Since we don't use the github download helper anymore, the squashfs
> archive name is changed from squashfs-4.6.1.tar.gz to
> squashfs-tools-4.6.1.tar.gz.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448207
> (and many more...)
> 
> See:
> [1] https://github.com/plougher/squashfs-tools/issues/313
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to 2025.02.x. Thanks

> ---
>  package/squashfs/squashfs.hash | 2 +-
>  package/squashfs/squashfs.mk   | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/squashfs/squashfs.hash b/package/squashfs/squashfs.hash
> index bc45b4ab5e..c921d638bb 100644
> --- a/package/squashfs/squashfs.hash
> +++ b/package/squashfs/squashfs.hash
> @@ -1,5 +1,5 @@
>  # Locally computed
> -sha256  94201754b36121a9f022a190c75f718441df15402df32c2b520ca331a107511c  squashfs-4.6.1.tar.gz
> +sha256  94201754b36121a9f022a190c75f718441df15402df32c2b520ca331a107511c  squashfs-tools-4.6.1.tar.gz
>  
>  # License files
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
> index b9fbf54b01..f2cb0ab25e 100644
> --- a/package/squashfs/squashfs.mk
> +++ b/package/squashfs/squashfs.mk
> @@ -5,7 +5,8 @@
>  ################################################################################
>  
>  SQUASHFS_VERSION = 4.6.1
> -SQUASHFS_SITE = $(call github,plougher,squashfs-tools,$(SQUASHFS_VERSION))
> +SQUASHFS_SOURCE = squashfs-tools-$(SQUASHFS_VERSION).tar.gz
> +SQUASHFS_SITE = https://github.com/plougher/squashfs-tools/releases/download/$(SQUASHFS_VERSION)
>  SQUASHFS_LICENSE = GPL-2.0+
>  SQUASHFS_LICENSE_FILES = COPYING
>  SQUASHFS_CPE_ID_VALID = YES
> -- 
> 2.49.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
