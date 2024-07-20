Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51666C3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D21F405D5;
	Sat, 20 Jul 2024 21:12:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oKHonhi1XLXc; Sat, 20 Jul 2024 21:12:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12471405F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12471405F9;
	Sat, 20 Jul 2024 21:12:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C015C1BF2C7
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB47781D3A
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:12:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g2vEUTcSDXGf for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:12:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C87B981ABA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C87B981ABA
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C87B981ABA
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:12:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13AB21C0002;
 Sat, 20 Jul 2024 21:11:59 +0000 (UTC)
Date: Sat, 20 Jul 2024 23:11:58 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240720231158.425c096d@windsurf>
In-Reply-To: <20240720114557.100691-1-ju.o@free.fr>
References: <20240720114557.100691-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721509919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2cQI/fT3l+K+SL8ntcB6Zz84qqzCb+EW8me6EfLouVY=;
 b=nrctr8VQRzpJSZAkDEYsO7xn6tgb9MJV05GcpzIg9AYADgYgVa9wSIELqri5v7VYoxZv0r
 5r6r7SssW5vOwgEwTjS4OAFG1RFaI0VznSQTvXFx4SDtHbMtszVfgTW+OIJAPzah80ka2A
 H+wuatQfKJLgGyqRLEAGoOfskvyL9qGh70JH6+h5kUMPm8OUcyA81+yjx/aNAhvnhJGtbw
 VE8ryUs1n6XcTEWX5IshYde7CVHlfg7/4o3lm5wXeIUrEbGux9UDYkYHYADGRI8xrwX31w
 iHZGpmZsU+bTcbsoIue26gTosEfStDCX/m3UpzdtQyAfIzqSgXdeWr+Yaq23DQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nrctr8VQ
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add mawk runtime test
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

On Sat, 20 Jul 2024 13:45:57 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                 |   1 +
>  support/testing/tests/package/test_mawk.py | 114 +++++++++++++++++++++
>  2 files changed, 115 insertions(+)
>  create mode 100644 support/testing/tests/package/test_mawk.py

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
