Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF49EED60F
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 16:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D52B580AF8;
	Thu,  1 Jan 2026 16:31:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oQF41UlV4F-P; Thu,  1 Jan 2026 16:31:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B50A80AFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767285074;
	bh=lhvnCi58zfckyM6ZbQq0vhxKNAjVfEGnluuFw5XgLS4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=V943keWuBedYVty5rMEdpQlKcKP+NLc5KuH/Mf4tIEnF+oEZfCyNHr2yiwQvkcBrM
	 eQdn7VuOPyETX1KcVFCkxW+1kDr8CfRYRVx4IypALGBOdeZQmFV+ofF5fUfUv79ocQ
	 PF02pT50T7fqoIRFBwtuDdBxcngPRU2IiSxCLIB+MckbTdHsdt0Ex41pnneYcmi3yd
	 ihzIGswrAdPjQOsKAGMFeJmGyRyaslM1N/CM58LRwQ24nMDWVMs91E44L7dWdzLC+c
	 6I8z1DULCBFhI9BwJmaL+GmWZt0pjUXASLT6Nif8UFTOwlMxjr3xAdt8HdlU2wCOuy
	 T2Ec5fFOSwvCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B50A80AFA;
	Thu,  1 Jan 2026 16:31:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 59FB1351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 16:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4092480AFA
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 16:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J4GivJHPovDo for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 16:31:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 99D3080AF8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99D3080AF8
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99D3080AF8
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 16:31:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D5E5DC1C39B;
 Thu,  1 Jan 2026 16:30:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7412160749;
 Thu,  1 Jan 2026 16:31:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 49A2D113B0777; Thu,  1 Jan 2026 17:31:05 +0100 (CET)
Date: Thu, 1 Jan 2026 17:31:04 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, Javad Rahimipetroudi
 <javad.rahimipetroudi@essensium.com>, Javad Rahimipetroudi
 <javad.rahimipetroudi@mind.be>, Sen Hastings <sen@hastings.org>
Message-ID: <20260101173104.649dbbaa@windsurf>
In-Reply-To: <20251003143043.641856-1-bernd@kuhls.net>
References: <20251003143043.641856-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767285067; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=7er6UtsREYtOnt7IKldcwoiJ3yDQPcZ7q4T1YWCUud8=;
 b=1FoAkvN5YiijKPe/7gQr6DtsSrkB76YwC0sPscCiEA7SPQIpWPkVBV64P64eJVx1f53eTk
 J9/Ot+vZ7XUhf3ipxiwoN+UOQM5cbtWSiK4xb7IQQWLEWFhQ/REY/w3bmym2RZmLsxPCCF
 VXTU2J6iyST5coaAscol/XrJXidqA5R0hl03P+nseu7anrNex144tLjr7Zt4Yic3a8E+U/
 Fb2hb5TER7f1muxkDn2ZvoqhGijhg3z2Hv81tF0Z4WVa56snst029jb7ksjQOInE1WOxii
 5cs3QXnXRS+B+3bcaaQQI9/Q2dMPKSmeGOXvUwDBUoCcsO+BWOhheQww3D5dNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=1FoAkvN5
Subject: Re: [Buildroot] [PATCH 1/2] package/libplacebo: add libplacebo
 package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri,  3 Oct 2025 16:30:42 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> From: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>
> 
> This patch adds libplacebo package that is used
> by mpv player.
> libplacebo is the core rendering algorithms and
> ideas of mpv rewritten as an independent library
> and contains a large assortment of video processing
> shaders, focusing on both quality and performance.
> 
> Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>

[...]

Thanks for the patch, I've applied, after doing a few tweaks.


> diff --git a/package/libplacebo/Config.in b/package/libplacebo/Config.in
> new file mode 100644
> index 0000000000..739de5c05c
> --- /dev/null
> +++ b/package/libplacebo/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_LIBPLACEBO
> +	bool "libplacebo"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC
> +	depends on !BR2_STATIC_LIBS # needs <dlfcn.h>
> +	help
> +	  libplacebo is, in a nutshell, the core rendering
> +	  algorithms and ideas of mpv rewritten as an
> +	  independent library. As of today, libplacebo
> +	  contains a large assortment of video processing
> +	  shaders, focusing on both quality and performance.

Lines were a bit too short, rewrapped.

> +
> +	  https://libplacebo.org
> +
> +comment "libplacebo needs a toolchain w/ dynamic library, threads, gcc >= 10"
> +	depends on BR2_USE_MMU
> +	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_10

This comment didn't match the actual dependencies.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
