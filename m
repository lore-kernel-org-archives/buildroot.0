Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA010C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:55:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FFB460F70
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0FFB460F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3AA060896;
	Mon, 25 Oct 2021 18:55:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qENwfdTdU2KA; Mon, 25 Oct 2021 18:55:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C7916088B;
	Mon, 25 Oct 2021 18:55:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6CC041BF3F7
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C5AF4025D
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:54:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id euDU8xrx_DJk for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 18:54:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E48240247
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 18:54:54 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id A57B8100004;
 Mon, 25 Oct 2021 18:54:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mf57S-00038h-SV; Mon, 25 Oct 2021 20:54:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20211008212136.721533-1-thomas.petazzoni@bootlin.com>
Date: Mon, 25 Oct 2021 20:54:50 +0200
In-Reply-To: <20211008212136.721533-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 8 Oct 2021 23:21:34 +0200")
Message-ID: <87y26hue85.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] support/scripts/pkg-stats: fix the
 status for packages found by guess
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The pkg-stats scripts tries to match packages against
 > release-monitoring.org in two days:

 > - First by using the "Buildroot" distribution registered on
 >   release-monitoring.org, in which we have added a lot of mappings
 >   between Buildroot package names and release-monitoring.org package
 >   names. If there is a match using this distribution, the package
 >   status is RM_API_STATUS_FOUND_BY_DISTRO, which means that the
 >   resulting HTML has a "found by distro" statement.

 > - Then, if the first solution didn't work, by using the pattern
 >   matching, as done in the check_package_get_latest_version_by_guess()
 >   function.

 > However, there is a bug in this later case: it sets the package status
 > to RM_API_STATUS_FOUND_BY_DISTRO as well, while it should have been
 > RM_API_STATUS_FOUND_BY_PATTERN. Due to this bug, in the resulting HTML
 > file from a pkg-stats run, all packages are marked as "found by
 > distro" even the ones that are "found by guess".

 > This commit fixes that by setting the correct package status.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 > This should be backported to stable branches of Buildroot.

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
