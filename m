Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1340BC52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 07:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6ED4813D7;
	Fri, 23 Aug 2024 07:58:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ce2XEuhlREQT; Fri, 23 Aug 2024 07:58:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B38C818E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B38C818E6;
	Fri, 23 Aug 2024 07:58:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4D8101BF3C2
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 07:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 368DF40C23
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 07:58:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CNS2t8D-ohxN for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 07:58:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B948240C17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B948240C17
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B948240C17
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 07:58:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6ABC34000B;
 Fri, 23 Aug 2024 07:58:10 +0000 (UTC)
Date: Fri, 23 Aug 2024 09:58:09 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240823095809.70b3bfec@windsurf>
In-Reply-To: <ZsgdgdqUcwJzrrna@waldemar-brodkorb.de>
References: <ZsgdgdqUcwJzrrna@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724399890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IfTa1L1y8DDwnDRBozpD6xU1nIujD1hdRCy/k01aNNY=;
 b=abj5N5jfWZPC+WPZakP5e/x0rH2EGECBO1ShYlYjddI5ya6Cd8JxRT7gu4Cvg8K4tN9uhO
 XNiZHC2DbICvIyip6PaKWh5WNeqdpdb4zi3BgmBd+ju2u8zGdbwZe95f2POKwU/PpsbY9C
 uO9kgD3+THp95bwJ7UKn6emyufcdoIV9xA97Ix31fR2B6pCad2Z8E0NCrLA58xg4LHDduW
 4YrW6NUZxrn6sp6VgcRul1PAWEq1RXKPMRZr28PAhbfjXXEMnfQOsJEo508H3qtEECuNpm
 XjibvBG7e/pBILUXr7vKDFYU9DJDg4jYXcd2qFOmJk3eTjMfKcCYhtIlfDGBuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=abj5N5jf
Subject: Re: [Buildroot] [PATCH next] package/fbv: update package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Waldemar,

Thanks a lot, looks good. Just a few nits below.

On Fri, 23 Aug 2024 07:26:25 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> diff --git a/package/fbv/Config.in b/package/fbv/Config.in
> index 2206276334..1d11bfb3ef 100644
> --- a/package/fbv/Config.in
> +++ b/package/fbv/Config.in
> @@ -2,10 +2,10 @@ config BR2_PACKAGE_FBV
>  	bool "fbv"
>  	help
>  	  fbv is a very simple graphic file viewer for the framebuffer
> -	  console, capable of displaying GIF, JPEG, PNG and BMP files
> -	  using libungif, libjpeg and libpng.
> +	  console, capable of displaying JPEG, PNG and BMP files
> +	  using libjpeg and libpng.
>  
> -	  http://freshmeat.net/projects/fbv/
> +	  https://github.com/amadvance/fbv
>  
>  if BR2_PACKAGE_FBV
>  
> @@ -23,11 +23,4 @@ config BR2_PACKAGE_FBV_JPEG
>  	help
>  	  Enable support for JPEG using IJG's libjpeg.
>  
> -config BR2_PACKAGE_FBV_GIF
> -	bool "GIF support"
> -	default y
> -	select BR2_PACKAGE_GIFLIB
> -	help
> -	  Enable support for GIF using giflib.

When you remove an option, you should add an entry in Config.in.legacy.


> diff --git a/package/fbv/fbv.hash b/package/fbv/fbv.hash
> index 3f25465ba1..7cd9bb597f 100644
> --- a/package/fbv/fbv.hash
> +++ b/package/fbv/fbv.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  9b55b9dafd5eb01562060d860e267e309a1876e8ba5ce4d3303484b94129ab3c  fbv-1.0b.tar.gz
> +sha256  233b387bf110eaab94221e91bebc16365c70bf6ede01280164a875a7f460d0e0  fbv-7c2000804226ca860ca80f3baa993582e29aa1a2-git4.tar.gz
>  sha256  bf21d97bafcaacb5d6bc3d5502030c340f0e0593614078ab017af91e950083af  COPYING

Did you verify that legal-info was still working?

> diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
> index a69e4ad518..9c7d74b671 100644
> --- a/package/fbv/fbv.mk
> +++ b/package/fbv/fbv.mk
> @@ -4,12 +4,14 @@
>  #
>  ################################################################################
>  
> -FBV_VERSION = 1.0b
> -FBV_SITE = http://s-tech.elsat.net.pl/fbv
> -
> +FBV_VERSION = 7c2000804226ca860ca80f3baa993582e29aa1a2
> +FBV_SITE = https://github.com/amadvance/fbv
> +FBV_SITE_METHOD = git

Please use:

FBV_SITE = $(call github,amadvance,fbv,$(FBV_VERSION))

and drop FBV_SITE_METHOD

Also, with this commit, you are kind of "adopting" this package, so
perhaps add yourself in the DEVELOPERS file for this package?

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
