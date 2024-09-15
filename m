Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F54C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 12:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFF2D8137C;
	Sun, 15 Sep 2024 12:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iHZXO6viZ6P1; Sun, 15 Sep 2024 12:54:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DADBF81393
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DADBF81393;
	Sun, 15 Sep 2024 12:54:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 375481BF841
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 12:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25A9A400E5
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 12:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OBTspK8BwRHt for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 12:53:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CB8C4400D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB8C4400D3
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB8C4400D3
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 12:53:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C8E5B240003;
 Sun, 15 Sep 2024 12:53:54 +0000 (UTC)
Date: Sun, 15 Sep 2024 14:53:52 +0200
To: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Message-ID: <20240915145352.6a8f25d2@windsurf>
In-Reply-To: <20240820184235.15351-1-zgyarmati@zgyarmati.de>
References: <20240820184235.15351-1-zgyarmati@zgyarmati.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726404835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+YjbF4R6l4hoWoUdRtWz84H4xA2yLzROESidz5znl1Q=;
 b=HvEhqgtpelFmYTFNHDIElgFIq5Rlz6QBj465dXwrCE+veb7sjPivtqNIQZPrFphA+7VL8d
 5wuc1G8ygPa3EXnprp/9jol3yqWQ7eu/AC2PtbEl7eVLw3xL5Ok4vFykPTb8rNEps6m6Fj
 yHzIkEigzOuxu03DrsVWAXRvO7aqCVbgBzDUG8I3ruXDsPewpszRfOTRIIqFTNGMPnXsfB
 BUWR6CEixZHlwUTKspcQVuDZJgF/war51EDGvFUwtviK0+0B7TrsiIK6fw5CjK4X8DjIEk
 9atig81c2tVlesPnW/RWe+5QRY/gJlRVN5fW0tV1Hy6yybmtMyLiSogoloZxUA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HvEhqgtp
Subject: Re: [Buildroot] [PATCH 1/1] package/shapelib: bump to 1.6.1
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 20 Aug 2024 20:42:34 +0200
Zoltan Gyarmati <zgyarmati@zgyarmati.de> wrote:

> Also updating hash of the LICENSE-MIT file (only copyright year changed)
> 
> Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
> ---
>  package/shapelib/shapelib.hash | 4 ++--
>  package/shapelib/shapelib.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
