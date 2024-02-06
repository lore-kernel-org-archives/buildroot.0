Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D252AC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 15:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 873BE41595;
	Tue,  6 Feb 2024 15:20:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 873BE41595
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CvNS4BZZEWuP; Tue,  6 Feb 2024 15:20:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 960884157E;
	Tue,  6 Feb 2024 15:20:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 960884157E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 107581BF215
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B8AB82319
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:20:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0NO9T8AA2PfH for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 15:20:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0B7218136E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B7218136E
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B7218136E
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 15:20:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D5A11C000A;
 Tue,  6 Feb 2024 15:20:40 +0000 (UTC)
Date: Tue, 6 Feb 2024 16:20:39 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206162039.7feb7ac9@windsurf>
In-Reply-To: <20240110044601.1084866-1-james.hilliard1@gmail.com>
References: <20240110044601.1084866-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707232840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yOVCFLA971KCcicBxVIJAzSSDxlMWelMrYjt1ggqxz0=;
 b=Fxu61Cl3Zdtbhen4mN57GaxBU3H7QnF1uJyYIT7w5UhecrCpXQSjYWd3CJsBXczGr/BZrG
 jMLqyinxnLm8sJgAtfi9aOxj72o3Adve2CLedcXY4O4dYDm+AKKn+WT6PzZxeJNNj+dtR3
 l9DR67fuvipdp3z33sOSWxSRKyiIKM+cxH7EnD6w3MTu85Ai39/RhMxWNwCeyrrrOWFzoy
 Q+e0nse+FwP0DJEq4beQ1AG+EbQWQMBQ34jqlHCqxd1LL2oMNTv2aIeGS0gWTSqxwIzVvf
 BQM0qX4SqGO68lE2vfcfyjfqztAVhbwjffUBS24j8sfi/KyGBcUz7by/CMngog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Fxu61Cl3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pycryptodomex: bump to
 version 3.19.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Jan 2024 21:46:01 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pycryptodomex/python-pycryptodomex.hash | 4 ++--
>  package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
