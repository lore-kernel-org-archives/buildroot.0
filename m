Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC052C282EC
	for <buildroot@archiver.kernel.org>; Fri, 14 Mar 2025 09:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8681E6075A;
	Fri, 14 Mar 2025 09:37:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H1mP8uzR2Fdm; Fri, 14 Mar 2025 09:37:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9216960811
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9216960811;
	Fri, 14 Mar 2025 09:37:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 456FFC8
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 09:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29E8F40649
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 09:37:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CEGwgob2B1TW for <buildroot@buildroot.org>;
 Fri, 14 Mar 2025 09:37:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 81CDE40824
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81CDE40824
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81CDE40824
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 09:37:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4009744111;
 Fri, 14 Mar 2025 09:37:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tt1Th-000iaZ-2C;
 Fri, 14 Mar 2025 10:37:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Kory Maincent via buildroot <buildroot@buildroot.org>
Cc: Kory Maincent <kory.maincent@bootlin.com>,  Romain Naour
 <romain.naour@smile.fr>,  thomas.petazzoni@bootlin.com
References: <20250221-fixes_octavo-v2-0-0bb2012512eb@bootlin.com>
 <20250221-fixes_octavo-v2-1-0bb2012512eb@bootlin.com>
Date: Fri, 14 Mar 2025 10:37:17 +0100
In-Reply-To: <20250221-fixes_octavo-v2-1-0bb2012512eb@bootlin.com> (Kory
 Maincent via buildroot's message of "Fri, 21 Feb 2025 10:30:24 +0100")
Message-ID: <874izw2bsi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufedtgeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepfeeuveefteefheeufffgledugeeffeffudevleejjedtuddujeevhffgveelvdeinecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpsghuihhlughrohhothdrohhrghenucfkphepkedvrddugeefrdelhedrvddvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekvddrudegfedrleehrddvvddtpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehsmhhilhgvrdhfrhdprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhot
 hhlihhnrdgtohhm
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/3] board/octavo/osd32mp1: Fix TF-A
 build error
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

>>>>> "Kory" == Kory Maincent via buildroot <buildroot@buildroot.org> writes:

 > The Octavo defconfig currently uses TF-A version 2.4 from ST, which leads
 > to build errors due to missing patches. This update imports the necessary
 > TF-A 2.4 patches to ensure compatibility and resolve the build issues for
 > these boards.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983324
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983326

 > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
