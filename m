Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89443D10F21
	for <buildroot@archiver.kernel.org>; Wed, 26 Nov 2025 11:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A89A8113B;
	Wed, 26 Nov 2025 11:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NYKsu2kz8GIM; Wed, 26 Nov 2025 11:00:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53FB781141
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53FB781141;
	Wed, 26 Nov 2025 11:00:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BD7532A9
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 11:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A422940789
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 11:00:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jx9yfbsdHimb for <buildroot@buildroot.org>;
 Wed, 26 Nov 2025 11:00:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BDC2940748
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDC2940748
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BDC2940748
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 11:00:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id AC9B54E418DE;
 Wed, 26 Nov 2025 10:59:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8362760721;
 Wed, 26 Nov 2025 10:59:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8CEDD102F0828; Wed, 26 Nov 2025 11:59:55 +0100 (CET)
Date: Wed, 26 Nov 2025 11:59:54 +0100
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20251126115954.1922ba41@windsurf>
In-Reply-To: <20251126-rasdaemon-v1-1-38c590f3e591@bootlin.com>
References: <20251126-rasdaemon-v1-0-38c590f3e591@bootlin.com>
 <20251126-rasdaemon-v1-1-38c590f3e591@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1764154796; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=T5RBITpQ3CB+USZf+ihEH446VRYPS3sCd6f6M/c0cM0=;
 b=Y7J0lOLbFOv8c2Qk1M8XK4YDecqpb3FymCnRf6oi1MruvaHGEoEY9SlAVOuvMyfdjm/bE6
 kYOntkFkSbO/NwB9cUvvAK7Yk4rra5uXOYTQXDA961UmakC3WR6QaFdmgePcJ3JhQNA6ZS
 TaF1o7Q4ZXVS0W3T8F6F3eqoY6NFXsbYo3fDAKN2R5zeBpBRhuBQpo6mqNt3G42oHLlRsb
 muI9af4gTh/7DHofeGe6PUe0MEDiu9NZ1CPlR0g7SRenCAk1Z9HsYx6sw85v43+snlTsAp
 qxf0fJXiRfDtciNexrISdsiSIgO38tzzQ/goAW+ZYDjw9krDdV2kOUcWvcOIkg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Y7J0lOLb
Subject: Re: [Buildroot] [PATCH 1/2] package/rasdaemon: Add rasdaemon package
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

Hello Bastien,

Thanks for the patch! Some comments below.

On Wed, 26 Nov 2025 11:20:09 +0100
Bastien Curutchet <bastien.curutchet@bootlin.com> wrote:


> diff --git a/package/rasdaemon/Config.in b/package/rasdaemon/Config.in
> new file mode 100644
> index 0000000000000000000000000000000000000000..f6ceb3585ce5612ba598b182e6538a49d1adb8f8
> --- /dev/null
> +++ b/package/rasdaemon/Config.in
> @@ -0,0 +1,23 @@
> +config BR2_PACKAGE_RASDAEMON
> +	bool "rasdaemon"
> +	depends on !BR2_STATIC_LIBS # libtraceevent
> +	select BR2_PACKAGE_LIBTRACEEVENT
> +	select BR2_PACKAGE_SQLITE
> +	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
> +	help
> +	  rasdaemon is a tool that collects all hardware error events
> +	  reported by the Linux Kernel from several sources (EDAC, MCE
> +	  PCI, ...) into one common framework.
> +	  See https://github.com/mchehab/rasdaemon for details.
> +
> +if BR2_PACKAGE_RASDAEMON
> +
> +config BR2_PACKAGE_RASDAEMON_AER
> +	bool "Enable AER support"
> +	default y
> +	select BR2_PACKAGE_PCIUTILS
> +	help
> +	  Enable handling of AER (Advanced Error Reporting) events on
> +	  PCIe
> +
> +endif

You need here:

comment "rasdaemon needs a toolchain w/ dynamic library"
	depends on BR2_STATIC_LIBS

Also, I'm in fact not sure the "default y" is good for
BR2_PACKAGE_RASDAEMON_AER. We generally try to keep optional features
disabled by default in Buildroot, and especially if they bring
additional dependencies.


> diff --git a/package/rasdaemon/rasdaemon.hash b/package/rasdaemon/rasdaemon.hash
> new file mode 100644
> index 0000000000000000000000000000000000000000..768475ce597a63b1738388c2bdebcc3117f006a8
> --- /dev/null
> +++ b/package/rasdaemon/rasdaemon.hash
> @@ -0,0 +1 @@

Please add:

# Locally calculated

here

> +sha256  7e12459f9477036491ac2b1e4c07cc3e8efea6dcd30525a263ab1f83910b773a  rasdaemon-0.8.4.tar.gz

And also, add the hash of the license file.

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
