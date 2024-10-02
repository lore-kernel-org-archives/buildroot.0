Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD48CF8542
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 21:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 290BC41C11;
	Wed,  2 Oct 2024 21:11:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 22OXRQCDJoug; Wed,  2 Oct 2024 21:11:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 243F541C1A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 243F541C1A;
	Wed,  2 Oct 2024 21:11:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 96D6F1BF5EA
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93F88804E3
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:11:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2gTfBqzvGCVb for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 21:11:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 96A71802D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96A71802D5
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96A71802D5
 for <buildroot@busybox.net>; Wed,  2 Oct 2024 21:11:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 960F7240004;
 Wed,  2 Oct 2024 21:11:22 +0000 (UTC)
Date: Wed, 2 Oct 2024 23:11:21 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20241002231121.7ce505de@windsurf>
In-Reply-To: <20240925133816.3899931-1-francois.perrad@gadz.org>
References: <20240925133816.3899931-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1727903483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/RUVleRqeRidO25p900aH8DOx92r4QpFTFMC0CxyYe8=;
 b=Tr+5y+cCzw6CzrVnjnSQw+8kdiC9z3PErCu0AgZFCUpk+tqrlXSSFWIaayTC2MW7jCvrUm
 hVRvRmjNhVMjeTzuW2gOM1+1AErdwQgERMZylr0hB2VXBbrbLdRX+a2Igc1mAOkxkxnHsM
 4dbukEZi9pE7aARBOSDbeUPPP7qc1QJlut/uh6+dlxB8MS5CySor5VH8gZF6ZjEAWYdWbx
 KlbxACcvrJXvsZwIbwVZ8USDHi2+uvdhR5EriX4NoCF2FAtMddPSQORcdhVsEU0Ey0WJKQ
 VZcfLn9YgaFLGd1jW2BL6C47ZXGwSIMiCQobjnYMoUBp7pJMLw14mvjDHEb4kA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Tr+5y+cC
Subject: Re: [Buildroot] [PATCH] package/webp: bump to version 1.4.0
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

On Wed, 25 Sep 2024 15:38:16 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/webp/webp.hash | 2 +-
>  package/webp/webp.mk   | 2 +-
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
