Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75EAC05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 22:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4273741754;
	Mon,  6 Feb 2023 22:05:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4273741754
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sWD-2uFkUBPk; Mon,  6 Feb 2023 22:05:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FF0B41746;
	Mon,  6 Feb 2023 22:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FF0B41746
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A95521BF422
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 22:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F8C140383
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 22:05:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F8C140383
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QLz-NIR1vCJ5 for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 22:05:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CA434016B
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8CA434016B
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 22:05:49 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1DB1E1C0003;
 Mon,  6 Feb 2023 22:05:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pP9cQ-00ED13-Aj; Mon, 06 Feb 2023 23:05:46 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230206171544.35665-1-fontaine.fabrice@gmail.com>
Date: Mon, 06 Feb 2023 23:05:46 +0100
In-Reply-To: <20230206171544.35665-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 6 Feb 2023 18:15:44 +0100")
Message-ID: <87357i8n5x.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2020.02.x] package/lxc: fix CVE-2022-47952
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
Cc: =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > lxc-user-nic in lxc through 5.0.1 is installed setuid root, and may
 > allow local users to infer whether any file exists, even within a
 > protected directory tree, because "Failed to open" often indicates that
 > a file does not exist, whereas "does not refer to a network namespace
 > path" often indicates that a file exists. NOTE: this is different from
 > CVE-2018-6556 because the CVE-2018-6556 fix design was based on the
 > premise that "we will report back to the user that the open() failed but
 > the user has no way of knowing why it failed"; however, in many
 > realistic cases, there are no plausible reasons for failing except that
 > the file does not exist.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

It is 2022.02.x, not 2020.02.x ;)

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
