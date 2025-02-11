Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FDFC0219E
	for <buildroot@archiver.kernel.org>; Tue, 11 Feb 2025 07:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 969BC60EA7;
	Tue, 11 Feb 2025 07:30:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gVCBHgoKWjjj; Tue, 11 Feb 2025 07:30:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B701D60ECE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B701D60ECE;
	Tue, 11 Feb 2025 07:30:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 110916C
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 07:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4DFB4117D
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 07:30:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3k_Xv5KY6wZC for <buildroot@buildroot.org>;
 Tue, 11 Feb 2025 07:30:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 18E2041178
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18E2041178
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 18E2041178
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 07:30:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 422BC432E9;
 Tue, 11 Feb 2025 07:30:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1thkjE-007Eul-1h;
 Tue, 11 Feb 2025 08:30:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org,  Christian Stewart <christian@aperture.us>
References: <20250210191802.426552-1-thomas.perale@mind.be>
Date: Tue, 11 Feb 2025 08:30:44 +0100
In-Reply-To: <20250210191802.426552-1-thomas.perale@mind.be> (Thomas Perale's
 message of "Mon, 10 Feb 2025 20:18:02 +0100")
Message-ID: <874j115463.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegtdeflecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeefgfehfeelvdffgfeludejfeeivdejiefgffetveehkefgjeefvefhieehheejkeenucffohhmrghinhepsghuihhlughrohhothdrohhrghenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehthhhomhgrshdrphgvrhgrlhgvsehmihhnugdrsggvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegthhhrihhsthhirghnsegrphgvrhhtuhhrvgdruhhs
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/go/go-bin: re-introduce go-src
 hash
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

>>>>> "Thomas" == Thomas Perale <thomas.perale@mind.be> writes:

 > The commit b4006287f8 "package/go: security bump to version 1.23.6"
 > removed the go source from the go-bin package `.hash` file.
 > Since that commit, a number of autobuild errors for the host-go-bin
 > package started spawning during the 'legal-info' step.
 > Because the package 'go-bin' defines the '_ACTUAL_SOURCE_TARBALL'
 > variable the source hash is still required for the legal-info.

 > Similarly to the 'nodejs' package, the hash files for both the `go-bin`
 > and `go-src` package are shared in the `package/go` directory with the
 > help of a symbolic link used to make the subdirectories point to that
 > common `.hash` file.

 > Fixes:
 > https://autobuild.buildroot.org/results/337/33763441a065ddb07e944e26ad8f1f6d43b68592

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Crap, indeed - Sorry for breaking it. I see that Romain has already
applied it.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
