Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0346DC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4EFD820FC;
	Wed,  1 May 2024 19:53:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j3IMPfuTaSHi; Wed,  1 May 2024 19:53:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C89568128A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C89568128A;
	Wed,  1 May 2024 19:53:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A7B111BF2C9
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A209F60BC7
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CpvjmUHpUgOc for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:53:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7C5D260602
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C5D260602
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C5D260602
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:53:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E17DFF804;
 Wed,  1 May 2024 19:52:59 +0000 (UTC)
Date: Wed, 1 May 2024 21:52:58 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240501215258.2d29767e@windsurf>
In-Reply-To: <20240419215212.1025654-1-ju.o@free.fr>
References: <20240419215212.1025654-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714593179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6XGVODQ4eefrxn+OGUI5uiS6zOKWze6+FqiaF3Vnzn8=;
 b=I9INYbRLqQZSCsAys8CcjHpN9mUBfjowK3v5neB+0U0j+bI4ZAG/FwhWGveJfi3FQnJCYB
 UzUBdd4Mexvns2ZkJwZ8XPTciWESgD2IiEUAW3q5Iw19iT6U8lDU8GbXYFHYwucdKHN1MM
 G9YUL8PjVtz4XpfyvzdmS8KnT2DmdEvw9qV9EsVYy0rFgYGqAxefKm2cBa5+/XvAsufI2k
 bv2xggd9XUEn1wQNSvgvN3Nt9zTj7NFtnnvUJ34jPie0zxEFHsSL+Z25ZygM8U3QI1RRft
 U0Uce5o3q77xnDEC9CK8v5ie7cbGaQdvxCC/4XH4pQuoOwhn087UorksPzNtzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I9INYbRL
Subject: Re: [Buildroot] [PATCH 1/1] package/acpica: bump to version 20240321
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

On Fri, 19 Apr 2024 23:52:12 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log since 20230628, see [1].
> 
> License file hash changed in [2], due to year update.
> 
> The upstream download page also changed the published hash from sha1
> to sha256. This change is reflected in the hash file.
> 
> [1] https://github.com/acpica/acpica/blob/G20240322/documents/changes.txt
> [2] https://github.com/acpica/acpica/commit/c18edfb1abfb50521a363f811bc8e1e64213bd00
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on master branch at commit 256aa8e with commands:

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
