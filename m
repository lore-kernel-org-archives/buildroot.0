Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B23D44166
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 10:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ED7181A5F;
	Fri, 12 Dec 2025 10:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J99_XrPCrpfq; Fri, 12 Dec 2025 10:24:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB5F381B3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765535081;
	bh=8pLaDry5xRu8MpnFOy7k4F8x6C4NeLoIMKea+B32SsY=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=AzVOggDaCPq8y/CMl39Rz8aDNyraSiRaas4z1KkgNpb7qUj8Idx0SyciLgrRrnuoy
	 JYH8hGjb4IGqH1iudZQF6KY5tMuxrHHTr7IuJW6XciidbU2IRXGnpxQwO872DNaE4p
	 v2mo//zL6xh9ncrUtzbBIl0jL5+l92ljk0Nt/h/8hghiHRLJ76al25oKbdWs75/W3h
	 NSSXeqRpgzJlSL7xw5DvuJGBiBjLeFpoHOz59mYgb8BqD2OcdWvaujlXybA1qfBvpB
	 qEJMaHBpGtE2SyVpJyxNLl2EsV7QdjitZOP0k69p70XaZ8Hfjcdlyjo5iWXzYhfuw9
	 GEn+KY9uYn0jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB5F381B3E;
	Fri, 12 Dec 2025 10:24:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F10A02C6
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 10:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E34D281B3E
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 10:24:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QW5EuUeGUAGY for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 10:24:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1377881A5F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1377881A5F
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1377881A5F
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 10:24:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 403C21A2129
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 10:24:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0FB3C606DF;
 Fri, 12 Dec 2025 10:24:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C3619103C8E11; Fri, 12 Dec 2025 11:24:36 +0100 (CET)
Date: Fri, 12 Dec 2025 11:24:35 +0100
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <20251212112435.263a0c71@windsurf>
In-Reply-To: <20251212101533.820554-3-kory.maincent@bootlin.com>
References: <20251212101533.820554-1-kory.maincent@bootlin.com>
 <20251212101533.820554-3-kory.maincent@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765535077; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=4+8UGl5c5UktfOMosqTrmbmB9vTOewQLQhN7VVasCfo=;
 b=IlchX2IZ/+IQgChTSCcQlfZucpPcIzuKpBfCvBIdDx2ekfd0O+jr5Vr+kRpxk/x4xX5/tT
 ms1fBYMckOAUEnzfrubSlFEyr7MrYXChEvWKW3SjKTBCpUqVbqZrGPczGSCfOv/GOMmjwL
 GdczKO8B8DJCXzpYvg0Hc+J28nhXI6Hc9EWZ8vg3oSqZhQiMj8niTb3J24ZxJVFEPO0/Gq
 7+jS1+GtJP47TIjREgDAzzqdnCi+3F5UzgtCP7Bay5b/F/nOpagzZftZgXKWuEFic4se7s
 t9mi4dz8yWMNTZR8t/etBqlxbwQ0eMqpz648HKfw7VwWPQWNeHQy3/PSV1K9uw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=IlchX2IZ
Subject: Re: [Buildroot] [PATCH 2/3] configs/beaglebone: Use Buildroot's
 default U-Boot version
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
Cc: Bajjuri Praneeth <praneeth@ti.com>, Bryan Brattlof <bb@ti.com>,
 Lothar Felten <lothar.felten@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 12 Dec 2025 10:15:29 +0000
Kory Maincent <kory.maincent@bootlin.com> wrote:

> diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
> index b27b97916e..cf884bae23 100644
> --- a/configs/beaglebone_defconfig
> +++ b/configs/beaglebone_defconfig
> @@ -20,9 +20,6 @@ BR2_PACKAGE_KMOD_TOOLS=y
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_TARGET_UBOOT=y
> -BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"

You can't do this, you need specify a specific version of U-Boot.
That's the policy for our defconfigs.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
