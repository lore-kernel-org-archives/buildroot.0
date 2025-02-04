Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F774C02193
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 15:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3525941288;
	Tue,  4 Feb 2025 15:33:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kVbE9qnTSvIP; Tue,  4 Feb 2025 15:33:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0084241242
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0084241242;
	Tue,  4 Feb 2025 15:33:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 80D2312A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 792F840AE5
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:33:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mRVn7Prwr232 for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 15:33:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D684B40442
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D684B40442
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D684B40442
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:33:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C5243443F3;
 Tue,  4 Feb 2025 15:33:03 +0000 (UTC)
Date: Tue, 4 Feb 2025 16:33:03 +0100
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>, Eric Le Bihan
 <eric.le.bihan.dev@free.fr>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>, Marcus Hoffmann
 <buildroot@bubu1.eu>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20250204163303.0c57a2a1@windsurf>
In-Reply-To: <20250120211707.2381182-1-fiona.klute@gmx.de>
References: <20250120211707.2381182-1-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeklecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeejpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehfihhonhgrrdhklhhuthgvsehgmhigrdguvgdprhgtphhtthhopegvrhhitgdrlhgvrdgsihhhrghnrdguvghvsehfrhgvvgdrfhhrpdhrtghpthhtohephigrnhhnrdhmohhrihhnrdduleelkeesfhhrvggvrdhfrhdpr
 hgtphhtthhopehjrghmvghsrdhhihhllhhirghrugdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghusghuuddrvghupdhrtghpthhtohepfhhonhhtrghinhgvrdhfrggsrhhitggvsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738683184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/eG8A25DAbAHhn7Q7Je49qmFZWUW4AlnqTxinZXqiog=;
 b=I1O9QK2vd956tE3Llrp+y56Qnk27ObbScZDbVbuBXG2XLmwKsmIEnmPK/NxqGTwzcjYh4q
 LcL6detDGP+nhtCA1nuvrgZGY1T0t/0fJncDAbjK9a6MZTtDqQgaF/dmgJTmfdv5sm8IM8
 kvsgGdL+LP/nv8VSzyp5ZYCu70DpSwUHZBKlTb7V7sIzgyjRo05h+YoHIvFLeJK+DO7CAO
 MXkaWgnF0wVJrPq/KG79He3xOU5zmLkGk79gE0r1PHN/+3f9IW58VVPGbi+jEcBT14g8dU
 8j4GiejiiLgGT05ABFQe4lYPe5uDtCGRh72FEiJZfv3ojMdktTe1Ae6aa4tPyw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I1O9QK2v
Subject: Re: [Buildroot] [PATCH v9 0/6] libglib2 2.82 series with bootstrap
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

Hello Fiona,

On Mon, 20 Jan 2025 22:17:01 +0100
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> Since 2.79.0 libglib2 needs to be bootstrapped without introspection
> support before gobject-introspection can be built, the added
> libglib2-bootstrap sub-package takes care of that. See NEWS:

You will not believe, but I've merged your series! First of all, thanks
a LOT for your work on this topic and your persistence. It's really
great to have someone who was brave enough to tackle this quite
complicated topic and push it to completion. Kudos to you for this!

Compared to your patch series, here is what I did:

- Added a fix for the network-manager package that was not building
  with toolchains using < 4.20 kernel headers. This was not initially
  related to your series, but since I tested your work with
  NetworkManager, I encountered the build issue.

- Added a fix for the Python SDBus NetworkManager test, which was
  failing because of the above issue.

- Added a new test case based on the info you have provided in your
  cover letter to test i11n with NetworkManager. I have assigned you as
  the maintainer of this test in the DEVELOPERS file. I hope this is OK
  for you of course.

I did one minor change in the libglib2.mk file also, I'll reply
separately to it.

Since your series contains a fairly significant update to libglib2, it
would be good to keep an eye on the autobuilders in the coming days for
potentially fallouts from this version bump (affecting other packages).

Once again, kudos and thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
