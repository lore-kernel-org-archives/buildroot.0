Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB89C4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 14:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BFEB409A5;
	Fri, 25 Nov 2022 14:15:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BFEB409A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id alrwW8MGutme; Fri, 25 Nov 2022 14:15:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58B48409FA;
	Fri, 25 Nov 2022 14:15:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58B48409FA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A6BB1BF30A
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 14:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E98EF8206A
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 14:15:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E98EF8206A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LGzoYsKz-mJp for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 14:15:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8306382054
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8306382054
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 14:15:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AE33CFF802;
 Fri, 25 Nov 2022 14:15:27 +0000 (UTC)
Date: Fri, 25 Nov 2022 15:15:26 +0100
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20221125151526.37a4a872@windsurf>
In-Reply-To: <620448da-4dda-3d9d-cb39-5c8a278767d6@mind.be>
References: <20221028223844.1180418-1-james.hilliard1@gmail.com>
 <20221030083033.GC1058960@scaer> <20221117085339.4a4d5d8f@windsurf>
 <620448da-4dda-3d9d-cb39-5c8a278767d6@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669385730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oHE2FzhdVRT00TJCptqmQYn8BorZaB/D5mqB1+aT87I=;
 b=MW3ox2QdgqWj6qcl90isn2QOGNvo08A1CiYGiAViAwYckfKMsVHETgH+gXuhHwjaDHbJNl
 APeitzsd6egGGGdMc/Aq4En4OnsEjXoGICqGULelksCXOPYwirAhgPf5NhBiz2ZR8mqz6s
 15JuXb61lTEeUIE69kRbu+rc/tuuSiQcck5BuZSIKmYOXrk6c37dDXitnPri+9XSR/hP1q
 vQfJSYZ55gpCONLGbWgfWB5twX1QwtELhzCAbSDoc6ICMKFI63jeXT3v3twAtOkafQOz6j
 yY3UFUE2EyLPrwRw5tQiBasvXS+Kjcb+M8LrzWiwA3Ma8zwD9w7aXmg5FKqTyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MW3ox2Qd
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc: ensure __register_frame is
 optimized out for glibc
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 25 Nov 2022 15:06:21 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

>   James previously already reported the problem to glibc:
> 
> https://sourceware.org/bugzilla/show_bug.cgi?id=29621
> 
>   I picked up the thread in both issues, I was able to narrow the problem down a 
> little more, but in the end the conclusion seems to be "We can't support that on 
> the glibc side at present."
> 
>   So I applied this patch to master, after making two major changes:
> 
> - move it to host-gcc-initial only;
> - instead of putting the full condition in the .mk file, make a Config.in symbol 
> BR2_TOOLCHAIN_HAS_GCC_BUG_107728.
> 
>   ... And now I notice I forgot to put the changes I made in the commit message. 
> But it's pushed already.
> 
>   Anyway, applied to master, thanks!

Thanks for following up on this. I reviewed the change you pushed, and
it looks like the best trade-off. Thanks again!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
