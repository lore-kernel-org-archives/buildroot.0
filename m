Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D18C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 14:32:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63B5360F0F
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 14:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63B5360F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F45E40854;
	Thu, 21 Oct 2021 14:32:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tYzM2LuNgAUT; Thu, 21 Oct 2021 14:32:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 695784084D;
	Thu, 21 Oct 2021 14:32:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D6CF11BF30E
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 14:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2F73406D6
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 14:32:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n1ebpFS17ouO for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 14:32:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D4154022A
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 14:32:27 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id C579710000E;
 Thu, 21 Oct 2021 14:32:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mdZ7H-0002WX-55; Thu, 21 Oct 2021 16:32:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20211004201737.1976547-1-yann.morin.1998@free.fr>
Date: Thu, 21 Oct 2021 16:32:23 +0200
In-Reply-To: <20211004201737.1976547-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Mon, 4 Oct 2021 22:17:37 +0200")
Message-ID: <877de678js.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/edk2-platforms: fix installation
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
Cc: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > There are currently three issues with the installation step:
 >  1. it does not ensure the parent destination directory exists before
 >     copying into it, so if /usr/share has not been created in the
 >     dependency chain of edk2-platforms, the installation fails, which
 >     may very well happen easily as edk2-plaforms has nothing in its
 >     dependency chain (except the toolchain et al.);

 >  2. all our dot-stampfiles and .files-list are also copied, as well as
 >     the Readme, license files, and maintainers file. All of those are
 >     useless on the target (and the .files-list introduce
 >     non-reproduciiblity);

 >  3. of a lesser importance, the construct to install, and specifically
 >     to reinstall, does not match what we usually do in Buildroot
 >     (removal of the directory to copy).

 > We fix all three in one fell swoop:

 >  1. create the destination directory if needed;
 >  2. copy just the directories with the actual platform descriptions

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Dick Olsson <hi@senzilla.io>
 > Cc: Kory Maincent <kory.maincent@bootlin.com>

Committed to 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
