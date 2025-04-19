Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C39FC369D1
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 14:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1887C6084D;
	Sat, 19 Apr 2025 14:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YZQ4l79De7Hu; Sat, 19 Apr 2025 14:31:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40B296087C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40B296087C;
	Sat, 19 Apr 2025 14:31:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5688622F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CEEA4065E
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LZrWDoOPMD4J for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 14:31:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 488054062F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 488054062F
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 488054062F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:31:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7407E41DF4;
 Sat, 19 Apr 2025 14:31:06 +0000 (UTC)
Date: Sat, 19 Apr 2025 16:31:05 +0200
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20250419163105.1252d695@windsurf>
In-Reply-To: <20250415090002.618541-2-buildroot@heine.tech>
References: <20250415090002.618541-2-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeehvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjedvjedvgfffveetieffudegieevleeigfffteefhefhtefhueelfeekjefgfedvnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegsuhhilhgurhhoohhtsehhvghinhgvrdhtvggthh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745073066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2xI0YSyg4IuMcxtnJ5maN61GtpAy05AcBB6eSMK8V50=;
 b=Y9mBoyySlNe0koYmzb4IHLfxPruJW+RtengCt1TNIhIMn4xj/nSueye0ewVW6SarQwezji
 TgKpjf9eUUXTjXvodGayuVN1RNDDEVoFK4AZBkz0a0onzSZVRyjFDQAK4TFKyXF8e7OJLh
 +V2zxAJq/73/VeoQ0IEHligldUU15+5GcHc+a3RW9wUnokBHz5w06PhA8PtXaa7BXVcSZL
 Msu5+yNjLurIE2waRwvm9abgCyUqVt1IwzpnFKEOsCt2YZ+eLYmlkOWH/1EgMJmUZ8+Jgw
 IeXXdhm3Vrxd6Mgm4EqSCwpxgG/V47q4KbigTQdnFPZtEXxLjFo2Nxt1LD/b6A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y9mBoyyS
Subject: Re: [Buildroot] [PATCH] package/json-for-modern-cpp: bump to
 version 3.12.0
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

On Tue, 15 Apr 2025 10:59:46 +0200
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> - Release Notes: https://github.com/nlohmann/json/releases/tag/v3.12.0
> - updated LICENSE.MIT hash due to updated year
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/json-for-modern-cpp/json-for-modern-cpp.hash | 4 ++--
>  package/json-for-modern-cpp/json-for-modern-cpp.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
