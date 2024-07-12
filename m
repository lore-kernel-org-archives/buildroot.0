Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A11FC3DA45
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEC0440BFF;
	Fri, 12 Jul 2024 14:38:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FaDcCt-ViP7e; Fri, 12 Jul 2024 14:38:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5B1340C87
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5B1340C87;
	Fri, 12 Jul 2024 14:38:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6DE211BF995
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66C8140C83
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:38:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ZpaKByEvbWT for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:38:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2621D40984
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2621D40984
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2621D40984
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:38:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8BA2A2000A;
 Fri, 12 Jul 2024 14:38:43 +0000 (UTC)
Date: Fri, 12 Jul 2024 16:38:42 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240712163842.6c8e8603@windsurf>
In-Reply-To: <20240601230340.1242345-1-ju.o@free.fr>
References: <20240601230340.1242345-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720795123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nLV0Udns97TuUw1D+ePCqaHUIA2WJwyMCrCmfTWKZS0=;
 b=bncw3scoaZ5QGQuof329pJt8njB1iLN4D3xC9qJwsAvNr5zxX0u4gxPeYlY+yj+FuhjV/S
 B7bZ29Y4la1l76Mp1S6IHpu6gLcNgDLGy53AfQqARrMTBSQ5tJZnvFYiUYZc8dy2N1oUdR
 1vLoRJeY5vBabzBsOUVnMhxKERFdWG6cXGHdto2CPcdtHToQKKhVv0C62DbV7h2IjuPz+T
 +bPL/0AiXdxhaYi4FWdnbdvU6bA/NIzROVPmG89kPW8+1yxUngcAQNDlUTMHoICuRjzSII
 IXqpQ4fp0w985qZ/E1YfLjIQl1lu/g4LtswHYQMEaVaMP0ISLZZURhOZEPb+yQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bncw3sco
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add mosquitto runtime
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

On Sun,  2 Jun 2024 01:03:40 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                    |  1 +
>  .../testing/tests/package/test_mosquitto.py   | 38 +++++++++++++++++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 support/testing/tests/package/test_mosquitto.py

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
