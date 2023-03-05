Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80432C6FA8E
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 17:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D6CE408C8;
	Sun,  5 Mar 2023 17:29:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D6CE408C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sfoBmf_4o0Uy; Sun,  5 Mar 2023 17:29:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0653405AE;
	Sun,  5 Mar 2023 17:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0653405AE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 198A61BF488
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7A0660DFE
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7A0660DFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pzn7roaV592j for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 17:29:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C89060BE0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C89060BE0
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 17:29:00 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0FF0460002;
 Sun,  5 Mar 2023 17:28:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pYsAK-001ff7-06; Sun, 05 Mar 2023 18:28:56 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20221231174208.1999716-1-giulio.benetti@benettiengineering.com>
 <20230222160518.3361b224@windsurf>
Date: Sun, 05 Mar 2023 18:28:55 +0100
In-Reply-To: <20230222160518.3361b224@windsurf> (Thomas Petazzoni via
 buildroot's message of "Wed, 22 Feb 2023 16:05:18 +0100")
Message-ID: <87fsaj85uw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/wilc-driver: fix build failure due
 to wrong pointer casts
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kris Bahnsen <kris@embeddedTS.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Sat, 31 Dec 2022 18:42:08 +0100
 > Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

 >> Add local patch pending upstream[0] to fix the bug.
 >> 
 >> [0]: https://github.com/embeddedTS/wilc3000-external-module/pull/3
 >> 
 >> Fixes:
 >> http://autobuild.buildroot.net/results/0a0/0a022d5c053bf8f7a53349b8bae4b2168a9cd134/
 >> 
 >> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 >> ---
 >> .../wilc-driver/0005-Fix-cast-warnings.patch  | 43 +++++++++++++++++++
 >> 1 file changed, 43 insertions(+)
 >> create mode 100644 package/wilc-driver/0005-Fix-cast-warnings.patch

 > Applied to master, thanks.

Committed to 2022.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
