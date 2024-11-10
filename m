Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A89D12D49
	for <buildroot@archiver.kernel.org>; Sun, 10 Nov 2024 17:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3F5380B8B;
	Sun, 10 Nov 2024 17:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R2s1bENTzbGl; Sun, 10 Nov 2024 17:14:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6B4780B8F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6B4780B8F;
	Sun, 10 Nov 2024 17:14:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FD39DB1
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 17:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89063402E2
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 17:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hKLaDu8CtyuH for <buildroot@buildroot.org>;
 Sun, 10 Nov 2024 17:14:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D40F402D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D40F402D7
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D40F402D7
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 17:14:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9928240006;
 Sun, 10 Nov 2024 17:14:36 +0000 (UTC)
Date: Sun, 10 Nov 2024 18:14:35 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241110181435.36e088d2@windsurf>
In-Reply-To: <20241110170031.322853-1-ju.o@free.fr>
References: <20241110170031.322853-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1731258876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pGBxezZCbQsRjNVzZbGL8wWAk+14bKsvLBrHIFSuxwc=;
 b=LwLwClAcrX+jmQmbqBfptBCWQisHmI7wUwN8lcPrRQFmJMNZ5E2ywua1CR9I5XddGBRJdN
 i7B2YkCG4OWhpeVJ0fdcYBxqrGOvXY41weFoJhIq5dmtGBUkZDrOjLbj98qxcuWb4ly+PZ
 hBHPCGoJZzmnAth/hhSQIeZr+BuWfM4f8YyiAN51zRwpqqRVpH/zHSkmV72V84DE/VewVM
 cf0OpHB4HzoZnBgLVR0adiDzxMcMiIWhEbfL9mmJK74IKnp/S0E20Fwi+qhci4s+BVwfJJ
 MPhAIi8nJUEg8cGjRDxAoFTuhBh954EFBp5KCPciGaKIcgBV/93UfGsDe02HvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LwLwClAc
Subject: Re: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version
 2.4.0
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

On Sun, 10 Nov 2024 18:00:31 +0100
Julien Olivain <ju.o@free.fr> wrote:

> For change log since v2.3.7, see:
> https://github.com/FluidSynth/fluidsynth/releases/tag/v2.4.0
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/pipelines/1535415352
> ---
>  package/fluidsynth/fluidsynth.hash | 2 +-
>  package/fluidsynth/fluidsynth.mk   | 2 +-
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
