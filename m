Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEC6CD4F48
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 188B484657;
	Fri, 15 May 2026 17:47:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qEvSrX6VmnhV; Fri, 15 May 2026 17:47:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31903846D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867226;
	bh=HtLavv7i+7f7nl8oWgZb29Ltz6UEgT6Lc1MvS1O9u/c=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TOY9cp5nrbjy9lICHAbC06me8O3UPPwcXxk3TuqEwLaFFOUdxSVv4WyUal29VOP+2
	 buqB/qeVE+4D/yPjbwesaJKuni0sk1Dz7EKUA0zcaWnCceJh3Sp/dBfrnvXEpRoTFy
	 Yb2IOoCJIfZ8dfaMl0aVwaUxc0hcHtiho6GwX1uwX+YBCDZuUPIo7Q5Q9aA2SD1Y+J
	 SmSIYGw/ToWkY0iwL/pnBpbmgLdyIZb/hqxg5aAjNDv1+1lxZi0+U+8LfWeQl7k8Yk
	 9pjC8MxAU0p3nZ76/Bm/R2PFOfaxQnGeoAkJu6ZIAesH7+C1hCJjQSsAApTO9NALji
	 2ufDd0TVu0y+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31903846D8;
	Fri, 15 May 2026 17:47:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AD7E23F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 291FB61623
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vbwostYS1QUU for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 10ECB61697
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10ECB61697
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 10ECB61697
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:46 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-43fe3e22e33so29674f8f.0
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:46:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778867205; x=1779472005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vhsDL0w+FwSq/3r/1zFIuLCEP6bmQJeRAsNOdSC1c/4=;
 b=GFW3VjjZpq7thMj+gdNUxRaba/KxSowVhT9EIv9949X+JbSfegsjTUBSvRVpOUC3W+
 FpBf5bDNpDS12k2gk8RZ0rgqbpnvDH3sq7Q4kIwu31AC00V7SGQxUDB2uehTZyQC7vuD
 JbCB7Y7PqlnJSMXiFb3XdPcWd52d3L5otTAW7pvNvNcqA7Ja6jRKsPXMNZjWYEKa60ef
 v9Dxnvl5gim1KD0YFS6RMaYZC6EApzU4zkHfeqXGIFDCt4K1v514hcq6ABHnAvaiOkvG
 z5YhpKzSSJwwGLkmEkRbqbX16CDE+5wdOX6Vz0wrGFzxQRYh5R92glWHwZDO3Y4WnwQN
 himA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+q2qEqjyZ2ZO91X3wlE4FhWhUUIVnei4Ek+b81Q3Z8LqpluuHOmpNMVd+KnsYHriuEP0UMXJ4fDKY=@buildroot.org
X-Gm-Message-State: AOJu0YzYdB8kAO5IE1Fnsn9QPSanDBzmmnNMkG++mLGDvdIDHtJ+vMxO
 w9Q6bFeNXS7rsuRnlkev+R3M7X1ZZgEVu3B4xW76FQ6iu/B3sJ9dImx1qm5/LL5tr+s=
X-Gm-Gg: Acq92OEgvYaQef8YU1+oPbZiNPiW/YeqqJ7kJxzScAzoWJMQfWqS/oAkjDFVT5BQagk
 LKoc15AVeL6yqELEbHKgEjb+ip3aIfMruBU/xcYVc1xGRpU4ggGquH8V6VvrgXETIWV3Uc0vlG0
 SkoPgzH1KcCLOziWcxTYcIhsEx+EGzyF1YR2FUGXTbm03lc36CZmjHCgyuI3s3tCAaow2k7ovfI
 J3N1+o9WW41zHRWEWshWbnM0KWQLzC/Cx9//z0LAx1uA86ibkLKLYzu47ayn8iwvlvVUaNGPrPR
 9kllGaIrJ7BSezjDXkdhHdaQ/MFP752cXOmrJFOWRYDQEu3FiYIXfeBzrGCTGkwUaBFuPjSWSVN
 2MXxzQNa71qZnPB8uabYT/0fuVco0SeyxWlO2oWkYdw1PDTsfeGdHX0ABZM0CCjht0GDSmOtMVZ
 XZqYTkm5rNd9lpkuQ+4G+5Ht6ylYgWAYSGoh7Au/Al8ZAy
X-Received: by 2002:a05:6000:26c4:b0:45c:3f0b:be08 with SMTP id
 ffacd0b85a97d-45e5c5e2db1mr7758039f8f.23.1778867205047; 
 Fri, 15 May 2026 10:46:45 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9e768bcesm17461536f8f.4.2026.05.15.10.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 10:46:44 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 19:46:44 +0200
Message-ID: <20260515174644.530595-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260505195834.1390763-1-giulio.benetti@benettiengineering.com>
References: <20260505195834.1390763-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778867205; x=1779472005; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vhsDL0w+FwSq/3r/1zFIuLCEP6bmQJeRAsNOdSC1c/4=;
 b=WjWLylJ0doI3i4wcSLTotCNAyst13OMQYnv0VYWqBovfbeo/sVklqDqc8uXDxNrmO5
 Xg45ZkZBLTXTbCt+Dx8JeAFRhRuGHBLa9XsAv20oyzpfkiIOmYrnQvFogDtjASmadqvP
 5se3Qex+Mq8SfTuV3IjcBvq21erJKdl9EGnSy2SMCpv1JWA4waMgn1uSPKsXaWTlaZxZ
 NxavULzn2lERcbE5SxWgiso8t/QC5ehKT85JgBTSIJuuBp09Ph/hbLZVIswkTtM78Q64
 gX3wHREjjSfKdx6VzPO4abBCHoZQ++/QU8qLIciWHHSwx6egbpvAYh1Y/b6DrdlA/A+1
 402w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WjWLylJ0
Subject: Re: [Buildroot] [PATCH] package/ffmpeg: bump version to 6.1.5
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
> https://git.videolan.org/?p=ffmpeg.git;a=blob;f=Changelog;h=cae4a8c6ded2d2cddbfc4bb247564ebf3f997479;hb=a44ab44236a99ae26594fb3e14fe0c956210673d
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/ffmpeg/ffmpeg.hash | 4 ++--
>  package/ffmpeg/ffmpeg.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
> index 1ffef61309..4c489f168c 100644
> --- a/package/ffmpeg/ffmpeg.hash
> +++ b/package/ffmpeg/ffmpeg.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  a231e3d5742c44b1cdaebfb98ad7b6200d12763e0b6db9e1e2c5891f2c083a18  ffmpeg-6.1.4.tar.xz
> +sha256  05fbe9db1f5452a3605bb1d9bf91da9d4bb08162891692e4f172b58c49109412  ffmpeg-6.1.5.tar.xz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
> -sha256  b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
> +sha256  246041b6ecf9bc32d718a62c57877c78b5eb397b6467e74ed7ae2626ab189c30  COPYING.LGPLv2.1
>  sha256  cb48bf09a11f5fb576cddb0431c8f5ed0a60157a9ec942adffc13907cbe083f2  LICENSE.md
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index 1efcbf87aa..1289cd5e72 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FFMPEG_VERSION = 6.1.4
> +FFMPEG_VERSION = 6.1.5
>  FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
>  FFMPEG_SITE = https://ffmpeg.org/releases
>  FFMPEG_INSTALL_STAGING = YES
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
