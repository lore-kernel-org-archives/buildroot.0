Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB986CF2579
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 10:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 988B340238;
	Sun, 13 Oct 2024 10:47:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rk2e9pMxHJNA; Sun, 13 Oct 2024 10:47:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B78B4036E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B78B4036E;
	Sun, 13 Oct 2024 10:47:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 41D9C1BF35D
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3020440728
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kklwZsE7nFpP for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 10:47:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7D04140725
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D04140725
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D04140725
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 10:47:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68842C0005;
 Sun, 13 Oct 2024 10:47:46 +0000 (UTC)
Date: Sun, 13 Oct 2024 12:47:17 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241013124717.1b811e78@windsurf>
In-Reply-To: <20241011174959.2765520-1-james.hilliard1@gmail.com>
References: <20241011174959.2765520-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728816466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wqq/xpqdq3re6fgv80a584SVt5YtMCPZJiDCpGGzmJU=;
 b=S8rpbi9ffS9bZdi2k8C4XAI4YZouSpVJZ5Qg0fgMDfWDKH38Xh1AwcfvOobGsvgv/r9XCh
 libYc7Jnpqe+jKDxjCjs95j1bDDr1sHnKPoi8gAFlj/X5jEVrJHosqBRmIsPNNPojIF0DA
 ZaawJLO7Pj4mxl+qvqRR7JliY230ZHDsV2t+rKBieB0UxIbZ4mSF37/16EA+1KmocG7eoR
 l4d1UUQtJ5uHh42dpu96Pczo1QyOIGT9AkQ7eLXBOMjSWQfrhExGWHedNG7UpkMxf/Nui+
 T45yFfo6K8QR8WJR50kyRdfEpLRcFl8iJL/B82AfFGO5nls8Oj4s/z9R8bkQ3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=S8rpbi9f
Subject: Re: [Buildroot] [PATCH 1/1] package/python-bsdiff4: bump to version
 1.2.5
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

On Fri, 11 Oct 2024 11:49:59 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-bsdiff4/python-bsdiff4.hash | 4 ++--
>  package/python-bsdiff4/python-bsdiff4.mk   | 4 ++--
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
