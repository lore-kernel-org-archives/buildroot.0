Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE73C5320E
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 10:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EA4540492;
	Mon, 19 Aug 2024 10:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p2PpaSBKJc1e; Mon, 19 Aug 2024 10:02:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B1554049A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B1554049A;
	Mon, 19 Aug 2024 10:02:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 06B3E1BF3D4
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 10:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9A3E4049A
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 10:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SP6ZJBlAD_1V for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 10:02:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B0C1540492
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0C1540492
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0C1540492
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 10:02:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 867B560005;
 Mon, 19 Aug 2024 10:02:45 +0000 (UTC)
Date: Mon, 19 Aug 2024 12:02:44 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20240819120244.7e17ad7a@booty>
In-Reply-To: <20240812051058.2911075-1-neal.frager@amd.com>
References: <20240812051058.2911075-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724061766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L2csmbyHGcpaI78TPxpw//Y+MD509tEIA5xDic4Ez1g=;
 b=SWyUkqZ7IEGXwnaYrdwoNj1YYLlhV8Mq6IiK9wt8qNPjxOD6WKBIXKmUvMWcyyjfDu/qyP
 FE7UhU0OE0ExEyL2EmCb3aOHw0COcKlPXrgVSfXK7WIYd+WRZWXdRONsqNPJ8idYDVubbe
 FmnqRmcdqMCZzd1DSgJHbyd1X8fyhZmpf+bqGlELUHz/mCwwe92/UzUGJS+XsYvV+1cKS5
 xQM55MbnH4W06WA01w+5yjo/3RWUedlDgR3URZOYde9Idu9/11o5f8yCHdBSNywwO2KAoW
 gt7qpArVD0cVYMD74orP2yLXT/VlZEY/ITiV5PdVg2DxQ8PQhJ3+aETYXQiHXQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SWyUkqZ7
Subject: Re: [Buildroot] [PATCH v3 1/1] board/xilinx: bump to linux 6.6.40
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
Cc: brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, romain.naour@smile.fr, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 12 Aug 2024 06:10:58 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch bumps all Xilinx board defconfigs to Linux 6.6.40.
> 
> Xilinx Evaluation Boards:
> configs/versal_vck190_defconfig
> configs/versal_vpk180_defconfig
> configs/zynq_microzed_defconfig
> configs/zynq_zc702_defconfig
> configs/zynq_zc706_defconfig
> configs/zynq_zed_defconfig
> configs/zynqmp_kria_kd240_defconfig
> configs/zynqmp_kria_kr260_defconfig
> configs/zynqmp_kria_kv260_defconfig
> configs/zynqmp_zcu102_defconfig
> configs/zynqmp_zcu104_defconfig
> configs/zynqmp_zcu106_defconfig
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
