Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D02EC25B5F
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 07:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1544401CC;
	Sun, 12 May 2024 07:07:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MYw1VvVRs7gv; Sun, 12 May 2024 07:07:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C089A402DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C089A402DC;
	Sun, 12 May 2024 07:06:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 24F481BF473
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1079D8409D
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:06:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xVr2wo90EqVv for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 07:06:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8F87D84091
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F87D84091
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F87D84091
 for <buildroot@buildroot.org>; Sun, 12 May 2024 07:06:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0DEBE240005;
 Sun, 12 May 2024 07:06:53 +0000 (UTC)
Date: Sun, 12 May 2024 09:06:53 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20240512090653.34bc6e0a@windsurf>
In-Reply-To: <20240511235609.88305-1-christian@aperture.us>
References: <20240511235609.88305-1-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715497614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uFJCXDChaOqykyFy0HQxkSovjwdkFaOsANALGq+jTo8=;
 b=iZa0j3nVC0Q5rWsXfD+aKqa3DRqlj1j4E9aMGHfJODoanaYS/1gPfa+Pdi6GIlcygSoUKq
 KB4QeQ6Zrv+7LLNFXRKHBCqnU91RyWj0O05P1D0FiMHGln9EC8xS59yj3K2I2Wyf86j2Pd
 FHRnbl6zO8YO8RVdkYAlpQzWHsVKXqABK1bzTqy3VFOzjBVJXnwQ8lP4JSCAVBx+xEQXwo
 Dc/KOamaRCp2DJ0IRpwmUh/h0krLBLIW4F4QC3l1iPmFtgOZI4sC5NAT0V079k11RzPG4i
 eRcITnL6LOr+51XMUy3QBCgUnzBQoSnoEOIpIck0kTeaylLmCmZtUrbk9KRx0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iZa0j3nV
Subject: Re: [Buildroot] [PATCH v1 1/1] package/docker-compose: bump version
 to v2.27.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 11 May 2024 16:56:09 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> https://github.com/docker/compose/releases/tag/v2.27.0
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/docker-compose/docker-compose.hash | 2 +-
>  package/docker-compose/docker-compose.mk   | 2 +-
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
