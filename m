Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E514FC021B2
	for <buildroot@archiver.kernel.org>; Tue, 25 Feb 2025 20:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF600815C1;
	Tue, 25 Feb 2025 20:02:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rHKvTqpawdZ5; Tue, 25 Feb 2025 20:02:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB1D481B8A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB1D481B8A;
	Tue, 25 Feb 2025 20:02:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C6E92DE0
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 20:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BD66815C1
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 20:02:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8dPSucLh0VHM for <buildroot@buildroot.org>;
 Tue, 25 Feb 2025 20:02:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 20BE4810A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20BE4810A3
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20BE4810A3
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 20:02:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65E7644436;
 Tue, 25 Feb 2025 20:02:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tn18g-001dmp-2E;
 Tue, 25 Feb 2025 21:02:46 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>,  Joachim Wiberg <troglobit@gmail.com>
References: <20250217134414.276793-1-fiona.klute@gmx.de>
 <20250217134414.276793-2-fiona.klute@gmx.de>
 <87h64mnije.fsf@dell.be.48ers.dk>
Date: Tue, 25 Feb 2025 21:02:46 +0100
In-Reply-To: <87h64mnije.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sat, 22 Feb 2025 15:47:01 +0100")
Message-ID: <87ikoxu715.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekvdeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeetgfelveffveehtdevgeefjeeiudduledtffehgefgleekteektedutdfhleeiueenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepfhhiohhnrgdrkhhluhhtvgesghhmgidruggvpdhrtghpthhtohepthhrohhglhhosghithesghhmrghilhdrtghomh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 2/2] package/watchdogd: fix sysv init
 script
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Fiona" == Fiona Klute via buildroot <buildroot@buildroot.org> writes:
 >> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
 >> PIDFILE was set incorrectly, watchdogd writes its PID file to
 >> /var/run/watchdogd/pid (note the slash), which is not configurable
 >> without patching.

 >> Restructure the rest of the script to match current style while at it.

 >> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

 > Committed, thanks.

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
