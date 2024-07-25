Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4600AC3DA5D
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 16:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27C2E40220;
	Thu, 25 Jul 2024 16:39:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bImxmPi2uTXO; Thu, 25 Jul 2024 16:39:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E30C402AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E30C402AA;
	Thu, 25 Jul 2024 16:39:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7FD641BF330
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 16:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CE8781ECF
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 16:39:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 19bzey3ifaBe for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 16:39:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5559681ECC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5559681ECC
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5559681ECC
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 16:39:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D61040004;
 Thu, 25 Jul 2024 16:39:27 +0000 (UTC)
Date: Thu, 25 Jul 2024 18:39:26 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240725183926.573a429d@windsurf>
In-Reply-To: <20240725153029.613254-2-giulio.benetti@benettiengineering.com>
References: <20240725153029.613254-1-giulio.benetti@benettiengineering.com>
 <20240725153029.613254-2-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721925567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XiqxdXPkFixkcpjCseG7ZV3Dq7jwtQyOIJSwrwq5798=;
 b=pwlCDWpbZXQa+gkaEpMWixWsztq9Phz+nz8ybSRs5USJZOVU92SVg4QM/Dz6d9jgy5Kx9Z
 uDMnJgoveONWUsUZeuniAoODsbrBj+RATOTbQUVYE1TBG7Fptc613jdymCddTdLFCsE03v
 cXw8Nxf1QmLOcACp3jAtnGA3Av22nre6V8OTU7G+szikrgAl0v8CYzpQJNS9s6j1T1NAL8
 MO5fs08rDq78AitmZS2OCPfAv17+nm4JEfzl7ckeKpkgcsHjniH2jxUNQ7tEG+ZPuzF4sG
 xSGa+9jilh3AxEtL4SXUhu/R2qAmY3T3pAhpBOfoHitallLdOI+L4lQ6GAPcyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pwlCDWpb
Subject: Re: [Buildroot] [PATCH] package/libtraceevent: bump to version 1.8.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 25 Jul 2024 17:30:28 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/libtraceevent/libtraceevent.hash | 2 +-
>  package/libtraceevent/libtraceevent.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
