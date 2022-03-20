Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89874C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 22:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45CFC40238;
	Sun, 20 Mar 2022 22:40:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y5QFreCVYT4N; Sun, 20 Mar 2022 22:40:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DCAF4019D;
	Sun, 20 Mar 2022 22:40:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0708A1BF402
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 22:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF88F40170
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 22:39:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pesG2W-I59Gy for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 22:39:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B38D840129
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 22:39:36 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D348460004;
 Sun, 20 Mar 2022 22:39:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nW4Cy-00FLlz-02; Sun, 20 Mar 2022 23:39:32 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220316214848.448925-1-thomas.petazzoni@bootlin.com>
Date: Sun, 20 Mar 2022 23:39:31 +0100
In-Reply-To: <20220316214848.448925-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Wed, 16 Mar 2022 22:48:46
 +0100")
Message-ID: <875yo8l04c.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] support/scripts/pkg-stats: strengthen
 version check in check_package_get_latest_version_by_distro()
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > The check_package_get_latest_version_by_distro() function analyzes the
 > data returned by release-monitoring.org. For two of our
 > packages (bento4 and qextserialport), release-monitoring.org returns
 > something that is a bit odd: it returns an entry with a
 > "stable_versions" field that contains an empty array. Our code was
 > ready to have or not have a "stable_versions" entry, but when it is
 > present, we assumed it was not an empty array. These two packages, for
 > some reason, break this assumption.

 > In order to solve this problem, this commit is more careful, and uses
 > the stable_versions field only if it exists and it has at least one
 > entry. The code is also reworked as a sequence of "if...elif...else"
 > to be more readable.

 > This fixes the following exception when running pkg-stats on the full
 > package set:

 > Task exception was never retrieved
 > future: <Task finished name='Task-10772' coro=<check_package_latest_version_get() done, defined at ./support/scripts/pkg-stats:532> exception=IndexError('list index out of range')>
 > Traceback (most recent call last):
 >   File "./support/scripts/pkg-stats", line 535, in check_package_latest_version_get
 >     if await check_package_get_latest_version_by_distro(session, pkg):
 >   File "./support/scripts/pkg-stats", line 489, in check_package_get_latest_version_by_distro
 >     version = data['stable_versions'][0] if 'stable_versions' in data else data['version'] if 'version' in data else None
 > IndexError: list index out of range

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.02.x, 2021.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
