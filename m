Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D83C02190
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 11:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92826606AE;
	Sat, 14 Sep 2024 11:27:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZFq_EKsbiPlK; Sat, 14 Sep 2024 11:27:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC979613AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC979613AB;
	Sat, 14 Sep 2024 11:27:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6FBF41BF2C8
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 11:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 618C6607B1
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 11:26:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JHwzG40lQWFz for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 11:26:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EBE3E600B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBE3E600B9
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBE3E600B9
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 11:26:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D31B40002;
 Sat, 14 Sep 2024 11:26:51 +0000 (UTC)
Date: Sat, 14 Sep 2024 13:26:50 +0200
To: Christian Hitz via buildroot <buildroot@buildroot.org>
Message-ID: <20240914132650.3eb4a7b4@windsurf>
In-Reply-To: <20240911131830.2313769-1-christian@klarinett.li>
References: <20240911131830.2313769-1-christian@klarinett.li>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726313212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xr9dAyRHPi+/GBm0U+tIZ1tVOU3k1/s8b379iNIgPts=;
 b=nzkP7lXWIwK5+zQU5D8+QOv7PSPp2mXGdbQMJ9AQVYiXFSB4Nqcbj54aQWtGFHMhlu1aIM
 nkiBWOSxSuXCTFNj5e9diV0dgOjScXD1LFiCTRtDeDX766psY3fEwisYYd2cvWV1NBri0O
 ZpDP+sX0FSHtAD3C/AmFqSvpoGtXHqAhWbcUvRbAQkrBZQGxkLsKe/EdLgaFM2X0EXXJMT
 ZBwGAShzQovP5ms61UtzdppyIaBJP2g3dqn08jK7bRCUPv/bEEOe0QuWc5hyi07D67x5QQ
 inVnesfsnKAN1292EopenlpwKZkzaEkP9QK0L5GgRYmyMYveC6BoT8U8u21o9w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nzkP7lXW
Subject: Re: [Buildroot] [PATCH] package/qt6/qt6svg: host variant depends on
 host-qt6base
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
Cc: Christian Hitz <christian@klarinett.li>,
 Christian Hitz <christian.hitz@bbv.ch>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 11 Sep 2024 15:18:29 +0200
Christian Hitz via buildroot <buildroot@buildroot.org> wrote:

> From: Christian Hitz <christian.hitz@bbv.ch>
> 
> Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
> ---
>  package/qt6/qt6svg/qt6svg.mk | 3 +++
>  1 file changed, 3 insertions(+)

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
