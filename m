Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2E2C433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 15:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B16A0402D1;
	Thu, 13 Jan 2022 15:49:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1jJ2hqJ7irnv; Thu, 13 Jan 2022 15:49:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 531654164E;
	Thu, 13 Jan 2022 15:49:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5EEC91BF3FD
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 15:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DB5884CBC
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 15:49:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yw6S2zE3XJ8Y for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 15:49:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4330A84CD1
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 15:49:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 4934120000A;
 Thu, 13 Jan 2022 15:49:07 +0000 (UTC)
Date: Thu, 13 Jan 2022 16:49:06 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220113164906.5db00b20@windsurf>
In-Reply-To: <53b29654-5d59-26e6-4635-a1ecb87babe0@mind.be>
References: <20220112132618.2634250-1-aperez@igalia.com>
 <20220112160512.GC6032@falbala.internal.home.lespocky.de>
 <20220112184729.GB23006@momiji>
 <53b29654-5d59-26e6-4635-a1ecb87babe0@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH RFC 0/2] Use Ninja as build tool for
 CMake-based packages
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, Alexander Dahl <post@lespocky.de>,
 Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 12 Jan 2022 19:55:03 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

>   There's one disadvantage to Ninja in Buildroot context: until [1] is fixed, it 
> doesn't collaborate well with top-level parallel build. This means that if you 
> run with a toplevel JLEVEL of e.g. 24, you can easil end up with 40-100 compiles 
> running in parallel. The problem already exists for meson packages, but these 
> are sufficiently rare that they don't pose a problem in practice. I don't know 
> if it's going to become a problem if cmake packages are added to the mix.

meson-based packages are no longer rare: we now have 116 packages using
the meson-package infrastructure, including very high profile packages
such as systemd, mesa3d, libglib2, and more.

It is still higher than the 328 cmake-based package we have of course,
but I wouldn't say that meson is "sufficiently rare" :-)

Annoying that this problem hasn't been resolved in upstream ninja :-/

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
