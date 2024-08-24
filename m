Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7173C5472D
	for <buildroot@archiver.kernel.org>; Sat, 24 Aug 2024 19:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BEB4811E8;
	Sat, 24 Aug 2024 19:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ymLlGVl5rdPh; Sat, 24 Aug 2024 19:00:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CA0F81190
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CA0F81190;
	Sat, 24 Aug 2024 19:00:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 772341BF314
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 19:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65A14400F2
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 19:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c6kOKtMnXJ6Y for <buildroot@lists.busybox.net>;
 Sat, 24 Aug 2024 19:00:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B95F64010C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B95F64010C
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B95F64010C
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 19:00:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6D181BF206;
 Sat, 24 Aug 2024 19:00:18 +0000 (UTC)
Date: Sat, 24 Aug 2024 21:00:17 +0200
To: Vincent Jardin <vjardin@free.fr>
Message-ID: <20240824210017.06355474@windsurf>
In-Reply-To: <20240821095044.10038-2-vjardin@free.fr>
References: <20240820233830.5927db8d@windsurf>
 <20240821095044.10038-1-vjardin@free.fr>
 <20240821095044.10038-2-vjardin@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724526029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jXtVNceSgG+MoiXaCyuWPliXN/CwLYPvPLw6MUdA5gA=;
 b=hYSroQ3xHNzEvtLSXjIgTdrZSkXv6S/GO2RoIPwKnPWwEIZznTObUppdybygPGgPvOw9Vd
 BHSBo4nBFBCGJkkwIslB5UZAHjBZF7W0yn0fLJrs/1WdUzD7InPIaNOevqSjZMXtM3t31O
 qIfmy+NPD7+XqJlDPwHpx6iJcWichHxfokyXYGXZYshab2Cu0wG8CeW0pQTPMpQfreEktl
 8va6jElMhLiSziRdO56Y7nL8NQYE/UCcll5uXuSvtH6BvuV3KwQLVYchgbSQJ2Sa2l1Tqv
 PuyOr1TObp05qFxckAp41IIhOmH66f0ZIf1sZt1mto2Xe1DRbzkxCWVaBEAXmQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hYSroQ3x
Subject: Re: [Buildroot] [PATCH v2 1/1] package/lsuio: bump to 2020 version
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
Cc: peter@digitalbrains.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Vincent,

Thanks for this v2!

On Wed, 21 Aug 2024 11:50:44 +0200
Vincent Jardin <vjardin@free.fr> wrote:

> diff --git a/package/lsuio/lsuio.hash b/package/lsuio/lsuio.hash
> index 2df6d074f4..472aee6e3e 100644
> --- a/package/lsuio/lsuio.hash
> +++ b/package/lsuio/lsuio.hash
> @@ -1,3 +1,4 @@
>  # Locally calculated
>  sha256  c88b3850248b2d3419e025abd7b9b0991c8bd33a2d4983f9608408a29900bfb5  lsuio-0.2.0.tar.gz
>  sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
> +sha256  fe799ea2920f07b3d950ae9b6b3dec8c0838437f4571fc8091b94fd765b3d415  lsuio-ba46808da148552462e50ba66d8d15cc5b9a3a00.tar.gz

There was no need to keep the hash for lsuio-0.2.0.tar.gz, and we
normally put the tarball hash before the license file hash. I've fixed
those minor details, did a few small tweaks in the commit title/log and
applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
