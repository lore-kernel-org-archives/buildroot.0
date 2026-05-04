Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBC0CD3430
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 951AD41BD7;
	Mon,  4 May 2026 14:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DMzRPnJ5dE99; Mon,  4 May 2026 14:47:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E9C341BF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906074;
	bh=NybEBySqjq7egtCBMjV/rYPeVUrFBTjsZz4nv2E1Xy0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fNO5ogLje+9Q5F1k2+AOBO/nA00WQaQ5lABcsZMJpbcpK2A425fFSti1DW4jMYkuW
	 CQCDZJlvvbaqIgCygypiHOxGV4+6y5LVN8olUulp2PuzlP0UqcF/LZoScdmGf7NSdx
	 qkqFbICI+tSB0QqkC28JM5K5Xx96QScJ5wSjmHF/ExgPL4NtDaCCKPUjbbeJbmAmRN
	 2+O2mBSJRLffgXsDxAvbmmbq3K2P3H76R+H4J7032fHYQlnBBypRLjSjulxohNwVf1
	 Y5KFaB34uPbMmK9O62lH0ODBjvxu3yo7kC0CW72cu5PZainasC9AVn2vbLjH100Y/J
	 XzxcsEQ93uBdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E9C341BF5;
	Mon,  4 May 2026 14:47:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B4883190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B22F41BF4
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OOax9fVGmUyL for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:47:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 93E2641BD7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93E2641BD7
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93E2641BD7
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:50 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-44c4cc7c1cfso1319740f8f.0
 for <buildroot@buildroot.org>; Mon, 04 May 2026 07:47:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906068; x=1778510868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oQuTdhZxncNkqB3o77x029/qcci9FrJlKy8J+Cf1oAw=;
 b=eEoTTvpzVO5YPSyV/+38IrW7NP6fHDGpAR22WnHiq0niHF2paHzrR4x6cl72CgTeNT
 J7oQHvxfSlwX70i+bTaDAvD/k3sichPbSEqVmM3HDZVX6Dsj/J6Z9e7oANpDweskjZ0W
 0mIt7quSRPpJsWRyt9ZzwTQVTOO236DL18u7c88JlrF4v2o2/mV5bL+KNjDKQYrywEpK
 tYrGadSFcmgE0YFQrDiPu78SXq3WSUe5cWB772/txhzuQuu2+/eoMy7njVAfMoyFaX67
 1AJnmc7AR0cgAmC8hIeMUMW7Y5ftme/roCwZubx3v5sG0QDym28jFGdhYH6HfgtPH7+l
 FUQg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/a4N0BGAmilD6SIUCLv2Vj6AULwtPHxuD+PeFahDMA4Uww7UYDzcRXhDD/JI7fCVDgFFRgy6U6y2w=@buildroot.org
X-Gm-Message-State: AOJu0Yxw7tO76icslMI274ItFudjACMuz6OefuVM98pyxtlm+TzgyDF9
 20kWG351w6UO77tlFl0KFMDrGK0a/AbSYO/sBDrJTonARpBpk6Rb27SePM8otZY51yh55gmnpGJ
 K24uc
X-Gm-Gg: AeBDietJEcREpIjo8+LtL1WiCWBoXlmrJKKZYOAnPNOyGPt34KKPTM9HHSWYdhBf4zF
 NWWv0mb/uKmF8pKxS/7U8gagx8PDT2fjy/glTe+lHL2eWKJREQ+Qgb+fVCM77v9U47HBX5oI/3e
 fja6ebCLkRFYBRyGUgSsSAj9wE9M4smPRk2/+MtaNhNtiS9vj0fhwNShR2mH3dV33Y8yJuj0EL0
 da48S/ZHvoqrgU6UwvEeFYPlyc7+icw7wwKLeFx1gmbDHyODXyFeqVxAfZpiiZYoTyaByqtyZTK
 +EiY9a2MmfzmY3p73Wu7rKDO97fYa/74YnisHjFEtJuOsGBTqAih1gS3GVcl+wWLTGZbRI06b6f
 021LAqDF3HwOLtZkBpiLK/6kg4BylChNpvd9HTzGQUqjoS6u8IEmonJ49c+ztOaukQtlPQ5c1/4
 gfEPRlpL8OMBZ48vM7ungj8f4AZg==
X-Received: by 2002:a05:6000:2088:b0:441:239e:2bb8 with SMTP id
 ffacd0b85a97d-44bb2f282d3mr16582109f8f.7.1777906068448; 
 Mon, 04 May 2026 07:47:48 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44a8ea7d0besm26501273f8f.4.2026.05.04.07.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:47:48 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  4 May 2026 16:47:47 +0200
Message-ID: <20260504144747.10446-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260422233421.1804260-1-fiona.klute@gmx.de>
References: <20260422233421.1804260-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906068; x=1778510868; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oQuTdhZxncNkqB3o77x029/qcci9FrJlKy8J+Cf1oAw=;
 b=IbOKO/6FQS6YnFXgAgVWRxZoVsSZrQb0XwKDsSRZrWUuHGhUZ8MVlncPH2oJaNQTXs
 47qKucaEhmyef9oOAMhFB7W2P1DDGX4yEfjN8sP0+l5vzFdKjxap6IfB4tthzdL99kvN
 jFBuDq/upf+6GNfABe6dMi7Ku0/gm/bafrLFMhZuV4DzWjoYpbjUElUgHX7DRn90yuCB
 q2EFyr/u08/f3z/x0oZT9Rl14JugbYVfV937/BcdaWvMe6FfDYrCSwIhas3+uKJY0qad
 oPkixN8DAmTyAWRiqcoqeIQ6Ocl/ubkOqDh1E5Fjfxia3S3hIaPv9ENVbaNv8j5tqfU0
 7uJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IbOKO/6F
Subject: Re: [Buildroot] [PATCH 1/1] package/btrfs-progs: remove unnecessary
 autoreconf
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
> Commit 1c11f9020ad98db11e6d67066d0fdb2cfab27605 removed the patch
> changing configure.ac with the bump to 6.10, so it is no longer
> needed.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> This patch is a side effect of me trying to update btrfs-progs to
> 6.19.1, I see now why so far nobody did: It breaks building a btrfs
> rootfs image with fakeroot, because fakeroot does not handle nftw (which
> btrfs-progs started using with 6.10.1).
> See: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1081976
> 
> This little cleanup should still make sense. :-)
> 
>  package/btrfs-progs/btrfs-progs.mk | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
> index 273c7e37f2..8691a5710e 100644
> --- a/package/btrfs-progs/btrfs-progs.mk
> +++ b/package/btrfs-progs/btrfs-progs.mk
> @@ -13,9 +13,6 @@ BTRFS_PROGS_LICENSE = GPL-2.0, LGPL-2.1+ (libbtrfsutil)
>  BTRFS_PROGS_LICENSE_FILES = COPYING libbtrfsutil/COPYING
>  BTRFS_PROGS_INSTALL_STAGING = YES
>  
> -# 0002-btrfs-progs-add-uClibc-ng-compatibility-for-printf-f.patch
> -BTRFS_PROGS_AUTORECONF = YES
> -
>  # Doesn't autodetect static-only and tries to build both
>  ifeq ($(BR2_STATIC_LIBS),y)
>  BTRFS_PROGS_MAKE_OPTS = static
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
