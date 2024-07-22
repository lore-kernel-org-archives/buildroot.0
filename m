Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE50C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AAAE400D2;
	Mon, 22 Jul 2024 12:29:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 58c8BSaEBL9G; Mon, 22 Jul 2024 12:29:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EEA240177
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EEA240177;
	Mon, 22 Jul 2024 12:29:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 48A381BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42C2040177
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:29:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zhsMWHHmNPHI for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:29:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F3E4F400D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3E4F400D2
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3E4F400D2
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:29:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26F5A2000C;
 Mon, 22 Jul 2024 12:29:01 +0000 (UTC)
Date: Mon, 22 Jul 2024 14:29:00 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240722142900.51b8e9d9@windsurf>
In-Reply-To: <20240721170912.138847-1-ju.o@free.fr>
References: <20240721170912.138847-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721651341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RSN8bz0IIDQrLkRiIR+GtHvowt6mz0OHWNR7QYN7ZBQ=;
 b=lMRsQ044GHEdcuX1/kV0GylMU3qX7NVNPpimzVFzNRB5nCPFC1u2Gg7SagCAHuk4iPOrVP
 j3Rp9Qed0nOnOdAlwpk/Dlh99pJXexK+LRwyf1o7hNJgfzSQGwiIL3oZroQnCxgYgqud91
 EzO3+Ca4uXWPPYcZZW3Uzd7H3EjWKA6kWAgbwnrHrTrhRAYwzGuBtlB8fUiUNr+9hsGd1j
 DGhqCP/32PZnqYc+cThFCWP52eKz0ZxsX2yDrhIq6LUdB5CxuGnSXQUmHj/plRE1j/7N+b
 QOHarevP+d1Yxvxj0L5ZSWMulIbhtmMSW+ipMZNpDqf5ruro6AOXrpKY9VTZPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lMRsQ044
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add iproute2 runtime
 test
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

On Sun, 21 Jul 2024 19:09:12 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                    |  1 +
>  .../testing/tests/package/test_iproute2.py    | 77 +++++++++++++++++++
>  2 files changed, 78 insertions(+)
>  create mode 100644 support/testing/tests/package/test_iproute2.py

I'm not an expert into what would be a good test for iproute2, but what
you proposed seemed like a reasonable set of basic tests, so applied.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
