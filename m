Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD71C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 11:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8F2940293;
	Fri, 12 Jul 2024 11:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EYBA8bobncp6; Fri, 12 Jul 2024 11:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87D5E40752
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87D5E40752;
	Fri, 12 Jul 2024 11:02:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8EDE21BF47F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 11:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AE9540752
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 11:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4I8YhLPpqTfs for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 11:02:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 198D040293
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 198D040293
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 198D040293
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 11:02:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F668E0007;
 Fri, 12 Jul 2024 11:02:20 +0000 (UTC)
Date: Fri, 12 Jul 2024 13:02:20 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240712130220.09d65a68@windsurf>
In-Reply-To: <20240711191539.90650-1-giulio.benetti@benettiengineering.com>
References: <29a51211-e273-4b28-ba3c-648df58b83c3@mind.be>
 <20240711191539.90650-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720782141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BtYLS48Yrb7/l3y9Is6UvmuAa1G3ETh4DYnG//lSu4U=;
 b=TPNtAQvY+mhREdajvnGL6b6B0gfOtdy4IiOjFRL02CKn3r7KujybXGTC2+RDHg2sTX21d7
 W+6QuXAzkMhZdsCo02fa3O2Ag3Meyhop50yga7UKCSJmJgze2vmsefaQbOA4uvl0I8JSgS
 Gn4zDE2cXGAXpJlfNbAlexwqq+5O2pLteS7jHPESN8fdCAPgT/M2yDToAFlGZxI//WJ6QR
 coaLUoY9Ttw+ktYdfDc0ZTpscCKpiS1SHWv2aom9Ad2vjGs7XmxYjHDX+3dL9NSVN/58vh
 C1gPRLjBS+go7VMUYbbyjT49BEv0xSFITmxoLG/oYDUVhRjEpqAYb+jJqY6HJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TPNtAQvY
Subject: Re: [Buildroot] [PATCH] package/sunxi-mali-utgard-driver: bump to
 version 2024-07-11
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 11 Jul 2024 21:15:39 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This version provide patches that can be applied with fuzz 0 and this is
> now required by Buildroot.
> 
> Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash | 2 +-
>  package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk   | 2 +-
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
