Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B858C7EE31
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9B3B612A7;
	Thu, 26 Jun 2025 19:55:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2BUSQFOaSQ5F; Thu, 26 Jun 2025 19:55:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E92A0612A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E92A0612A8;
	Thu, 26 Jun 2025 19:55:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D207C154
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF9884035E
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:54:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JSnj51HzGWXn for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:54:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E74E140075
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E74E140075
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E74E140075
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:54:58 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45348bff79fso14500445e9.2
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:54:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750967697; x=1751572497;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hAmHbz+2iD+l62H26AV9vVM9fTsmzMJOAcx+1EggVwc=;
 b=YRaIFa40tpF020x2ZGu1Gma29tQGvDW86yrJ0EKF5LCXHrg0LiNr4CyGZi+r+GS+YX
 0m1dBhRVilRlQ5/wSIFGexrdUkxCdebzb/exXzrpCZsrdLTHCcogXsZ6Ahy7eYs4li09
 4dr6BM04FBglZ4edBESU1MknLzfWbUe9FPd9BYFnafDxf9TtgYrXCPvRiNM+uleegqtx
 Ji5ktdmC+RZYXKA4g+ZpMcZo5c0lNMuY05USt75TYB+MtVPC1oNXLaS+gPqS1vQ2PvL9
 e6p1WwwcDmCriCbOwcPq52NO2soanmtEKQuKAev/ZfiQobZK//KWE38lfRFRZcXH9Mo9
 pPIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzw/cbQw5mgCEfKqRzkKxgyExbPBWnv2XZjExquXXSp4W1y19AcQft7Xr9VBHM4LvdEaL8ZYIhJ10=@buildroot.org
X-Gm-Message-State: AOJu0Yxqisji8EceyP7f6ShG2Sb6lbqz+roc1klrbfwxWfFzBrQXe9mb
 V03vDc4vgVxpYxC25fRFOjZ8u0zYQ7xmEZyaOtKPumbt5ZTkB/ztNkfvgarI/Roz2AE=
X-Gm-Gg: ASbGncsEE1GF9xCp8t7ckjXTtzc9sHIfwCRbPpc+CPy+T9rLWBF6ioS95K85hVCe9xk
 Bp2l9fR9WGC9v1YnE/lL37Wy9I6PXIw2N0k37pr6NXjfmywrlHyWaf6fRuDU1p4jSiz0tStJji/
 rCgM6Zx3ETyJwuAtzWBggqhweG7ztMnS1lywdaKhlMGCypx9ur4TTNRPq152cyZZ6GbSN3K4IRv
 rV+AKJcanOVVl3ChADKpyo+YA+QYHaZ7NfWUPKd8770e2X4V8EVKSDCal5CQxgRX7fvA+qe9478
 QRkWDxz4Vi20+K5hB4XIq3xDpcxP7lecRTgJ03Ul/ozvIgsLPUdEneB4UNoGevypOlbTTni/J6s
 7zwgyRjLNHQLiLIuiTa+ELbLL2K4n+WYCnvndPCXSiiY=
X-Google-Smtp-Source: AGHT+IGD7UCOG/2yf8t8AHUUiQb+3zPiApbaNdH8j5l5hJp+F2jCQ+x0GyhNcQfDkFw+nQdGlhLwOQ==
X-Received: by 2002:a05:600c:4f12:b0:450:cf42:7565 with SMTP id
 5b1f17b1804b1-4538ee84c5fmr5228565e9.23.1750967696943; 
 Thu, 26 Jun 2025 12:54:56 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a390d3fsm29443255e9.1.2025.06.26.12.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:54:56 -0700 (PDT)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Jun 2025 21:54:48 +0200
Message-ID: <20250626195448.15907-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618212357.189395-1-romain.naour@smile.fr>
References: <20250618212357.189395-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750967697; x=1751572497; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hAmHbz+2iD+l62H26AV9vVM9fTsmzMJOAcx+1EggVwc=;
 b=VvvAJIuLsL/5Z2ylMLd165xkSWh2b2HJzhBJQo7mjvakCiHcK6DVJ8uY4QAMhskYgS
 9FSVZhZlnogWX+RTYGfkEx7KPwoWVS88JJCyezZpT/CdJZS3kGJRV2oDYu6ZJATi6cFA
 gHIO+7qJmV9C9LddgmPCouFh4XVBo+6bGQ87LcFLRzn5YF6WRAGbmc5uyoEHeXXWtULE
 BVs2zkUcEH+VsqBapz8z4drBpK7k7XViW0ZkKHLdigxeLHSvmY75FVCiRQq/ggnfUWtB
 LoYCLYFTpGC8HKx74U0WrxGiEiaansOjs58Rr/YZs/2bFMkRj6yZCtk+uCVSSzXUPM0Q
 wHKw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VvvAJIuL
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

Applied to 2025.05.x. Thanks

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
