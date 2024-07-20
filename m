Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEBBC3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10A74405F8;
	Sat, 20 Jul 2024 21:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GDprCkgkLm29; Sat, 20 Jul 2024 21:22:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1FBA405FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1FBA405FA;
	Sat, 20 Jul 2024 21:22:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF6511BF2C7
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC0EF405F8
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jC6MPgP_6HLF for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:22:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 57767405FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57767405FA
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57767405FA
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:22:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2D5440002;
 Sat, 20 Jul 2024 21:22:29 +0000 (UTC)
Date: Sat, 20 Jul 2024 23:22:28 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240720232228.290e88b3@windsurf>
In-Reply-To: <20240720173834.302209-1-ju.o@free.fr>
References: <20240720173834.302209-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721510550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tETSXx35sh6bIhf9LtbEicef8FcBmuRoFYieV+DPHKw=;
 b=oK80PcquftLFQ+YOPWZ7e7liEdC8G4xLmMmjv6qO0YuFDAUtiiID2LkvIPfHujU5/ZRD3E
 h+kv3E8kdXh2P6kR3zkuAFiu3AelRvWbSanGCw8L1xyHkui4mt9abmNHSw0nUbLU2pM/Sh
 LzVn569Zz8T2p07bkxC2XbfV+uMUuy+HGTfEUpttGTyp4PdbWH78I0OjUwv6NIEVZx1Vwu
 nylFuXUug13pBDQmtwC7hdU44Ze8m2zV11Fc+J10WtiJZnon6m3UZyrNCWB0tYzH1gIvQP
 fM2KvA4GmtxxDhC6bO5X2ArVaaSpQ4apRSzsqv+duwKTKtDlNoF+nBVBmwwIvQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oK80Pcqu
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add gpsd runtime
 testing
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

On Sat, 20 Jul 2024 19:38:34 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                    |  2 +
>  support/testing/tests/package/test_gpsd.py    | 56 +++++++++++++++++++
>  .../rootfs-overlay/root/udp-nmea.log          |  6 ++
>  3 files changed, 64 insertions(+)

Thanks, applied!

> +        # Collect some of our fake GPS data, and check we got the
> +        # coordinates from our test data file.
> +        # Our expected coordinates are:
> +        # https://www.openstreetmap.org/#map=19/43.60439/1.44336

Nice choice of location :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
