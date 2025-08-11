Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A83DCA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 20:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E622F8412C;
	Mon, 11 Aug 2025 20:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lCOPJsKIkAwk; Mon, 11 Aug 2025 20:52:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E671084126
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E671084126;
	Mon, 11 Aug 2025 20:52:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AC7F4B8B
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 20:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9319A40F5C
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 20:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4mx1AG4JEI_D for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 20:52:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::236;
 helo=relay16.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4E6B74005E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E6B74005E
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::236])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E6B74005E
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 20:52:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5180944A09;
 Mon, 11 Aug 2025 20:52:11 +0000 (UTC)
Date: Mon, 11 Aug 2025 22:52:10 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20250811225210.57d4340f@windsurf>
In-Reply-To: <d483d5ac-58f7-4517-b049-3a7688b83d2f@gmx.de>
References: <20250809223229.2307960-1-fiona.klute@gmx.de>
 <20250810124736.00b1cc30@windsurf>
 <d483d5ac-58f7-4517-b049-3a7688b83d2f@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeefgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehfihhonhgrrdhklhhuthgvsehgmhigrdguvgdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepjhgrmhgvshdrh
 hhilhhlihgrrhguudesghhmrghilhdrtghomhdprhgtphhtthhopeihvghgohhrshhlihhsthhssehgohhoghhlvghmrghilhdrtghomh
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1754945531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AGFuwbwuXzF1hO0juXA1MCmq/Psvglp/YUMKGRtVTUo=;
 b=FaZXs/THUh5boAju0SKKByUiKXWYARdsZjDvkTafReE/pMCCwu2+44OUCNDnZhF0zTDqRO
 hnCv4GL1DpR3mRwYpP5oKmPQNnARJYFR1r5M2KTia9BagRH3HwGtqxx6YbyDSfp/7LfKb8
 EHyLlPOp1LKUSq4uXf7UWOqWaIm1+nRnGXl0uZeQ+3NF7np0D0tdijdzPzWizdRAWbWy5m
 QCRPb3o+hakass76SukZaMSDGA/ibiNPQEVHbP5+wj2gFhCAy1/Z1ggxAjsfy/uWmWJnaH
 3gJwNcV6V6xK0MTmanzSfE9eJWgFXYp0t1oH1OFCQoxqzM/MHrO3DppSgOTwAA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FaZXs/TH
Subject: Re: [Buildroot] [PATCH 0/7] Add package/python-memray and
 dependencies
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 11 Aug 2025 12:53:52 +0200
Fiona Klute <fiona.klute@gmx.de> wrote:

> Something like "record a trace and process it into 
> statistics/flamegraph" should be simple enough to do, checking if the 
> output makes sense would be hard to automate though. Would just "doesn't 
> crash in the process" and maybe a grep for expected items be enough?

Something simple is enough. As you say, ensuring that the output makes
sense is too complicated.

> I'll add it then. Would it make sense to use "depends on" the new option 
> in package/python-memray then, to simplify the forwarded requirements 
> (instead of copying all the "depends on" for elfutils and json-c), even 
> if it's a little less convenient to enable?

I saw you v2, and it uses "select", and it was the right thing to do.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
