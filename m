Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF96CE9D40B
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 16:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89BDD60A63;
	Wed,  4 Feb 2026 16:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zdmToY1e_OdV; Wed,  4 Feb 2026 16:22:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D8DA60DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770222122;
	bh=HQRFKxe1GwLk9RZNF8QRR2AhJHs6ixltBH92wv3lsMo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=d7AthjP6VmfjM6QrZRebdmrrBpeic2jI6qSov/B+bd8yS6EUvDOipwlUa4s0vKLwD
	 RJR7HkDBCqGx1ZWO40uzMWeLkft8Cei174XcefZ98WmEBl/b5pBuHu6GlkQBVIY8dT
	 TRzQ50KrAPu2PrWY4doU6hmPNjvrgdL7aHH+ZngeTjiPqmh+IENrAaQ6GWEIgYmlnK
	 eXmSs7zFGQna5Kdip53X3cY8Ev5Pg/SjNHiF/OEAHVOwC9Da1lkpqaCCMZU1RgatFO
	 Dot+PZN5ZcKN0zOgBTEcjexbCUcNar8bLSIja6UTsF6u4RuIJF3uqYcn8G2KJdhGpR
	 1Jx/bcNAnYreA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D8DA60DED;
	Wed,  4 Feb 2026 16:22:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BEACDF5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A173960DED
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:22:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RL5c0_XmwJMo for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 16:22:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C553160A63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C553160A63
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C553160A63
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:21:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4C04A1A2BEA;
 Wed,  4 Feb 2026 16:21:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0FF6F60767;
 Wed,  4 Feb 2026 16:21:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 35FA5119A865B; Wed,  4 Feb 2026 17:21:55 +0100 (CET)
Date: Wed, 4 Feb 2026 17:21:55 +0100
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
Message-ID: <aYNvzzbE_lY8YybW@windsurf>
References: <20250911212752.266940-1-alex.bennee@linaro.org>
 <20250911212752.266940-5-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250911212752.266940-5-alex.bennee@linaro.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770222116; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ge+BgpiDOO1wvt25/vBfkX5SZBXJtN1kJ1JY/lbBOrw=;
 b=lGuZD6qTq9ODzGuVtL6rItbY5sfCMp9yAFoenYWXk/D5Z96lJyOb/0WiEwkTcFUnaJXnHC
 2zqcSvUcbLk223ZpxRttD4D20Lxuk2Lxl7WtLTyfXVhGpoBXYfaJX75N0hT/FyH0wMDboQ
 o85rckNJ4QJ/wh1aBzSCFw5ZRjG2ByvF9sz/DHT6t8WQdZ47fFvpjCLgYIiL6V7lAGI2NV
 4Wu5Gu5hhIdpAI2Kqvra7QFPgmexPMGY2vD9MSHOcLxmyWSU5ueMJny+9fo9nsrBDTShwQ
 DdkzHdLIJ5bqEFny/mYgEcHUqnjjhp/uWTfXNJqtf5aHcuJtDEe+QUxmVJCqJA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=lGuZD6qT
Subject: Re: [Buildroot] [PATCH v5 4/9] package/qemu: introduce kvm and tcg
 system options
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alex,

We have finally applied your patch, with a few tweaks, see below.

On Thu, Sep 11, 2025 at 10:27:44PM +0100, Alex Benn=E9e wrote:
>  if BR2_PACKAGE_QEMU_SYSTEM
>  =

> +config BR2_PACKAGE_QEMU_SYSTEM_KVM
> +	bool "Enable KVM system virtualisation"
> +	default y
> +	help
> +	  Say 'y' here to enable a QEMU with KVM support.
> +	  If unsure, say 'y'
> +
> +config BR2_PACKAGE_QEMU_SYSTEM_TCG
> +	bool "Enable TCG system emulation"
> +	default y
> +	help
> +	  Say 'y' here to enable QEMU binaries which can emulate foreign
> +	  architectures using the TCG JIT.

If both options are disabled, no qemu binary is built at all. The
build doesn't fail, but it means that existing packages, such as
libvirt that select qemu + qemu-system might be confused. So we've
added a select BR2_PACKAGE_QEMU_SYSTEM_TCG if
!BR2_PACKAGE_QEMU_SYSTEM_KVM under the BR2_PACKAGE_QEMU_SYSTEM option,
ensuring that at least one of the two gets enabled.

>  config BR2_PACKAGE_QEMU_CHOOSE_TARGETS
>  	bool "Select individual emulator targets"
> -	depends on BR2_PACKAGE_QEMU_SYSTEM || BR2_PACKAGE_QEMU_LINUX_USER
> +	depends on BR2_PACKAGE_QEMU_SYSTEM_TCG || BR2_PACKAGE_QEMU_LINUX_USER
>  	help
> -	  By default, all targets (system and/or user, subject to the
> -	  corresponding options, above) are built. If you only need a
> -	  subset of the emulated targets, say 'y' here and enable at
> -	  least one target, below.
> +	  By default, all targets system targets are built when TCG is

This updated only accounted for TCG, but this option also appears for
user-mode emulation. So we've simplified since to "By default, all
system targets are built".

Applied with those changes, thanks!

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
