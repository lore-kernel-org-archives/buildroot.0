Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA817C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:35:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5051A60F57
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5051A60F57
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1513B81B48;
	Mon, 18 Oct 2021 19:35:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yNqbapRrQGGx; Mon, 18 Oct 2021 19:35:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC25681010;
	Mon, 18 Oct 2021 19:34:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D95991BF97A
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6AB440222
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:34:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id roZ7zqtA7XxL for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:33:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 510144020A
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:33:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0F8B720004;
 Mon, 18 Oct 2021 19:33:34 +0000 (UTC)
Date: Mon, 18 Oct 2021 21:33:34 +0200
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20211018213334.0c6901ae@windsurf>
In-Reply-To: <20211016215400.31415-5-ps.report@gmx.net>
References: <20211016215400.31415-1-ps.report@gmx.net>
 <20211016215400.31415-5-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 5/5] package/uqmi: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Sergio Prado <sergio.prado@e-labworks.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 16 Oct 2021 23:54:00 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> diff --git a/package/uqmi/Config.in b/package/uqmi/Config.in
> new file mode 100644
> index 0000000000..47b19e04d4
> --- /dev/null
> +++ b/package/uqmi/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_UQMI
> +	bool "uqmi"
> +	depends on !BR2_STATIC_LIBS # libubox
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
> +	select BR2_PACKAGE_JSON_C
> +	select BR2_PACKAGE_LIBUBOX
> +	help
> +	  This command line tool originates from the OpenWrt project
> +	  to configure LTE modem in QMI mode for WAN connection.
> +
> +	  https://git.openwrt.org/project/uqmi.git
> +
> +comment "uqmi needs a toolchain w/ dynamic library"

You had forgotten:

	depends on BR2_TOOLCHAIN_HAS_SYNC_4

here.

> +	depends on BR2_STATIC_LIBS
> +UQMI_VERSION = 0a19b5b77140465c29e2afa7d611fe93abc9672f
> +UQMI_SITE = https://git.openwrt.org/project/uqmi.git
> +UQMI_SITE_METHOD = git
> +UQMI_LICENSE = LGPL-2.0+
> +UQMI_LICENSE_FILES = main.c
> +UQMI_INSTALL_STAGING = YES

I dropped this line, as you suggested.

Applied with those two changes. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
