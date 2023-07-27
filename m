Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2C5C001E0
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 08:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C62BC40BE9;
	Thu, 27 Jul 2023 08:56:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C62BC40BE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 99g54lHvNbs0; Thu, 27 Jul 2023 08:56:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFC3740194;
	Thu, 27 Jul 2023 08:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFC3740194
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BAF681BF59C
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 08:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9273341F37
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 08:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9273341F37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id It3eOy-09anP for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 08:56:06 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3FFF241E83
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 08:56:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FFF241E83
Received: by mail.gandi.net (Postfix) with ESMTPSA id 984334000F;
 Thu, 27 Jul 2023 08:56:02 +0000 (UTC)
Date: Thu, 27 Jul 2023 10:56:01 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230727105601.577d3213@windsurf>
In-Reply-To: <20230727065417.347083-1-bernd@kuhls.net>
References: <20230727065417.347083-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690448163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MMCRcZpwhxwF2LvQt3aYax/83uXHFDJcCHFTYMhhSIQ=;
 b=oT/lMRO3XsLO18UXXwiVlQ6nn7Kf6Dyik7kWhTar3SSQkE7YGUdhMgEGlq/iAyDGLJk2Re
 5glOAzvSHuc/YEO2JuC86xVy7DJX1RgHZFJTQy9lJU3fyluA6xd11FJ+X5PZ1aNikSWr8a
 pdN0tyxr/TB9MifpYprglmO7NmR7MajmJb4VFud7my7oXLm6BQynZjpBY2tv9abFPyDlzS
 fOxH9r6Tb2sbhAOjtY08hhtGncbAWmBWngBpyoPFYKxZ6JQPJj+XMzVpH0cPxesZpXF5xq
 iPFjmrKKfj4c+DjAKmrNS14YmG0dPEpPo9ivBwxHLZOoru5avfRnAU0HnaDcgw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oT/lMRO3
Subject: Re: [Buildroot] [PATCH 1/1] package/cairo: mutex support depends on
 NPTL
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 27 Jul 2023 08:54:17 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/041/041ac8f0809a0f9415c545b7585cd197db08b55f/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> The last bump of cairo took place in 2019 with commit
> 8d2a9d089a969909ad2de8acb67ee14ced03de28, the first build error of this
> kind I could find dates back to Sep 2022:
> http://autobuild.buildroot.net/results/8c5/8c547ec2e148ce3c4f230bb4b0d5c5b360d74dd5/

This could have gone in the commit message itself. I believe (but I'm
not 100% sure) that this issue started occurring when fully random
configurations started being tested. Indeed before that we were not
testing configurations with threads enabled but not NPTL, I believe.

Anyway, the fact that the issue existed in September 2022 means we need
to backport this fix to our stable 2023.02.x and 2023.05.x branches,
which is really the information that we need to have.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
