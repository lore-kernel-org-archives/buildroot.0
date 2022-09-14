Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D927ECAAD3
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 09:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3675541762;
	Wed, 14 Sep 2022 09:47:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3675541762
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UsToInUhsNb7; Wed, 14 Sep 2022 09:47:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19AB041756;
	Wed, 14 Sep 2022 09:47:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19AB041756
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C37911BF355
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 09:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EF7F60BBC
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 09:47:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EF7F60BBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dP1qszO0GBtQ for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 09:47:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C941160757
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C941160757
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 09:47:37 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 749BE100003;
 Wed, 14 Sep 2022 09:47:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oYOzW-0047f5-AH; Wed, 14 Sep 2022 11:47:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220804203555.29029-1-thomas.petazzoni@bootlin.com>
 <87fsguqodw.fsf@dell.be.48ers.dk>
Date: Wed, 14 Sep 2022 11:47:34 +0200
In-Reply-To: <87fsguqodw.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Wed, 14 Sep 2022 11:46:51 +0200")
Message-ID: <87bkriqocp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/pistache: fix dependency on
 rapidjson
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
Cc: Thomas Ruschival <thomas@ruschival.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:
 >> rapidjson has been added as a dependency of pistache as part of commit
 >> 2f3218567953185008ec862f814bebecb9d6ed82 ("package/pistache: bump
 >> version & switch to meson build"), using a "depends on". However, as
 >> it is a library dependency, a "select" is normally used in Buildroot.

 >> rapidjson's only dependency is on C++ support, which is already a
 >> dependency of pistache.

 >> In addition, use = instead of += for the rapidjson dependency in the
 >> .mk file, as it's an unconditional dependency.

 >> Cc: Thomas Ruschival <thomas@ruschival.de>
 >> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 >> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

 > Committed to 2022.05.x and 2022.02.x, thanks.

Ups, sorry - Meant 2022.05.x only.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
