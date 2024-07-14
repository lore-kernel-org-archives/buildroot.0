Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08A2C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 16:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1EEB4010D;
	Sun, 14 Jul 2024 16:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id riL2OGHDUB_B; Sun, 14 Jul 2024 16:56:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F280401F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F280401F6;
	Sun, 14 Jul 2024 16:56:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 99F901BF32B
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 16:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9127740574
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 16:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IAhsvbNzEGWF for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 16:56:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2796D40571
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2796D40571
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2796D40571
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 16:56:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9EBAB240002;
 Sun, 14 Jul 2024 16:56:50 +0000 (UTC)
Date: Sun, 14 Jul 2024 18:56:48 +0200
To: Athaariq Ardhiansyah <foss@athaariq.my.id>
Message-ID: <20240714185648.7f8c3131@windsurf>
In-Reply-To: <20240714160457.39434-1-foss@athaariq.my.id>
References: <20240714160457.39434-1-foss@athaariq.my.id>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720976211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0m8PCHZsAqoZDPpm0ZB6QF9834NLDO1VeJjEPTEZ/5g=;
 b=QE2ZPTb57AZdEoGYrHPOTd8JlMDN8Fif5eKn5T3cKanE7qgCzB/4w/4LCpuQJU7xykSMNp
 EIatlpvA6u3473pRtqyMKskONp4d6RCOya7+KkKnEz8XYVNQdh36/h/aJsCNchpXxWQ/SI
 OytEq1mwsMtuvG3LhZLmJhjBhRZU46e3DGDBAO5DaON6BAv5CgBn5sYDMyL7sDSH3nZkq9
 9ZJrnH5k0xBljY+44BolqcMo/IM0C6JWxjraikN149oqP24AWx6GBRVUa0TJeA4wVj82VA
 QnTPH1tkkHpPcOPPnhh08vMuyj9qx8+EmTKCC4ifQEo6/ahEpS5dNhzwIMQbEw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QE2ZPTb5
Subject: Re: [Buildroot] [PATCH v4 1/3] package/rpi-firmware: bump version
 to 1.20240529
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
Cc: Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Athaariq,

On Sun, 14 Jul 2024 23:04:52 +0700
Athaariq Ardhiansyah <foss@athaariq.my.id> wrote:

> Latest RPi firmware already provided support for Raspberry Pi 5.

Thanks for the new patch. 

However, I don't understand your commit message. What "Latest" are you
talking about? Keep in mind that someone might read this in 2 years,
and the notion of "Latest" today and in 2 years will not be the same.

Also why is this sentence in the past tense? Do you mean that the
5476720d52cf579dc1627715262b30ba1242525e version currently packaged
already has RPi 5 support, or that we need to update to 1.20240529 to
have RPi 5 support?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
