Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A74AC43334
	for <buildroot@archiver.kernel.org>; Thu,  2 Jun 2022 14:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CB9D60FD0;
	Thu,  2 Jun 2022 14:04:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Iq9Yq5wRUCuz; Thu,  2 Jun 2022 14:04:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9441960E6F;
	Thu,  2 Jun 2022 14:04:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DC93B1BF3D6
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 14:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D737F60FBC
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 14:04:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Toq3vO-GQUJz for <buildroot@lists.busybox.net>;
 Thu,  2 Jun 2022 14:04:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E565360E6F
 for <buildroot@buildroot.org>; Thu,  2 Jun 2022 14:04:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D84E620003;
 Thu,  2 Jun 2022 14:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654178660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UEbGFPXDycJe4ftzXr9V/T1ootMw4MM8c9+Jsl8jFyc=;
 b=jy1wnoW3f/pFIx5/Do5++1gLzhzWCkB/ee5s0XKd+F4tQV2pg8AiJ7N3ELOl2V72rMtTRk
 Li/wqCbZhuE2BY36YfmHqCtW/twWCfChPPXIG5DPqnxctzjRToeSjEPVbh6MEFseZRIss2
 VYqbBxsaNtP5uK747+SfIJ3+m6TZKSORXis+laQwoTXlvYabTNG59EK0XKeHQDNcRoOhd9
 UrdIMhYXdD8/wvfMeGacDjLAWBDcln4L7UJlcK0D87wyqMZ5Ryfx9DerebkUiJW6KI4fqm
 SZzaUB/TtgILNXjzyrfjcEfwmt3G4uy9IP2JxSefinI0cVgscNnKfW4RSCUXKw==
Date: Thu, 2 Jun 2022 16:04:18 +0200
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20220602160418.519f17f9@windsurf>
In-Reply-To: <20220519220747.455528-1-f.fainelli@gmail.com>
References: <20220519220747.455528-1-f.fainelli@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/cpulimit: Backport a fix for an
 infrequent crash
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
Cc: yann.morin.1998@free.fr, mmayer@broadcom.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 19 May 2022 15:07:46 -0700
Florian Fainelli <f.fainelli@gmail.com> wrote:

> Backport the fix submitted from this pull request:
> 
> https://github.com/opsengine/cpulimit/pull/61
> 
> to fix an infrequent crash.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  .../0003-Fix-an-infrequent-crash.patch        | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 package/cpulimit/0003-Fix-an-infrequent-crash.patch

Both applied to master. PATCH 2/2 isn't really a fix, but it makes
sense to have it in master IMO instead of this weird special case for
the or1k/musl situation.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
