Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4AAC4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 17:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 192BE61089;
	Wed, 21 Dec 2022 17:57:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 192BE61089
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V-oknmJvhAnq; Wed, 21 Dec 2022 17:57:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51A8B6108A;
	Wed, 21 Dec 2022 17:57:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51A8B6108A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4020A1BF844
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 17:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A8924189C
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 17:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A8924189C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id btGvzeCfmuIF for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 17:57:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B20B641893
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B20B641893
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 17:57:49 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 438931BF208;
 Wed, 21 Dec 2022 17:57:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p83Ld-0029Iz-2Y; Wed, 21 Dec 2022 18:57:45 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Quentin Schulz <foss+buildroot@0leil.net>
References: <20221213-cairo-cves-v1-0-b802b492d112@theobroma-systems.com>
 <20221213-cairo-cves-v1-2-b802b492d112@theobroma-systems.com>
Date: Wed, 21 Dec 2022 18:57:45 +0100
In-Reply-To: <20221213-cairo-cves-v1-2-b802b492d112@theobroma-systems.com>
 (Quentin Schulz's message of "Wed, 14 Dec 2022 12:16:02 +0100")
Message-ID: <87pmccod0m.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/cairo: fix CVE-2020-35492
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Quentin" == Quentin Schulz <foss+buildroot@0leil.net> writes:

 > From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
 > Add an upstream patch to fix CVE-2020-35492:
 > A flaw was found in cairo's image-compositor.c in all versions prior to
 > 1.17.4. This flaw allows an attacker who can provide a crafted input
 > file to cairo's image-compositor (for example, by convincing a user to
 > open a file in an application using cairo, or if an application uses
 > cairo on untrusted input) to cause a stack buffer overflow ->
 > out-of-bounds WRITE. The highest impact from this vulnerability is to
 > confidentiality, integrity, as well as system availability.

 > Important note: this is not the exact upstream patch. Indeed, the
 > upstream patch[1] contains a png file which appears as a binary diff
 > inside the patch. The `patch` tool which is used by Buildroot to apply
 > patches does not handle that kind of diff. Since it is just a test, it
 > shouldn't impact the quality of the CVE fix and all changes related to
 > the test are removed from the patch.

 > [1] https://gitlab.freedesktop.org/cairo/cairo/-/commit/03a820b173ed1fdef6ff14b4468f5dbc02ff59be
 > Cc: Quentin Schulz <foss+buildroot@0leil.net>
 > Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
