Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A839C52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 17:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21EB080B64;
	Fri, 23 Aug 2024 17:41:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qjegaRdJ0xzs; Fri, 23 Aug 2024 17:41:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36CC9810FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36CC9810FC;
	Fri, 23 Aug 2024 17:41:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E3051BF34F
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 884EE40179
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9i7bgSXK-jtj for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 17:41:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 66C8A4015E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66C8A4015E
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 66C8A4015E
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 17:41:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8AFDEFF802;
 Fri, 23 Aug 2024 17:41:16 +0000 (UTC)
Date: Fri, 23 Aug 2024 19:41:15 +0200
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20240823194115.313117a2@windsurf>
In-Reply-To: <20240821144928.2598045-1-festevam@gmail.com>
References: <20240821144928.2598045-1-festevam@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724434876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ePrGFKimBcvvJPNR8mzYsnox3iXK3nuyH5Atn71dQQ=;
 b=h8M5beJDKSl/iPIU8oogazTI3qJ95akTTXLEWtu0yrzHQaP9WckVV1s04dNjZJskLBfd7T
 i/OOZXMr3UymOkY5mv3gf1rNuy6znvoJIqEpiFW9MP+5C7rvCGcejje8T8RHIz0agMioxf
 pbgEbfPcxVGsvqhnktaR+C0zhPj5M0lFpqBowxRf5X4ABuTWCC2tOrTraoyHBBz2fvIEI7
 C9N/3/BiD6GKa4g8yrejS1pjC8G5YTO83vnSI7H1BQuozYEnQ2C63SYIsiepbc/3s5Laab
 uKKtvWoOqvSg6vytrQBkUOhzeeaHQpaE7jXogzFdtphBIJx0M0ct/rOvp5V1SA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h8M5beJD
Subject: Re: [Buildroot] [PATCH] configs/wandboard: update U-Boot and kernel
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

On Wed, 21 Aug 2024 11:49:28 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Update to U-Boot 2024.07 and kernel 6.6.47 versions.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  configs/wandboard_defconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

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
