Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A59FC3ABC3
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 16:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A953B8131C;
	Tue, 13 May 2025 16:58:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KLaOkof9gMHe; Tue, 13 May 2025 16:58:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED69F80EAD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED69F80EAD;
	Tue, 13 May 2025 16:58:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EEDA7153
 for <buildroot@buildroot.org>; Tue, 13 May 2025 16:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4674820D4
 for <buildroot@buildroot.org>; Tue, 13 May 2025 16:58:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xgrx8ADFRgeX for <buildroot@buildroot.org>;
 Tue, 13 May 2025 16:58:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8CFD680EAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CFD680EAD
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8CFD680EAD
 for <buildroot@buildroot.org>; Tue, 13 May 2025 16:58:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 53F474393B;
 Tue, 13 May 2025 16:58:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uEsx9-0039Ke-1e;
 Tue, 13 May 2025 18:58:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org,  Martin Bark <martin@barkynet.com>
References: <20250512205758.1229300-1-ju.o@free.fr>
Date: Tue, 13 May 2025 18:58:02 +0200
In-Reply-To: <20250512205758.1229300-1-ju.o@free.fr> (Julien Olivain's message
 of "Mon, 12 May 2025 22:57:58 +0200")
Message-ID: <87r00stplx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdegieehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepkeekudekkedtjeffheeivedtiefhgedtueeffeekueeguedvfffhkeejieduieffnecuffhomhgrihhnpedtuddrohhrghdpkhgvrhhnvghlrdhorhhgnecukfhppeekledrgeejrddvudelrddvheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekledrgeejrddvudelrddvhedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehmrghrthhinhessggrrhhkhihnvghtrdgtohhm
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/connman: update homepage url
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > The old connman homepage url [1] now redirects to an Intel open source
 > software portal which no longer contains the connman project.

 > The project is now hosted at [2]. For reference, the upstream
 > commit [3] removed references to [1].

 > This commit updates the Config.in homepage url to [2].

 > [1] https://01.org/connman
 > [2] https://git.kernel.org/pub/scm/network/connman/connman.git
 > [3]
 > https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=7d35eba0b93580c7dae5763b517ea5571dc4a273

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
