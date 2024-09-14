Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDA2C0219E
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 22:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00540403B6;
	Sat, 14 Sep 2024 22:15:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2D1GZbBafRkp; Sat, 14 Sep 2024 22:15:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D19A4403C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D19A4403C9;
	Sat, 14 Sep 2024 22:15:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 65F061BF3DB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5534F60655
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:15:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2kLW6gSlWmHG for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 22:15:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3B25E605C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B25E605C2
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B25E605C2
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 22:15:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5EFE71BF203;
 Sat, 14 Sep 2024 22:15:28 +0000 (UTC)
Date: Sun, 15 Sep 2024 00:15:27 +0200
To: Geoff Levand <geoff@infradead.org>
Message-ID: <20240915001527.4e286947@windsurf>
In-Reply-To: <8b037972-abe1-47c4-951b-ab3cdb6e0f1c@infradead.org>
References: <8b037972-abe1-47c4-951b-ab3cdb6e0f1c@infradead.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726352130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5pQbwpRxRCoHz3PelLPGS9cuthXj3VM3qP0bpaIvh/Q=;
 b=AUmy8AAab2epoQr/jph7nLLgDoXpcSTAAdRl4TSVLh1vAJXSADkAO6A4VP3wGja8dJUNjK
 g0ne3vchz4ChV2JidlItpF7G9cLRYPr46OLb3iVeA76LoogKB0nQ6thn8vniV+ra5D+5Zh
 LYiJf+18g8q+unnOBriS0R1FEdpNqrF/v5Yd6XxmXYde/ZrWS/55lAJDfkruqHJo7CUapX
 R5/7peBB0VP9sloVzFS1LE0NZzcdmAzXCjn8CdNnmdA+YsqMGwfsfpagGNjtY2QU1nTDpN
 LpgVSuHT4W6NmenO/wlI46xNyM2V60+JlcbYPncSkPksczroDkzFs1cdR8aOLA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AUmy8AAa
Subject: Re: [Buildroot] package/flannel: bump to version 0.25.6
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

On Wed, 28 Aug 2024 10:08:14 +0900
Geoff Levand <geoff@infradead.org> wrote:

> Signed-off-by: Geoff Levand <geoff@infradead.org>
> ---
>  package/flannel/flannel.hash | 2 +-
>  package/flannel/flannel.mk   | 2 +-
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
