Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFACC3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 19:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B66160779;
	Fri,  2 Aug 2024 19:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sv5KHePAc9lR; Fri,  2 Aug 2024 19:24:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1192061305
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1192061305;
	Fri,  2 Aug 2024 19:24:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F7F71BF487
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 19:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D44480B53
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 19:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NHP6KZM-u_Hu for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 19:24:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1C7928087C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C7928087C
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C7928087C
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 19:24:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 215DDFF802;
 Fri,  2 Aug 2024 19:24:25 +0000 (UTC)
Date: Fri, 2 Aug 2024 21:24:24 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240802212424.3402c5cf@windsurf>
In-Reply-To: <20240726164522.73606-1-bernd@kuhls.net>
References: <20240726164522.73606-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722626666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tphAcDupPJJZDQkO/Xk9uhrq8RYhJ8CC2769UOO/fZQ=;
 b=bvv9BtAjJqmvlqkmK+9972seGa3fIB7dOMhnj6NPYg2+3m4NgeOB2o9mOBFacERgSxkcas
 qRzz9587FZEOpLW+aB3u3JOhUWt4j+hLKRw2/FJcf4ZEF9D4xud8mR7BxqiHlyCXEs5XQl
 uZET/2yOvR/thEQoFlSoEUQgGP9yHdu8baTUMRrUEpNjiGz0x1IdJdoCzQCvGlbjM1VkBk
 s3Xfq8qQmxR0hrvOdgUf+xBajK08z5CaTqbvhZtxhszyXYGuAhIjNaMt3FrNg6ZM46SEaL
 aosUzme7dA2TlNiCljID0Nr20XxzVbQZ6tYhkhlqRZJSLby6iuNBPhupFdcgSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bvv9BtAj
Subject: Re: [Buildroot] [PATCH 1/1] package/dtv-scan-tables: bump version
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 26 Jul 2024 18:45:22 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/dtv-scan-tables/dtv-scan-tables.hash | 2 +-
>  package/dtv-scan-tables/dtv-scan-tables.mk   | 2 +-
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
