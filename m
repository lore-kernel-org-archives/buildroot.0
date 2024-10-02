Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A032CF8540
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 21:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69B964140A;
	Wed,  2 Oct 2024 21:11:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x6sPkbbzRJ6T; Wed,  2 Oct 2024 21:11:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46E5441BFB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46E5441BFB;
	Wed,  2 Oct 2024 21:11:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C525E1BF5EA
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C106A81F8F
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kfr8dA0shbAE for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 21:11:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AD79C81F91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD79C81F91
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD79C81F91
 for <buildroot@busybox.net>; Wed,  2 Oct 2024 21:11:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F23001BF204;
 Wed,  2 Oct 2024 21:11:09 +0000 (UTC)
Date: Wed, 2 Oct 2024 23:11:09 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20241002231109.6364063b@windsurf>
In-Reply-To: <20240925133713.3899825-1-francois.perrad@gadz.org>
References: <20240925133713.3899825-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1727903470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xfrhs7hajuMDD05xhFmvfjZjgMuln8W5s3NcriliIJU=;
 b=hcCW2X7BipNzoR5qiDItO1epnrs7qV5N/G419ZPBd/JT54ftZpdPIlkUSeIkzSpI9pYBJB
 w3lQP1x7Qe1VOWjBCXef8O72j070qj95501Eka0IyzIoVWvgWN/ZkazdyNpJSm22Y+DqIv
 BsNOvw2xpvi0hFt/B16yi/aAg2syvqCn6Phv9sFwzd18I5PbCoFjMDFb9JgYQbnlFTLU//
 8bA8HvkIOl/vhK1uthRemq3srRSw/r4m25ryOPdrjAx7QSr32TtFhf6EWCaM+0jaCKG0rM
 T9+1bTWg8C8eoQ4jGmJzAAwgvSqb4z5vfd4pqlvr7ucenWzjBQ5+lSW4i/gd9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hcCW2X7B
Subject: Re: [Buildroot] [PATCH] package/gnutls: bump to version 3.8.7
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 25 Sep 2024 15:37:13 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/gnutls/gnutls.hash | 4 ++--
>  package/gnutls/gnutls.mk   | 2 +-
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
