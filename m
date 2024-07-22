Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D66BC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 13:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3E6E4023D;
	Mon, 22 Jul 2024 13:12:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mutF5Xew_l2K; Mon, 22 Jul 2024 13:12:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F14540250
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F14540250;
	Mon, 22 Jul 2024 13:12:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E3ACD1BF2A3
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 13:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDDD9400D2
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 13:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tOHVgZbjld4Y for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 13:12:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7C846400C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C846400C6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C846400C6
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 13:12:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 878E3240009;
 Mon, 22 Jul 2024 13:12:27 +0000 (UTC)
Date: Mon, 22 Jul 2024 15:12:26 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240722151226.3c9a3514@windsurf>
In-Reply-To: <20240720173834.302209-1-ju.o@free.fr>
References: <20240720173834.302209-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721653947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NVtfLCP064qr/jileGELmbWmEs5i+ZFmAPZIJix2avo=;
 b=N72TGzsm49Zqc0NE3sByLAGcCWQ13Oaqeb9veGybvnLPp0GR76THOz9PjeN5W8Jj2JSvif
 nhiAH7ZKO0d63Vz92q42C2SHM0+jtsE+c9UJbTI9nom3wXphvwZ+yPZZhJyoe2N5Dh3m6B
 0m0jKBUbQKZpxatAYs84a+xXJn1uDxTxs66ZPWLJCSRGNFTSzP6cU/TYLzXEyI9lfyjJ1F
 c9XikVvK3gmRmTcfdGAuf1KbYpTKCq+cUpoFDPcyw18m8+iClPoGLDIwsB6UlLCr7YlsW4
 XF21wPRv0hrBbS6gnwE7HnOBehbsLy+6n5J720Y7bgaLW28O9OfUdIiop1lg+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N72TGzsm
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
>  create mode 100644 support/testing/tests/package/test_gpsd.py
>  create mode 100644 support/testing/tests/package/test_gpsd/rootfs-overlay/root/udp-nmea.log

Our CI is apparently not happy with this new test:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/7391792948

Could you perhaps have a look?

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
