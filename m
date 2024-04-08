Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB11C67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 20:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2C8A40CA1;
	Mon,  8 Apr 2024 20:54:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dcp97gAGp7_R; Mon,  8 Apr 2024 20:54:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 058344117C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 058344117C;
	Mon,  8 Apr 2024 20:54:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2AE581BF2A7
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 20:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14CD860A4C
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 20:54:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZHto-7wwumjC for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 20:54:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1FCF8607E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FCF8607E7
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1FCF8607E7
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 20:54:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB61220002;
 Mon,  8 Apr 2024 20:54:11 +0000 (UTC)
Date: Mon, 8 Apr 2024 22:54:10 +0200
To: Matt Staveley-Taylor <matt.stav.taylor@gmail.com>
Message-ID: <20240408225410.6a8ba988@windsurf>
In-Reply-To: <20240408013859.732937-1-matt.stav.taylor@gmail.com>
References: <20240408013859.732937-1-matt.stav.taylor@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712609652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qaaaE+YI/nXEYy0V29mALNussLAlIUEQ1I1WwEsyvXo=;
 b=UW6NRZQJb85//NqIqfNEGz96kZy3IJVCu1Q7JsPKtqYoolsUBa0Nf7E86YZNHlEr5qCjqe
 i0tLH3l4wyL1c8SWVu7EVk1pqE3A3pGMY02VLDqENlsWETrlXlwSPJZRSeBNiDuPSrt2rW
 owLo5nmlXGTcm0w5AK7aNeGMX1n5W+0fwcADpYCz3GUKOAKGIAPSM50VzSqxsAT8A0Oh++
 9RI7iPHXzzLrDPHsMaQK88zBLxeSIscGDExgZX0OLMl7qC6sKPqkoC2YNqxc1sMVAlVMB/
 HrujBqDPrPbdIyoijCjmGqJcebKPwDqunoDqJgavqQ8CLa/lvZZws/JGCwkcmA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UW6NRZQJ
Subject: Re: [Buildroot] [PATCH 0/2] Add bcachefs-tools package
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

Hello Matt,

On Mon,  8 Apr 2024 02:38:43 +0100
Matt Staveley-Taylor <matt.stav.taylor@gmail.com> wrote:

> This patch series adds a new bcachefs-tools package: the userspace tools
> for the bcachefs filesystem [1].

Thanks a lot for working on this!

> This package depends on host-clang to provide libclang, which is used to
> generate C <-> Rust bindings.

But do we need to unconditionally compile the C <-> Rust bindings?

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
