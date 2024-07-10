Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39031C3DA45
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 22:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA66B409F4;
	Wed, 10 Jul 2024 22:03:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 91OPW_dJcT2u; Wed, 10 Jul 2024 22:03:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C9F640881
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C9F640881;
	Wed, 10 Jul 2024 22:03:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C07A1BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 22:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46D19607DE
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 22:03:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xDY2Wn4bLEen for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 22:03:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3AE0160636
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AE0160636
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3AE0160636
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 22:03:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 079FCC0002;
 Wed, 10 Jul 2024 22:03:41 +0000 (UTC)
Date: Thu, 11 Jul 2024 00:03:40 +0200
To: Lance Fredrickson <lancethepants@gmail.com>
Message-ID: <20240711000340.015bdd34@windsurf>
In-Reply-To: <20240623220347.1967206-1-lancethepants@gmail.com>
References: <20240623220347.1967206-1-lancethepants@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720649022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ca8F1ngkJ7Mr1odDvyuyvTli+DNdOS1ne4jEViUdnvM=;
 b=jTik7FREvKqxxAzOk5PLC6ePxg0+Pq7toIqsgE0RImhfjbsgBjPo9z2fX8pEUSwm/envu1
 juoB/NAwSoFcRU27D5N6dNgu63KxmPwuixESOwWuALN4oJYDzGEj5P0UccJ5RTXECqQlK5
 DwybnkmRfzTlt841fTYCjp0WBXdWskWfmZ1Q1EVJ1K3jZz5SPtQdbThqITdSVzugHvkjbD
 tCS2MIf7MWTr7704MHEwDZ7idpujBMK4bMYLvCZetSEbk/VYv4yq2sTvwjUZ2frp/ImGqF
 AFLLr1cxq6Dce54Wwz1IvdUqmpkM28/rlPTekXzZz2x/S9+c/EYc3R7IX4rcpw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jTik7FRE
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: add WiFi and BT
 firmware for MT7925
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 23 Jun 2024 16:03:47 -0600
Lance Fredrickson <lancethepants@gmail.com> wrote:

> From: Lance Fredrickson <lancethepants@gmail.com>
> 
> Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
> ---
>  package/linux-firmware/Config.in         | 10 ++++++++++
>  package/linux-firmware/linux-firmware.mk | 13 +++++++++++++
>  2 files changed, 23 insertions(+)

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
