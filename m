Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228EAC04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 07:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5A55606E9;
	Sat, 11 May 2024 07:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MlP7J4tAD4oG; Sat, 11 May 2024 07:00:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2B2B60782
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2B2B60782;
	Sat, 11 May 2024 07:00:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF0E91BF398
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 07:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC14F60782
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 07:00:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNwUdvsT65ak for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 07:00:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 56E2E606E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56E2E606E9
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56E2E606E9
 for <buildroot@buildroot.org>; Sat, 11 May 2024 07:00:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6BEAC40004;
 Sat, 11 May 2024 07:00:10 +0000 (UTC)
Date: Sat, 11 May 2024 09:00:09 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20240511090009.11809921@windsurf>
In-Reply-To: <20240509170112.7381E86D42@busybox.osuosl.org>
References: <20240509170112.7381E86D42@busybox.osuosl.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715410810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z9L+bi/SWaiNOO/CKWreZbkQjrUnMEbGtyMBF10W2hk=;
 b=XrmsMjogaEqvzIy6SDBiYLJ8dgOoPTEW/bwwkz4vh1SpfoJQ4uySXU4hoewZpAEFd/hZDX
 IXZ+nO4Z2RvpQIYVmC9wFKg8pyQUHPKIo1CPnqKutTpnkpvYENufclI6mGErp3Gr/5cAwY
 mSxp8sWar872JhvScmt10YjGRrA3SYxEf2pSXkPEJiQjXa/i5FMM/ZabwxhU7Po2WOXd2b
 W+v6xnXJl5tP/qFlbb8f0lMSN+0vloOz0ZoMRO2o0hRyfdC0M926QmcdPrYwERuF4KpC55
 KSL/zpDqx+eWC1bdW33CYUYnRtSo8E14SAP9UymBIJ/kJCRbu3M3diTEGMayPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XrmsMjog
Subject: Re: [Buildroot] [git commit] package/kodi: bump version to
 21.0-Omega
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Thu, 9 May 2024 19:00:54 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> Added new required dependency to libudfread: Since upstream commit
> https://github.com/xbmc/xbmc/commit/5f9b9cfa26f274e381e92d73cfa33fb55582436e
> kodi does not build anymore without libudfread.

There is a mistake in your patch on this, causing a build failure, see
below.

>  	depends on !BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
> @@ -56,6 +58,7 @@ menuconfig BR2_PACKAGE_KODI
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libass -> harfbuzz
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # C++17
> +	depends on BR2_HOST_GCC_AT_LEAST_9 # C++17
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_TOOLCHAIN_USES_MUSL
>  	depends on BR2_USE_WCHAR
> @@ -103,6 +106,7 @@ menuconfig BR2_PACKAGE_KODI
>  	select BR2_PACKAGE_SQLITE
>  	select BR2_PACKAGE_TAGLIB
>  	select BR2_PACKAGE_TINYXML
> +	select BR2_PACKAGE_TINYXML2
>  	select BR2_PACKAGE_ZLIB
>  	select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_USES_GLIBC # runtime UTF conversion support
>  	select BR2_PACKAGE_LIBINPUT if BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
> @@ -162,6 +166,7 @@ config BR2_PACKAGE_KODI_EVENTCLIENTS
>  config BR2_PACKAGE_KODI_LIBBLURAY
>  	bool "blu-ray"
>  	select BR2_PACKAGE_LIBBLURAY
> +	select BR2_PACKAGE_LIBUDFREAD

You're indeed adding the "select" on BR2_PACKAGE_LIBUDFREAD, but in a
sub-option of kodi, BR2_PACKAGE_KODI_LIBBLURAY, while...

>  KODI_LICENSE = GPL-2.0
> @@ -45,6 +45,7 @@ KODI_DEPENDENCIES = \
>  	libfribidi \
>  	libplist \
>  	libpng \
> +	libudfread \

here you're adding libudfread to the unconditional dependencies,
unrelated to the sub-option.

Which one is correct? Having a sub-option, or marking libudfread a
mandatory dependency whenever kodi is enabled?

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
