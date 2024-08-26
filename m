Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15840C5321D
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 16:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F172260586;
	Mon, 26 Aug 2024 16:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cAVyJg55X506; Mon, 26 Aug 2024 16:49:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E911E60793
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E911E60793;
	Mon, 26 Aug 2024 16:49:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 50BD81BF33F
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 16:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AFAC400F6
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 16:49:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RvK5GjPoRxST for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 16:49:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E4BEE400E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4BEE400E4
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4BEE400E4
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 16:49:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 80EAE40006;
 Mon, 26 Aug 2024 16:49:03 +0000 (UTC)
Date: Mon, 26 Aug 2024 18:49:02 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240826184902.352f76a3@windsurf>
In-Reply-To: <20240824162523.356508-1-ju.o@free.fr>
References: <20240824162523.356508-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724690943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=34qDcvT2boLLBRjPw+XcbnG7bXFgS21BGxWQTux+35Y=;
 b=iJYqS9SYarDIx5JjhnrG6OFaDe29RFdgMv/94miOzHlJHvTpL20FTc9XwGsvAWUmaKRji1
 B5E7KbHKKjOE6yrQgyS0nEiiKtlSDMPopqy/LCkHAkHeDAwgmNItsCmlYm5y1iSe3JbCTs
 PAzTBX+ap1NdV64ELOmwjolqaDviZtVg1leXLOo3XPmFTtujC/YiqQr2iCNS49B1O1kXo1
 lXmrb0IZ8paGW6xVNff63M405Y27EDol7hhe/mKzw7CDcogG/LoCZHHJq21wzP4dPtFRSP
 hhogZql9b9hGyLQcmxnMDx+oUGsU7WZekFw5pB7vYMUGt0X0jIpAUBmQKXVXvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iJYqS9SY
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add which runtime test
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

On Sat, 24 Aug 2024 18:25:23 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/7658080298
> ---
>  DEVELOPERS                                  |  1 +
>  support/testing/tests/package/test_which.py | 53 +++++++++++++++++++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 support/testing/tests/package/test_which.py

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
