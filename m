Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF7BC3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB06C600D1;
	Sun, 21 Jul 2024 16:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b43JyYCQGxSH; Sun, 21 Jul 2024 16:29:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E812605D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E812605D4;
	Sun, 21 Jul 2024 16:29:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D22B41BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFF42605D4
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:29:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8TELqjXsxWJU for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:29:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9D46F600D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D46F600D1
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D46F600D1
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:29:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 61DCC40003;
 Sun, 21 Jul 2024 16:29:18 +0000 (UTC)
Date: Sun, 21 Jul 2024 18:29:17 +0200
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20240721182917.15344f69@windsurf>
In-Reply-To: <8734o3ozh9.fsf@tarshish>
References: <20240721090024.371743-1-fontaine.fabrice@gmail.com>
 <8734o3ozh9.fsf@tarshish>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721579358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uOMe4XP6z6ateJYlNl2zvljc9MSSU0osWfVcur64Dyg=;
 b=G8yMbdWiTIMH/UAUEqrjiidESkwuc68x0kLQDwDV0bKMHF8TSN9/bSMWV91v0/NMiGxw4Q
 BWnEfsBh42zhqrl9DvQ/jXdQztaAnax54gRDAnziMIabGXeN4EPbZbYCZ+u0LAgp7mY3la
 lsIUOWiAD5SDPAY0iSXdiE1VDqAmnqInJt5BP3Ji2v5DKunlrd0kR+acGAbkIj3eLF9llk
 sgg0K67iwd/8eZOdKiTEKAX0H97vjPvCwWr6DsQiO+D7TMONuwnqn6wxESiX/okuCGZWl6
 qy/LisKH5YNczepYgDCQmwwVAwJwxOYli5mToxoH5EXHjGU4yZGOVeomde/kow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G8yMbdWi
Subject: Re: [Buildroot] [PATCH 1/1] Revert "package/gnutls: add tpm2-tss
 optional dependency"
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 21 Jul 2024 12:39:46 +0300
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> I guess we should leave this here to make it explicit we do not support
> tpm2 for host. More importantly, I think we also need unconditional
> --without-tpm2 in GNUTLS_CONF_OPTS.

I agree.

Fabrice, could you rework the patch?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
