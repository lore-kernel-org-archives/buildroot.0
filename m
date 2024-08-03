Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E9DC3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 21:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AC2180E01;
	Sat,  3 Aug 2024 21:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mo_Pz8G_Mlyg; Sat,  3 Aug 2024 21:01:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DCB080DE1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DCB080DE1;
	Sat,  3 Aug 2024 21:01:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE24E1BF35D
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 21:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C87F24027C
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 21:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P3U6qa82y-G0 for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 21:01:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6B7A3400DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B7A3400DD
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B7A3400DD
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 21:01:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C13D2240004;
 Sat,  3 Aug 2024 21:01:27 +0000 (UTC)
Date: Sat, 3 Aug 2024 23:01:26 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240803230127.75ec5f8b@windsurf>
In-Reply-To: <20240803204331.396912-1-ju.o@free.fr>
References: <20240803204331.396912-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722718888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IZJ95A9kNz3rTAxECkmjoWi8XBRPedhZe2LwaxANRXc=;
 b=cuhZV9/fo1yd4vNluKQAmjtunjjTMMKtumb0JTSHBxICEyjOZxeaqFDZ5OxK1YQykEGEM8
 in+18dYAJhbr3sdubyydtHOTkwJxMScpYddfhWCi24LoMI4OjtwIbrsodQU2orpA08GXTQ
 tMZcDcFfWFXX2siApJNuFXekeQTLLwhRWREXYF7MmiFfp8/vJ1+OZIj+P0yoljraS17XzY
 KW30kfMu6/8ILDXnHdoY1vK40gaStSA7sNQ+8bz/X6HNvreGSWTTmNOkqUDqAka5YCIv5/
 Ey7vkPiAZjLn7WKkhBiVU4tYWVH/m7y+kNYkkb1EvMfw2ZE/RwhRGR4eXwz1dA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cuhZV9/f
Subject: Re: [Buildroot] [PATCH 1/1] package/genimage: bump to version 18
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  3 Aug 2024 22:43:31 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For a change list since v17, see:
> https://github.com/pengutronix/genimage/compare/v17...v18
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/genimage/genimage.hash | 2 +-
>  package/genimage/genimage.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
