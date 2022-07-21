Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A4EC43334
	for <buildroot@archiver.kernel.org>; Thu, 21 Jul 2022 07:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 912B140FF6;
	Thu, 21 Jul 2022 07:07:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 912B140FF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V9-hSaNHzpfJ; Thu, 21 Jul 2022 07:07:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 908AE4055D;
	Thu, 21 Jul 2022 07:07:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 908AE4055D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2BE071BF489
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 07:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC1BD4055D
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 07:07:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC1BD4055D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cLhS0gEeHb0x for <buildroot@lists.busybox.net>;
 Thu, 21 Jul 2022 07:06:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 903F1403E7
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 903F1403E7
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 07:06:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 511ED24000B;
 Thu, 21 Jul 2022 07:06:54 +0000 (UTC)
Date: Thu, 21 Jul 2022 09:06:53 +0200
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20220721090653.1cead285@windsurf>
In-Reply-To: <f7f93cd8-a062-19a6-0707-fe847f0fad0b@gmail.com>
References: <20220720205915.2346283-1-f.fainelli@gmail.com>
 <f7f93cd8-a062-19a6-0707-fe847f0fad0b@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658387215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qvEFzZFNd9M6/vVxUcy9teRg9YXKRShkOKWnps4SKE8=;
 b=phNeYHSJbnQZZT/mHGxYAWDDzH9rVF1s9dcTJoVjkL93uCnDqsvxlIExcXyAMctdHwdj9J
 yrUaMjkVlQ+vEFhQyBc4k0A3/OmDdwa1fv015RJG1+3eqTCtp3dVtFb5u8X4LhsrJ+WNjO
 qBtJF4TX2g9v+iAEsPe4THRDevUL8MWADlo6M5l/E/ccwJ9VCWMz1nIG7Jvo1scOAxPzVQ
 7wMgaMkbNLmX9Qt3WG3BFcevYs5aS6Dj6UVHSn9mWdaCeoWOOjDVu+oSxA44ZaExVsH8uo
 unjGo6rBCS+sfJi/n0eLKs3uqhh7QI7eq6DsoV0NZs65Q8581XCytcabUasNNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=phNeYHSJ
Subject: Re: [Buildroot] [PATCH] package/xfsprogs: Fix builds for
 architectures without MAP_SYNC
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
Cc: bernd.kuhls@t-online.de, chrismcc@gmail.com, yann.morin.1998@free.fr,
 buildroot@buildroot.org, fontaine.fabrice@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 20 Jul 2022 20:27:23 -0700
Florian Fainelli <f.fainelli@gmail.com> wrote:

> On 7/20/2022 1:59 PM, Florian Fainelli wrote:
> > Include a patch that was submitted to the linux-xfs mailing list to
> > address build failures for io/mmap.c:
> > 
> > https://lore.kernel.org/linux-xfs/20220720205307.2345230-1-f.fainelli@gmail.com/
> > 
> > Fixes:
> > autobuild.buildroot.net/results/407131b767fc8241e8f5f5001c0b5d4e2c488dea
> > 
> > Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>  
> 
> Looks like we got the attention of a few XFS developers, and sorry 
> Fabrice for not having seen your earlier attempt. Assuming Darrick's 
> patch get accepted I will provide a backport shortly after:
> 
> https://lore.kernel.org/all/YtiPgDT3imEyU2aF@magnolia/
> 
> Please do not apply this patch.

Thanks for following-up, I've marked your patch as "Rejected" in
patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
