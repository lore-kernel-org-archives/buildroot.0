Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75062C25B5F
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 12:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 435E542AD5;
	Fri, 10 May 2024 12:03:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ThdZTI8QpVJ2; Fri, 10 May 2024 12:03:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5882A42AE2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5882A42AE2;
	Fri, 10 May 2024 12:03:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1391A1BF2A1
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 12:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77A1F42A89
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 12:03:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m87k2q-0bV3C for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 12:03:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6697642A4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6697642A4D
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6697642A4D
 for <buildroot@buildroot.org>; Fri, 10 May 2024 12:03:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B843EC0003;
 Fri, 10 May 2024 12:03:23 +0000 (UTC)
Date: Fri, 10 May 2024 14:03:22 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240510140322.1b4f0d5d@windsurf>
In-Reply-To: <20240324183038.157041-1-ju.o@free.fr>
References: <20240324183038.157041-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715342603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GadpJjQhWM/Q6CWHympWuGlEc02inpUgHi61LOousVw=;
 b=AK1x63HcSa3EwrPZ3E5b0BD1E2sfyiSyEMgEwguEy9w72jcncj0zJw8qTqVake9e+EmIDN
 oftj2LK+wduWoju2LDuQSSOVJ+00xYUFASf6d05WsJdY/ek/58kvtXZqD9/AlxcibSYoy2
 AkR8yXim/0GGyRvMQpXBrzFV7V6Naww+Pr9QRLxTO1TLRnPtnsdrnVKD1hReqeseRnDQyo
 Jx2A198RzXdRLGh0rnWQRE9mCsBeXD4cVlbA9WWlF6sJGbhexQSNuB/+AtQ+z2j7sIxDFJ
 67ttqXDR+opMp0KPNtuxTi8N2NfS7/pRQl4XtZlTdPG5cLC0HugZruCXJ3RNrQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AK1x63Hc
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add gnuplot runtime
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

On Sun, 24 Mar 2024 19:30:38 +0100
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                    |  2 +
>  support/testing/tests/package/test_gnuplot.py | 73 +++++++++++++++++++
>  .../rootfs-overlay/root/gnuplot-test.plot     |  4 +
>  3 files changed, 79 insertions(+)
>  create mode 100644 support/testing/tests/package/test_gnuplot.py
>  create mode 100644 support/testing/tests/package/test_gnuplot/rootfs-overlay/root/gnuplot-test.plot

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
