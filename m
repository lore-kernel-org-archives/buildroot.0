Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE09C25B74
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 19:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A0316086F;
	Mon, 13 May 2024 19:36:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MuQkc5cdAMgV; Mon, 13 May 2024 19:36:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 529A060A5F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 529A060A5F;
	Mon, 13 May 2024 19:36:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D0241BF2CA
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 340904076B
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eGgsmW0jwW1Y for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 19:36:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ACF8B40861
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACF8B40861
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ACF8B40861
 for <buildroot@buildroot.org>; Mon, 13 May 2024 19:36:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B810320004;
 Mon, 13 May 2024 19:36:49 +0000 (UTC)
Date: Mon, 13 May 2024 21:36:49 +0200
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20240513213649.5624a768@windsurf>
In-Reply-To: <20240513123442.213242-1-festevam@gmail.com>
References: <20240513123442.213242-1-festevam@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715629009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CUdSngTxlDLOd4A7si23FCcleBLHjSgHqRqaX1HZUko=;
 b=p7LdXtIGe5WiQkxBNROQleiPzW2RqNc9k6YD7/y2SaLuRrS+5jzJGQw0VJKyWsauukooAb
 7IkcFXSjAWXB6lmau/NdpuMKSU6R0l8GI4YqGpcVBVWDXDTgu4tQgFgDaPhULfTKSrjmRa
 QqXSwU4UexcvixRV4FCoblR82VYPkZq75FSytjSlzjr+BPJrDu9Bdpll6sOdJ1tDGBtlY/
 GVWILUtm40AIaougav/yLRFCnmDU9+M/KAOlffJR0kqHzTDI9H6ce1h4lKm1ouxkilRKo+
 VSHH51+Ek7Y5LqfJRHjp1+J0t0z6EIXemnrbPzpyaTQOlhSC1RxvMYiY3/GvUw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=p7LdXtIG
Subject: Re: [Buildroot] [PATCH] configs/freescale_imx93evk: Update to NXP
 lf-6.6.3-1.0.0
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
Cc: ju.o@free.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 13 May 2024 09:34:42 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Update kernel, TF-A and U-Boot repos to the NXP lf-6.6.3-1.0.0 versions.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  configs/freescale_imx93evk_defconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

BTW, it would be good to make use of BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
in this defconfig (and in fact in the other defconfigs you maintain as
well!). Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
