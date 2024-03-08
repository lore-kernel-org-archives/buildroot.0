Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0773C5475B
	for <buildroot@archiver.kernel.org>; Fri,  8 Mar 2024 21:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93EF541D03;
	Fri,  8 Mar 2024 21:48:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HY0nyMIq7JoZ; Fri,  8 Mar 2024 21:48:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8149141D05
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8149141D05;
	Fri,  8 Mar 2024 21:48:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C6E71BF48D
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 21:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2725760A7F
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 21:48:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IOZ1yAdaRW_X for <buildroot@lists.busybox.net>;
 Fri,  8 Mar 2024 21:48:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0185660AE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0185660AE5
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0185660AE5
 for <buildroot@buildroot.org>; Fri,  8 Mar 2024 21:48:38 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 88FF8C2185
 for <buildroot@buildroot.org>; Fri,  8 Mar 2024 21:46:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04C871C0005;
 Fri,  8 Mar 2024 21:45:53 +0000 (UTC)
Date: Fri, 8 Mar 2024 22:45:53 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20240308224553.56237e89@booty>
In-Reply-To: <20240304074140.1537910-4-neal.frager@amd.com>
References: <20240304074140.1537910-1-neal.frager@amd.com>
 <20240304074140.1537910-4-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1709934354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7HSGLlc2Zrc+vS0XK+w0HzpaPiOhCv5I1ItBX3NefyA=;
 b=gOrO95AboE+iKDMgXf5rnbiedi/XZF5qbCluUM5XIbvy3Xip4n3SnSa+lr+qTrqOc26a1B
 XTSVPZIzJZFTUG7STfbM3aSdKxnDE5XXlRy6U7yV5R0xbP1JS03MFmYPPTWyJNRvlKAsrw
 AUNfvDepPltxtjKHSdmIG7G/nhSHmCKdkoDvfgMLD5QJCu1Tcd6u3p4QfoPx1qeUZom8Hy
 Qb6ZD8Pry8zYnr+zeDAlzylS6KJBONKVkozLFjn6J8dq45ni2QzXJZX2oMk/xoRmbrNkyj
 zW0wTDnR6K5nCSKmpe4kvRScSx8SQrzOwjSp8SBdMoZmBdXwTze5EsIdJ0DNvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gOrO95Ab
Subject: Re: [Buildroot] [PATCH v11 4/6] boot/versal-firmware: new boot
 firmware
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, michal.simek@amd.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 4 Mar 2024 07:41:38 +0000
Neal Frager <neal.frager@amd.com> wrote:

> This patch adds a new boot firmware to buildroot for building the versal plm
> and psmfw.  It requires the toolchain-bare-metal package that includes a
> bare-metal binutils, gcc and newlib which can be built for the microblaze
> architecture.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

[Tested on Kria KV260 starter kit]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
