Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86DADC4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 21:47:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F28160F9E
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 21:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F28160F9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A86540379;
	Mon, 26 Jul 2021 21:47:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tY2XAveZCRCt; Mon, 26 Jul 2021 21:47:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A5244033B;
	Mon, 26 Jul 2021 21:47:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD8EE1BF2F1
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 21:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C534B4047F
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 21:47:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7DP88HstfYvC for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 21:47:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9DE3C40491
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 21:47:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 6AACA240005;
 Mon, 26 Jul 2021 21:47:30 +0000 (UTC)
Date: Mon, 26 Jul 2021 23:47:29 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20210726234729.74a6443b@windsurf>
In-Reply-To: <20210725111231.359830-1-arnout@mind.be>
References: <20210725111231.359830-1-arnout@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5 1/3] package/python-numpy: use lapack
 instead of clapack
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Alexandre PAYEN <alexandre.payen@smile.fr>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Damien DUVAL <damien.duval@smile.fr>, Jagan Teki <jagan@amarulasolutions.com>,
 buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sun, 25 Jul 2021 13:12:29 +0200
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> wrote:

> The clapack package is deprecated and will be removed. Use lapack
> instead.
> 
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Damien DUVAL <damien.duval@smile.fr>
> Cc: Alexandre PAYEN <alexandre.payen@smile.fr>
> Cc: Romain Naour <romain.naour@gmail.com>
> Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/python-numpy/python-numpy.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
