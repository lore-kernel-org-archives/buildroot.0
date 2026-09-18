Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F32C982DC
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAD4640D11;
	Fri, 18 Sep 2026 13:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0r848FRHMXoe; Fri, 18 Sep 2026 13:09:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DFE5E40D49
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736980;
	b=e+zAQN2TUuL2iCnxepKDloEHajnXhlglJ8TxbSLxyMRzLTUyo08Mla54OJsRIf6kSvCA
	 pMD15UNIrp/iLfaTMTqDjA7f/0H37LveQKjasbvHx9K7QeErORfU0Sr7wckRHRi+jcuO1
	 gy44RlSxrO8Wy/d43oiMJ/3FNQqklRMzp0r0aIh0WaoisyGtNMsHsXgHJo7DqvdHl7H1I
	 Pf7ltdKPP0staxcBum0vMQ5kZZz01i5QDfw2yDWWB0xRYf0ILiGKHOF3zYxuExHN506xk
	 6UxO+UVHZhxNH9ayJy4Foy+BZ+Zcii+B2SuBBpoVArtDBcALDityyzkI/ea5Z555b0w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736980;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=mxog4c8YnC9H59Jolu/7ECYGLopoFDacxlfuuzcs4KM=;
	b=qUMXSvtYMFj2m5lkdisodMCQ5SDzd7OjNp+NjKzZULIdlDGBkPGVtG2WE9XLPbBg4Jd/
	 helpyCJYqgyXBdre6KosuRUNJtftkrTVrZdxFKTo6yX0SOiV/JJXIu5F/xQw0Rg8cS3VL
	 EwvBIg8duFKw1OpdAq+LDhwKOWXuG7GqcYLsm4GC9B3i1bTVOHx3875FbEkKHucv0szFU
	 Qlh+6rZa+TMqSq5WmIMp+17vOTiYxe/DllzihYLM+5RW/xPIZe0UUKZ0xREKvQh2M+We0
	 K4VNSKxpmgOqSggw4oKxrCwg531lPvXHGlpbhNUeBkpqIrNBukcB5XOLwnEvo5/1sCA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736980;
	bh=mxog4c8YnC9H59Jolu/7ECYGLopoFDacxlfuuzcs4KM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SHmAeeOWxa8DAZa8n++FDi0ISvBQtcewo6Ld+wbHnZT1WXsZXz+EG1sg5tEs2lcAb
	 f8RdTbaUzIlIzPZhEVjZkjrf4QFaVSB60a7s+7k+OOFq6Id/TqPhO7CasbUODiDUub
	 lla8Ls/i2U2PWahODzGMZqTTBWd+fipQwVKD7AFX6J0COvo1ag+2qLzaH2Y6V8ryQ4
	 tx3GlTSBl08Uf4c4ysN3rT3438eotVHhhj2zmwCGQS8wtrmnOQQYGJaW+3do3zMxUG
	 YlfKk2PFSjYYZtH0PVBP4ovA97GDxlRDuRwIYfcemF58MahCjXs//h2kMFiIFI7J06
	 dwPtg4vXlgEjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFE5E40D49;
	Fri, 18 Sep 2026 13:09:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 466A3224
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C77940CF0
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:09:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cyfNImmN4AQX for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:09:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1802F40D49
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736975;
 b=VmrsGz9a16LCRiSAjrV8NjyIln0sp19a+++/bHlRSmHaa1UCPGWjxLBEqFniDhfrOxNw
 SHF41nQ5dBRz4/Hxz7vCjnWSfa4lTa4QfhLcEbvPbAks0j2YB/sZ+7z3DmrKiSyXY+s4e
 Rk8qDIatEUpEFSSzHqxck5YK2F5/NbA3Vic/qdKZwQ+wyp6iIqS5GkftiY7m1s6liYT+t
 buWo3hEJ8Dh2fwo6xs1EnTmeTK9nJhqUk9aAU/JqEPWlnSD0mBF6BGioKgzfdF/PBLg7X
 OIQhkmVPEAJHduL29B4bcTcsWPyY27Y31wOAlcaZpJM+fWFwpABUz25Dnl8kcdnN7hQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736975;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=4N7WLZSi9zp9ovlWLNN3XI7nms0n27t2vJ+ucwctVD8=;
 b=F0Y2B7Q92FceLi4/2BUvapTGBdiGego373JtsOimcD2wO/d3Gr9g6Q0wkjU1DY9bFHQ9
 eRltLaPQ6Qiq4kErVWJ7iivfhcDTKpj8Z5SDn6eOaLmOBUlYanplCEfV2ZRWRcICFRdnu
 PCt0bYdR0FReMzoDDb8eeD/mMlV7x176XTlOnZ8a7fZS+TyzkQYRJcnB+GFmkuPcUom0v
 7PVf4q6W19mIHDAky5fziEmb2DGOTUnAwc4jqoYINaMPzeos7MELfGvVIt/1K0mA+82fG
 ZqhkuZCTOt3kcB+fi736LgRGARSAo41AUvJb2eVSN132WAGOvBr1DInsaGE8aKyr6og==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=DC9Quhcu; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1802F40D49
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:09:35 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49b912e4b11so4176405e9.3
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 06:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789736973; x=1790341773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4N7WLZSi9zp9ovlWLNN3XI7nms0n27t2vJ+ucwctVD8=;
 b=b/NMZstHlzwRJEiXDts5xsla/l15HthihTVRO7QXthMjI3UHnoidoYpCi6kKRp9opQ
 sd5pICQ5eaoNJT36nbJjSnUWNWeFWdAqVv4RS2zlHXMYqjhfqShTOsutHagxyuAMWrBw
 rbgmv45/gLaUmeCLEmXcpwkz/SCbvVDHIoO89UkAkbVVfH7JOnkY/6cPGinHA+GHKcW1
 BqeHVCdBx1u9+kdedhViCJH36fhC6UDrLEk09AcHxCcFbxzXXbuPMoYfjQbKYN//Gw5A
 eFTkthmDpZXqLhiO3bfjUdjI35ohiVBlt2qB+vHK/RBSYOLAH2/kddU4HHcfabjKQ7Xc
 yiuw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwKgBFKj3UgDaxH8U1LF7F1/nlFn4uMjGwNPQ71UCGCyory1oImMl6aQitogXaNUCn5N34Cq+rkrtM=@buildroot.org
X-Gm-Message-State: AFuF++mOknQV/XRwc2PpW3zhUbZIeu++ZFX611amvd5o2o6xZe7Uy0j3
 mTuac4tPCJHYagfyMwRNh1iFUoCWy+mv9gR3S4X58NU3K5V7h7YqDem+g6+1Z0TjFRo=
X-Gm-Gg: AYBFou3LhZ+1fPZ1H2PrZsmsvmHT6lhLGNRuOGzaznwVhyZJYniE1r9aOvTvHJQiAsI
 kWGZNnEpLTiGCxPgqFCczlhYqg/rev/IxukQnVGA/nEU5AO9ipTBdgIVeGw8cepITp+IwKRBzwa
 zMvKF3rCQaVefxEzodvAjV4pdRCTKQGEPuEgFrRL1CYiW4FxM20Qw83jLzuNl9RCq/AOGrGYF5G
 oV7LfJUYcOocrSYiEBdcAq6E1461pxlwTgnf/r46YD+JjVnFKlexSRsWF0HRXNO9eH1VecyrfTk
 fC7rfX913rC6TOouasTGVcsxeN4Rui6E4+B1M6XzxeWO2xKFaO3fVqAmxEBWx5Vml/o0IDaD3c3
 P1Y+haofygwAhmF0IfYb3V3g/Ta86T7DbU9OYCkjoTjsbmFGxYYwdDsxRR0BhiH5xL4l7V07Vnu
 fwJNyChHLFIDGZ2Zy03EGTaewhhlB3BR6BHLXjlaAH6E9+vXqRrAl0EoymebaeHoLw
X-Received: by 2002:a05:600c:3584:b0:49c:fc6e:a3d9 with SMTP id
 5b1f17b1804b1-49fc584fa71mr42657785e9.24.1789736973149; 
 Fri, 18 Sep 2026 06:09:33 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fc7cfd1dasm55599315e9.9.2026.09.18.06.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 06:09:32 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 18 Sep 2026 15:09:31 +0200
Message-ID: <20260918130931.163480-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910201105.2543208-1-bernd@kuhls.net>
References: <20260910201105.2543208-1-bernd@kuhls.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/xz: security bump version to
 5.8.4
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
> https://github.com/tukaani-project/xz/releases/tag/v5.8.4
> 
> - lzma_alone_decoder(), lzma_lzip_decoder(),
>   lzma_auto_decoder(), and lzma_microlzma_decoder(): Fix an
>   invalid memory access after memory allocation has failed and
>   the application reinitializes the existing decoder to decode
>   a different file. This bug could at least result in a crash.
>   This is tracked as GHSA-5qpq-xqfv-j9pg. CVE number is pending.
>   (Also in v5.2, v5.4, and v5.6.)
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/d8ad85198932bc421166413ecf9cc821917c56a9
> 
>  package/xz/xz.hash | 4 ++--
>  package/xz/xz.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/xz/xz.hash b/package/xz/xz.hash
> index 488a3d55dc..270ac748db 100644
> --- a/package/xz/xz.hash
> +++ b/package/xz/xz.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/tukaani-project/xz/releases/tag/v5.8.3
> -sha256  33bf69c0d6c698e83a68f77e6c1f465778e418ca0b3d59860d3ab446f4ac99a6  xz-5.8.3.tar.bz2
> +# From https://github.com/tukaani-project/xz/releases/tag/v5.8.4
> +sha256  3340ae48f88665abc78d71dc43446fb3f7e70b48fd59844ac0e14958cef6e00b  xz-5.8.4.tar.bz2
>  
>  # Hash for license files
>  sha256  616a3ad264ce29b8f1cb97e53037b139d406899ca8d1f799651e17bfa09830b8  COPYING
> diff --git a/package/xz/xz.mk b/package/xz/xz.mk
> index 056c168057..c3232966ee 100644
> --- a/package/xz/xz.mk
> +++ b/package/xz/xz.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XZ_VERSION = 5.8.3
> +XZ_VERSION = 5.8.4
>  XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
>  XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
>  XZ_INSTALL_STAGING = YES
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
