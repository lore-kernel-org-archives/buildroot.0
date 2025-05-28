Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE05C3ABB2
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 19:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FF7540BB2;
	Wed, 28 May 2025 19:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8AoISLwhV11v; Wed, 28 May 2025 19:04:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5147340BB9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5147340BB9;
	Wed, 28 May 2025 19:04:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A573319D
 for <buildroot@buildroot.org>; Wed, 28 May 2025 19:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96CFC808C8
 for <buildroot@buildroot.org>; Wed, 28 May 2025 19:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q-qSHHA6Fz_s for <buildroot@buildroot.org>;
 Wed, 28 May 2025 19:04:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A2085809B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2085809B9
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A2085809B9
 for <buildroot@buildroot.org>; Wed, 28 May 2025 19:04:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7AF341FCF7;
 Wed, 28 May 2025 19:04:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uKM4l-001Zft-2n;
 Wed, 28 May 2025 21:04:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Titouan Christophe via buildroot <buildroot@buildroot.org>
Cc: Titouan Christophe <titouan.christophe@mind.be>
References: <20250514150446.968758-1-thomas.perale@mind.be>
 <20250520143947.h3j5i3nblgu4ielq@n621.de>
 <17796dd7-9f0d-40ac-8dbb-2a03b6e88f8d@mind.be>
Date: Wed, 28 May 2025 21:04:31 +0200
In-Reply-To: <17796dd7-9f0d-40ac-8dbb-2a03b6e88f8d@mind.be> (Titouan
 Christophe via buildroot's message of "Wed, 21 May 2025 15:13:04
 +0200")
Message-ID: <87h614wo8w.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvgedtheculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeefueevfeetfeehueffgfeludegfeefffduveeljeejtdduudejvefhgfevledvieenucffohhmrghinhepghhithhlrggsrdgtohhmpdgsuhhilhgurhhoohhtrdhorhhgnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehtihhtohhurghnrdgthhhrihhsthhophhhvgesmhhinhgurdgsvg
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask: security bump to
 version 3.1.1
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

>>>>> "Titouan" == Titouan Christophe via buildroot <buildroot@buildroot.org> writes:

 > I agree with you, bumping flit doesn't look that bad. Also, other
 > packages than Flask could have the "good idea" of changing their build
 > requirement in patchlevel version bumps that also include some
 > security fixes. Thus, I think that having flit>=3.11 in 2025.02.x LTS
 > is better in the long run, as it reduces the patch maintenance burden
 > on the Buildroot "staff"

 > I therefore suggest to apply
 > https://gitlab.com/buildroot.org/buildroot/-/commit/c5659cebb7b54e2522601824a10c47c0ef73a09f
 > on 2025.02.x. To make sure this wouldn't hurt elsewhere, I applied the
 > commit locally, and then I successfully built all target packages that
 > rely on flit, ie:

Sounds sensible to me, thanks for testing!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
