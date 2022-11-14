Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D864C433FE
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 20:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FE38402DC;
	Mon, 14 Nov 2022 20:20:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FE38402DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nd-DmGWEZNGu; Mon, 14 Nov 2022 20:20:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EAE484020B;
	Mon, 14 Nov 2022 20:20:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAE484020B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EDCDB1BF299
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 20:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D590C403D8
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 20:20:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D590C403D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PW-By3EWvdA4 for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 20:20:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8776D40363
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8776D40363
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 20:20:43 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E72D0240007;
 Mon, 14 Nov 2022 20:20:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oufwb-007im6-SQ; Mon, 14 Nov 2022 21:20:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20221102165629.755750-1-jwood+buildroot@starry.com>
 <20221106105124.GP3918838@scaer>
Date: Mon, 14 Nov 2022 21:20:37 +0100
In-Reply-To: <20221106105124.GP3918838@scaer> (Yann E. MORIN's message of
 "Sun, 6 Nov 2022 11:51:24 +0100")
Message-ID: <87o7t9i8yy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/ca-certificates: add support
 for cryptography > 3.0
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
Cc: jwood+buildroot@starry.com, Martin Bark <martin@barkynet.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Justin, All,
 > On 2022-11-02 12:56 -0400, jwood+buildroot@starry.com spake thusly:
 >> From: Justin Wood <jwood@starry.com>
 >> 
 >> This patch was originally submitted upstream at https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1008244
 >> by Wataru Ashihara <wsh@iij.ad.jp>.  Minor changes by me to account for the Buildroot change in 0001-*.patch.
 >> 
 >> Building ca-certificates with a newer cryptography is breaking without this patch, and building buildroots
 >> `python-cryptography` package first doesn't change the broken behavior.

 > I've reworded the commit log in a more logical manner (explain what
 > breaks and why, then how we fix it).

 > I also notice that the bug report states that cryptography 3.0 is also
 > affected, so I tweaked the commit title accordingly.

 >> Signed-off-by: Justin Wood <jwood@starry.com>

 > Applied to master, thanks.

This is patching code we've added ourselves in patch 0001, so perhaps it
makes sense to invert the order of the patches, merge them or simply
drop the certdata2pem.py call completely? We don't build
host-python-cryptography automatically, so it can only happen if the
recently added optee-os option is selected (or a custom package), and
they happen to build before ca-certificates.

Committed to 2022.08.x, thanks (we don't have host-python-cryptography
in 2022.02.x).

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
