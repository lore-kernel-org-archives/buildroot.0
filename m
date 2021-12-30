Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E766C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 21:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDDF982778;
	Thu, 30 Dec 2021 21:34:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hsfzZReI5Hmi; Thu, 30 Dec 2021 21:34:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BA0982733;
	Thu, 30 Dec 2021 21:34:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 88DD51BF3C4
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 21:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 738E882733
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 21:34:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0kKt1a5vpvC3 for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 21:34:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 61E4581425
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 21:34:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 51E61FF802;
 Thu, 30 Dec 2021 21:34:22 +0000 (UTC)
Date: Thu, 30 Dec 2021 22:34:21 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20211230223421.059f0917@windsurf>
In-Reply-To: <20211230205544.2056341-3-bernd.kuhls@t-online.de>
References: <20211230205544.2056341-1-bernd.kuhls@t-online.de>
 <20211230205544.2056341-3-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/4] package/Makefile.in: fix per-package
 build with gettext-gnu
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 30 Dec 2021 21:55:43 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Building a package which needs -lintl fails because the package
> gettext-gnu, containing this library, is not rsync'ed to the build
> directory.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Hu? Could you explain?

>  TARGET_NLS_DEPENDENCIES = host-gettext
>  ifeq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
> -TARGET_NLS_DEPENDENCIES += gettext
> +TARGET_NLS_DEPENDENCIES += gettext-gnu

gettext is a virtual package that depends either on gettext-gnu or
gettext-tiny, and both of them provide a libintl implementation.

How can this patch be correct?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
