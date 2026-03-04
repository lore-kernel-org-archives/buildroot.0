Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC78EF8FE2
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 13:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90E46607E0;
	Wed,  4 Mar 2026 13:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YVe3pD59ngep; Wed,  4 Mar 2026 13:13:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7121607CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772629995;
	bh=1zDbosqpfQ64vH94Kvtn5UtmIvuZn2gPjtjUaB/HwEU=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=XAXELyk7YP5Y1lycDnecdVGpH29E1grG1khBt6C1zj+KaSDLFixrq+D5/1WvTCIYV
	 RgZWVrUQC8zyGTXkWzxb6WxZ14r4MhuwPBpJj05lJkWkqp7MnKInsJNptIpGvp5LBL
	 O9m5MAlkRHUmN5AJzxpfkSGkf7NrAxEDUB246y6mei1JywMbQb4RoFVlQeMiRGeANA
	 HwyVs0n2Fm6w074yQc4bJaM2DjR5lUf9ANMwS1lLL/qH5kAw52KkVpuFxAW3RYrOfz
	 5Ez6yG4Eb6vOOSlwG9mHsIRW1gg7Fy4oK+zbC05yrfMx4uzaFwrBmm49ByIFpyIRGl
	 XrZCa9su/85xQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7121607CB;
	Wed,  4 Mar 2026 13:13:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D083231
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 13:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EFE4607CB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 13:13:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HDWQIqCjOTEM for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 13:13:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3F1C1607BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F1C1607BD
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F1C1607BD
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 13:13:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B4C441A2C22;
 Wed,  4 Mar 2026 13:13:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 883BD5FF5C;
 Wed,  4 Mar 2026 13:13:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4229B10369778; Wed,  4 Mar 2026 14:13:02 +0100 (CET)
Mime-Version: 1.0
Date: Wed, 04 Mar 2026 14:13:00 +0100
Message-Id: <DGU0VV815IDV.21AG43M00GZWZ@bootlin.com>
To: "Neal Frager" <neal.frager@amd.com>, <buildroot@buildroot.org>
X-Mailer: aerc 0.20.1
References: <20260303154716.2122822-1-neal.frager@amd.com>
 <20260303154716.2122822-2-neal.frager@amd.com>
In-Reply-To: <20260303154716.2122822-2-neal.frager@amd.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1772629987; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=iW4b6NEGG0MElRqbPBW27XstaSfqD5GI+YhcYkDrzk8=;
 b=HA5hrO1GoR7SFX+mQYiWB5bIA5piMuZWX797mN718XsCBnqKgkwuNpitNvjiYeAMGG/Oq8
 KfFUW2iwumaRERUmrKvfwtYX/XL1Vy09JHUfeCfXXQIsYMaGX73TAy+FnNx8PawW4wRebF
 0o23DU1M5dzT86UEazkB8rKm29cnM4pEs6z/BMONYYNlQiohSTYXWQRbD4SLE+XDpuTNHA
 S8h51iYmgRr0Jogk/TexHm9b565ZH4uTEO9JVqRB4zmLGJD79V3LS/yFKu43Odz4ePFbS9
 ArOqW18aJFadQtSOkJNQcmfgLIc8e0ugQD4hHxRo54Pw3bMD+Q84zz4/KnqOEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=HA5hrO1G
Subject: Re: [Buildroot] [PATCH v1 2/3] board/zynqmp/post-image.sh: use
 LINUX_DTBS variable
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, yann.morin@orange.com,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue Mar 3, 2026 at 4:47 PM CET, Neal Frager wrote:
> By switching to the LINUX_DTBS variable, the post-image.sh script can now
> work regardless of whether a user is using BR2_LINUX_KERNEL_INTREE_DTS_NAME
> or the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR for custom hardware. This simplifies
> the transition users will make when migrating from a zynqmp evaluation board
> to a zynqmp custom platform.
>
> To keep the example post-image script as simple as possible, it assumes that
> the first DTB in the LINUX_DTBS list is the one for creating the system.dtb
> filename that u-boot will use for booting. Users are free to implement their
> own post-image scripts for use cases with multiple DTBs.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  board/zynqmp/post-image.sh | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/board/zynqmp/post-image.sh b/board/zynqmp/post-image.sh
> index f44b66342d..c1a9062909 100755
> --- a/board/zynqmp/post-image.sh
> +++ b/board/zynqmp/post-image.sh
> @@ -2,13 +2,8 @@
>
>  # By default U-Boot loads DTB from a file named "system.dtb", so
>  # let's use a symlink with that name that points to the *first*
> -# devicetree listed in the config.
> -
> -FIRST_DT=$(sed -nr \
> -               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
> -               "${BR2_CONFIG}")
> -
> -[ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}.dtb" "${BINARIES_DIR}/system.dtb"
> +# devicetree in the LINUX_DTBS list.
> +ln -fs "${BINARIES_DIR}/$(basename ${LINUX_DTBS})" "${BINARIES_DIR}/system.dtb"
           ^^^^^^^^^^^^^^^

Is the added ${BINARIES_DIR} prefix correct?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
