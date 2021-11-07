Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E57C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 20:21:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0B4D60F0F
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 20:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E0B4D60F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B97846070D;
	Sun,  7 Nov 2021 20:21:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id roKy_q7F0xPk; Sun,  7 Nov 2021 20:21:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2463E6068C;
	Sun,  7 Nov 2021 20:21:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CD8981BF28A
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 20:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD1DC6070D
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 20:21:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5uatTaaCiGcz for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 20:21:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF4D3605D6
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 20:21:27 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A5CBCC0007;
 Sun,  7 Nov 2021 20:21:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mjofM-0005kg-WE; Sun, 07 Nov 2021 21:21:25 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211107095244.3503192-1-fontaine.fabrice@gmail.com>
Date: Sun, 07 Nov 2021 21:21:24 +0100
In-Reply-To: <20211107095244.3503192-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 7 Nov 2021 10:52:44 +0100")
Message-ID: <87y25zaf97.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/softhsm2: needs threads
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
Cc: =?utf-8?Q?Jos=C3=A9?= Pekkarinen <jose.pekkarinen@unikie.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > softhsm2 needs threads since the addition of the package in commit
 > 53873b6daecd2a97740833cae7c5b4cdb185a6b2 to avoid the following build
 > failure:

 > osmutex.cpp:240:2: error: #error "There are no mutex implementations for your operating system yet"
 >   240 | #error "There are no mutex implementations for your operating system yet"
 >       |  ^~~~~

 > While at it, fix a typo in comment

 > Fixes:
 >  - http://autobuild.buildroot.org/results/40a8c2d9f58fbe490b6832754fdf8ac4ee0804fc

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
