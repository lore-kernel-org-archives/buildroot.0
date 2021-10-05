Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171C6C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 16:57:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78DAB61163
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 16:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 78DAB61163
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47E9A83DB8;
	Tue,  5 Oct 2021 16:57:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l6E40XEoqo2n; Tue,  5 Oct 2021 16:57:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA15183DB4;
	Tue,  5 Oct 2021 16:57:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C3441BF2F2
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 16:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B7DA60C03
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 16:57:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WpIscB6_eAmS for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 16:57:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 919C660C09
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 16:57:08 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id F2D521BF205;
 Tue,  5 Oct 2021 16:57:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mXnkV-0007bU-RQ; Tue, 05 Oct 2021 18:57:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20210917201944.3760710-1-yann.morin.1998@free.fr>
 <87v92bd1u7.fsf@dell.be.48ers.dk> <20211005152734.GA2081069@scaer>
Date: Tue, 05 Oct 2021 18:57:03 +0200
In-Reply-To: <20211005152734.GA2081069@scaer> (Yann E. MORIN's message of
 "Tue, 5 Oct 2021 17:27:34 +0200")
Message-ID: <87fstfbeao.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] fs/ext2: fix namespace for variables
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
Cc: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter
 > On 2021-10-05 15:43 +0200, Peter Korsgaard spake thusly:
 >> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
 >> > In filesystems, variables must be prefixed with ROOTFS_, to avoid
 >> > ckashing with packages of the same name.
 >      ^^^^^^^^
 >> > We do not have a package named 'ext2', so we currently have no clash,
 >> > but it is still ebtter that the variables be properly namespaced.
 >> s/ebtter/better/ ;)

 > Lol. But you missed s/ckashing/clashing/ above. ;-)

Grr, indeed ;)

 >> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 >> > Cc: Kory Maincent <kory.maincent@bootlin.com>
 >> Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

 > Thanks for the backports! :-)

You're welcome!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
