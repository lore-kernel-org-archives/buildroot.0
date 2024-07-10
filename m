Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B33C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 08:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2839081F40;
	Wed, 10 Jul 2024 08:31:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yITwgmnb0nNj; Wed, 10 Jul 2024 08:31:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE0AF81F89
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE0AF81F89;
	Wed, 10 Jul 2024 08:31:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB5E91BF5AD
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 08:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8E9D81F40
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 08:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hom7zGLuxuCr for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 08:31:18 +0000 (UTC)
X-Greylist: delayed 81725 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 10 Jul 2024 08:31:17 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B6AF581F38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6AF581F38
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B6AF581F38
 for <buildroot@busybox.net>; Wed, 10 Jul 2024 08:31:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 430BB1BF20E;
 Wed, 10 Jul 2024 08:31:14 +0000 (UTC)
Date: Wed, 10 Jul 2024 10:31:13 +0200
To: Michael Fischer <mf@go-sys.de>
Message-ID: <20240710103113.17683ac3@windsurf>
In-Reply-To: <20240710074425.21518-1-mf@go-sys.de>
References: <20240710074425.21518-1-mf@go-sys.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720600274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TxTs7qVwD9WqrvtVuvkx959eb6qv7MhF0x3wiscKSNU=;
 b=dotvKzcRkt0Zd6pynFmsCSo8mgTaoi80uCzXIBAsn80SdmfAn92pDYmauY41ADgV0GSlyL
 ZECav16AyZ5aE6kFDx/Cz+WASZpHJTiIW2kYyi/JCSLzBkurzzky5IRI0vFvBEbzH/hUKb
 /cSh7pneDdFsn0qwphcdT/1XosXAcoZxTaBWCBPK1iVxGjNFQDp1rcsn3jBgxFH7IOzWxs
 RI0vMOD7un1S1RSbLPWbuBQ0Mng1cUDuNCycc+1gTMvXtsgNkdKWbTKjViGGcbmSvhOyaw
 7IL/MvYtCN/lVn9hjfkpwQIoZVTsoaLCpPnKWcPiQISyP5HlFbyWFkXw/K/zLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dotvKzcR
Subject: Re: [Buildroot] [PATCH] package/gnuplot: bump version to 6.0.1
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 10 Jul 2024 09:44:25 +0200
Michael Fischer <mf@go-sys.de> wrote:

> Signed-off-by: Michael Fischer <mf@go-sys.de>
> ---
>  package/gnuplot/gnuplot.hash | 8 ++++----
>  package/gnuplot/gnuplot.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
