Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F42C0219B
	for <buildroot@archiver.kernel.org>; Tue, 11 Feb 2025 17:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25F8380306;
	Tue, 11 Feb 2025 17:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bUccTUEdAutN; Tue, 11 Feb 2025 17:01:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CD1D80BF7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CD1D80BF7;
	Tue, 11 Feb 2025 17:01:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 877136C
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 17:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7693560F23
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 17:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gYHVR8qUJXUs for <buildroot@buildroot.org>;
 Tue, 11 Feb 2025 17:01:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 714FC60E98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 714FC60E98
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 714FC60E98
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 17:01:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21CF2442A5;
 Tue, 11 Feb 2025 17:01:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1thtdC-008bVO-1M;
 Tue, 11 Feb 2025 18:01:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org,  Christian Stewart <christian@aperture.us>
References: <20250210191802.426552-1-thomas.perale@mind.be>
 <874j115463.fsf@dell.be.48ers.dk>
Date: Tue, 11 Feb 2025 18:01:06 +0100
In-Reply-To: <874j115463.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Tue, 11 Feb 2025 08:30:44 +0100")
Message-ID: <87ikpg1kml.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegudehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeefgfehfeelvdffgfeludejfeeivdejiefgffetveehkefgjeefvefhieehheejkeenucffohhmrghinhepsghuihhlughrohhothdrohhrghenucfkphepkedvrddugeefrdelhedrvddvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekvddrudegfedrleehrddvvddupdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehthhhomhgrshdrphgvrhgrlhgvsehmihhnugdrsggvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegthhhrihhsthhirghnsegrphgvrhhtuhhrvgdruhhs
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Thomas" == Thomas Perale <thomas.perale@mind.be> writes:
 >> The commit b4006287f8 "package/go: security bump to version 1.23.6"
 >> removed the go source from the go-bin package `.hash` file.
 >> Since that commit, a number of autobuild errors for the host-go-bin
 >> package started spawning during the 'legal-info' step.
 >> Because the package 'go-bin' defines the '_ACTUAL_SOURCE_TARBALL'
 >> variable the source hash is still required for the legal-info.

 >> Similarly to the 'nodejs' package, the hash files for both the `go-bin`
 >> and `go-src` package are shared in the `package/go` directory with the
 >> help of a symbolic link used to make the subdirectories point to that
 >> common `.hash` file.

 >> Fixes:
 >> https://autobuild.buildroot.org/results/337/33763441a065ddb07e944e26ad8f1f6d43b68592

 >> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

 > Crap, indeed - Sorry for breaking it. I see that Romain has already
 > applied it.

Committed to 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
