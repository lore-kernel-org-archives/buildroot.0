Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD95CFD63F
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 14:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B1F960822;
	Wed,  7 Jan 2026 14:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G3eJcrUgeEgT; Wed,  7 Jan 2026 14:03:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47A1160C2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767794592;
	bh=A9BNHLdd6MoIOOoP5mekIm+yhUVBmrox5heTzfiQlCQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oIsqhCMQKtjpjWxGo24X3mIt72g/Erzs78WS7Mc2C2XhWX/BjBD2XgcFzTj7lOB5C
	 yA4O+D4cVfFIcrfHbcwCtaG7SDmZtQFkTCxRMXdej2sj6SmH4lJDWreHEZ/4wRuG9t
	 OARqTqzoGUmJN6XVuw4vHQiroVJJi975av7QQaYraHUpHMY3qpo39xhB68ODmHIAiw
	 Kyi12HimVS3ERuXCDw4lq9pHOvRnzypaQAjRWC1uNfyfcsu5llF8ZJen4I3xObDRT+
	 9TjfpO89QESL3L2/1wJP3Atme/QOU70DgScnYxnBj4FcXedMz33uRRURJy5EfiY6jo
	 VR9XFi+qNwFNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47A1160C2E;
	Wed,  7 Jan 2026 14:03:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B47B6436
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B8CF409AD
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:03:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hm8-w39PAgIX for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 14:03:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F6ED409A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F6ED409A2
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F6ED409A2
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:03:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 37EB11A26B5
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:03:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0D211606F8;
 Wed,  7 Jan 2026 14:03:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AACFF103C8665; Wed,  7 Jan 2026 15:02:33 +0100 (CET)
Date: Wed, 7 Jan 2026 15:02:32 +0100
To: Che-Wei Chuang via buildroot <buildroot@buildroot.org>
Cc: Che-Wei Chuang <cnoize@andestech.com>, Leo Yu-Chi Liang
 <ycliang@andestech.com>
Message-ID: <20260107150232.7b672513@windsurf>
In-Reply-To: <20260107073401.3004368-1-cnoize@andestech.com>
References: <20260107073401.3004368-1-cnoize@andestech.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767794586; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=m5Syda1+PrTXVvivjA2iaVJ8sX1a9R3VlxOJFgOE5bw=;
 b=ktS2CgRzDm7clNspOV3QwdTp4/WloE5M3eHYsZ50bNZ7myDDEk4d43sgo+5cEACq0EYIfg
 XnGvVB9TpBb5Ror2eqHTGz89LzUImaR2mG3tKGkwI/zdXIwyG96yXw0Imu/8nVoiJp/JZk
 PAMUWRT4ejMLVtYqJ/++8DdM0OH29ybNdR1OwSy4EIjrUchFRK0UTnv7zg362dc9yrteE7
 qL9aKHNu0N2M1ZiiNexMGsDu94ZBb7RFbUd1ZggHEMt99m6Y1N5yEfpr5WW+GKYgsd/8gy
 K/Sjb05NWvPZ2UdtWGDyNijNYK9CacnWeBxPFSdr5B0lLeoljjk1Hxsj+mUwiQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ktS2CgRz
Subject: Re: [Buildroot] [PATCH 0/2] board/andes: add AE350 OP-TEE support
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

Hello Che-wei,

On Wed, 7 Jan 2026 15:33:59 +0800
Che-Wei Chuang via buildroot <buildroot@buildroot.org> wrote:

> This series adds initial Buildroot support for the Andes AE350 platform
> with OP-TEE.

Thanks a lot for your patch series! Always great to see direct
involvement from Andes on supporting Andes platforms.

However I am not sure we really want to have two configurations for the
AE350, one with OP-TEE, one without. If we start going down this route
for each and every platform, we will have an explosion of the number of
configurations.

So you should really decide what is the "standard" way of using Linux
on AE350, and that is what the Buildroot defconfig should use. We
cannot have defconfig for every possible use-case/scenario.

So if the OP-TEE enabled build is the "future" in terms of how AE350
will be running a Linux kernel, then this should be supported directly
into the existing AE350 configuration.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
