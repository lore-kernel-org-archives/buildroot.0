Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBFEC27C53
	for <buildroot@archiver.kernel.org>; Sat, 22 Jun 2024 17:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 947CD40278;
	Sat, 22 Jun 2024 17:43:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LxfdgNQRE5TZ; Sat, 22 Jun 2024 17:43:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DC8D4059E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DC8D4059E;
	Sat, 22 Jun 2024 17:43:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B14F1BF5DB
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 17:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28321403AD
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 17:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I3CRKneWU9xX for <buildroot@lists.busybox.net>;
 Sat, 22 Jun 2024 17:43:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CC12D403A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC12D403A5
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC12D403A5
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 17:43:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 025391C0002;
 Sat, 22 Jun 2024 17:43:05 +0000 (UTC)
Date: Sat, 22 Jun 2024 19:43:05 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240622194305.21900f07@windsurf>
In-Reply-To: <20240612150730.382801-1-ju.o@free.fr>
References: <20240612150730.382801-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1719078186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zNFc/yF2tIfy0GAPzQCLoQWH65sUaDX400XK30GfscM=;
 b=FZo0YPZHi5kQ3zRX3gtU6gApzT/swG3BHX0nItMCPYoswNlbVHXBfLpXgcYDltubtFE3ZS
 jhRugdEHs1Ro21gq2LmvWfCe2Y6P7PrT5+5omDcBWTdtcq7BlrcRgElJ5tf5W4jG/nj9El
 jrcIBO7bHi/p/mx8sBCW8K9f4/pQCiK2OzTvbXUN6FI2ZNk2dVTrm3ODyt2qswuYbnJFzP
 poZzl7/QHdVhBJA70zTbiKtVUqLZiygJulEaYtWJuVNXx3hpXth8fd1mdFatep263hwAu2
 Kyp47NmNz27ZZVUcL9gyUYJeonb48WifkJHyR0nXvb6ayBbrVc4gX5SyZ6P+lA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FZo0YPZH
Subject: Re: [Buildroot] [PATCH 1/1] package/rdma-core: bump to version v52.0
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

On Wed, 12 Jun 2024 17:07:30 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log since v51.0, see:
> https://github.com/linux-rdma/rdma-core/releases/tag/v52.0
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch master at tag 2024.05 with commands:

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
