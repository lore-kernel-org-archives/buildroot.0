Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451B1F436B8
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14C2B80240;
	Fri, 17 Apr 2026 15:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4tuODIhBM0Bb; Fri, 17 Apr 2026 15:24:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16E1881985
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439486;
	bh=PL62yISpBRwJ9jCGfHjaTaePSAsbddxWg45L5HBCpOI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IGCFLVcXlzO5TRloO7eihMDrsDf++WHAJcIJ7xe/DqiN6uSHhcwuGmbLe/654xgJh
	 /BdOdu+sGS7/pgFVj0qHCuIbBnHzvSDx9CnGNw0K2wscrFSontWMByxyTUsEXmEICT
	 Wnm+RJZQcfYqacJQZ7TDJ4P4oYpH66sWmHuT3o4lgCDFpQcVW/lhqecNmX8EA2ZBH6
	 lV0PYLzbP+mol5dp55d+l+rVlCZp0zD8wkUsTb3BRRowh6wru3kSJBRaF8xc8Aip/l
	 hsv6pL0t5u2ZTjCXiF1g32E7p1o/BEq1xkul0YKbqCooGgnXFZRm0mv6/GDLWCXeEL
	 R40sL6YNeggiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16E1881985;
	Fri, 17 Apr 2026 15:24:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 81827396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67D41405F5
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TY9Ga0WAUcLr for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:24:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1EB01405DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EB01405DC
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1EB01405DC
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:41 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-488af9fdaa7so5926155e9.1
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776439480; x=1777044280;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=y7jAp0RnWQBwVHZ8nCFcHCD6pEnsIr+xbsINGKr+dYI=;
 b=fGXIvIqMqPVegXxevcBFEWwaGDZKSYfU1vhvQjC037cziDqkCHB3cMak3P6AhIT3Tw
 cfUECLZSWUZHaJMRuNEUXVrV95pwqf+NiNsb61x6iGBYv9rZt4RxLLoVDmkcTK/0aLMy
 ILL5oBsvl98kWEM5jNEChTsP2B6vbaNp8Za3KUnFov/bp+WEIFS3CXsVpwrUa81peYCE
 rB1SPFT4uSGNFKGbalZutVrQ76S4+AD6pC6byTNorhjfLpivImtoktogTaKWn1GZPUNM
 FfgmPcM2I7A9CvjWA+t0XZoUahsapK5msg5MLzk/Yzrzwu23A0pBE6SpI3nNQ5ri2MaG
 GAyw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9dNGfaRDxCt8/48ZzuWfIIG9nk9g5d2VORWOZ7kpSpe7zxpV1Ri4kSBavD+UNclDJNi6oLkZVNyVE=@buildroot.org
X-Gm-Message-State: AOJu0Yzm3lsaCcMpO9ziRvhPDLCd/EkqukEu1UsVROwT8Wkv15VPFtWK
 m/3QODMLJlf/s+AYZpPJ+lXgQEepK4inwpDR+VtqyGBvtdRlP+4dQ5atbMSI65Y/s4VWWREAL4R
 axoVL
X-Gm-Gg: AeBDieuZv0Mz+Trj+rhQ5URh0O7oKmfVrBp3Zm9Gr8DrGybEMq4FJGJEhjYxLSkfxSd
 jsN4dFYjiSwZ7fifszCKIN4PU2FMif02QmboXfCSMqvu50HjecqEs9iy3Gcs0EXT317gQzooPcA
 AhI+NUZFU9eFbizl4eE4BRtR1yDZRmx9z7ykLhqWjPVdwRf8z7lY3xfvqT5s8qh54WvOc9epwQ0
 mDKOD0IMK19VVdiSrlu+s4+WgsQ71QIzBwCTPj9Gm3tGmfTYwqxjFCuzFC2kOLuKJEEuMx0Mso9
 1/Dy2vZ0frjZNWyFUADatPUIr1i3Y0ogujWKDFunjUuWN6A0+kr53QQjAfoY/U/3BHNayLKhZs0
 yaP+31xzF97LYKIu0RciXpdML6n6ghT4x3x3JxUoeNAonvZ5gAHpTo7N2NQJ0zZOUmy2R8dWc77
 Coy31dWu4a1In5hE4jLsFdXOev9Acvo1cvr7GuHA==
X-Received: by 2002:a05:600d:8448:b0:488:f3f4:b8c8 with SMTP id
 5b1f17b1804b1-488fb78dd98mr40346285e9.30.1776439480000; 
 Fri, 17 Apr 2026 08:24:40 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e3a381sm5814576f8f.21.2026.04.17.08.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 08:24:39 -0700 (PDT)
To: Scott Fan <fancp2007@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:24:38 +0200
Message-ID: <20260417152439.312909-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20250925014217.1562831-1-fancp2007@gmail.com>
References: <20250925014217.1562831-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776439480; x=1777044280; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y7jAp0RnWQBwVHZ8nCFcHCD6pEnsIr+xbsINGKr+dYI=;
 b=S0zG+e3w07kQkwvNlZRk6t7CH9j9oVZHo/BR3mqXWF7JXl6A8G5dz4OIZhES0f7PIZ
 Htxlv3MDiIrfKqr82ai8EkJPcQYt2pmHdSxqsdihyJTRL28zvKEUxqJSEvmT+a4BBLWz
 +ubIepu/od8sfNc51HPHTVqdCK/ML1mw9xhiy4kYjDJPCUVwZl1J8QT96q+nDR1fowCC
 +5So65EgLzhnvlWbafkmnCywEM4am57A5j2Ix/JD+052lX9NerXUexMX0v4Y4qM0hJVQ
 7i3fe+CD3OZb9A/bZau+17jfyihe2XiQsUL10hGE6H8lMX4cfHGo4ROx6mX8Ib5liXRU
 8eVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=S0zG+e3w
Subject: Re: [Buildroot] [PATCH 1/2] package/libopenssl: bump version to
 3.5.3
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
> This release incorporates the following bug fixes and mitigations:
> - Added FIPS 140-3 PCT on DH key generation.
> - Fixed the synthesised OPENSSL_VERSION_NUMBER.
> 
> https://github.com/openssl/openssl/releases/tag/openssl-3.5.3
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Applied to 2025.02.x. Thanks

> ---
>  package/libopenssl/libopenssl.hash | 4 ++--
>  package/libopenssl/libopenssl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
> index 7f3795e1ac..d0ca45d303 100644
> --- a/package/libopenssl/libopenssl.hash
> +++ b/package/libopenssl/libopenssl.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/openssl/openssl/releases/download/openssl-3.5.2/openssl-3.5.2.tar.gz.sha256
> -sha256  c53a47e5e441c930c3928cf7bf6fb00e5d129b630e0aa873b08258656e7345ec  openssl-3.5.2.tar.gz
> +# From https://github.com/openssl/openssl/releases/download/openssl-3.5.3/openssl-3.5.3.tar.gz.sha256
> +sha256  c9489d2abcf943cdc8329a57092331c598a402938054dc3a22218aea8a8ec3bf  openssl-3.5.3.tar.gz
>  
>  # License files
>  sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index 38d04ea924..b892d4e236 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBOPENSSL_VERSION = 3.5.2
> +LIBOPENSSL_VERSION = 3.5.3
>  LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
>  LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
>  LIBOPENSSL_LICENSE = Apache-2.0
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
