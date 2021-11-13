Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B4E8C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 09:56:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFAF760F22
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 09:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EFAF760F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8EA460792;
	Sat, 13 Nov 2021 09:56:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GBknEQc7ZgGE; Sat, 13 Nov 2021 09:56:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 148BE6077E;
	Sat, 13 Nov 2021 09:56:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0FA241BF35E
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 09:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F19C140155
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 09:56:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CFMsVtfkX1vA for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 09:56:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E55F44013B
 for <buildroot@uclibc.org>; Sat, 13 Nov 2021 09:56:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [90.1.143.61])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id B959419F4EA;
 Sat, 13 Nov 2021 10:55:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636797359;
 bh=Jrnc/fww5rTF1Sy+PnZwW9Lck9SWQ13gIgvEerDhKSk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LrGvvvs/BWe1fNo36vazjZYV6i7jUfa+wA/3/OrXmLeKSv3uBPhKk0sS+36gfsWFJ
 WM6xkjOw1QDxh79vb2cQtEUvrQbGKQdvxTTBX5zg+RpUoWX29mcroT2fNmv37ox+y8
 Zu7rZ8M3AIO4j+eXQQZsrgY2EWYljiNomOVQDiBX29Cl2vwRGg6+6GOdSxqCwjQIB6
 5NwySh1BA10n7wrFdo7Zu0CIoSDHTQvmkDqsGAECQoCZ5EwCfc/NhftfgtrP0nONEb
 NE6SSvVuAXc9+m1/G1nf2OywtP5b9FtGjtUV/1BxQeaDNkmvU1u432uYSd9oJbzcKn
 hyILtY5ONR5uA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 Nov 2021 10:55:54 +0100
Date: Sat, 13 Nov 2021 10:55:54 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20211113095554.GR247986@scaer>
References: <20211109202921.2031664-1-bernd.kuhls@t-online.de>
 <20211111203813.GB2609__12237.069783599$1636663125$gmane$org@scaer>
 <pan$592bf$4b5d782b$717424ed$c336ebd9@ID-313208.user.individual.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <pan$592bf$4b5d782b$717424ed$c336ebd9@ID-313208.user.individual.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] package/glmark2: drm-glesv2 needs libdrm
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2021-11-13 10:33 +0100, Bernd Kuhls spake thusly:
> Am Thu, 11 Nov 2021 21:38:13 +0100 schrieb Yann E. MORIN:
> 
> > Globally, I think glmark2 needs a bit of refactoring: it is very unusual
> > that the feature-set is before the main symbol. Usually, we have, in 
> order:
> >   - ARCH_SUPPORTS et al.
> >   - main symbol
> >   - if-block with all options.
> >   - comment(s) about toolchain features et al.
> > 
> > Could you look into that, and respin a full series that fixes all these
> > issues in glmark2, and adds the missing dependencies, please?
> 
> Hi Yann,
> 
> sent v2 with a minimal set of changes
> 
> http://patchwork.ozlabs.org/project/buildroot/list/?series=271843
> 
> which should fix the technical problems in Config.in while lacking time 
> to do a full refactoring, sorry.

Thanks! I applied all three patches now. And no worries, refactoring
would have been nice but the fixes are already great! Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
