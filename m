Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769AFCA0EEB
	for <buildroot@archiver.kernel.org>; Fri, 22 Aug 2025 21:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33AAE83BE6;
	Fri, 22 Aug 2025 21:22:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o2Us3qBIKEeJ; Fri, 22 Aug 2025 21:22:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D09183BE2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D09183BE2;
	Fri, 22 Aug 2025 21:22:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EF7B42E
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 21:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85A2360E2E
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 21:22:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vMIqSVVy1fKq for <buildroot@buildroot.org>;
 Fri, 22 Aug 2025 21:22:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 955A260E2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 955A260E2C
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 955A260E2C
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 21:22:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 23607C8EC66;
 Fri, 22 Aug 2025 21:22:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DDC56604AD;
 Fri, 22 Aug 2025 21:22:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 49B361C22D33B; 
 Fri, 22 Aug 2025 23:22:47 +0200 (CEST)
Date: Fri, 22 Aug 2025 23:22:44 +0200
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20250822232244.7667d0fc@windsurf>
In-Reply-To: <20250820163921.1968030-4-angelo.compagnucci@gmail.com>
References: <20250820163921.1968030-1-angelo.compagnucci@gmail.com>
 <20250820163921.1968030-4-angelo.compagnucci@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755897767; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ibGaN/OiwIjDpmhoHi7mUFhBEXHHV2h5fskN+QlTfok=;
 b=STt9uHRF3715i+9FwpMM73uRKrCB9Wq34uPTU882u3JTeFNIJQ5eqMwkasiKZgOoOyBRa7
 YLNY6sLPuHlfvQZuunoF6AN8fTfrVLUB2Hqz2jB4eRpZV45z/DETuVs4SEZGHrX/tFex8Q
 CruHsJQe4+tC4wppxIk1E8Y010Oif8BN4LWPWIRNr3wINBLc+DQoLeBqy/sF4vxNaSqdsL
 jBV2YFYX9BdCYCPs+/2b9saE5bQ1ZAyPM/qsUvNreUV7shg2XMpnccemR3sy1hdW9i38bv
 Pu8JnLZ3nniUpj0kmuqtBTscef0L7jTXQ+thNQ8yYS2517AJ3GHHGvxn2Y4YBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=STt9uHRF
Subject: Re: [Buildroot] [PATCH 3/4 v2] package/libppd: new package
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

Hello Angelo,

On Wed, 20 Aug 2025 18:39:20 +0200
Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:

> diff --git a/package/libppd/Config.in b/package/libppd/Config.in
> new file mode 100644
> index 0000000000..124de4f7f2
> --- /dev/null
> +++ b/package/libppd/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_LIBPPD
> +	bool "libppd"
> +	depends on BR2_INSTALL_LIBSTDCPP

This means a Config.in comment is needed.

> +	depends on BR2_PACKAGE_LIBCUPSFILTERS

We want a "select" here, which means duplicating all the crazy
dependencies of libcupsfilters yes :/

> diff --git a/package/libppd/libppd.mk b/package/libppd/libppd.mk
> new file mode 100644
> index 0000000000..9680bb7115
> --- /dev/null
> +++ b/package/libppd/libppd.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# libppd
> +#
> +################################################################################
> +
> +LIBPPD_VERSION = 2.1.1
> +LIBPPD_SOURCE = libppd-$(LIBPPD_VERSION).tar.gz
> +LIBPPD_SITE = https://github.com/OpenPrinting/libppd/releases/download/$(LIBPPD_VERSION)
> +LIBPPD_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
> +LIBPPD_LICENSE_FILES = LICENSE NOTICE
> +LIBPPD_CPE_ID_VENDOR = openprinting

Do you have a reference that shows this CPE vendor is used to identify
libppd in particular?

> +LIBPPD_SELINUX_MODULES = cups

Are you sure this belongs here? This is a real question: I have no idea.

> +LIBPPD_INSTALL_STAGING = YES
> +
> +# no configure in tarball
> +LIBPPD_AUTORECONF = YES
> +
> +LIBPPD_DEPENDENCIES = cups libcupsfilters

Why do you have a dependency on cups here, but not in Config.in?

> +LIBPPD_CONF_OPTS = \
> +	--with-cups-config=$(STAGING_DIR)/usr/bin/cups-config

Seems like it indeed uses cups directly, so package/libppd/Config.in
should select it.

I see the configure.ac script checks for zlib. Is this a mandatory
dependency? (Not according to the documentation).

There's a fair amount of --disable options in configure.ac, which would
be useful to explicitly disable (or handle).

--disable-ghostscript
--disable-pdftops
--disable-mutool
... and more

That's weird because none of those dependencies are described in
INSTALL.md. As if the configure.ac had been copy/pasted from
libcupsfilters and not adjusted properly?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
