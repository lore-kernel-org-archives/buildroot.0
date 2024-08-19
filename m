Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5BBC5320E
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 11:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E10F80F3F;
	Mon, 19 Aug 2024 11:13:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OocOmq8MuV5H; Mon, 19 Aug 2024 11:13:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3805680F51
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3805680F51;
	Mon, 19 Aug 2024 11:13:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C4A861BF3DF
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 11:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3F80605AA
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 11:13:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xYmeWJiWDvYR for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 11:13:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 95B336000A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95B336000A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95B336000A
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 11:13:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E904BFF806;
 Mon, 19 Aug 2024 11:13:12 +0000 (UTC)
Date: Mon, 19 Aug 2024 13:13:12 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240819131312.66ddc4c0@windsurf>
In-Reply-To: <ZsCF118LHasdCmy7@waldemar-brodkorb.de>
References: <ZsCF118LHasdCmy7@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724065993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0q9cPyEUEQaeEZSRefpzFM4R9kmXs60VpAIkqUD5XVs=;
 b=nYpNF3QSKXFaR5y1Ec+HHGZNUPELtDNfsQs0RFt6UjQJKwiq54QUebh9FelnutDGQfAeWH
 KtVjz0ofnJ4xBqJFp3svlsFDQ0+UziQ0gMku90jpp3FUDOktEzPg/A6NjISc7g2kzsooww
 GMyMWMyBwCRRJgtK6Zcf6+VkcnZbZvlB6uqUbPrMM8aGj4cg0MMCyR/AxlTrvM2sI2IhwS
 PYIPW/TCZLJCJ+sNby8REATC8KuFywMJ0ehtUtKIkowmF+QiCDeI/hi8qx91ZTDVnL1by/
 FvBnQWmcSgwogWtpuNn0CYKfyg9nDEFYZObVVkXofBK3zfpuW5pRTSbhzhi9Yw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nYpNF3QS
Subject: Re: [Buildroot] [PATCH] package/mdadm: quote TARGET_LDFLAGS
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

On Sat, 17 Aug 2024 13:13:27 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Fixes:
>  - http://autobuild.buildroot.net/results/4a6/4a692e5aa5ac5cb409282a69f664c35611101b32
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/mdadm/mdadm.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
