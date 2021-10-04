Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA0EEC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 11:09:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20AF9613B5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 11:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 20AF9613B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5AB584AD2;
	Mon,  4 Oct 2021 11:09:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fq7UpUPm2dyP; Mon,  4 Oct 2021 11:09:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2376884AA5;
	Mon,  4 Oct 2021 11:09:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A7911BF34A
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 11:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2D2061B5F
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 11:09:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1dL78dv8lKUf for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 11:09:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE54561B59
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 11:09:21 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 49724FF803;
 Mon,  4 Oct 2021 11:09:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mXLqP-0007rV-GD; Mon, 04 Oct 2021 13:09:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Martin Elshuber <martin.elshuber@theobroma-systems.com>
References: <20210913142652.942533-1-martin.elshuber@theobroma-systems.com>
Date: Mon, 04 Oct 2021 13:09:17 +0200
In-Reply-To: <20210913142652.942533-1-martin.elshuber@theobroma-systems.com>
 (Martin Elshuber's message of "Mon, 13 Sep 2021 16:26:50 +0200")
Message-ID: <87lf39jbc2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] package/strongswan: fix broken
 dependency relation
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
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Martin" == Martin Elshuber <martin.elshuber@theobroma-systems.com> writes:

 > The AKA backend for 3GPP2 requires libgmp (see
 > https://wiki.strongswan.org/projects/strongswan/wiki/Autoconf). Since
 > the AKA backend for 3GPP2 is included by BR2_PACKAGE_STRONGSWAN_EAP,
 > when selecting a crypto backend different from
 > BR2_PACKAGE_STRONGSWAN_GMP, there is no guarantee the gmp package is
 > selected as well. When doing so, make fails since the package is in the
 > dependency chain but not selected:

 >   $ make
 >   Makefile:585: *** gmp is in the dependency chain of strongswan that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.
 >   make: *** [Makefile:23: _all] Error 2

 > To fix this, select BR2_PACKAGE_GMP when selecting BR2_PACKAGE_STRONGSWAN_EAP.

 > Signed-off-by: Martin Elshuber <martin.elshuber@theobroma-systems.com>

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
