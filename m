Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96762C74A5B
	for <buildroot@archiver.kernel.org>; Wed, 29 Mar 2023 09:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FCF841D68;
	Wed, 29 Mar 2023 09:29:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FCF841D68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AV3WVhFxWq6B; Wed, 29 Mar 2023 09:29:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5239B41C49;
	Wed, 29 Mar 2023 09:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5239B41C49
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A9B11BF35D
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 09:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C01C841BBD
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 09:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C01C841BBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XvFcL3NvwXnX for <buildroot@lists.busybox.net>;
 Wed, 29 Mar 2023 09:29:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6206E41C49
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6206E41C49
 for <buildroot@buildroot.org>; Wed, 29 Mar 2023 09:29:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 32AB51C0005;
 Wed, 29 Mar 2023 09:28:56 +0000 (UTC)
Date: Wed, 29 Mar 2023 11:28:55 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20230329112855.6110cf8d@windsurf>
In-Reply-To: <ffed7523-6dbe-6d61-03e7-57cdbc732097@mind.be>
References: <20230326130937.56650-1-f.fainelli@gmail.com>
 <20230328202533.GD3204460@scaer>
 <c7968ace-cfbb-1c54-bdde-083a37423686@mind.be>
 <20230329105022.6137bf1a@windsurf>
 <ffed7523-6dbe-6d61-03e7-57cdbc732097@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1680082137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ssE8fNNuWESTSQzw9tYtYImbvZrVtrOfGI5SbIpi+mQ=;
 b=b/AOd0T5tMBApQ276Kmi2Wm/RXbkZaR7pQMQ9ChAomcyc9cdJxg3bMwBY/cpnGUk3SUXZ9
 OUrhAcA9+7ILUC6nMjojTZy6idPcEJyhJudRIFc5rk7x7a40Fo6diAIyaX6fFc456C4Ib0
 BXWKYcdZB5vLtMlbRW3XSREWeWEb9ZWC2ofAyJtAguXbMq3NE0ABqPTi2MAL+ReyyP7dMC
 sRDwSvps3VUf8rwcfBVRD7r+peRu3/ylaRv+NufJYqnpyWzXllVx7UdQKM2YclCn4+ooNi
 FnaQ+7HjMkMfhpCw5A7p9Yr3NW5Zd1o/WThG+pJr3bwRXYrNu0sWtML7kd3SCg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b/AOd0T5
Subject: Re: [Buildroot] Indicating upstream status [was: [PATCH]
 package/bluez5_utils: Fix builds with musl-libc]
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, marcin@bis.org.pl,
 d.lang@abatec.at, buildroot@buildroot.org,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 29 Mar 2023 11:06:47 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>   Yeah, that's why I propose "Upstream:" - it's generic enough to cover all of 
> these cases. The contents can be freeform I think, check-package should just 
> check that the Upstream tag is present. And the documentation should give 
> examples of the five cases you mention.

Sure.

>   The "patch taken from downstream" is the only one which doesn't fit in the 
> "Upstream" thing. But it's also a situation we don't really like: we basically 
> don't want local patches, and a patch taken from some other distro _is_ a local 
> patch.

The reality is that we have such patches (for example to fix musl build
issues), and we somehow have to live with them.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
