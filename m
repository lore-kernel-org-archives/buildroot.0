Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8608DCA0EE4
	for <buildroot@archiver.kernel.org>; Fri, 15 Aug 2025 15:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2609060E86;
	Fri, 15 Aug 2025 15:20:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ToQvaRfaoEeA; Fri, 15 Aug 2025 15:20:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC42B60E84
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC42B60E84;
	Fri, 15 Aug 2025 15:20:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04B2A228
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 15:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA8D260E79
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 15:20:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b1MzP3hdLxkU for <buildroot@buildroot.org>;
 Fri, 15 Aug 2025 15:20:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DD9B460E78
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD9B460E78
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD9B460E78
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 15:19:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A3AE41C7B;
 Fri, 15 Aug 2025 15:19:55 +0000 (UTC)
Date: Fri, 15 Aug 2025 17:19:54 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <20250815171954.19b3ea36@windsurf>
In-Reply-To: <20250815110935.6530-1-giulio.benetti@benettiengineering.com>
References: <20250815122406.3d466418@windsurf>
 <20250815110935.6530-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeegfeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgffhkeekgeevgfekhfeggfelffdvgfdtteduuedthfehfffgkeeileefhedvkeelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepghhiuhhlihhordgsvghnvghtthhisegsvghnvghtthhivghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopegsuhhilhgurhhoo
 hhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755271196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DtLwjfUqjaNxC7Mbk39PZdAbDlMXwwWvEm1kkP9VDzc=;
 b=H7N2oDOMH5MUmpIgkVVRsbjipwkaTQIkpJdoU2t3gNucIq7NS1rXZRTelz9Udbsk0PuFd5
 KeaNHK6zfGJ5ws/TOMZfmHcUcRNXFKThXp80o7j5Btn+Hli29cqrZTIus+CjSo4CVc0mW6
 q2uk5qSGR4xHV6Ljkk18Qxv6Beb0BZDQelI5MknGO0a0YEVS+tlZXhRPA7loKNUYlZJPzI
 twZc65vYg6wp1fdV2y2mW7OxdNzQcGCe21br+l98RCehwIPEBq5H17pBlrC48d9aEcfeRZ
 uI8qiFyEDEy6OkDG9joz091gittTPH8HzUwJyvaqN/Vs1vXBPzGnHr1C2Gzl7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H7N2oDOM
Subject: Re: [Buildroot] [PATCH v2] package/libtracefs: fix build failure
 due to missing NPTL
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

On Fri, 15 Aug 2025 13:09:35 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> With commit:
> https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/commit/?id=31acfe1747b273e147f864b5a62a4e39197ca1a2
> package libtracefs utest started to use pthread_barrier_() functions and
> this lead to build failure when we build without NPTL. Since utest is
> not needed on the target we can avoid to build it, so let's disable it.

This is already much better (thanks!), but still isn't easily directly
actionable by the LTS maintainer. You need to bring this back to the
Buildroot commit that introduced the "issue", so that the LTS
maintainer can trivially figure out whether this patch needs to be
backported to the LTS branch or not.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
