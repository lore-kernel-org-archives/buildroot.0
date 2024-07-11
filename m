Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E3CC3DA45
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 18:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0646240210;
	Thu, 11 Jul 2024 18:00:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mIxHZJZuigbW; Thu, 11 Jul 2024 18:00:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C87ED40462
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C87ED40462;
	Thu, 11 Jul 2024 18:00:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 955BD1BF47D
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 18:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8251340543
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 18:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7DU978N9_de for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 18:00:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0649C40210
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0649C40210
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0649C40210
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 18:00:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8C30FF804;
 Thu, 11 Jul 2024 18:00:30 +0000 (UTC)
Date: Thu, 11 Jul 2024 20:00:29 +0200
To: Francis Laniel <flaniel@linux.microsoft.com>
Message-ID: <20240711200029.0763fc1d@windsurf>
In-Reply-To: <20240617151020.31120-4-flaniel@linux.microsoft.com>
References: <20240617151020.31120-1-flaniel@linux.microsoft.com>
 <20240617151020.31120-4-flaniel@linux.microsoft.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720720831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1HRpQ7PJWzBKCcSRSDo6JQ37NDhiKSjpmE/KG7zmrMY=;
 b=PlqyWLbk1jnk1IZG1eKUYAxMwcutkj9LXVov59U7js4GXCJllYEPNvn2ayUFnM9gn9Y7Jn
 3B8V8TG7lsJNGvb6YLT2Bcc8DY+7Sblq2M94F782aORFlbYIWeUqzF1JNdKPE2657a1+NA
 iZoJKw1QybfY8gNaR9P+9clztMeDyG2OlaX98gF08Q/oUh25PJ25ZsLxwdyi8LuyS/4eHM
 8WUfu8zs481TsmZIHn6BfxgWLExslGtR8I4VZe23Jx+e73IpuzMUgHcxKdpU/vMtD/1+Yf
 ROdebBHBTIV9+98ju7WLylc2/F5WHWTLu1Tt0bE54LqP8u0oneTSbbjvLi7w1w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PlqyWLbk
Subject: Re: [Buildroot] [RFC PATCH v1 3/4] package/sysdig: remove package.
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Francis,

I'm adding in Cc: Angelo who is also listed as a maintainer for this
package in our DEVELOPERS file. Angelo, any feedback?

See below.

On Mon, 17 Jun 2024 16:10:19 +0100
Francis Laniel <flaniel@linux.microsoft.com> wrote:

> Building sysdig within buildroot is a complicated task which
> has changed at each of their release.

But the package is working right now, isn't it? Did you try to update
it to a newer version and encountered some specific issues? If so,
which issues?

Maybe those issues should be communicated back to upstream, so that
they can improve how sysdig is provided/delivered? If something like
Buildroot can't package sysdig, maybe they will be interested in
hearing why?

> As the package seems to not be really used in buildroot, it
> seems wise to remove it.

How can you say it is "not really used"? We have no usage metrics for
packages, so really we have no idea of who uses sysdig.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
