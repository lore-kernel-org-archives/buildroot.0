Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08497CA0EE9
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 20:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C280D614DC;
	Sat, 16 Aug 2025 20:05:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iYNcXYBpTbpV; Sat, 16 Aug 2025 20:05:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F151E614DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F151E614DD;
	Sat, 16 Aug 2025 20:05:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D1D375
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A74D413EA
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:05:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id apOYlsnOcTY3 for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 20:05:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7340A413E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7340A413E2
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7340A413E2
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:05:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 046C9443F8;
 Sat, 16 Aug 2025 20:05:21 +0000 (UTC)
Date: Sat, 16 Aug 2025 22:05:20 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <20250816220520.0e2a17ac@windsurf>
In-Reply-To: <20250815203545.10042-1-giulio.benetti@benettiengineering.com>
References: <20250815203247.14ecd5f5@windsurf>
 <20250815203545.10042-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeejjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepiedthefhieeuieffvdetvdeguedvtdffveeigeejkeegkefggeejjeeihfdujedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghuihhlughrohhothdrnhgvthdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepghhiuhhlihhordgsvghnvghtthhisegsvghnvghtthhivghnghhinhgvvghrihhnghdrtghomhdpr
 hgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755374723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pB2G3QkFmM6B9zaNY77xXwu2XFwMvi9sgywaFZOF/gI=;
 b=G92OdAjQ0QgXoL/Dl7DKWklxuIISBvnbzx+dWjqpcVgk5QO1I9TpFY9Bry0mQV+Zc4fBzF
 eUjNiVEzNPokM/TRiGAb8ER51Hmcrz4/ZtvSEuM+075MkmW04FvvCfwV3X3O/RixEGU7BN
 /dzMz5rSLmCEyvAF3frj9YGgrxCin6+lTc4ugQeSDcJwfjrw8rYuRAvkGaHRfI7CtUQBPf
 IBp4ql471CoHwB5Au0yJw2bU8Olp75BwLLlg2ZiDYuHk7PktyO0Jcsn4JDmD+kqB2SSiJj
 gCcTjsTBr8Y4mbO5DIQ/RWuthFrYFIx+DA/UqhYetheLYQQsboAW0BtKZxQhiA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G92OdAjQ
Subject: Re: [Buildroot] [PATCH v3] package/libtracefs: fix build failure
 due to missing NPTL
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 15 Aug 2025 22:35:45 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> With commit:
> https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/commit/?id=31acfe1747b273e147f864b5a62a4e39197ca1a2
> package libtracefs utest started to use pthread_barrier_() functions and
> this lead to build failure when we build without NPTL. Since utest is
> not needed on the target we can avoid to build it, so let's disable it.
> 
> Fixes: 117ece4835 ("package/libtracefs: bump to version 1.8.0")
> Fixes:
> https://autobuild.buildroot.net/results/69b/69b75908bebdf9382a4cd9b138fcaf1e34daba09//
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * improve commit log to point when problem began as requested by Thomas Petazzoni
> V2->V3:
> * improve commit log again by pointing which Buildroot commit introduced
>   the build failure as pointed by Thomas Petazzoni
> ---
>  package/libtracefs/libtracefs.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
