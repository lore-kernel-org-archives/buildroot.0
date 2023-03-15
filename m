Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727FCC61DA4
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 07:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2352680C67;
	Wed, 15 Mar 2023 07:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2352680C67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LfNPZrJxE49B; Wed, 15 Mar 2023 07:18:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69A0180C18;
	Wed, 15 Mar 2023 07:18:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69A0180C18
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 683031BF47E
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 07:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 429A9415DD
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 07:18:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 429A9415DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5X7ZKo8pvo7j for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 07:18:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF63F40981
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF63F40981
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 07:18:21 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3450E240006;
 Wed, 15 Mar 2023 07:18:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pcLOs-001ja1-As; Wed, 15 Mar 2023 08:18:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: C D <dellicker@live.com>
References: <SJ0PR05MB7625D8C1B77DE29365DEDB13D4B99@SJ0PR05MB7625.namprd05.prod.outlook.com>
 <20230314085823.5a37e5e9@windsurf>
 <SJ0PR05MB7625BB7889E5DD3876C01E89D4BE9@SJ0PR05MB7625.namprd05.prod.outlook.com>
Date: Wed, 15 Mar 2023 08:18:18 +0100
In-Reply-To: <SJ0PR05MB7625BB7889E5DD3876C01E89D4BE9@SJ0PR05MB7625.namprd05.prod.outlook.com>
 (C. D.'s message of "Tue, 14 Mar 2023 18:43:29 +0000")
Message-ID: <87jzzi4h51.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] Forcing linker to look at right library path?
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "C" == C D <dellicker@live.com> writes:

Hi,

 > I'm trying to build sedcli (https://github.com/sedcli/sedcli); the version
 > I'm building is a slightly modified private branch (added some debugging), but
 > the Makefile and configure script are basically identical.  I went through 
 > the Makefile and added $(DESTDIR) in appropriate locations to make the files
 > go where they need to, but after running a "make sedcli-reconfigure" I realized
 > the configure script isn't taking any off options Buildroot is using to attempt
 > to make it do the right thing, and I'm assuming this is where my problem is.
 > The output I get from it is:

 > Wrong option: --target=x86_64-buildroot-linux-gnu
 > Wrong option: --host=x86_64-buildroot-linux-gnu
 > Wrong option: --build=x86_64-pc-linux-gnu
 > Wrong option: --prefix=/usr
 > Wrong option: --exec-prefix=/usr
 > Wrong option: --sysconfdir=/etc
 > Wrong option: --localstatedir=/var
 > Wrong option: --program-prefix=
 > Wrong option: --disable-gtk-doc
 > Wrong option: --disable-gtk-doc-html
 > Wrong option: --disable-doc
 > Wrong option: --disable-docs
 > Wrong option: --disable-documentation
 > Wrong option: --with-xmlto=no
 > Wrong option: --with-fop=no
 > Wrong option: --disable-dependency-tracking
 > Wrong option: --enable-ipv6
 > Wrong option: --disable-nls
 > Wrong option: --disable-static
 > Wrong option: --enable-shared

It sounds like you have configured this as an autotools package, but
looking at https://github.com/sedcli/sedcli/blob/master/src/configure I
see that it is a custom hand written script, so that is why it doesn't
understand all of these options. Use generic-package instead.

Notice that we already have a package for sedutil, which sounds as if it
does more-or-less the same as this sedcli.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
