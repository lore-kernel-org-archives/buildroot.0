Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C8FC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 21:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E481260600;
	Mon, 19 Aug 2024 21:33:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BTzGoaumsP9K; Mon, 19 Aug 2024 21:33:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 156596060B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 156596060B;
	Mon, 19 Aug 2024 21:33:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E67B1BF398
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 21:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 087F940342
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 21:33:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id syRSbEYLNsZH for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 21:33:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 98A08400B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98A08400B9
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98A08400B9
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 21:33:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2C121BF203;
 Mon, 19 Aug 2024 21:33:41 +0000 (UTC)
Date: Mon, 19 Aug 2024 23:33:40 +0200
To: <yann.morin@orange.com>
Message-ID: <20240819233340.33639925@windsurf>
In-Reply-To: <87df5815f79f91e5842f7b35d673ec474167d4bb.1722501946.git.yann.morin@orange.com>
References: <cover.1722501946.git.yann.morin@orange.com>
 <87df5815f79f91e5842f7b35d673ec474167d4bb.1722501946.git.yann.morin@orange.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724103221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j83jf5L6UX+Ap9eEzGUKy1igPaRzulPFdVd5FIaMG1c=;
 b=SOCVYQHTWe4IMBkye4Q4YKCPmY17jhWoAhsU6a07DuZVgZ5CeFqQDuLIHTAC4NdkBssjfM
 zFPocRsBC1TDiKTNwtx8h9GzNK/bBETkJcEIWC4XkbYqvG/Z/+We15uvYDqcRvMCtjs4zv
 LvONvdD00V/LAqK8nqL+xCyajNIzGVupuRgRirCRpxBfXmTX5ogk8a09ew43CLKt+9jIeU
 2ZccVx6xSR9PYVSWr+gAWiheHj5TXKoJkCMzfUUHekM2UvndMZB5H4zqH4K+jhMRAiNaZ0
 QbyWzuJrTxzX/RX3R+BpaO8secYbSa0uP62aBPBOobjem1RLN3Zoi/CZf2VmLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SOCVYQHT
Subject: Re: [Buildroot] [PATCH 1/7] package/skopeo: add missing dependency
 on host go arch support
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

On Thu, 1 Aug 2024 10:45:45 +0200
<yann.morin@orange.com> wrote:

> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Fixes: 619b83a4438667cdb4cc8a7dddc79dbf6d84ec2a
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> ---
>  package/skopeo/Config.in.host | 1 +
>  1 file changed, 1 insertion(+)

Applied to master after adding a reference to an autobuilder failure
fixed by this patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
