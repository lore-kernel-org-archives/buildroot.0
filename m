Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7357DC369C2
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 08:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3861080EAE;
	Fri, 25 Apr 2025 08:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iOXwfRH2VbSS; Fri, 25 Apr 2025 08:07:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B10080EB8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B10080EB8;
	Fri, 25 Apr 2025 08:07:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 617B6159
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 08:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 538DC406AE
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 08:06:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uXGxabzAry7F for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 08:06:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 29656406AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29656406AD
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29656406AD
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 08:06:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8BCD42E76;
 Fri, 25 Apr 2025 08:06:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1u8E5G-002kGv-0g;
 Fri, 25 Apr 2025 10:06:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250423203112.3C82586270@busybox.osuosl.org>
Date: Fri, 25 Apr 2025 10:06:54 +0200
In-Reply-To: <20250423203112.3C82586270@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Wed, 23 Apr 2025 22:30:42 +0200")
Message-ID: <87ldro64wx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedukeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepkeduveehveefhffgveejleegtefhieehgfefveekieevkeeuheegteffgfelvdffnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] package/sane-airscan: new package
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

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=f78280bf262ceb1c1abbdade9de77fcc4add74ae
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 >  DEVELOPERS                             |  3 +++
 >  package/Config.in                      |  1 +
 >  package/sane-airscan/Config.in         | 20 ++++++++++++++++++++
 >  package/sane-airscan/sane-airscan.hash |  3 +++
 >  package/sane-airscan/sane-airscan.mk   | 13 +++++++++++++
 >  5 files changed, 40 insertions(+)

 > diff --git a/DEVELOPERS b/DEVELOPERS
 > index a692a9779c..1f0fc1903c 100644
 > --- a/DEVELOPERS
 > +++ b/DEVELOPERS
 > @@ -1361,6 +1361,9 @@ F:	package/python-rpi-ws281x/
 >  F:	package/python-wtforms/
 >  F:	package/rpi-rgb-led-matrix/
 
 > +N:	Guillaume Chaye
 > +F:	package/sane-airscan/

Email address is missing. I've fixed that now.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
