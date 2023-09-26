Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5A6E7D24B
	for <buildroot@archiver.kernel.org>; Tue, 26 Sep 2023 08:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E014F82289;
	Tue, 26 Sep 2023 08:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E014F82289
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OeKoMYA-GJcc; Tue, 26 Sep 2023 08:02:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 395EB82286;
	Tue, 26 Sep 2023 08:02:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 395EB82286
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C4DAA1BF33A
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 08:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2E1E41E73
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 08:02:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2E1E41E73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bStexrHp5ot5 for <buildroot@lists.busybox.net>;
 Tue, 26 Sep 2023 08:02:53 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F1C941E37
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 08:02:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F1C941E37
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9262320010;
 Tue, 26 Sep 2023 08:02:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ql31r-0032ev-59; Tue, 26 Sep 2023 10:02:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Jens Maus via buildroot <buildroot@buildroot.org>
References: <20170608153557.30726-1-mail@jens-maus.de>
 <20230923165214.4014466-1-mail@jens-maus.de>
Date: Tue, 26 Sep 2023 10:02:46 +0200
In-Reply-To: <20230923165214.4014466-1-mail@jens-maus.de> (Jens Maus via
 buildroot's message of "Sat, 23 Sep 2023 18:52:14 +0200")
Message-ID: <87y1gtuztl.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] package/nut: package/nut: specify
 --with-user/group when building NUT
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>, Jens Maus <mail@jens-maus.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Jens" == Jens Maus via buildroot <buildroot@buildroot.org> writes:

 > This commit fixes a problem where the NUT package couldn't be
 > used as a NUT server due to the fact that the default group for
 > nobody is "nogroup" and not "nobody" like the internal default
 > of NUT. Thus, when starting a NUT server daemon the daemon starts
 > with incorrect group permissions. This commit fixes this
 > shortcoming by introducing a dedicated 'nut' user and 'nut' group
 > to drop priviledges to it.

 > Signed-off-by: Jens Maus <mail@jens-maus.de>

 > ---
 > Changes v1 -> v2:
 >   - added NUT_USERS with nut/nut user and group (Yann)

 > Signed-off-by: Jens Maus <mail@jens-maus.de>

Committed to 2023.02.x, 2023.05.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
