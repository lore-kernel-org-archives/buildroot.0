Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5A9C02196
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 19:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A0E484786;
	Fri,  7 Feb 2025 19:34:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2mG_qNF2cld5; Fri,  7 Feb 2025 19:34:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4730A84BC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4730A84BC1;
	Fri,  7 Feb 2025 19:34:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C6E4E4
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FEA460AAE
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:34:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZZ7yRbBcTKZD for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 19:34:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EA3AA70512
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA3AA70512
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA3AA70512
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:34:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F37F44396;
 Fri,  7 Feb 2025 19:34:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tgU7H-000F3h-2U;
 Fri, 07 Feb 2025 20:34:19 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,  James Hilliard
 <james.hilliard1@gmail.com>,  Marcus Hoffmann <bubu@bubu1.eu>
References: <20250206124825.157300-1-buildroot@bubu1.eu>
Date: Fri, 07 Feb 2025 20:34:19 +0100
In-Reply-To: <20250206124825.157300-1-buildroot@bubu1.eu> (Marcus Hoffmann via
 buildroot's message of "Thu, 6 Feb 2025 13:48:24 +0100")
Message-ID: <87cyfteeh0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeeghfehheduheefieeuleelhefguedvjeduhfeugfevgeelgeelgeefudejfeehtdenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhphihlohhnshhprhhojhgvtghtrdhorhhgnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehjrghmvghsrdhhihhllhhirghrugdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghusghuuddrvghupdhrtghpthhtohepsghusghusegsuhgsuhdurdgvuh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/python-waitress: security bump to
 3.0.2
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

>>>>> "Marcus" == Marcus Hoffmann via buildroot <buildroot@buildroot.org> writes:

 > Both 3.0.1 and 3.0.2 fix security issues.
 > In 3.0.1:

 > * Fix a bug that would lead to Waitress busy looping on select() on a
 >   half-open socket due to a race condition that existed when creating a
 >   new HTTPChannel. See https://github.com/Pylons/waitress/pull/435,
 >   https://github.com/Pylons/waitress/issues/418 and
 >   https://github.com/Pylons/waitress/security/advisories/GHSA-3f84-rpwh-47g6

 > * With thanks to Dylan Jay and Dieter Maurer for their extensive
 >   debugging and helping track this down.

 > * No longer strip the header values before passing them to the WSGI
 >   environ. See https://github.com/Pylons/waitress/pull/434 and
 >   https://github.com/Pylons/waitress/issues/432

 > * Fix a race condition in Waitress when channel_request_lookahead is
 >   enabled that could lead to HTTP request smuggling.
 >   See https://github.com/Pylons/waitress/security/advisories/GHSA-9298-4cf8-g4wj

 > In 3.0.2:

 > * When using Waitress to process trusted proxy headers, Waitress will
 >   now update the headers to drop any untrusted values, thereby making sure
 >   that WSGI apps only get trusted and validated values that Waitress
 >   itself used to update the environ. See
 >   https://github.com/Pylons/waitress/pull/452 and
 >   https://github.com/Pylons/waitress/issues/451

 > Full Changelog:
 > https://docs.pylonsproject.org/projects/waitress/en/latest/#change-history

 > Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
