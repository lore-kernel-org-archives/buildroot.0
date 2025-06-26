Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8531C7EE31
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9080C612B1;
	Thu, 26 Jun 2025 19:56:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w3vtX9ra7z_a; Thu, 26 Jun 2025 19:56:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C42356129B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C42356129B;
	Thu, 26 Jun 2025 19:56:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1350110A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE18D4030D
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:56:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id whivPjlHWHUL for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:56:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EA4CD402A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA4CD402A7
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA4CD402A7
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:56:11 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a365a6804eso902504f8f.3
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750967770; x=1751572570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9db+V3Q3u5QJsepwzSuG2DKmCFcLUr6ivPF05/gfIM8=;
 b=iEL96AdKE7KeQ/OWTGIYBhp8GmJRUoGkWOOiximw2f+YwA/hk5UqqbRkNwbzP0E3RZ
 gYe1r8BxzD6CmMkQCH4BbfKXbbPeO29qxZKzs+7S4vGcLinqZK9TYFXkRFpuhcPiW/BW
 plZHK7k+Z8d5kvdkLjpkU0cyYc7XZ6oBrzrPkRJxwPFuPO6T/Zi/uttn4HAJ+/YoFTac
 Y4Q5SpsRnNV4UwkZGx7rjuSULvoelWy77MT8NjF1X6ImQf1QppxFIYP/yafnvGW6VSHS
 tzH1seTEW5hddtvU+pCNTp1WNIND/S0HBqGmOOXgECkhLQ06akw0hgCRMevojEvD8ViC
 CuHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyPKFZY7Wo93f7nEaoORcAa3e6cZEVN/b9/D3raG+iKRsrG5qrpAVLU47LPe+8d5qD/rlyy0/3gH0=@buildroot.org
X-Gm-Message-State: AOJu0Yx9trFlX8wvxLyo9QMl5CdLj4EYXALYEUI0I1xRALvJRrNROLQq
 Ric8vmZCOjwFiv6gg0ZVHrGMonXfwgKZU9BCFkts3D3N9ZjlmRhOtfEcoWOuMTOz+50=
X-Gm-Gg: ASbGncvoEr647SE5PEj81muXhZtOpU84d5bCl/hYZGBxCE0p2AEZzYCDgR8tpCtNWXF
 a6n3lKQn/QCoPnxBd9r8gcjXXheAm7FwJKcv9qWgQLI1cb+1xDFqIXq/l+EmCL55dy+Tf/T1eGR
 O3m69o1DejFxjkHIvAtXiia2yz8bnRq6uD0L+s7GxQ19bnA1/RmeYVid1UWFvKBhhobS1q8Nl7x
 GUU3dBtb96GEwmKu2s130sjytEtamqBuV8OgcBm/UsQ9OfNh2oSAcNAquQeDMBGijlAGO54JCL6
 +1mTpOgYijbcMPwfgMwvN3a+8RNojIJ9E3ExskUpQl3X0O4fVXwEFI/9uzBeaCbqgWzHDn1VgdR
 1MXqVcZR1F5qPTzBa15rtBtU28coIvOjP
X-Google-Smtp-Source: AGHT+IHSg+F1+2lPcWewZDeeN9iAFzM5xgR2NcoXN+8s1N4y6gE1SwZc5uXkZyYgQRMZ10jZdCDdlg==
X-Received: by 2002:a05:6000:645:b0:3a4:d53d:be20 with SMTP id
 ffacd0b85a97d-3a8fdff4832mr595592f8f.18.1750967769895; 
 Thu, 26 Jun 2025 12:56:09 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a4235cbsm29227225e9.38.2025.06.26.12.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:56:09 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Jun 2025 21:56:00 +0200
Message-ID: <20250626195600.16315-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620063114.21344-1-bernd@kuhls.net>
References: <20250620063114.21344-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750967770; x=1751572570; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9db+V3Q3u5QJsepwzSuG2DKmCFcLUr6ivPF05/gfIM8=;
 b=HA7O1C96F7iu5egbOWdnJdbIWLHv6TbtQXJHcvFTXVtSgcILYv9qEg2YZ3K0w0Gjpb
 9UjdqksV4a/pFQpHvSyfoPp0B2yvqWAg0yMGN4SjrzA55EFqnQdETM4nAyLt7fRvz6la
 A71tOXxjPeQio0QMQKIRxBEY8esnhV5V0QLyc7nqudqFHWitVxBpP1sggE2Xx1wNNbD1
 0AF4AAamxiPT+NRcwca8kWov5tX9KPtAmwG0znQtJCBlYSuZd9RX7k9KMsb8QHNL2LCx
 FqlhccOQ8XUCN0hIo/ruYtiLJRE+rU66lqT0eGlmt6a7TSttHa3PO+VScoaQQctNH3Qj
 9bMA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HA7O1C96
Subject: Re: [Buildroot] [PATCH 1/1] package/clamav: bump version to 1.4.3
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
> https://blog.clamav.net/2024/08/clamav-140-feature-release-and-clamav.html
> https://blog.clamav.net/2024/09/clamav-141-132-107-and-010312-security.html
> https://blog.clamav.net/2025/01/clamav-142-and-108-security-patch.html
> https://blog.clamav.net/2025/06/clamav-143-and-109-security-patch.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.05.x. Thanks

> ---
>  package/clamav/clamav.hash | 2 +-
>  package/clamav/clamav.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
> index 5989682671..5f83d57661 100644
> --- a/package/clamav/clamav.hash
> +++ b/package/clamav/clamav.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  5d3a20633bd589f612a71905a4fb50c1ee857cfbe6c72644368cac0030a1eeb4  clamav-1.0.9.tar.gz
> +sha256  d874cabf3d4765b35b518ef535658a1e6ec74802006a1d613f9f124aa1343210  clamav-1.4.3.tar.gz
>  sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING.txt
>  sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING/COPYING.bzip2
>  sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING/COPYING.file
> diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
> index 0a88cc1b9f..93ddfaae5b 100644
> --- a/package/clamav/clamav.mk
> +++ b/package/clamav/clamav.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CLAMAV_VERSION = 1.0.9
> +CLAMAV_VERSION = 1.4.3
>  CLAMAV_SITE = https://www.clamav.net/downloads/production
>  CLAMAV_LICENSE = GPL-2.0
>  CLAMAV_LICENSE_FILES = \
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
