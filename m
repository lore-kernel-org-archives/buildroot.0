Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED89CD5BB8
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 19:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 285F981973;
	Thu,  5 Sep 2024 19:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 331qB6HI_EwX; Thu,  5 Sep 2024 19:28:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19E6B81AF3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19E6B81AF3;
	Thu,  5 Sep 2024 19:28:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BAEEC1BF97A
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A730081BF4
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2e05sRnDjari for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 19:28:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8E47081973
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E47081973
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E47081973
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 19:28:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 632DA1BF203;
 Thu,  5 Sep 2024 19:27:58 +0000 (UTC)
Date: Thu, 5 Sep 2024 21:27:57 +0200
To: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
Message-ID: <20240905212757.1d6f5dc0@windsurf>
In-Reply-To: <20240905152110.1317154-1-guillaume.chaye@zeetim.com>
References: <20240905152110.1317154-1-guillaume.chaye@zeetim.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725564478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Naqeis7AAcVBbG7Kxdt3EWk3SYyFsPkhspZuVgFqWI4=;
 b=EPNtxW5202CUTB4TPe6/r9Uf+Jke/ulT8IQulQYr8BSSRQxirSJGAq/uOd1GtWX1BhZmfu
 iAnd5sgCiLMuHL0HR5JsWULKNRdxkEsfBbnlSTjuiX8xbg7Ph4Yzi2yZ7T9o+jiYWnMw2N
 Dd2yAYFc0nV8OdqAW6BmqoElW77PsWD0tVXi+etcACPwimyNXhy2cwXkt+68rDwvudgq/Y
 rhnbjQ/vtWWUYa7+ZfWww9O/f/Z2raxIkQ5NAPA5KhzvpOAFkB4TuR0WnSwTS/A0ArtFzj
 vH3y3w+cOwYnZjXuZLcDYlA0GS0RT9V+UVyTfJ/9MLzkRhbetF9D9dtuMw9sxA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EPNtxW52
Subject: Re: [Buildroot] [PATCH 3/3] package/wpa_supplicant: add missing
 config for WPA3 entreprise
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Guillaume,

On Thu,  5 Sep 2024 17:21:10 +0200
"Guillaume GC. Chaye" <guillaume.chaye@zeetim.com> wrote:

> Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>

Thanks for your patch!

It is not immediately obvious that CONFIG_SUITEB and CONFIG_SUITEB192
are related to WPA3 enterprise. This kind of patch would greatly
benefit from having a non-empty commit log, with a bit of explanation
and/or reference to relevant documentation. Do you think you could do
this?

Generally speaking, an empty commit log is almost always wrong, and
should be extended to be non-empty, with relevant explanations helping
the maintainers/reviewers what the change is doing, and how.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
