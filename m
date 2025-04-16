Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDC9C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 20:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A402A424EF;
	Wed, 16 Apr 2025 20:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rS7V7Vb-CazZ; Wed, 16 Apr 2025 20:40:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E117424AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E117424AB;
	Wed, 16 Apr 2025 20:40:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12245920
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0339D4199A
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:40:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aMgPcoZFuhXy for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 20:40:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E9D9E40E58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9D9E40E58
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9D9E40E58
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:40:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E038D43A79;
 Wed, 16 Apr 2025 20:40:35 +0000 (UTC)
Date: Wed, 16 Apr 2025 22:40:34 +0200
To: Thomas Perale <thomas.perale@mind.be>
Message-ID: <20250416224034.3eb04598@windsurf>
In-Reply-To: <b864a02f-c98a-48f5-863a-a7bd800809f6@mind.be>
References: <20250415195547.199428-1-thomas.perale@mind.be>
 <87tt6o3oxx.fsf@dell.be.48ers.dk>
 <065809af-e4b6-4bd8-9f53-49d39fab38af@rnout.be>
 <4b029329-2258-428d-80c9-315dbd6335be@essensium.com>
 <20250416215812.6a8ae1a5@windsurf>
 <b864a02f-c98a-48f5-863a-a7bd800809f6@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdejfeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehthhhomhgrshdrphgvrhgrlhgvsehmihhnugdrsggvpdhrtghpthhtohepthhhohhmrghsrdhpvghrrghlvgesvghsshgvnhhsihhumhdrtghomhdprhgtphhtthhop
 egrrhhnohhuthesrhhnohhuthdrsggvpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheptghhrhhishhtihgrnhesrghpvghrthhurhgvrdhush
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1744836036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L9Ou7ZviZmpEAB2gPDGuzfZrr1om9KgoDTUGdxXRuJs=;
 b=O1u39frM4S/LevrlNQ7w08Zzr+TrbpYgeHtNDAQVXAnpvtWcrjfsHgiiQ8hF9mU3Ex4Ph8
 L9c+aohQ79rUGwmhkPCTMDbAHZx7/59Hj0iVgCzpxYoAUdhvyXJXtwEzJrRNZuxZpJGDIr
 WyBziDuJzh+k+OCcUgT7A+Y8E3/a+D32+2Jsw0DuRt4rdG7VBQZkolzsrll9yaGH9qH1xv
 ehLQk3V4loMN802Hs593Wm2+d58IHVwC7V1ubs/PAAhCM5rwVKju+GAjchsCuDM0nKPbRj
 zKc0c/6qdXfW17EynygvnWWzU8mXV08P7VnkyAa1voMJh5TNH9XuShYl7Nc9kA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O1u39frM
Subject: Re: [Buildroot] [PATCH 0/7] Add PURL support
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
Cc: Arnout Vandecappelle <arnout@rnout.be>,
 Thomas Perale via buildroot <buildroot@buildroot.org>,
 Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@essensium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, 16 Apr 2025 22:06:17 +0200
Thomas Perale <thomas.perale@mind.be> wrote:

> DependencyTrack uses NVD annotation unfortunately.

And? Sorry, I'm not sure to follow you.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
