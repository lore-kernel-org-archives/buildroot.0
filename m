Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830AFC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 20:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FAA880E55;
	Tue, 30 Jul 2024 20:17:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C9TSGMq2_fEf; Tue, 30 Jul 2024 20:17:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F67780E84
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F67780E84;
	Tue, 30 Jul 2024 20:17:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8EBC51BF423
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 20:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C95C6076A
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 20:17:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7QXMmDb8-Sal for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 20:17:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4A7BA6074D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A7BA6074D
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A7BA6074D
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 20:17:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 57A6EC0002;
 Tue, 30 Jul 2024 20:17:09 +0000 (UTC)
Date: Tue, 30 Jul 2024 22:17:08 +0200
To: Dmitriy Chestnykh <dm.chestnykh@gmail.com>
Message-ID: <20240730221708.155d6fc9@windsurf>
In-Reply-To: <CA+RUeSpHZdf5uMFQi37xum67Ro7w6TJZRF-oeYc1ma8CtWfwWg@mail.gmail.com>
References: <20240728115817.743185-1-dm.chestnykh@gmail.com>
 <20240728180047.38c594f2@windsurf>
 <CA+RUeSqWVBsZYMV1S_2eDnLbEJY6E7o4aqDQjd9j=puoSs0cfQ@mail.gmail.com>
 <20240728221140.01aa7ed1@windsurf>
 <CA+RUeSpHZdf5uMFQi37xum67Ro7w6TJZRF-oeYc1ma8CtWfwWg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722370629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n+oqYP95gj87oVJERNLBLbTooFYXTjZqp0bfJeHJ0Hk=;
 b=eAOqU5P2ItaR8dFJF9wxcs7k1jnG/VdVgSOS80cZw0hF7aQx4XM0w+bYxRZ/rKJpR7Dyrc
 1yUksmX7fgvL2BmOo8xsupr1kGWajLLAAyb9EOQvZwUh1dMR089sgqvMlGxKs5ZtAYGLX7
 iHkFXEhS6BgbAs+uBIKqZh3PLfu3JmdDP24a6unnVz6OaVzwLD+FrNC098trRlhmvFN9Fp
 LBFiaOeq7Na7aovS1+1KQiFm4N/KdZRK6OYUhD30A81BmNlGU4emD+bW5/NzV0WmO1ZBNm
 kPyI6v5nAAnUbgObR8OxCq5jPM15tzvcaFN3hpbP/kXrRplHrStYPPpdkrWFfA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eAOqU5P2
Subject: Re: [Buildroot] [PATCH] package/uclibc: Fix ARC build with 4.x
 kernel headers
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

On Mon, 29 Jul 2024 07:38:12 +0300
Dmitriy Chestnykh <dm.chestnykh@gmail.com> wrote:

> Which version of QEMU do you use? Recently Waldemar sent a patch where he
> noticed that QEMU 9.x has an issue with SH4 emulation and the system
> doesn't boot

I do have the fix from Waldemar that brings the rootfs as an initramfs
in SuperH configurations, to workaround the Qemu 9.x bug.

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
