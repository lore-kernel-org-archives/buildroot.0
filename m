Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2A1C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14DDB40942;
	Sat, 13 Jul 2024 14:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aBmEw9VXgCNJ; Sat, 13 Jul 2024 14:28:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3271413AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3271413AE;
	Sat, 13 Jul 2024 14:28:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 259851BF41B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11F614018D
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:28:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hNTOPHaMHGDS for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:28:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C877840096
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C877840096
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C877840096
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:28:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 014E3E0002;
 Sat, 13 Jul 2024 14:28:07 +0000 (UTC)
Date: Sat, 13 Jul 2024 16:28:04 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240713162804.7bfcae8d@windsurf>
In-Reply-To: <20240713132532.4099578-1-dario.binacchi@amarulasolutions.com>
References: <20240713132532.4099578-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720880889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oB5nBpAZFLJRXrx4ARHZsaaKpnyryeKxiNkIGCJ8i24=;
 b=ZAxqWa3HYAGt1YsxDOMMXG40k0O4Vh7ksFYV7qcsa5Wyo3Zac3cBQVwYrqPPi5DXqdR8PV
 qWrlLIdq4iRr1RwjuGrtjwweNrnmrlZ+aqwgO1CLKX93Ilu9urDAtmhDlsb0lu08qMCeuM
 AxdUAq8Mv5rwj20kcQO1OuGotzSNLLKdaNY1IEc3DyUWIDNMpViB36kV2uQHhrR612GdpS
 SkoUBD1O7Fel232LWIWLC47X7ufybfDlxDjxoTpkuvyI2VkNKMprKBdnMo7mTEkjO2y3Kk
 GclaDU3nXhgvtm9cuQUhEu4Q8i6yCD9Fxo13IdMqZ+n0r41x7KgOxPhKq9lRkQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZAxqWa3H
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: drop duplicated libnfc entry
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
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 13 Jul 2024 15:25:32 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The patch removes one of the two occurrences of libnfc from the list of
> packages managed by Simon Dawson.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  DEVELOPERS | 1 -
>  1 file changed, 1 deletion(-)

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
