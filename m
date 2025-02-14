Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8955FC02198
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 22:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32691417CE;
	Fri, 14 Feb 2025 22:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n0Zf2G5I8oSV; Fri, 14 Feb 2025 22:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 024744199E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 024744199E;
	Fri, 14 Feb 2025 22:00:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B9161E3
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 22:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF862409B1
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 22:00:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v94VTgt2OMb4 for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 22:00:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9A7FA40451
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A7FA40451
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A7FA40451
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 22:00:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5016144490;
 Fri, 14 Feb 2025 22:00:03 +0000 (UTC)
Date: Fri, 14 Feb 2025 23:00:02 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Neal Frager via buildroot <buildroot@buildroot.org>
Cc: Neal Frager <neal.frager@amd.com>, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com, ju.o@free.fr,
 romain.naour@smile.fr, michal.simek@amd.com
Message-ID: <20250214230002.007445d0@windsurf>
In-Reply-To: <20250214165402.1128194-3-neal.frager@amd.com>
References: <20250214165402.1128194-1-neal.frager@amd.com>
 <20250214165402.1128194-3-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehtdektdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgduleemkeelgegsmeehhedttdemvddutggvmegsvgehieemrggsfedvmegtrggrvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekleegsgemheehtddtmedvudgtvgemsggvheeimegrsgefvdemtggrrggvpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehnvggrlhdrfhhrrghgvghrsegrmhgurdgtohhmpdhrtghpthhtohepihgsrghir
 dgvrhhkihgrghgrqdgvlhhorhiirgesrghmugdrtghomhdprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghrrghnughonhdrmhgrihgvrhestgholhhlihhnshdrtghomhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesshhmihhlvgdrfhhrpdhrtghpthhtohepmhhitghhrghlrdhsihhmvghksegrmhgurdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1739570404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X2YFHYGLb5/mzALj0rq3Re4xA0EAXaw5aZy6U2YofSg=;
 b=Tgim4NT49xAYywrc5mAy36oLtym4wyRufYiPMGi8/U7aVfaskSPshd+/A/4Acw/qwrXHy5
 uJSGCK/ANGtn/Y3VUikedXKg8ZAhDGjAWvq26rXnDEv5mTHLPhfQScemr9pB4EQdOxuKYv
 U9VUDqGdSd14auu8JVY7Zbzbgjwj+Ex4hK1elKOQnITLrCKPGaRC3xlDDD7NGCzYChXejM
 YMXJIpp71crdwHjTxgQdswLSfSYQcr4roMhABRnE9Aq9/+1d1o+PhbZvrHE120h7/gz/ab
 EbHJeTBN5+xtOMv1nvusMdAvnqXDNnAzfeU/fDSnXtZkbH+2TT9iG8w4k0W3Ig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Tgim4NT4
Subject: Re: [Buildroot] [PATCH v2 3/4] package/newlib-bare-metal: add
 multiple tuple support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 14 Feb 2025 16:54:01 +0000
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> Add support to newlib-bare-metal to support multiple architecture tuples
> with the BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH string.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

And same as binutils-bare-metal for this patch as well, for consistency
reasons.

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
