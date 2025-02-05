Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABD8C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91265404CC;
	Wed,  5 Feb 2025 11:55:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZMW8VuHlwNbZ; Wed,  5 Feb 2025 11:55:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DF2E4123D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DF2E4123D;
	Wed,  5 Feb 2025 11:55:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 48F9812F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37D8B60A61
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:55:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3qnuFrAZoKVg for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:55:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E528560BA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E528560BA0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E528560BA0
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:55:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F0A144322D;
 Wed,  5 Feb 2025 11:55:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tfdzg-0008tK-1P;
 Wed, 05 Feb 2025 12:55:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org,  Julien Olivain <ju.o@free.fr>
References: <20250205112619.27018-1-peter@korsgaard.com>
 <20250205124959.414df5fe@windsurf>
Date: Wed, 05 Feb 2025 12:55:00 +0100
In-Reply-To: <20250205124959.414df5fe@windsurf> (Thomas Petazzoni's message of
 "Wed, 5 Feb 2025 12:49:59 +0100")
Message-ID: <871pwck3mz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeekudevheevfefhgfevjeelgeethfeihefgfeevkeeiveekueehgeetfffgledvffenucffohhmrghinhepsghuihhlughrohhothdrnhgvthenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhr
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/swipl: fix build without C++
 compiler
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Wed,  5 Feb 2025 12:26:18 +0100
 > Peter Korsgaard <peter@korsgaard.com> wrote:

 >> Fixes http://autobuild.buildroot.net/results/b24a96b999676990995a466686fe1eacf6cddfef
 >> 
 >> Some of the optional packages in swipl are written in C++, so CMake thinks a
 >> C++ compiler is needed even though we build with -DSWIPL_PACKAGES=OFF.  Add
 >> -DCMAKE_CXX_COMPILER=true to satisfy this check even in setups without C++:
 >> 
 >> -- Check for working CXX compiler: /usr/bin/true
 >> -- Check for working CXX compiler: /usr/bin/true - works
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> package/swipl/swipl.mk | 3 ++-
 >> 1 file changed, 2 insertions(+), 1 deletion(-)

 > Thanks, but you need to specify since when this problem started
 > occurring, so that whoever is going to evaluate this patch for backport
 > to our LTS branch will know what to do :-)

Argh, will resend.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
