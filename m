Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67909CE7A96
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 20:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FA03400E4;
	Thu,  5 Sep 2024 20:35:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pj4NuUfpTRKW; Thu,  5 Sep 2024 20:35:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 303A040530
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 303A040530;
	Thu,  5 Sep 2024 20:35:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9FAEA1BF41B
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C5538133D
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:35:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KMSHl_q4mBeT for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 20:35:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 73C0F81255
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73C0F81255
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73C0F81255
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 20:35:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BA9571C0003;
 Thu,  5 Sep 2024 20:35:48 +0000 (UTC)
Date: Thu, 5 Sep 2024 22:35:48 +0200
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20240905223548.6358b331@windsurf>
In-Reply-To: <20240904123459.2089677-1-festevam@gmail.com>
References: <20240904123459.2089677-1-festevam@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725568548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mk+6oCe1J4ixaaoAmJ8Cw5aw4KwnKAxOGkU/oqlDj/k=;
 b=RSZElfYKlH2RSZOaedn/4Wd9YbXF7bDBbtxA4gskl2cVbdQ4Kjjr2sm58+irkaBqoclDKm
 fV6Y5LJNkJpb3XmGfgf4wS3NVALbLaX7t+fXpha8oAXKxTdxKtzXpZTR7bE0l6oohIPMEQ
 pwHkBFQyELR4N3HiemnBRCZjmH27vOQPvlDb6L0dUThbhErhkmTQyhPqMDuoWjadDj9MTl
 quQuSyqo/tHojrkcX/vZMrNKIZ2yNdXKjTf0ThtbZ424H/e8rmL9Ss+ndZpfSYlP9gwHcV
 XEwz3ScDNBfBxW5Se+pbqf9PrTzvsPj5NxzY4MfH9QXqbSDky2D5XcTR3Mc44Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RSZElfYK
Subject: Re: [Buildroot] [PATCH] configs/imx6ulevk: update U-Boot and kernel
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  4 Sep 2024 09:34:59 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Update to U-Boot 2024.07 and kernel 6.6.48 versions.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  configs/imx6ulevk_defconfig | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
