Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3BDC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 20:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1EFF810CE;
	Mon, 22 Jul 2024 20:22:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R20K7GtXfEhq; Mon, 22 Jul 2024 20:22:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2F0F810D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2F0F810D0;
	Mon, 22 Jul 2024 20:22:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4448E1BF296
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 20:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31F5A40328
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 20:22:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EfDrvihyHcyN for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 20:22:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E4A204024C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4A204024C
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E4A204024C
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 20:22:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D3482C0002;
 Mon, 22 Jul 2024 20:22:40 +0000 (UTC)
Date: Mon, 22 Jul 2024 22:22:39 +0200
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20240722222239.47e2dfc6@windsurf>
In-Reply-To: <20240514103629.2002634-1-troglobit@gmail.com>
References: <20240514103629.2002634-1-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721679761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BwEENZ+wokbksaZGmRgJdDDLF5xn3kliYGRAEGBC6w0=;
 b=UBa11KPhu0ogYAdTMAGZkebGEUukRLlTVjupd12WcjGx8n+4ASVneApVeOTiIQKX4En/Th
 tJEM78NROmBSuFcakRc/pjFVRAwJNO017WmladUJHmZR3lEhycj3EU3O58B6Wzdfdc1cvr
 HFeP0PrDq357lPM6tp8E/zu678JvhFWpoI/QAqi6ScFOP0dsMgprMKystlqOa/n5zRfmcJ
 r4F9HNO5ly5y2WE/oJ/jgR6sBSCHzxjfzOKczdnP4fdrZhTTCAnCADKdqft5rcqepfnjHD
 DZONYQYfGGYwMo3jT+KGY4t+23Ohsq1OEusXEmEhbok3Pl4Bx7fvrOldO1hT7Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UBa11KPh
Subject: Re: [Buildroot] [PATCH 1/1] package/hostapd: drop duplicate
 host-pkgconf dependency
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 14 May 2024 12:36:29 +0200
Joachim Wiberg <troglobit@gmail.com> wrote:

> host-pkgconf already defined as dependency in package ingress.
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>  package/hostapd/hostapd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
