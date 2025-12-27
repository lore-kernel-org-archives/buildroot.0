Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34AEEE92712
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 14:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E802607A6;
	Sat, 27 Dec 2025 14:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id baUb5ztcQKUn; Sat, 27 Dec 2025 14:22:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FC0660790
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766845358;
	bh=dvC20EqoLaVntTD8YsAVZ6TU4utrFRjuleeDx8mYUvg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kSyhUQVR5YPtYlwQ5YE39I+fsQJhb+4bgkMhYIfr1LpTVdaO8iE6GQxoSBGLNEnCq
	 U+JPp7h3esUuJ6G9AANNy8q2eyTzmZiThK4W64yC20HN85n1vDxSklR32fJg+6/5O8
	 sGoFlf4w0o9bVzavynYy5is8HMP+DoN612jo/3SO9VR9D6Peycx6WM0+Dq1VmWY8AX
	 tmhZlotrLGQoLS/YNPRsUorpReLTKZxpz+iqYcfpriFzQuI/tvKNyampFbLBgmNCYK
	 HxYN8W7mGOg4+zHuLrx19/vopaj7m2HnR6sB+GlMh2v/mCwvdZqUB+WE9F4Zaos1WX
	 Z07S1Tud76loQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FC0660790;
	Sat, 27 Dec 2025 14:22:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BAB79EC
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 14:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABE6760790
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 14:22:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pbf2EvJnCaFu for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 14:22:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A5EC96062F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5EC96062F
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A5EC96062F
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 14:22:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 62B241A249C
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 14:22:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3155E60725;
 Sat, 27 Dec 2025 14:22:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E23AA1197849E; Sat, 27 Dec 2025 15:22:29 +0100 (CET)
Date: Sat, 27 Dec 2025 15:22:28 +0100
To: Trammell Hudson via buildroot <buildroot@buildroot.org>
Cc: Trammell Hudson <hudson@trmm.net>
Message-ID: <20251227152228.05407b86@windsurf>
In-Reply-To: <aP0fooArqo5kwOnV@hachi.swcp.com>
References: <aP0fWpti-9PiGKxn@hachi.swcp.com> <aP0fg9gNzZ0xspy0@hachi.swcp.com>
 <aP0fooArqo5kwOnV@hachi.swcp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766845351; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Q50Naozg/N7YBzK+GZt2rdD9hwzMGbodgiuCc+5YaeQ=;
 b=FuB6BrnKgwETCbvsy+9XBs8Io/6BP5v2ESMi3jleTISthZvnXzC4HirJdH3l4pS/wUSnV2
 ob19S36oaSUqwgDWG0ISVL8L+EKTq/t6faSGJqSAZMZuXf+LvbQ/+ed3fUsVxJ84E8jm5Q
 MFjj9SpGlZ8/blK1NTWGayp681lQ6zep5++PGFArHK234IWBOV9zzlcyZK8faJV4j3L1Vy
 Nqa5p0DeB4pFBNIc/BMFHA2Rw4Cn1nJ/Ubb+sU0ikhSYsDnHwaiN06tfO/Q8KSvZxdioWe
 /R73B0pLiL/vB2DP3tm1ksB0kytGGh4s+edseweat+zDIGj+0XBC3yz7ZWCXfA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=FuB6BrnK
Subject: Re: [Buildroot] [PATCH 2/2] package/shairport-sync: Add support for
 AirPlay2
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

Hello Trammell,

Thanks for your patch, which I have applied, after doing some tweaks.
See below.

On Sat, 25 Oct 2025 13:06:10 -0600
Trammell Hudson via buildroot <buildroot@buildroot.org> wrote:

> diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
> index 528767ba9c..fddba4a439 100644
> --- a/package/shairport-sync/Config.in
> +++ b/package/shairport-sync/Config.in
> @@ -26,6 +26,21 @@ config BR2_PACKAGE_SHAIRPORT_SYNC_CONVOLUTION
>  	help
>  	  Enable audio DSP convolution support.
>  
> +config BR2_PACKAGE_SHAIRPORT_SYNC_AIRPLAY2
> +	bool "AirPlay2 support"
> +	select BR2_PACKAGE_NQPTP

Added an indication in a comment that this is a runtime dependency (as
opposed to a build time dependency).

> +	select BR2_PACKAGE_LIBPLIST
> +	select BR2_PACKAGE_LIBSODIUM
> +	select BR2_PACKAGE_LIBGCRYPT
> +	select BR2_PACKAGE_FFMPEG
> +	select BR2_PACKAGE_FFMPEG_GPL
> +	select BR2_PACKAGE_FFMPEG_NONFREE

These two were not needed according to my testing
(BR2_PACKAGE_FFMPEG_GPL BR2_PACKAGE_FFMPEG_NONFREE).

> +ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_AIRPLAY2),y)
> +SHAIRPORT_SYNC_DEPENDENCIES += libplist libsodium libgcrypt ffmpeg util-linux

I've added host-vim in this list because the "xxd" tool is needed on
the host, and the host-vim package provides it.

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
