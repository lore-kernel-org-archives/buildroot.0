Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A4CC0218F
	for <buildroot@archiver.kernel.org>; Fri, 31 Jan 2025 21:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35F2E4291C;
	Fri, 31 Jan 2025 21:24:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MFxn2ngy-r9J; Fri, 31 Jan 2025 21:23:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E2514291D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E2514291D;
	Fri, 31 Jan 2025 21:23:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A56D712C
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 21:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0F48848EE
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 21:23:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xecn-KY-b4R5 for <buildroot@buildroot.org>;
 Fri, 31 Jan 2025 21:23:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9BF0E84930
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BF0E84930
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9BF0E84930
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 21:23:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 425A143281;
 Fri, 31 Jan 2025 21:23:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tdyUS-009RC5-1E;
 Fri, 31 Jan 2025 22:23:52 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
References: <20250123201858.111999-1-giulio.benetti@benettiengineering.com>
 <877c6a4sri.fsf@dell.be.48ers.dk>
 <e7cc9e98-e41c-4fe9-9acd-62e284ce8d81@benettiengineering.com>
Date: Fri, 31 Jan 2025 22:23:52 +0100
In-Reply-To: <e7cc9e98-e41c-4fe9-9acd-62e284ce8d81@benettiengineering.com>
 (Giulio Benetti's message of "Fri, 31 Jan 2025 22:09:10 +0100")
Message-ID: <878qqq3cev.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepkeegffdtieevkeejheevteeludetveeffedutedvkeefjeehiedtvdfhkeffueetnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehgihhulhhiohdrsggvnhgvthhtihessggvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/swupdate: bump to securoty version
 2024.12.1
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

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Hi Peter,
 > On 1/31/25 21:45, Peter Korsgaard wrote:
 >>>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:
 >> > Fix a high severity bug with the raw handler
 >> > For release note, see:
 >> > https://github.com/sbabic/swupdate/releases/tag/2024.12.1
 >> Can you confirm that this was a new issue introduced in 2024.12 and
 >> E.G. that 2024.11.x / 2024.02.x aren't affected?

 > I confirm those versions are not affected. Here you can see the only
 > commit for version 2024.12.1:
 > https://github.com/sbabic/swupdate/commits/2024.12.1/

 > that is:
 > https://github.com/sbabic/swupdate/commit/434815b94d73c20b5461b954c4e62144ca29aa8f

 > and in order it Fixes:
 > https://github.com/sbabic/swupdate/commit/5d57a9c05ec2a4ae422bdb35247a75402f8e0aeb
 > and:
 > https://github.com/sbabic/swupdate/commit/aff67cdb2c62003a3be194036b68c62e3064d660
 > and both have been committed to master and 2024.12 branches
 > after 2024.05 tag and not in 2024.05.x tags.

 > So yes I confirm

Ok, thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
