Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31649C67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 20:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EACD740C1C;
	Mon,  8 Apr 2024 20:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KBmTc9o66vT8; Mon,  8 Apr 2024 20:37:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 077D24118A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 077D24118A;
	Mon,  8 Apr 2024 20:37:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 18BBD1BF2A7
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 20:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05A3F60B74
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 20:37:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5uJIqC0YP7sO for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 20:37:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C700960B63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C700960B63
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C700960B63
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 20:37:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B12A3FF802;
 Mon,  8 Apr 2024 20:37:24 +0000 (UTC)
Date: Mon, 8 Apr 2024 22:37:23 +0200
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20240408223723.59a2b59d@windsurf>
In-Reply-To: <20240403170351.470997-1-petr.vorel@gmail.com>
References: <20240403170351.470997-1-petr.vorel@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712608645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7WALp5TbIRVn+yrzM7mdN4/Yv4yL8etmg6Fm7ByF0nk=;
 b=ZDGI21soK+Fw0bBv2ScqIVZ0yq+UVsVsycZP5OogpGmH+snn9JxslrwJWhy3vTnVHx5S8/
 /c/oY9ILs3TziqK3kyihJtoFNLZuXOfolJzJHYoULEU4msxxWH6iYPQs5+bHWBHETmyOvG
 LvCtxzez4tf5tg7ArsHw1QO3B3HUNvhNsLXMgByg/1VKgdAOh1wYWIajzSSg35haobeef0
 Ocrjxaf3CZ4d5gAdb5V0nfbMLQcPXfx572nkJHMRXhmWTrXbDPbOn1q5dnq4dyO0c1T+Pu
 g8jTJnGRvUbagUs7VHpK247phzG1yey+comAQYSrvDdM1+ISETGxHAJZV2Um7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZDGI21so
Subject: Re: [Buildroot] [PATCH 1/1] toolchain/helpers.mk: Use int as main
 return type
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
Cc: Robert Marko <robimarko@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  3 Apr 2024 19:03:51 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> Although -Wmain-return-type is not considered as error (unlike
> -Wimplicit-int), but just a warning, let's fix it for the future.
> 
> <stdin>:1:1: warning: return type of 'main' is not 'int' [-Wmain-return-type]
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Based on the fix from Robert
> https://lore.kernel.org/buildroot/20240403121807.2087547-1-robimarko@gmail.com/

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
