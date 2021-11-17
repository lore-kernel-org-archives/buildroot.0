Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3DA2C433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:59:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43BFE61391
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43BFE61391
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 016E483478;
	Wed, 17 Nov 2021 21:59:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sfMsUPqXkHTj; Wed, 17 Nov 2021 21:59:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4780B8343E;
	Wed, 17 Nov 2021 21:59:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB7CD1BF283
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C87AA826D6
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:59:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W89eCUBsSv5H for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 21:59:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BF0683410
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 21:59:47 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 5527B200009;
 Wed, 17 Nov 2021 21:59:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mnSy0-0006rp-Mq; Wed, 17 Nov 2021 22:59:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20211113093009.6915-1-bernd.kuhls@t-online.de>
 <20211113093009.6915-3-bernd.kuhls@t-online.de>
Date: Wed, 17 Nov 2021 22:59:44 +0100
In-Reply-To: <20211113093009.6915-3-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 13 Nov 2021 10:30:09 +0100")
Message-ID: <87pmqytpdb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] package/glmark2: fix selection of
 dependencies
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

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Commit 9c068b4be8 (package/glmark2: fix wayland build) extended the set
 > of required libraries for various "flavor" options by selecting those
 > libraries from the blind options.

 > However, that option is true as soon as the requirements are met (the
 > depends on), even when glmark2 itself is not enabled.

 > This means that extra libraries are pulled in to the build, even when
 > not required.

 > We fix that by moving the actual selects to the main symbol, along with
 > the proper conditions. This means that we have two lines that select
 > wayland-protocols, under two different conditions; we could make that a
 > single select, but the codition would need to be on two lines anyway,
 > so meh...

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > Requested by Yann:
 > http://lists.busybox.net/pipermail/buildroot/2021-November/628389.html

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
