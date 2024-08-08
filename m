Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A7CC52D7B
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 21:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2406D81D70;
	Thu,  8 Aug 2024 21:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UZ_kpi6V02V8; Thu,  8 Aug 2024 21:41:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C4EB818A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C4EB818A2;
	Thu,  8 Aug 2024 21:41:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2A6161BF97D
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 21:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1565440E93
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 21:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wJuziDlw6RRq for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 21:41:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B20E24012A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B20E24012A
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B20E24012A
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 21:41:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23F3120002;
 Thu,  8 Aug 2024 21:41:14 +0000 (UTC)
Date: Thu, 8 Aug 2024 23:41:13 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240808234113.09f8a415@windsurf>
In-Reply-To: <20240808202652.23100-1-giulio.benetti@benettiengineering.com>
References: <20240808202652.23100-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723153275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SAvxKmdJfdchF1wdePBKzHJW057FyctZcike91LriWM=;
 b=MwDmLrRlMcyM/qhH8T24Ark67OspX1pq2i9+l8Vsh/tYOMznAEOllibH+oOA738Vk4FXve
 8yI9Yu4AuFn5oTZyWFz1MpdFMz370IyZLLiZfs/rmwQp1uPcsbr2PrJY8mQBEor9nYqgm+
 6AwyJBjp13ZmMOzsVaw5dW58feQLTddpwc7WnirCycX3H65vZaGphxXH551NNp4GX3XuJr
 NO0Xf+epV/rkvQSbfI0TpmptdH1jU3n9KUYf77Q4lRDE4Skx3YIWa+TC9mPJOdz5jDLMUn
 qbjyGvSJf6kX0L+Pqc+NLbij1mwa2vgzaxpFyrQ8CAcCzsn2UkWrtT0aSPbePQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MwDmLrRl
Subject: Re: [Buildroot] [PATCH] package/libnvme: bump to version 1.10
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

On Thu,  8 Aug 2024 22:26:52 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/libnvme/libnvme.hash | 2 +-
>  package/libnvme/libnvme.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
