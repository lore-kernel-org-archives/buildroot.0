Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837ACC3A5A7
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 22:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2454560E3C;
	Tue,  6 Dec 2022 22:12:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2454560E3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pxKwm19gEQiR; Tue,  6 Dec 2022 22:12:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77DAA60FE8;
	Tue,  6 Dec 2022 22:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77DAA60FE8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 38CE31BF39E
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 22:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 148DD81E7E
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 22:12:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 148DD81E7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HNaHuEtqEiXs for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 22:12:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25A8F81E7B
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25A8F81E7B
 for <buildroot@busybox.net>; Tue,  6 Dec 2022 22:12:31 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2665D1BF205;
 Tue,  6 Dec 2022 22:12:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p2gAu-00FZL9-4x; Tue, 06 Dec 2022 23:12:28 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach via buildroot <buildroot@buildroot.org>
References: <58294107fad727dfc01e76ca23a47ab08a1ef9ea.1669368933.git.baruch@tkos.co.il>
Date: Tue, 06 Dec 2022 23:12:28 +0100
In-Reply-To: <58294107fad727dfc01e76ca23a47ab08a1ef9ea.1669368933.git.baruch@tkos.co.il>
 (Baruch Siach via buildroot's message of "Fri, 25 Nov 2022 11:35:33
 +0200")
Message-ID: <87o7sg5ghf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/dash: fix static with shared build
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Baruch" == Baruch Siach via buildroot <buildroot@buildroot.org> writes:

 > When BR2_SHARED_STATIC_LIBS is enabled we pass both --enable-static and
 > --enable-shared to configure. dash configure.ac only looks for
 > --enable-static to make the build static. But when linking against
 > libedit pkg-config only returns dynamic linking dependencies, so the
 > indirect ncurses dependency in not mentioned. The end result is that
 > libedit can't find ncurses symbols on link.

 > BR2_SHARED_STATIC_LIBS only makes sense for libraries, not executable
 > binaries. Pass --disable-static unless BR2_STATIC_LIBS is enabled for
 > static only build.

 > Fixes:
 > http://autobuild.buildroot.net/results/137d39cc5ec436759a2fde3f26ce5633e0ad6c2e/
 > http://autobuild.buildroot.net/results/55a38e0e45212bf7403d9ccb626c9422e3affe72/
 > http://autobuild.buildroot.net/results/8f109f1a04a6a2ff6d8c4c920e499fbaec3f72b9/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
