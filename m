Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE39C54FB9
	for <buildroot@archiver.kernel.org>; Thu, 16 Nov 2023 14:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A61A83834;
	Thu, 16 Nov 2023 14:06:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A61A83834
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cZPGBCoOPMyO; Thu, 16 Nov 2023 14:06:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 895E683827;
	Thu, 16 Nov 2023 14:06:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 895E683827
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD1F91BF359
 for <buildroot@lists.busybox.net>; Thu, 16 Nov 2023 14:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 939026FA76
 for <buildroot@lists.busybox.net>; Thu, 16 Nov 2023 14:06:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 939026FA76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RP4GuSu_BRzI for <buildroot@lists.busybox.net>;
 Thu, 16 Nov 2023 14:06:19 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 727646FA55
 for <buildroot@buildroot.org>; Thu, 16 Nov 2023 14:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 727646FA55
Received: by mail.gandi.net (Postfix) with ESMTPSA id 923DFFF809;
 Thu, 16 Nov 2023 14:06:16 +0000 (UTC)
Date: Thu, 16 Nov 2023 15:06:15 +0100
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20231116150615.0b9d6236@windsurf>
In-Reply-To: <87zfzdzti5.fsf@tarshish>
References: <20231116135136.2337261-1-thomas.petazzoni@bootlin.com>
 <87zfzdzti5.fsf@tarshish>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1700143576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N6HDeE1HNOyWCo/Ml5PDylspAmUsRtfrTFy2PfiNql8=;
 b=DEcWsLKgET0hexGJ6HN8Y4yZyoxCaBbcZgbWSvMJ8ojJl5jKqWZhopXkFcCgpCtpnFnBEJ
 SBcd22xX+ywdOOcS7QxLF8LOVQ/+i4khEg9hBPtqtF65k94bC5n29hb7mY6mNgfUzrLcLt
 NZLp5zKdpL80OoF9+WIpjMni5z04Lx3axwpJUCOt81BmRcZ+R3RzI2dfHMw0XcQaszq0JW
 pGSJXMLFHbGO23k7jPNaA0CL0Bj29hSNFddFnCilIbbH1uY8VbORtYW/g7iXGwcVXgcPiB
 qbLnGM2paueSRmuM33yqUo6b+EVi+7gcfiPj9Aoo59wlvqdjgsCnyGHn274p+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DEcWsLKg
Subject: Re: [Buildroot] [PATCH] package/netsnmp: revert back to 5.9.3,
 backport security fix
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
Cc: Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 16 Nov 2023 16:01:03 +0200
Baruch Siach <baruch@tkos.co.il> wrote:

> > 56caafceab3ec12669ccb7aa6fc8b653778064e1 package/netsnmp: fix musl build
> > 13fc9dcb34926e9b6310b23662920c55c96d83a1 package/netsnmp: security bump to version 5.9.4
> >
> > and instead revert the one upstream commit that fixes both CVEs.  
> 
> s/revert/backport/, I guess?

Dang, yes, of course :-/

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
