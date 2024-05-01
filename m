Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF07C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C86480B38;
	Wed,  1 May 2024 19:57:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id olhK0nCAQ7zL; Wed,  1 May 2024 19:57:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76A6380B52
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76A6380B52;
	Wed,  1 May 2024 19:57:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B13C21BF2C9
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A89DC80B52
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:57:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LYucrDJqJcWm for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:57:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A40DF80B38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A40DF80B38
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A40DF80B38
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:57:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CAE00FF803;
 Wed,  1 May 2024 19:57:01 +0000 (UTC)
Date: Wed, 1 May 2024 21:57:01 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240501215701.7b2ce70e@windsurf>
In-Reply-To: <20240420132817.1352847-1-ju.o@free.fr>
References: <20240420132817.1352847-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714593422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A5gKKdjXs6hya048vRHPRe74fjVXGKz9dWrX97doT3E=;
 b=hX++hVkPD3ivQhJofOsL7tGGjjQwfKNJmMlnZabQwbjUZVNKQ11dgA+y9E3g5cV+eFwcCm
 kHB8o4hTY1e7C9fhNFTd2+i/MzpblVp/XiVVpbeasoz3jLiaWQDOvSrQNaxJJsfTelBfsJ
 tQEul8w2EyjUkh5N/IDI1bdeBYXfprp0YhKY95wjXvPVqsMcvamq+6SoWYJtfet78jl9ys
 jBSPsX6K8kd+3IhOnRRzZpjvtnfJRxqZJrJ479BrOSGIrB/fuRLQPYsfLaVwUNMrN6X3QT
 7+GaT5TSuPrVlEYwqZMmX45oAMgwFGnm+s9hpxWApASkbu0YRpoTxJtcFDdL6Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hX++hVkP
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add fwts runtime test
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

On Sat, 20 Apr 2024 15:28:17 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                 |  1 +
>  support/testing/tests/package/test_fwts.py | 67 ++++++++++++++++++++++
>  2 files changed, 68 insertions(+)
>  create mode 100644 support/testing/tests/package/test_fwts.py

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
