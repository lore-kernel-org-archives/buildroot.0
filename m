Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9654C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 08:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94BDD607A5;
	Mon, 19 Aug 2024 08:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a-G98MdLWEle; Mon, 19 Aug 2024 08:39:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A31A1607B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A31A1607B5;
	Mon, 19 Aug 2024 08:39:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D2121BF3EF
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 08:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6804E403A1
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 08:39:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XadUcgkBD6DX for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 08:39:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 09778401FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09778401FC
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09778401FC
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 08:39:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3C2B1C0005;
 Mon, 19 Aug 2024 08:39:25 +0000 (UTC)
Date: Mon, 19 Aug 2024 10:39:24 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20240819103924.58e40ed9@booty>
In-Reply-To: <20240812052101.2920141-1-neal.frager@amd.com>
References: <20240812052101.2920141-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724056766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PMcoMAtpUoW0S6pQgl3e1S+Vf9jqTXN50SpIAlENn18=;
 b=nVbeDT1i7wpTnVv6kgnhAb/Ns3aY0rpZUCZXZDjSSTyDjvyPWLu7A/8XVehAH7tYxj8/iW
 AC8svRTukA8n3+IFPGi3VJ/7tygupe4bYIH/7PuEJfOg0/Bn+YP0b1IaXK7geqUQYD4Egg
 vXWFoWr1sVgXFklkYI4OiiWL1t80ydFXNE4ZCSOwG6SPG8vLYypCaSse1+tk7QtQbc0OKP
 BYmS2+5Ufj1tV7pIHlKKshO0A16fcJOJagVl1l/2MVAi92vdrTLrkM7VVRuEwn5+fCH3nX
 a/8leMUC4vX1bczoSjs2wYQMijfMtlj/GI7jzytPV8+mfmeByV1eI0ZXJE7yyQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nVbeDT1i
Subject: Re: [Buildroot] [PATCH v4 1/1] configs/versal_vek280_defconfig: new
 defconfig
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, romain.naour@smile.fr, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 12 Aug 2024 06:21:01 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch adds support for Xilinx Versal VEK280 Evaluation Kit.
> 
> VEK280 features can be found here:
> https://www.xilinx.com/products/boards-and-kits/vek280.html
> 
> The VEK280 requires a patch for the memory node in the dts file because it is
> not currently correct.  This patch has been applied to the linux-xlnx repo and
> will be included in the 2024.2 release.
> 
> Upstream: https://github.com/Xilinx/linux-xlnx/commit/3c7a97d99bdb3dd6b1f36d7d87d3a3c113dfe2ea
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
