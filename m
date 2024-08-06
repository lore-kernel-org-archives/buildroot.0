Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF855C52D6F
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 11:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F06B6409BC;
	Tue,  6 Aug 2024 11:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oRvlKN6ZU7nz; Tue,  6 Aug 2024 11:22:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 096C2409C8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 096C2409C8;
	Tue,  6 Aug 2024 11:22:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C9F0D1BF306
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 11:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C354760733
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 11:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eXHsbRjXawW7 for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 11:22:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7F43E600C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F43E600C9
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F43E600C9
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 11:22:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 887AF1BF203;
 Tue,  6 Aug 2024 11:22:35 +0000 (UTC)
Date: Tue, 6 Aug 2024 13:22:34 +0200
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20240806132234.416ec38e@windsurf>
In-Reply-To: <20240806044826.980205-1-neal.frager@amd.com>
References: <20240806044826.980205-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722943355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hAvP7ev/O/8m9h9K/JLthnNb+8Um7P8r6zPKXb7FvKg=;
 b=dz+a8p1LRlghpoD7OJ8mPMGsM0ia8YXprVeZaOdQr3aTkddAlzF/MzWoLLX1VTHw3FnMGA
 mM+dZPx0SDTnHFMhbw8WdvG7S8iiO+JNVacU24kzHauATP2gnwjE7BJEr+3V+xXiE2FdsP
 3ijMQ8b1LHPpIPzc/qhvhMGeepQ0OR1MQAlmjrymIY1zDmqpozaDUQXSGMgIYXv8pnbSq1
 YxHePCzUM1bndIAisYt2kOarfRgVF/pU9Mm6j3pQzNkGr4Z2zoakjMPhkSn5kKAJ1t4UdM
 C1iDMIqOXm/7ct3YEOdl4qKgoi+rdQ0KyV1LnVDiHVtTYRA/BKCFzuFIE2LVDA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dz+a8p1L
Subject: Re: [Buildroot] [PATCH v1 1/1] package/gcc-bare-metal: bump to gcc
 14.2.0
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
Cc: luca.ceresoli@bootlin.com, michal.simek@amd.com,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 6 Aug 2024 05:48:26 +0100
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> This patch bumps gcc-bare-metal to gcc 14.2.0.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  package/gcc-bare-metal/14.1.0            | 1 -
>  package/gcc-bare-metal/14.2.0            | 1 +
>  package/gcc-bare-metal/gcc-bare-metal.mk | 2 +-
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  delete mode 120000 package/gcc-bare-metal/14.1.0
>  create mode 120000 package/gcc-bare-metal/14.2.0

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
