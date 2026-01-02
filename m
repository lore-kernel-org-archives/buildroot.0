Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754D3FA3753
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 17:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4994280F35;
	Fri,  2 Jan 2026 17:06:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pscUiVLEL393; Fri,  2 Jan 2026 17:06:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C33B580D41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767373601;
	bh=ItM0fJ5qQmoZVGFwMtt4bRl6MtDsE2sFnB/o+f1ybcQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dDfKLpQDH4hxtI2lEoPqSdfV2x0S9nqG/gmF6PsFYUw4jDpYDuUT1o/GFC0HNdqhG
	 xglR46Ajs2YdGM/Ki543TWbG/s3vnI0ASFxgf8gI3B6FjL7/i+IqSSUtk1F2Mp6qdk
	 8S5sNj9KtZIiYJQX1EC/FeDo3A33ljkJKLVvQlndijn0ISDTiuCqIf0t4gzJ1uY/xt
	 EZKVLVOO7kL6xy+pJGh6WC0fiMwXjG8XTu0mO0FOJDFXzYxHFa96j8gGG3tri82tFE
	 Sh7b8XuOgHuZ7IZFrPWMY9CyLe7ueVhftLLuVXkzhwF9x2L4XHpYZpBaDwLr7vLhMD
	 5F8duNODuLcpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C33B580D41;
	Fri,  2 Jan 2026 17:06:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DDF3351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FF3160A7F
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U6dAzXOhhJxW for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 17:06:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 92C84607DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92C84607DA
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92C84607DA
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:06:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 5B7211A25D6;
 Fri,  2 Jan 2026 17:06:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 30E24606C7;
 Fri,  2 Jan 2026 17:06:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AF553113B0718; Fri,  2 Jan 2026 18:06:34 +0100 (CET)
Date: Fri, 2 Jan 2026 18:06:33 +0100
To: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Cc: Jamie Gibbons <jamie.gibbons@microchip.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Conor Dooley <Conor.Dooley@microchip.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>
Message-ID: <20260102180633.13a4ad1c@windsurf>
In-Reply-To: <20250814121637.3775660-1-jamie.gibbons@microchip.com>
References: <20250814121637.3775660-1-jamie.gibbons@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767373595; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=MRU93EzcmtVXfJ78She1B987I7gPh+Np2Vfvo2ymH0s=;
 b=G5ggqrXkZfFIYj1ZAu4EDu3plcWsSYMTQWxGF/dHVL/7OxlROx7AY+MYB0536dym1nIWcW
 HAAOnNihepBS6ufvAaTFOgu4ill823UCxOADPEXHfubaxNlMBzrz/mHjBcixZJ0haBKL6b
 C1B/fG4jSoo03YSAEQYHhEHM/bcAZ5jg3HxRQG+spHGOidXPHKaRTeUtsd3nHCYqwL094S
 VkK2fk2V5caJbDCz54uj54PYE1DRJFTMrEiV0mDxi+YncuUG6PhmbEQPkrddzkuuEb1exe
 +I9avOxddWP1eZMFRaUJrsePWrkLn0+4wjEa9MsD43fqhAHXdcVcm8otzcCA/g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=G5ggqrXk
Subject: Re: [Buildroot] [PATCH 0/3] Add MPFS Icicle kit with Production
 Silicon support
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

On Thu, 14 Aug 2025 13:16:34 +0100
Jamie Gibbons via buildroot <buildroot@buildroot.org> wrote:

> Jamie Gibbons (3):
>   configs/microchip_mpfs_icicle: bump Linux and U-Boot, add hashes
>   board: microchip: mpfs_icicle: update to support production silicon
>   configs/microchip_mpfs_icicle: add support for production silicon
>     Icicle kit

Sorry for the delay, series applied!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
