Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DB8D0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 15:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FA2081E07;
	Sat, 26 Oct 2024 15:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TzcDRsNSOYJP; Sat, 26 Oct 2024 15:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77DB581E5F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77DB581E5F;
	Sat, 26 Oct 2024 15:58:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B2DF5C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C13C40355
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:58:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ud45l_H3uWs for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 15:58:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2BFFB40347
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BFFB40347
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BFFB40347
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:58:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 457F420005;
 Sat, 26 Oct 2024 15:58:38 +0000 (UTC)
Date: Sat, 26 Oct 2024 17:58:36 +0200
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org
Message-ID: <20241026175836.4f5661c7@windsurf>
In-Reply-To: <20240916081229.14823-1-adam.duskett@amarulasolutions.com>
References: <20240916081229.14823-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729958318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6OJdEHrYrKtNrkEiDfGlOE8stRILJLVqMN4OOgeshbY=;
 b=kUKi2BzW330ibvP1r3bZHtuP/mtAmlZFglrQ4Gm3X+bJsWjIk0DpUK/FL+90YTL9GwgWqM
 +LPd95xHxIyrRVXHG7hojPB5K84uuW903GKCLitXQq7ipGrK7n/g4rdaj75GMgHKiLGn9M
 E0+8t5preS/H2ewY9ddsbejWUIQmhPLB6/Tj+Xe3slIhcnuPu4E0VhSJPbePXaZl/NOEW0
 K973gwLlYubujWwPM6nJbnkwLLV7mDA8p6f5MPMMvPycacFoYL6e6/5YexxfjJFlyIErGI
 qSe2TsxVC/kNCAkuHX079JAB3PM5bBC7Dgk9fxwvFWb0ffsMxWeuOirtXEX0AA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kUKi2BzW
Subject: Re: [Buildroot] [PATCH 1/4] package/depot-tools: bump version to
 22df6f8e
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

On Mon, 16 Sep 2024 10:12:26 +0200
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/depot-tools/depot-tools.hash | 2 +-
>  package/depot-tools/depot-tools.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Thanks, series applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
