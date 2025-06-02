Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCBEC5AD49
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 11:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C0F980DD7;
	Mon,  2 Jun 2025 11:43:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ia92vsKWS507; Mon,  2 Jun 2025 11:43:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7F1080D44
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7F1080D44;
	Mon,  2 Jun 2025 11:43:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E47AA127
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 11:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D651480D44
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 11:43:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LpAMMwxM_Ycg for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 11:43:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 294A880D2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 294A880D2D
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 294A880D2D
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 11:43:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A92CA439B6;
 Mon,  2 Jun 2025 11:43:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uM3ZY-006YwM-0D;
 Mon, 02 Jun 2025 13:43:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
References: <20250602112307.4185883-1-neal.frager@amd.com>
Date: Mon, 02 Jun 2025 13:43:20 +0200
In-Reply-To: <20250602112307.4185883-1-neal.frager@amd.com> (Neal Frager's
 message of "Mon, 2 Jun 2025 12:23:07 +0100")
Message-ID: <87ldqapdwn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefjeehkeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeefgfehfeelvdffgfeludejfeeivdejiefgffetveehkefgjeefvefhieehheejkeenucffohhmrghinhepsghuihhlughrohhothdrohhrghenucfkphepkedvrddugeefrdelhedrvddvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekvddrudegfedrleehrddvvddtpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegrrhhnohhuthesrhhnohhuthdrsggvpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrt
 ghomhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopegsrhgrnhguohhnrdhmrghivghrsegtohhllhhinhhsrdgtohhmpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehsmhhilhgvrdhfrhdprhgtphhtthhopehnvggrlhdrfhhrrghgvghrsegrmhgurdgtohhm
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 1/1] package/bootgen: Re-apply fix build
 on machines with modern flex
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 buildroot@buildroot.org, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > With bootgen 2025.1, the directory structure was re-done.  In the process of
 > doing this, the source files in the bisonflex directory lost the fix below
 > which had been applied on an earlier version of bootgen for the issue below.

 > Bootgen embeds an old version of flex, but uses the system include syntax
 > (#include <>) to reference it, causing conflicts on systems with the
 > development headers for a modern flex version installed, leading to build
 > issues like:

 > ../bisonflex/bif.yy.cpp: In member function 'virtual int BIF::FlexScanner::yylex()':
 > ../bisonflex/bif.yy.cpp:1608:18: error: no match for 'operator='
 > (operand types are 'std::istream' {aka 'std::basic_istream'} and
 > 'std::istream*' {aka 'std::basic_istream*'})

 > Fix it by using normal local #include statements by:

 > sed -i 's/<FlexLexer.h>/"FlexLexer.h"/g' *

 > This patch re-adds the patch to fix this to buildroot.

 > Fixes: https://autobuild.buildroot.org/results/056384322246877253cd8d0781717ce495cbe769/
 > Upstream: patch submitted to AMD internal jira process

Heh, that issue seems to keep on resurfacing ;)

This should be part of your commit to bump bootgen to v2025.1.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
