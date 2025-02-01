Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED89C0218A
	for <buildroot@archiver.kernel.org>; Sat,  1 Feb 2025 13:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6351842B4A;
	Sat,  1 Feb 2025 13:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yfyiEAN5GeBV; Sat,  1 Feb 2025 13:33:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 271F742CA3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 271F742CA3;
	Sat,  1 Feb 2025 13:33:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5714716E
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 13:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45DCF42CA3
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 13:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wpzJqKfVEwhQ for <buildroot@buildroot.org>;
 Sat,  1 Feb 2025 13:33:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D57BE42B4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D57BE42B4A
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D57BE42B4A
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 13:33:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D122E43290;
 Sat,  1 Feb 2025 13:33:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1teDd4-009z9T-0R;
 Sat, 01 Feb 2025 14:33:46 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>,  Martin Bark
 <martin@barkynet.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250128202249.548819-1-peter@korsgaard.com>
Date: Sat, 01 Feb 2025 14:33:46 +0100
In-Reply-To: <20250128202249.548819-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 28 Jan 2025 21:22:47 +0100")
Message-ID: <87wme9x005.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudekhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeeghefhkeeivdeuiedtkeevkeekuedvtddvjedukeekjeekhfeggfdvudevffefgfenucffohhmrghinhepnhhouggvjhhsrdhorhhgpdhgihhthhhusgdrtghomhenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepuggrnhhivghlrdhprhhitggvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrhhtihhnsegsrghrkhihnhgvthdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/nodejs: security bump to version
 22.13.1
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

 > Fixes the following security vulnerabilities:
 > Worker permission bypass via InternalWorker leak in diagnostics
 > (CVE-2025-23083) - (high)

 > With the aid of the diagnostics_channel utility, an event can be hooked into
 > whenever a worker thread is created.  This is not limited only to workers
 > but also exposes internal workers, where an instance of them can be fetched,
 > and its constructor can be grabbed and reinstated for malicious usage.

 > This vulnerability affects Permission Model users (--permission) on Node.js
 > v20, v22, and v23.

 > GOAWAY HTTP/2 frames cause memory leak outside heap (CVE-2025-23085) - (medium)

 > A memory leak could occur when a remote peer abruptly closes the socket
 > without sending a GOAWAY notification.  Additionally, if an invalid header
 > was detected by nghttp2, causing the connection to be terminated by the
 > peer, the same leak was triggered.  This flaw could lead to increased memory
 > consumption and potential denial of service under certain conditions.

 > This vulnerability affects HTTP/2 Server users on Node.js v18.x, v20.x, v22.x and v23.x.

 > For more details, see the announcement:
 > https://nodejs.org/en/blog/vulnerability/january-2025-security-releases

 > Update the LICENSE hash for a an addition of the (MIT licensed) nlohmann
 > JSON library:

 > https://github.com/nodejs/node/commit/27bcd103e775e00eb8d03ac37052bbd4ccb6d239

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2024.11.x, thanks.

I will have a look at bumping 2024.02.x to 20.18.2 as well.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
