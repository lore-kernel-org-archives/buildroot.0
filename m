Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396EDCD128A
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 21:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3E6D60EA5;
	Wed, 10 Apr 2024 21:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KRmLvzAG9rO2; Wed, 10 Apr 2024 21:06:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3D5260EBB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3D5260EBB;
	Wed, 10 Apr 2024 21:06:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 82E531BF4D6
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C3E5405CA
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 67YY2bAxwJIB for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 21:06:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2790040425
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2790040425
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2790040425
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 21:06:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E21351C0002;
 Wed, 10 Apr 2024 21:06:18 +0000 (UTC)
Date: Wed, 10 Apr 2024 23:06:17 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240410230617.706f2d7e@windsurf>
In-Reply-To: <20240330143005.1621629-1-giulio.benetti@benettiengineering.com>
References: <20240330143005.1621629-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712783179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DWlP9dg0I+SstDO7KOEplAYp4qeLfgcBLdLAzfWV0/Q=;
 b=oKK/NCuE1ZmmEbIjhoEaBaLuNcRTS8z/AgznJzzedDRYrvmTDSzTWyA44/byT+mBNOdTbr
 B5hhL/N9h7rDpAmpy/XvDPXpnzJZukqAcBo/B86mEoSN9zbWHMFsOSEWmqrTN+VS2lPYcT
 wfOvdxFTtZa0ZwMhknB0rSf3p4pnmipYJ35ni3ZxPA/ufbNiM9++pmXoa5lhfoLVUZ4zXm
 Bo5jvIYF34PtFCXUTDVAKHFqz5HevuAYB5uA6MnJKUCmGPdvYkRo9gIQIbk4BjAzYuQfDM
 WMbR4uIvcJ5iNsFwVV6xGhO7KYFAMvr4308gw9YqYNa7UHOZ5oqzOhMuiMZXlw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oKK/NCuE
Subject: Re: [Buildroot] [PATCH] package/swugenerator: bump to version 0.3
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

On Sat, 30 Mar 2024 15:30:05 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Upstream github tarball dropped prefix "v" while releasing version 0.3
> so let's drop it in swugenerator.mk as well.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/swugenerator/swugenerator.hash | 2 +-
>  package/swugenerator/swugenerator.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
