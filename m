Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DADFC352A1
	for <buildroot@archiver.kernel.org>; Wed,  7 Dec 2022 07:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3865841850;
	Wed,  7 Dec 2022 07:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3865841850
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZqTB-NTc8z3e; Wed,  7 Dec 2022 07:11:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 393E441843;
	Wed,  7 Dec 2022 07:11:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 393E441843
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B7101BF28B
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 07:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7ED261080
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 07:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7ED261080
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NDsDdnZFxr3m for <buildroot@lists.busybox.net>;
 Wed,  7 Dec 2022 07:10:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4F0460F2E
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4F0460F2E
 for <buildroot@buildroot.org>; Wed,  7 Dec 2022 07:10:48 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1A3BE40002;
 Wed,  7 Dec 2022 07:10:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p2oZq-00Fvwg-45; Wed, 07 Dec 2022 08:10:46 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20221127223653.302788-1-peter@korsgaard.com>
Date: Wed, 07 Dec 2022 08:10:46 +0100
In-Reply-To: <20221127223653.302788-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 27 Nov 2022 23:36:52 +0100")
Message-ID: <87bkof664p.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/dovecot: add upstream security fix
 for CVE-2022-30550
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > An issue was discovered in the auth component in Dovecot 2.2 and 2.3 before
 > 2.3.20.  When two passdb configuration entries exist with the same driver
 > and args settings, incorrect username_filter and mechanism settings can be
 > applied to passdb definitions.  These incorrectly applied settings can lead
 > to an unintended security configuration and can permit privilege escalation
 > in certain configurations.  The documentation does not advise against the
 > use of passdb definitions that have the same driver and args settings.  One
 > such configuration would be where an administrator wishes to use the same
 > PAM configuration or passwd file for both normal and master users but use
 > the username_filter setting to restrict which of the users is able to be a
 > master user.

 > https://dovecot.org/pipermail/dovecot-news/2022-July/000477.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
