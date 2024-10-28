Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D0BD5B154
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 20:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0521560804;
	Mon, 28 Oct 2024 20:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EjLZ0G_ES_oK; Mon, 28 Oct 2024 20:57:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3441607FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3441607FA;
	Mon, 28 Oct 2024 20:57:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DAFEE4EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9D5680D5B
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:57:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w_nUjhGLQ74X for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 20:57:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9903080D83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9903080D83
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9903080D83
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:57:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E932F1C0006;
 Mon, 28 Oct 2024 20:57:01 +0000 (UTC)
Date: Mon, 28 Oct 2024 21:57:01 +0100
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20241028215701.61fc6893@windsurf>
In-Reply-To: <20241028172943.2147885-1-fiona.klute@gmx.de>
References: <20241028172943.2147885-1-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730149022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tLhGASZb+NwRDddjK6ccM78eM0ocABsweb4RQ14NHME=;
 b=dKRGeaiTsAxlloH7MdeQA+kslP1v+SphZz8B6EYE1rp/ULesKwFBTiInEUSPmbyz02Lw9Q
 cORhXs8Evb4X9hZ2PT9WVfzT+wx+Okc44yifxPU+Y3ZcWVRIJ/aUCayW3nPq5qQA0Jqn5A
 oVfSCqADuVMXl3yOPQmbcglxaRAtFPEKr2Q+wsxAFV9yk1pYGJu1Pgh3TJQ9ulGi+QQ8pZ
 uNtf2I4HLyquymoAVQAljE1N8OJOoptmzaC/dx5mQnSrBWFMgQLTNK3Lnd5qwW7qmCe0cQ
 IFWkhT3MQMvbzuHFhlIilwLik7h+/gN8+f7UKVDkqe5ZmrX7AVTK8fqomXdKtQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dKRGeaiT
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual/adding-packages-directory:
 describe start script details
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 28 Oct 2024 18:29:43 +0100
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> This codifies style elements discussed on the mailing list, most
> importantly PID file handling, and adds detailed considerations for
> writing start scripts.

Thanks for this!

> +==== Stopping the service
> +
> +The stop function should check that the daemon process is actually
> +gone before returning, otherwise restart might fail because the new
> +instance is started before the old one has actually stopped. How to do
> +that depends on how the PID file for the service is handled (see
> +above). It is recommended to always append +--exec "/sbin/$DAEMON"+ to
> +all +start-stop-daemon+ commands to ensure signals are set to a PID

                                                           ^^^ sent

Applied with this minor nit fixed! Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
