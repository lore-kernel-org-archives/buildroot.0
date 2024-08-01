Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45993C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 21:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A3278204F;
	Thu,  1 Aug 2024 21:24:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q4fw2JrSO5Ch; Thu,  1 Aug 2024 21:24:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20AE982036
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20AE982036;
	Thu,  1 Aug 2024 21:24:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B6111BF3F0
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 689E4402E7
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:24:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tSdH4zOUsWNi for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 21:24:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2408E40153
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2408E40153
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2408E40153
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 21:24:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 434FF60003;
 Thu,  1 Aug 2024 21:23:59 +0000 (UTC)
Date: Thu, 1 Aug 2024 23:23:58 +0200
To: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Message-ID: <20240801232358.102e4544@windsurf>
In-Reply-To: <20240801191234.9526-1-kilian.zinnecker@mail.de>
References: <20240801191234.9526-1-kilian.zinnecker@mail.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722547439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RXc3z8c7ysaioPakNXYYbE29HdCgIec8dqILiuhgzFo=;
 b=LL+Fw4J6qYbfZ6PFAVjQLp1xhxB02G7mCq3MSIDqxcdR5RrEVT7EYn4VW/5Vzs0LK9nZXV
 XNF/+BfiQiWo6S3gTXljzHKhbqHFaVfHKb5m9CIR1uO8Y7wRFXPJprLvFiZsftUwbde7AD
 qEda7D2e/FOU2Wubl7peppoCFdh9R3SXxqtotz/GgdWldRY5w+N07UQvUO7Rs8DUrrCE9U
 Ab/X+zyyP7zH311d/931TcnMegKlcw9w6+HWDz3oumVL9bSSt3yDuNxd8iu/jOjj2xMJiq
 6NgO+7HTgS5hIP/nOFXEGTpvWyhoDFD3h7QYsB72JZ4lrziIvKidrsQq7Ye5pw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LL+Fw4J6
Subject: Re: [Buildroot] [PATCH] board/udoo/neo/readme.txt improve
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
Cc: festevam@gmail.com, Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  1 Aug 2024 21:12:34 +0200
Kilian Zinnecker via buildroot <buildroot@buildroot.org> wrote:

> This patch adds more inforamtion to the Udoo Neo's readme, e.g.,
> Uart pins and baudrate.
> 
> Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
> ---
>  board/udoo/neo/readme.txt | 54 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 53 insertions(+), 1 deletion(-)

Applied to master with some small improvements to the commit title and
log. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
