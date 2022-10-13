Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C06C433FE
	for <buildroot@archiver.kernel.org>; Thu, 13 Oct 2022 08:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5008B40C4B;
	Thu, 13 Oct 2022 08:27:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5008B40C4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cf44WSu-awWc; Thu, 13 Oct 2022 08:27:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C3D840C3D;
	Thu, 13 Oct 2022 08:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C3D840C3D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D22D1BF4D8
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 08:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F38D56111F
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 08:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F38D56111F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x9oZLkaGutay for <buildroot@lists.busybox.net>;
 Thu, 13 Oct 2022 08:27:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 701376111D
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 701376111D
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 08:27:53 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9ED0660006;
 Thu, 13 Oct 2022 08:27:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oitZE-00Enyl-0H; Thu, 13 Oct 2022 10:27:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20221012215008.2918444-1-thomas.petazzoni@bootlin.com>
Date: Thu, 13 Oct 2022 10:27:47 +0200
In-Reply-To: <20221012215008.2918444-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 12 Oct 2022 23:50:08 +0200")
Message-ID: <87h708nn5o.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] Config.in: introduce BR2_TIME_BITS_64
 option for Y2038 compatibility
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
Cc: "Yann E.
 MORIN" <yann.morin.1998@free.fr>, Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Y2038 is now almost only 15 years away, and embedded systems built
 > today are potentially going to still be operational in 15 years, and
 > even though they are supposed to receive updates by then, we all know
 > how things go, and potentially some of these embedded systems will not
 > receive any update.

Thanks for picking this up! This has been on my todo list for a while as well!.


 > In 2038, the signed 32-bit representation of time_t used on 32-bit
 > architectures will overflow, causing all time-related functions to go
 > back in time in a surprising way.

 > The Linux kernel has already been modified to support a 64-bit
 > representation of time_t on 32-bit architectures, but from a C library
 > perspective, the situation varies:

 >  - glibc uses this 64-bit time_t representation on 32-bit systems
 >    since glibc 2.34, but only if -D_TIME_BITS=64 is
 >    specified. Therefore, this commit adds an option to add this flag
 >    globally to the build, when glibc is the C library and the
 >    architecture is not 64-bit.

 >  - musl uses unconditionally a 64-bit time_t representation on 32-bit
 >    systems since musl 1.2.0. So there is nothing to do here since
 >    Buildroot has been using a musl >= 1.2.0, used since Buildroot
 >    2020.05. No Buildroot option is needed here.

 >  - uClibc-ng does not support a 64-bit time_t representation on 32-bit
 >    systems, so systems using uClibc-ng will not be Y2038 compliant, at
 >    least for now. No Buildroot option is needed here.

 > It should be noted that being Y2038-compliant will only work if all
 > application/library code is correct. For example if an
 > application/library stores a timestamp in an "int" instead of using
 > the proper time_t type, then the mechanisms described above will not
 > fix this, and the application/library will continue to be broken in
 > terms of Y2038 support.

 > Possible discussions points about this patch:

 >  - Should we have an option at all, or should we unconditionally pass
 >    -D_TIME_BITS=64, like we have been doing for _FILE_OFFSET_BITS=64
 >    for quite some time. The reasoning for having an option is that
 >    the mechanism is itself opt-in in glibc, and generally relatively
 >    new, so it seemed logical for now to make it optional as well in
 >    Buildroot.

I was hoping we could just do it unconditionally, given that musl does
it already.

Failing that, I would think we could at least make it default y.


 >  - Should we show something (a Config.in comment?) in the musl and
 >    uClibc-ng case to let the user know that the code is Y2038
 >    compliant (musl) or not Y2038 compliant (uClibc-ng). Or should this
 >    discussion be part of the Buildroot documentation?

Having a notice about this in the documentation certainly cannot
harm. I'm not sure it makes sense to have it in Config.in.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
