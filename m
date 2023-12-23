Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B289AC3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 21:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DD6B821BA;
	Sat, 23 Dec 2023 21:22:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DD6B821BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tR5I1gcDSVem; Sat, 23 Dec 2023 21:22:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C12D3821FB;
	Sat, 23 Dec 2023 21:22:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C12D3821FB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8025F1BF406
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 21:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6631382183
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 21:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6631382183
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5q4UC8R9QwV8 for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 21:22:04 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9B86821A9
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 21:22:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9B86821A9
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC852E0002;
 Sat, 23 Dec 2023 21:22:00 +0000 (UTC)
Date: Sat, 23 Dec 2023 22:22:00 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231223222200.56b0e0cc@windsurf>
In-Reply-To: <20231203041841.492885-1-adam.duskett@amarulasolutions.com>
References: <20231203041841.492885-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703366521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OqfkKAbKA4AiJDXRFGfspQQ/AoywB/X1WdhiaR0kNnk=;
 b=h1D6/huFtB4A59gpdWKUYMszwdoekifQDdHIrc167gntkffMopOywB1NEWDCLwOPQvkiTy
 LSG+WkmYTlJ+v329WRRwCWTVg8nOIVOPK7lYYSZ0QQpBlDpVF0elsNZ6KxvoVwnGrgGm4w
 FiZNzAfMOTNd1TO7QeM0GQuWE6HZZURci+OSdPcTU7RJ6K+e5By7FYcjfApPb1U7xbZkRh
 ZfTSLuD1pqa7QfCF0Hkrb12SSs8EwUXx26HxWCPnUdGQoQdHh0S/4Q6xExZ8npYKr3rskV
 7ukih8JoLQX/wnpljVwNowasCDqWLZO5ARwR6i7rzPd7BmJJZQ5ej5gLtTsUVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h1D6/huF
Subject: Re: [Buildroot] [PATCH 1/6] package/google-breakpad/gen-syms.sh:
 fix shellcheck warnings
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
Cc: Pascal Huerst <pascal.huerst@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  2 Dec 2023 21:18:34 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> Fixes warning SC2068
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/google-breakpad/gen-syms.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
