Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 589A6C433EF
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 07:47:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B46B601FA
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 07:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B46B601FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EED0281D46;
	Fri, 12 Nov 2021 07:47:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hpoy4ZjZauOh; Fri, 12 Nov 2021 07:47:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 345CF81CBA;
	Fri, 12 Nov 2021 07:47:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B59A1BF869
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 07:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04310400CB
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 07:47:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id daUNbUiFwor9 for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 07:47:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 69ACF40258
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 07:47:36 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 277F9E0008;
 Fri, 12 Nov 2021 07:47:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mlRHY-0005Z6-CG; Fri, 12 Nov 2021 08:47:32 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20211110065623.A90DB401FC@smtp2.osuosl.org>
Date: Fri, 12 Nov 2021 08:47:32 +0100
In-Reply-To: <20211110065623.A90DB401FC@smtp2.osuosl.org> (Thomas Petazzoni's
 message of "Wed, 10 Nov 2021 06:56:16 -0000")
Message-ID: <87zgq9yfvv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2021-11-09
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

 > Hello,
 > Autobuild statistics for 2021-11-09
 > ===================================

 >                         defconfig |                        link to the job                        | orph?
 > ----------------------------------+---------------------------------------------------------------+------

Wow, lots of build failures, mainly because of Linux/U-Boot build
failures with gcc >= 10 on the host because of missing:

Linux:

commit e33a814e772cdc36436c8c188d8c42d019fda639
Author: Dirk Mueller <dmueller@suse.com>
Date:   Tue Jan 14 18:53:41 2020 +0100

    scripts/dtc: Remove redundant YYLOC global declaration

U-Boot:

commit 018921ee79d3f30893614b3b2b63b588d8544f73
Author: Peter Robinson <pbrobinson@gmail.com>
Date:   Thu Jan 30 09:37:15 2020 +0000

    Remove redundant YYLOC global declaration

    Same as the upstream fix for building dtc with gcc 10.

    Signed-off-by: Peter Robinson <pbrobinson@gmail.com>


 > nezha | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966167  | ORPH

Hmm, why is this listed as ORPH? I don't right away see any mistakes in
by DEVELOPERS entry.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
