Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E73C433F5
	for <buildroot@archiver.kernel.org>; Mon, 23 May 2022 15:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBB09833D3;
	Mon, 23 May 2022 15:35:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B_HYgAdsOXuV; Mon, 23 May 2022 15:35:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F28258338B;
	Mon, 23 May 2022 15:35:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 408221BF390
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 15:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E9A360EB7
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 15:34:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8LRNnYkeP2pE for <buildroot@lists.busybox.net>;
 Mon, 23 May 2022 15:34:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA18B60E2A
 for <buildroot@buildroot.org>; Mon, 23 May 2022 15:34:57 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9EC6860002;
 Mon, 23 May 2022 15:34:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ntA57-00DiQZ-QJ; Mon, 23 May 2022 17:34:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220413162520.594048-1-fontaine.fabrice@gmail.com>
Date: Mon, 23 May 2022 17:34:53 +0200
In-Reply-To: <20220413162520.594048-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 13 Apr 2022 18:25:20 +0200")
Message-ID: <87sfp0w9cy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/liboping: fix build with gcc >=
 7
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Replace first patch (which is not in master after nearly 4 years) with
 > a new set of pending patches to fix the following build failure with
 > gcc >= 7:

 > liboping.c: In function 'ping_set_ttl':
 > liboping.c:207:9: error: '%s' directive output may be truncated
 > writing up to 255 bytes into a region of size 242
 > [-Werror=format-truncation=]
 >   207 |    "%s: %s", function, message);
 >       |         ^~
 > ......
 >   829 |      sstrerror (ret, errbuf, sizeof (errbuf)));
 >       |      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 > liboping.c:206:2: note: 'snprintf' output between 15 and 270 bytes into a destination of size 256
 >   206 |  snprintf (obj->errmsg, sizeof (obj->errmsg),
 >       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 >   207 |    "%s: %s", function, message);
 >       |    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/31083354e9064b2deef86917d67e92a88af0fa46

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
