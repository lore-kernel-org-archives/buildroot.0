Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC70C369BA
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 19:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AD6860884;
	Wed, 16 Apr 2025 19:07:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jJdOjBPsWHWF; Wed, 16 Apr 2025 19:07:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7203F60AD8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7203F60AD8;
	Wed, 16 Apr 2025 19:07:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F1AFF920
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E279D60856
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O2JK8ZW0F6-P for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 19:07:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 57D78608F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57D78608F3
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57D78608F3
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:07:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95AD81FCE5;
 Wed, 16 Apr 2025 19:07:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1u586k-00CM5b-2C;
 Wed, 16 Apr 2025 21:07:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Christian Stewart
 <christian@aperture.us>,  Arnout Vandecappelle <arnout@rnout.be>
References: <20250415195547.199428-1-thomas.perale@mind.be>
Date: Wed, 16 Apr 2025 21:07:38 +0200
In-Reply-To: <20250415195547.199428-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Tue, 15 Apr 2025 21:55:33 +0200")
Message-ID: <87tt6o3oxx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdejudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepteevtdevtedvudfhtddukefffefffeeugfevteejgffgvdfhtddtffefffekgfetnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpshhonhgrthihphgvrdhorhhgnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvrhgrlhgvsehmihhnugdrsggvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheptghhrhhishhtihgrnhesrghpvghrthhurhgvr
 dhushdprhgtphhtthhopegrrhhnohhuthesrhhnohhuthdrsggv
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 0/7] Add PURL support
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

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > This patch series add support for the PURL.
 > https://github.com/package-url/purl-spec

Nice!

 > PURL are a software identifier similar to CPE.
 > More information on PURL can be found in the first patch of the series.

 > After testing the usage of PURL with DependencyTrack and
 > https://ossindex.sonatype.org I can see that it improves the tracking
 > of CVEs and version bump

Out of interest, how does it help (do you have an example?)

Does a PURL match complicate anything if we add a local (security) patch
to a package?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
