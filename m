Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BB1EE57FA
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 09:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21D51817AB;
	Wed, 31 Dec 2025 09:48:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6nOn39coU_JM; Wed, 31 Dec 2025 09:48:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FF4F816D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767174496;
	bh=/hjXF1/mx7cbAosMr4bnn8sPdSLX+oAfV8iL6DZlvoI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=C8Vjn8CLDpZL/JMFVX9NAIh1gosfXJSH2icJ8NlyysoT49jK1VUw7OUJfsE46ThP3
	 y9BoC+hHGjkHyIbizTgOFFTIrmhweuZBb1PxadYLeJBCLaZeGoCPBSkjODKsnFs2OG
	 c87CJdKT7/51Zn0W4cvvE2wKeSy8MHp2YtpvkRcgB90aSf1PdAr9NyRBh6TFRF6rzX
	 wQbNOEGyHp4AmFL3UIxjphNge4AhyL/PGln2jzw3KDnLHxadXs3S7gYlgNx6yU3HNy
	 MOedJBSOIh9uzCWxbP5/0GyR+c55P7c9/BcLKSMVTl2ZjdBeuJdafYa+/xzflLsKns
	 NMvRY2Mt7hM7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FF4F816D8;
	Wed, 31 Dec 2025 09:48:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 51A6CD8
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 09:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E6EA60A61
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 09:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 874_5SifKfer for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 09:48:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6968A60A5F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6968A60A5F
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6968A60A5F
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 09:48:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 59B411A255E
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 09:48:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2C34560744;
 Wed, 31 Dec 2025 09:48:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 701FD113B0757; Wed, 31 Dec 2025 10:48:10 +0100 (CET)
Date: Wed, 31 Dec 2025 10:48:00 +0100
To: Bastien Curutchet via buildroot <buildroot@buildroot.org>
Cc: Bastien Curutchet <bastien.curutchet@bootlin.com>, Fiona Klute
 <fiona.klute@gmx.de>
Message-ID: <20251231104800.115fbed6@windsurf>
In-Reply-To: <20251219-rasdaemon-v4-2-2cdc992de787@bootlin.com>
References: <20251219-rasdaemon-v4-0-2cdc992de787@bootlin.com>
 <20251219-rasdaemon-v4-2-2cdc992de787@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767174491; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=62g4ZlZc6w0EIFcBWK6+bY3KtOrvGzcz8PuR8+06P3g=;
 b=mp+wMiWJsARCgzayXbq9xURpX/KvEcLK+ZYqv25+4E/U5WdtlxgkbeXS3hk4fB6kPA5MOP
 wXGEtbYQ61+1aeAOrEnJ75Ck56wmXh7ITlimxeZsx8DTQrEHgV+gRhJZr2jBdz84HBKLq8
 4iApLrg1O81cgjOdMYvX24GcevrBvoRvMibzGdgd7j7DyQ1FCy8XOYnzVFhKbbmwVlZ0DJ
 jArC66Zo1JTRvdK6M9y58WD00r1ETvd/1gpwNG2XyxE4cX/tHg76TB1GvoKTTRImLZ5EE7
 iS6mICpEvvfFGef1BqwDJoYcOnkJw0yvxGq+gSStewaeyionXjiCIjz2Ye4PiA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=mp+wMiWJ
Subject: Re: [Buildroot] [PATCH v4 2/2] support/testing: add rasdaemon tests
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

On Fri, 19 Dec 2025 17:30:16 +0100
Bastien Curutchet via buildroot <buildroot@buildroot.org> wrote:

> Rasdaemon was added in previous patch.
> 
> Add a test_rasdaemon that allows to test it.
> Test is done on x86. It first checks the daemon's version, then mounts
> debugfs and finally ensures that the init script allows to
> start/restart/stop the daemon.
> 
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>

I've applied, after doing some changes, see below.


> +class TestRasdaemon(infra.basetest.BRTest):
> +    config = f"""
> +        BR2_x86_64=y
> +        BR2_x86_corei7=y
> +        BR2_INIT_SYSV=y

This was not needed, the default init system (Busybox) is fine.

> +        BR2_LINUX_KERNEL=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.59"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux.config"
> +        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{infra.filepath("tests/package/test_rasdaemon/linux-debugfs.fragment")}"

This kernel wouldn't build as host-libelf and host-openssl were
missing, so I've added:

+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y

Applied with those changes; Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
