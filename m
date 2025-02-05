Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DD6C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 10:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF9556109F;
	Wed,  5 Feb 2025 10:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jy7YEaL27B-n; Wed,  5 Feb 2025 10:02:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAD15610A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAD15610A5;
	Wed,  5 Feb 2025 10:02:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AD70B12F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94B6883B1A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:02:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k6VWiIZTnX2F for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 10:02:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A59B283B15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A59B283B15
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A59B283B15
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:02:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E78B9433ED;
 Wed,  5 Feb 2025 10:02:26 +0000 (UTC)
Mime-Version: 1.0
Date: Wed, 05 Feb 2025 11:02:26 +0100
Message-Id: <D7KFCEE0ZEXQ.2XLWMRBDTR8HK@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, "Ezequiel
 Garcia" <ezequiel@vanguardiasur.com.ar>
To: "Arnout Vandecappelle" <arnout@mind.be>, <buildroot@buildroot.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250204-repair_mimic-v1-1-c8e8f29b6c1e@bootlin.com>
 <05b5558f-a882-4110-ad95-840221b0b239@mind.be>
In-Reply-To: <05b5558f-a882-4110-ad95-840221b0b239@mind.be>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkfevuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfvfhhohhmrghsuceuohhnnhgvfhhilhhlvgdfuceothhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfdtgeethffggeehheefgffgvdetjeeghefhgeetfffhleevvddtleeitddtgfffnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgrdhsohenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheprghrnhhouhhtsehmihhnugdrsggvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegso
 hhothhlihhnrdgtohhmpdhrtghpthhtohepvgiivghquhhivghlsehvrghnghhurghrughirghsuhhrrdgtohhmrdgrrh
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738749747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JYCzGceQPv56OC4t4vUIY7EntsubVn8lcyGfThwkYdk=;
 b=oJc5WL2Z1boXi3+AP8D+bNpkPLsNYUt1xJl3q96aaU21XxWJ3BljXLkXJpFMoOahndpniO
 DOEWX9nz5DSRNN3vICVktKKti21Ppi4hxjO70sUUL5woPUAHnxXaGyhp4sOPI2ZZ5HpfFL
 ZsMBKjDsQCyLF/B1+7Q8ervi+33DUTmMZB4q59s2NBzas11LNjcmtUJlX6UTUeS6Id9gmE
 6Wl5DFKv3c+Z6kHVE52qb6uzcOw3FhBEnve077D/8mxy0KiFPXdNxdGE+iiFp9hvopuELl
 crjq/R9lIL9EFGmS7SjMgpEni0iEN9Kq/FuGu8RbicbRtpjoQEFhU718minhYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oJc5WL2Z
Subject: Re: [Buildroot] [PATCH] package/mimic: update url
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
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue Feb 4, 2025 at 6:07 PM CET, Arnout Vandecappelle wrote:
Hello, thank you for the review.
>
> On 04/02/2025 17:16, Thomas Bonnefille via buildroot wrote:
>> MycroftAI just moved mimic to "mimic1" on Github as multiple versions of
>> it have been released, this cause the sha256 of the package to be
>> modified.
>> This commit modify the URL of the package to avoid this issue.
>
>   Changing the URL doesn't actually fix the issue: the contents of the tarball 
> still have mimic1 in there. We have to change the hash.

Sorry, I must have messed up things on my local folder with the
buildroot cache to think that it was solving the issue.

>   But we can't change the hash without breaking existing downloads and 
> sources.buildroot.org. So we also have to change the file name. The easiest way 
> to do that is to also bump the package version.
>
>   Or we could drop the package :-)

Indeed, the package hasn't been updated in four years, it must not be
useful nowadays...
I can send a patch to remove it if you want ?

Regards,
Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
