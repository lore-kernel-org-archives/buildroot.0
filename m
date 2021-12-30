Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A6FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 22:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D728F81337;
	Thu, 30 Dec 2021 22:21:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QuvKxGplzGbB; Thu, 30 Dec 2021 22:21:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30005812F3;
	Thu, 30 Dec 2021 22:21:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DE2F01BF3C2
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 22:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBE2D812F3
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 22:21:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o4-6yWizvinN for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 22:21:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11551812E9
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 22:21:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 5578DFF80A;
 Thu, 30 Dec 2021 22:21:40 +0000 (UTC)
Date: Thu, 30 Dec 2021 23:21:39 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20211230232139.720a6ff1@windsurf>
In-Reply-To: <20211230215149.12357-3-bernd.kuhls@t-online.de>
References: <20211230215149.12357-1-bernd.kuhls@t-online.de>
 <20211230215149.12357-3-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 3/3] package/vdr: enable musl/uclibc build
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Thu, 30 Dec 2021 22:51:49 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> diff --git a/package/vdr/Config.in b/package/vdr/Config.in
> index df602f26d6..1119892d8b 100644
> --- a/package/vdr/Config.in
> +++ b/package/vdr/Config.in
> @@ -2,15 +2,17 @@ config BR2_PACKAGE_VDR
>  	bool "vdr"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on !BR2_STATIC_LIBS
> +	depends on BR2_SYSTEM_ENABLE_NLS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
> -	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h
>  	depends on BR2_USE_MMU # fork()
>  	depends on BR2_USE_WCHAR
>  	select BR2_PACKAGE_FONTCONFIG
>  	select BR2_PACKAGE_FREETYPE
> +	select BR2_PACKAGE_GETTEXT if !BR2_TOOLCHAIN_USES_GLIBC

Could you provide a bit more explanation about the gettext/nls stuff here?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
