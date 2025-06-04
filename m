Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66666C5B549
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01B41409A8;
	Wed,  4 Jun 2025 18:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b_U99uyHl5Qc; Wed,  4 Jun 2025 18:16:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 290684091F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 290684091F;
	Wed,  4 Jun 2025 18:16:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EFF71DA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D759F60E50
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:16:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UbSCkhzbbHpU for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:16:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3FE3760E4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FE3760E4F
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FE3760E4F
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:16:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A740442AB;
 Wed,  4 Jun 2025 18:16:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uMsfH-00Grjk-0g;
 Wed, 04 Jun 2025 20:16:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Daniel Lang via buildroot <buildroot@buildroot.org>
Cc: Daniel Lang <dalang@gmx.at>,  Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20250602190418.939289-1-dalang@gmx.at>
Date: Wed, 04 Jun 2025 20:16:39 +0200
In-Reply-To: <20250602190418.939289-1-dalang@gmx.at> (Daniel Lang via
 buildroot's message of "Mon, 2 Jun 2025 21:04:16 +0200")
Message-ID: <87tt4vfk3c.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvgeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepteetueejjeefleduieehkeetgefhfeeihefhleeguedvhfduieevleevveehfeejnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpsghuihhlughrohhothdrohhrghenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepuggrlhgrnhhgsehgmhigrdgrthdprhgtphhtthhopegvrhhitgdrlhgvrdgsihhhrghnrdguvghvsehfrhgvvgdrfhhr
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/ninja: ignore CVE-2021-4336
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

>>>>> "Daniel" == Daniel Lang via buildroot <buildroot@buildroot.org> writes:

 > CVE is filed against a different project.
 > Signed-off-by: Daniel Lang <dalang@gmx.at>

It is really because we don't have a CPE identifier for ninja, but
apparently there isn't one:

https://github.com/ninja-build/ninja/issues/2384

But OK, given that this is a host only build tool, the chances that it
will have any significant CVEs in the future seems quite low.

Anyway, committed - Thanks.

> ---
 >  package/ninja/ninja.mk | 3 +++
 >  1 file changed, 3 insertions(+)

 > diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
 > index b7bc1a4f1c..805fef4541 100644
 > --- a/package/ninja/ninja.mk
 > +++ b/package/ninja/ninja.mk
 > @@ -10,6 +10,9 @@ NINJA_SITE = $(call github,Kitware,ninja,v$(NINJA_VERSION))
 >  NINJA_LICENSE = Apache-2.0
 >  NINJA_LICENSE_FILES = COPYING
 
 > +# Filed against a different project called monitor-ninja
 > +NINJA_IGNORE_CVES += CVE-2021-4336
 > +
 >  define HOST_NINJA_INSTALL_CMDS
 >  	$(INSTALL) -m 0755 -D $(@D)/ninja $(HOST_DIR)/bin/ninja
 >  endef
 > -- 

 > 2.49.0

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
