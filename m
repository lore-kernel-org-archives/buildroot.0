Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EE0C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 20:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2E5F60C18;
	Thu, 30 Dec 2021 20:45:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MWZJbT6_1zVl; Thu, 30 Dec 2021 20:45:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28C4260BCB;
	Thu, 30 Dec 2021 20:45:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C9D011BF361
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B782760BCB
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:45:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ie7Ixyyu63hK for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 20:45:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57162606F9
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 20:45:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 7AE56E0003;
 Thu, 30 Dec 2021 20:45:06 +0000 (UTC)
Date: Thu, 30 Dec 2021 21:45:05 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20211230214505.6bff001f@windsurf>
In-Reply-To: <04d568a84678569e4aed9a17d0609009271e146f.1636810092.git.yann.morin.1998@free.fr>
References: <cover.1636810092.git.yann.morin.1998@free.fr>
 <04d568a84678569e4aed9a17d0609009271e146f.1636810092.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 13/16 v2] core/show-info: report whether a
 package is overriden
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
Cc: Vadim Kochan <vadim4j@gmail.com>, eeppeliteloop@gmail.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 13 Nov 2021 14:28:24 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> The show-info output can be used in quite some ways, like to assess the
> validity of the current configuration, like a production build in a CI
> would do for example. One such assessment would be to ensure that no
> package is overriden.
> 
> Additionally, when we will (later!) want to check whether we can re-use
> cached artefacts of a package, we will not want to do so for packages
> that are overridden (nor would we want to actually cache such a result
> either).
> 
> We do not expose the override location, because this is a purely-local
> information, and show info should never contain such local information
> (the output of show-info can be shared). Besides, that information is
> already known by the user, as they passed it to Buildroot via local.mk
> to begin with.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Vadim Kochan <vadim4j@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: eeppeliteloop@gmail.com

I did not apply this one, because when you set <pkg>_SITE_METHOD =
local, then <pkg>_OVERRIDE_SRCDIR will be assigned, but the package
isn't really "overridden". It's using locally available source code, as
part of the package definition itself.

So I found that advertising this package as "overridden" was not
semantically correct.

I'm of course ready to discuss this, and see other arguments :)

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
