Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998C6C25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F74E41E63;
	Thu,  9 May 2024 16:40:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EZyBsdAl7ptU; Thu,  9 May 2024 16:40:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A89E41E74
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A89E41E74;
	Thu,  9 May 2024 16:40:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 41CD01BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37F62404D2
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ae1yxAfRLcaD for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:40:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2232841E6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2232841E6D
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2232841E6D
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:40:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F8E41C0003;
 Thu,  9 May 2024 16:40:31 +0000 (UTC)
Date: Thu, 9 May 2024 18:40:30 +0200
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20240509184030.0f0bfc72@windsurf>
In-Reply-To: <20240409084357.444720-1-buildroot@heine.tech>
References: <20240409084357.444720-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715272831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8wLvkyefJAdI4oFahCgR9OAOP1Rj+m4HYAvw8HV8rUI=;
 b=ngBVxl/PlF1s6iQ4QLRC+PUctTGI7cqXRd+dlUDteHzeko1rSm6hbYY8/oMh1ovL08i/E2
 aCfNk83pYkXzuMpBk6BSglLkBzcGp1F7+b0iedsVJi9LK1nj1Q98xsu9JXtLhTHmzA10GJ
 vsj3RY95fKKFeRLiTIDcL799DffZN28eavwkV+Sp/AgCfT7me7nC87lgPCZHIfj+Fauppg
 koB2/EZJxZkg8HzgHnncup21qm2asOR84eD1jr/7UAQHZjFu/2bUNEqBGppacJhoy92JlN
 TzKbTA8uOUNw3r4fsc36C9VaoCchS4q5kLPRkwr9EaO8LAmKJsZHXSEZNyeNqw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ngBVxl/P
Subject: Re: [Buildroot] [PATCH v2] package/re2: bump to version 2024-04-01
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

On Tue,  9 Apr 2024 10:43:51 +0200
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> 
> ---
> v2: added signed-off-by
> ---
>  package/re2/re2.hash | 2 +-
>  package/re2/re2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
