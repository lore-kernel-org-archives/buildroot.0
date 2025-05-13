Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01696C3ABC9
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 09:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B81481309;
	Tue, 13 May 2025 09:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S30t635y4vHU; Tue, 13 May 2025 09:44:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7E2B812F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7E2B812F5;
	Tue, 13 May 2025 09:44:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E53412A
 for <buildroot@buildroot.org>; Tue, 13 May 2025 09:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83BE380FB1
 for <buildroot@buildroot.org>; Tue, 13 May 2025 09:44:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v2--_3a3t68a for <buildroot@buildroot.org>;
 Tue, 13 May 2025 09:44:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6D1EC80E21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D1EC80E21
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D1EC80E21
 for <buildroot@buildroot.org>; Tue, 13 May 2025 09:44:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 57AED43165;
 Tue, 13 May 2025 09:44:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uEmBQ-002iqn-1L;
 Tue, 13 May 2025 11:44:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach via buildroot <buildroot@buildroot.org>
References: <20250509041939.11656-1-kadambini.nema@gmail.com>
 <87a57mxuqa.fsf@tarshish>
Date: Tue, 13 May 2025 11:44:20 +0200
In-Reply-To: <87a57mxuqa.fsf@tarshish> (Baruch Siach via buildroot's message
 of "Fri, 09 May 2025 07:40:13 +0300")
Message-ID: <874ixovo97.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdefkedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepfeegjeffkeehtdetudfggfekvdduvedvvdegvdefjedtudevleduhfdutedvueffnecuffhomhgrihhnpeguvggsihgrnhdrohhrghdpghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepkhgruggrmhgsihhnihdrnhgvmhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsggrrhhutghhsehtkhhoshdrtghordhilh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/dropbear: security bump to
 version 2025.88
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Baruch" == Baruch Siach via buildroot <buildroot@buildroot.org> writes:

 > Hi Kadambini Nema,
 > On Thu, May 08 2025, Kadambini Nema wrote:
 >> Fixes CVE-2025-47203.
 >> https://security-tracker.debian.org/tracker/CVE-2025-47203
 >> 
 >> Release notes:
 >> https://github.com/mkj/dropbear/releases/tag/DROPBEAR_2025.88
 >> https://github.com/mkj/dropbear/releases/tag/DROPBEAR_2025.87

 > The 2025.87 release removed SHA-1 from the default build. See my comment
 > on Bernd's suggested 2025.87 bump patch:

 >   https://lore.kernel.org/all/874j02d3h7.fsf@tarshish/
 >   https://lore.kernel.org/all/20250309083216.824179-1-bernd@kuhls.net/

Thanks. I committed Berns 2025.87 bump with that and then this commit on
top.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
