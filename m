Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6B1C2A06C
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 16:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C504806C9;
	Sun,  4 Jan 2026 16:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xX8WUCzjRI9N; Sun,  4 Jan 2026 16:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3C3880790
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767545204;
	bh=QWDY/BbuORZp9zA6EU/diO3EmLiHZrvEzyIIzL6WMl0=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=FQPaNNr1Rp9QcyryfqTcl7U/WtdKTD6dvKyKaM+ekeMLYyis4D1fw7uybqI7j3Zm9
	 scy/qhCRdn4wsEsgFbchpSFlFsUnapCCnFathkM0xiVGgpUW8BMnyusGPG4Mh6/yvf
	 rLGQT9JHvIqOuEOB5gPwNFVItxS+/pA3iMDyBf2FJ8Q7Thlbs4rrKdcxl9mghDiAQe
	 Ls5AOIkk0hU8Vw/AhAuTlfJCA1yH/sFgJp+JqImwveCyPW9u5L477ZpAqQiVgz7e1O
	 kD8FDWoYlvA+VgZ9COL7uctSn1NDHqBtDf3CXL/y/8Qiujg0O+n+uQ0/+wOmgPQMNC
	 xSavoUQJPFq/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3C3880790;
	Sun,  4 Jan 2026 16:46:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C2ECE7
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 16:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1035A403D2
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 16:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aVnEvWEGvEab for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 16:46:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 33569403CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33569403CC
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33569403CC
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 16:46:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id C5565C1C96E;
 Sun,  4 Jan 2026 16:46:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 948776072B;
 Sun,  4 Jan 2026 16:46:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 72E0A113B06CE; Sun,  4 Jan 2026 17:46:38 +0100 (CET)
Date: Sun, 4 Jan 2026 17:46:37 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20260104174637.3421eaea@windsurf>
In-Reply-To: <20260104143240.4126891-2-fiona.klute@gmx.de>
References: <20260104143240.4126891-1-fiona.klute@gmx.de>
 <20260104143240.4126891-2-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767545199; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=jEFFQR37YgGpVrdnuWMF2kI6//yivAoqAVdDQs0mNbM=;
 b=FtTME792nuR2AnhFUqLr8qfnNm/kWO58OfGojEQQeoEEXP22Sqt32FMpb3CzNi3jGa+3/+
 2x4YuiLzwKw9uD1TnLIY/ZvVHciJ4pCrV9eNW+XutonURUur5SzZYnoSnqCjxUOEknIgkk
 RXFDfWI1MoFdO2Ncz9707c0t4TxgfUcg+eMvg5i2+uGx0e4pmtxtjCNViImMNJCoBQRpHd
 GF/RIFN8Ow+yP3jcMSWmrXzwOyZRa8XThRbC1x9svt/SLSDpkVgMxHphWgR7F0ja8+qWi9
 GGP/wUrb3V4OH1L451ySByhrO+o2gldgn+bnEUZCO2La8JQxzfDX2yEnH5amFQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=FtTME792
Subject: Re: [Buildroot] [PATCH 2/2] package/python-memray: require
 toolchain with C++ support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fiona,

On Sun,  4 Jan 2026 15:32:40 +0100
Fiona Klute <fiona.klute@gmx.de> wrote:

> During the build Cython creates C++ source that needs to be
> compiled. The missing dependency did not show in the existing runtime
> test because the Bootlin stable toolchains include C++ support.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> ---
>  package/python-memray/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-memray/Config.in b/package/python-memray/Config.in
> index afd0adc901..75f13e8597 100644
> --- a/package/python-memray/Config.in
> +++ b/package/python-memray/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_PYTHON_MEMRAY
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # elfutils/libdebuginfod
>  	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
> +	depends on BR2_INSTALL_LIBSTDCPP
>  	select BR2_PACKAGE_ELFUTILS
>  	select BR2_PACKAGE_ELFUTILS_LIBDEBUGINFOD
>  	select BR2_PACKAGE_LIBUNWIND

I realize that the whole package lacks a Config.in comment documenting
the dependencies, could you add it, perhaps as a preparatory commit?

Also, please indicate in the commit log which commit introduced the
issue.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
