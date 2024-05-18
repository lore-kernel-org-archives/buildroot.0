Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E53CC25B74
	for <buildroot@archiver.kernel.org>; Sat, 18 May 2024 20:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1A2A605B1;
	Sat, 18 May 2024 20:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KBiPNqaLRKhy; Sat, 18 May 2024 20:13:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BB72605EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BB72605EC;
	Sat, 18 May 2024 20:13:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E2D3C1BF3F0
 for <buildroot@lists.busybox.net>; Sat, 18 May 2024 20:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD5D1605F0
 for <buildroot@lists.busybox.net>; Sat, 18 May 2024 20:13:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fq7cFaULW5j4 for <buildroot@lists.busybox.net>;
 Sat, 18 May 2024 20:13:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 918B1605B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 918B1605B1
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 918B1605B1
 for <buildroot@buildroot.org>; Sat, 18 May 2024 20:13:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF9931BF204;
 Sat, 18 May 2024 20:13:36 +0000 (UTC)
Date: Sat, 18 May 2024 22:13:35 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240518221335.1d012fb0@windsurf>
In-Reply-To: <20240518094006.1134068-1-dario.binacchi@amarulasolutions.com>
References: <20240518094006.1134068-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1716063217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o9ZIgSgLr3s0muhBpjZsa3eZzu9nQHCQEOyiqDK026w=;
 b=JGcDJFOTpVY1FJTihfLyFvC+wlmjs3cWBgZtvQHKgO/irggZMJXpthmvIzKjx4QrPsh78L
 MnmV8H5eVeQ9qsCsIqBKqXU4d0UHG+/9LYpbs+TOi5lOe2Uiyw4LNIp7xB+gHd6Dwrm6Eb
 AMNR5PVl9L+oEtJzIJXzQeF/++dPE1i5GK1vWfJ8oFjCwLf/hvMo25VNHSujtNjNL2HN+8
 k1AlwDmRLbvL8Ggt/Sx/1jpqoUwxatoFeQuOAgHA7QaeoUIo1d+QrSHBLLlh84pIe+N1jL
 bboGf/Q9W/WAoAYbNmv3Nfs0VLr9Xo9cBhFPIB9IXBBP2foJrjBswKwJMEqhOg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JGcDJFOT
Subject: Re: [Buildroot] [PATCH v2] package/zxing-cpp: add options for
 enabling readers and/or writers
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dario,

On Sat, 18 May 2024 11:40:06 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> +if BR2_PACKAGE_ZXING_CPP
> +comment "At least one of readers/writers must be enabled"

This comment is not really useful, as it doesn't force anything. If
really at least one of readers or writers are needed, then you should
do this in the main BR2_PACKAGE_ZXING option:

	select BR2_PACKAGE_ZXING_CPP_READERS if !BR2_PACKAGE_ZXING_CPP_WRITERS

This will ensure that readers are selected if writers are not selected.
But it will still allow to deselect readers if writers are enabled.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
