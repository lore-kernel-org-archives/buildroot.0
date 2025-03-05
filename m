Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8835C19F32
	for <buildroot@archiver.kernel.org>; Wed,  5 Mar 2025 18:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34EDF40753;
	Wed,  5 Mar 2025 18:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OnPke_8X_Hs1; Wed,  5 Mar 2025 18:40:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C1E14076A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C1E14076A;
	Wed,  5 Mar 2025 18:40:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CA21995F
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 18:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8A3440378
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 18:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CJp0ijU2HS-C for <buildroot@buildroot.org>;
 Wed,  5 Mar 2025 18:40:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0FE0F401FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FE0F401FB
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0FE0F401FB
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 18:40:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A18BF442D1;
 Wed,  5 Mar 2025 18:40:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tptfO-00EuQy-2X;
 Wed, 05 Mar 2025 19:40:26 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  =?utf-8?Q?Miqu=C3=A8l?= Raynal
 <miquel.raynal@bootlin.com>
References: <20250205-fix_zxing-v1-0-c3e4c2adfdab@bootlin.com>
Date: Wed, 05 Mar 2025 19:40:26 +0100
In-Reply-To: <20250205-fix_zxing-v1-0-c3e4c2adfdab@bootlin.com> (Thomas
 Bonnefille via buildroot's message of "Wed, 05 Feb 2025 10:47:38
 +0100")
Message-ID: <87o6yfgw2t.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdehheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnheptdejvdejveeihefhuedvgfdutdetgfejieehuedvffevfeetgeekudffleelueffnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeduleehrdduiedvrddukeehrddvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleehrdduiedvrddukeehrddvuddphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoo
 hhtlhhinhdrtghomh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 00/12] Bump gstreamer version to 1.24.11
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

>>>>> "Thomas" == Thomas Bonnefille via buildroot <buildroot@buildroot.org> writes:

 > See the release note :
 >     https://gstreamer.freedesktop.org/releases/1.24/

 > Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
 > ---
 > Thomas Bonnefille (12):
 >       package/gstreamer1/gst-omx: remove gst-omx
 >       package/gstreamer1/gstreamer1: bump version to 1.24.11
 >       package/gstreamer1/gst1-devtools: bump version to 1.24.11
 >       package/gstreamer1/gst-python: bump version to 1.24.11
 >       package/gstreamer1/gst1-libav: bump version to 1.24.11
 >       package/gstreamer1/gst1-rtsp-server: bump version to 1.24.11
 >       package/gstreamer1/gst1-vaapi: bump version to 1.24.11
 >       package/gstreamer1/gstreamer1-editing-services: bump version to 1.24.11
 >       package/gstreamer1/gst1-plugins-base: bump version to 1.24.11
 >       package/gstreamer1/gst1-plugins-good: bump version to 1.24.11
 >       package/gstreamer1/gst1-plugins-bad: bump version to 1.24.11
 >       package/gstreamer1/gst1-plugins-ugly: bump version to 1.24.11

This series should probably be added for 2025.02 given the security
vulnerabilities, but the series is marked as changes requested in
patchwork?

Why was this done / who did it?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
