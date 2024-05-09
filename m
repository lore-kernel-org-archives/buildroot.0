Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFD5C25B74
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 21:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A44894175A;
	Thu,  9 May 2024 21:16:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vxy1hdRwnOXX; Thu,  9 May 2024 21:16:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C12441763
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C12441763;
	Thu,  9 May 2024 21:16:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BC4721BF427
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7E3141763
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:16:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jEtdnjAgrzA1 for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 21:16:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3E1674175A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E1674175A
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E1674175A
 for <buildroot@buildroot.org>; Thu,  9 May 2024 21:16:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4AB020002;
 Thu,  9 May 2024 21:16:35 +0000 (UTC)
Date: Thu, 9 May 2024 23:16:34 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240509231634.112c4dc4@windsurf>
In-Reply-To: <aa627e66-c932-42fc-a5f4-aaff35449bf9@bubu1.eu>
References: <20240328110058.2037303-1-buildroot@bubu1.eu>
 <20240410232520.20172e60@windsurf>
 <aa627e66-c932-42fc-a5f4-aaff35449bf9@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715289396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wu6squS7/zxIL5eEKuccxHYmAlyaQQUnPr/GUZFO2fw=;
 b=VfOPlqZ28TOeQNOh9GGFZm69eCV4NMvqoFH+jlRflAUmBjwKrOw4yodPeHUvKD5+7WRUoK
 93Y0IhqYF9CYhHcuFs53vGMAAf3xNmZAYndEhTNjB7wTPR9K9UmmVjQenLVrMpu3h5X4Be
 O76f+CYtacjOxof7lHgFRSwSrnS98KkvJbMd+0GfWz3k7zA9OFuMI+LyhOB8qwM3+q6VCJ
 xOMFNpnZt3lndPPDUelZj0ar333GFwhBXRCSiseTyjHpoDRdaUSqwrHi837fNS9RBK+I3I
 D2zC4xgONc4cw2saIOnPIHz2cPOhHB9pfE311ia8Z5Mzr5duvvG/e/xzwChyJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VfOPlqZ2
Subject: Re: [Buildroot] [PATCH] package/nodejs: bump to 20.12.0
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
Cc: Daniel Price <daniel.price@gmail.com>, Marcus Hoffmann <buildroot@bubu1.eu>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 15 Apr 2024 14:38:50 +0200
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> I did not (yet, will do now when I don't need my PC for day ;-)). What I 
> did was build nodejs for our target which uses host-nodejs prebuilt and 
> target nodejs from source. That continued to work as expected.
> 
> I'll report back about the tests once I get around to it.

Do you have some further updates, so that we can perhaps apply this
version bump?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
