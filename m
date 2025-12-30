Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E2DE95A6C
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 11:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FCF4600BB;
	Tue, 30 Dec 2025 11:08:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DXHw4xcomqON; Tue, 30 Dec 2025 11:08:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAD80608A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767092936;
	bh=2xFkxXIVmSKQ/DfJmY+AW1/IIxKrtaJPiiidGn2c7uc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CLijpsAQ6tnMmvWBQG87gRFzyeCBj5YGnxLk0OclzG6PPwnQMxkleEB6fH+akS72v
	 CJS1z7IMK3Uxrny+se7SkWMcYqRGOuYKpEKSmJ830ud3+LkddsdQIpPmoPSs/m0Njh
	 IXGTIGbZZbSHu25y0cfREOR76cgMCR8HH5fSucvHjQPS1VPHeoBR8/C6CG07hJ2YYS
	 J/mLWPcxKkHjAkhxnvVyomUkJtGGdSLDfrShBVDMU60e1B5GayTPflWcNU/sxsTHpE
	 DGufEVhgGm3MpSKXHPhVWCIvqQKA05T7RJ0ttkPJp77OKBunkkwB9GW0BsUO5CZtkV
	 gT5f9203a8OnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAD80608A0;
	Tue, 30 Dec 2025 11:08:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04821177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAABA40561
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:08:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZsoVSBcgC_MH for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 11:08:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 038C340502
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 038C340502
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 038C340502
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:08:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 895A51A252F;
 Tue, 30 Dec 2025 11:08:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5683D6072C;
 Tue, 30 Dec 2025 11:08:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6DB6A113B02AE; Tue, 30 Dec 2025 12:08:49 +0100 (CET)
Date: Tue, 30 Dec 2025 12:08:47 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Andreas Ziegler <br025@umbiko.net>, Angelo
 Compagnucci <angelo.compagnucci@gmail.com>, Fabrice Fontaine
 <fontaine.fabrice@gmail.com>, Mahyar Koshkouei
 <mahyar.koshkouei@gmail.com>, Matt Flax <flatmax@flatmax.org>, Romain Naour
 <romain.naour@gmail.com>, Simon Dawson <spdawson@gmail.com>, Woodrow
 Douglass <wdouglass@carnegierobotics.com>
Message-ID: <20251230120847.22375487@windsurf>
In-Reply-To: <20251229175938.3549882-1-bernd@kuhls.net>
References: <20251229175938.3549882-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767092931; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=wVcVDUXozMSm+KpK8uDbSozt1VCWTMzLP3WKm3MzpPA=;
 b=PmvIIIDL8hb6NqjMSWzr0vyFF+nbW797MLcnQgyqRcmFcLjxZ7Iw1VZwxAxxHcnW/xeK1K
 qp8TIju+uCAVvXDZJSHR0qoPQTjDJ7MV46wOL2H1mQwz8LJ1cISueRtV3yYMtZfl3ZAkjR
 kOeF3tr5ciC9q8FZg1vTfbhJme0PEpQT5M475vn6kyLfEW9Fa6Eicf3WylYCr1QjiSrNv4
 yPwz9dm5g28V9i6T9C202JpW9vfOcIHvtLlkmD5xSOEyrVjMwUKfPiiv4wfLicGrpewsgJ
 bOKvaTbcJTdX7Z3XQ0WpUyA8NfFT9D2v5TR0YS4EFBIVH4WBuTdlEHwwhOYALw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=PmvIIIDL
Subject: Re: [Buildroot] [PATCH v8 00/29] Remove packages
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

On Mon, 29 Dec 2025 18:59:08 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Bernd Kuhls (29):
>   package/libnids: remove package
>   package/dmraid: remove package
>   package/libmhash: remove package
>   package/connman-gtk: remove package
>   package/hawktracer: remove package
>   package/let-me-create: remove package
>   package/libcgi: remove package
>   package/libiqrf: remove package
>   package/libuwsc: remove package
>   package/alure: remove package

I've applied up to this point.

>   package/openpowerlink: remove package

This one causes warnings:

Config.in.legacy:6025: BR2_PACKAGE_OPENPOWERLINK_KERNEL_MODULE not referenced but has a comment stating it is
Config.in.legacy:6035: BR2_PACKAGE_OPENPOWERLINK_LIBPCAP not referenced but has a comment stating it is

>   package/opentracing-cpp: remove package
>   package/qjson: remove package
>   package/sconeserver: remove package
>   package/taskd: remove package
>   package/racehound: remove package

This one:

WARNING: .checkpackageignore:881: ignored file package/racehound/0001-Fix-module-install-path-lib-instead-of-usr-lib-prefi.patch is missing

>   package/musepack: remove package
>   package/libcuefile: remove package

This one doesn't apply on the latest master.

>   package/python-aioredis: remove package
>   package/cppdb: remove package
>   package/ffmpeg: remove optional dependency to opencv3
>   package/freeswitch: remove optional dependency to opencv3
>   package/gtkiostream: remove optional dependency to opencv3
>   package/mjpg-streamer: remove optional dependency to opencv3
>   package/vlc: remove optional dependency to opencv3
>   package/opencv3: remove package

I'm happy to apply up to this point once the above issues are fixed.

>   package/ogre: remove dependency to libfreeimage
>   package/cegui: remove dependency to libfreeimage
>   package/libfreeimage: remove package

For this one, I suggested to drop libfreeimage, so of course I'm fine
with it, but "ogre" is still relevant and maintained upstream. Is it
still using libfreeimage in its latest version?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
