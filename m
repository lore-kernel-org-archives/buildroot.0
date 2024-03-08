Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDF6C54E41
	for <buildroot@archiver.kernel.org>; Fri,  8 Mar 2024 21:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68BBC40AFB;
	Fri,  8 Mar 2024 21:48:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JXl9g8pcXWcr; Fri,  8 Mar 2024 21:48:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50BEB41D00
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50BEB41D00;
	Fri,  8 Mar 2024 21:48:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4373B1BF995
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 21:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D885400EF
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 21:48:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OfTEofB_0w74 for <buildroot@lists.busybox.net>;
 Fri,  8 Mar 2024 21:48:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 13B19402C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13B19402C3
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13B19402C3
 for <buildroot@buildroot.org>; Fri,  8 Mar 2024 21:48:38 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 12AFDC2132
 for <buildroot@buildroot.org>; Fri,  8 Mar 2024 21:45:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7FD9FF802;
 Fri,  8 Mar 2024 21:45:33 +0000 (UTC)
Date: Fri, 8 Mar 2024 22:45:32 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20240308224532.427a7199@booty>
In-Reply-To: <20240304074140.1537910-2-neal.frager@amd.com>
References: <20240304074140.1537910-1-neal.frager@amd.com>
 <20240304074140.1537910-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1709934334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yow0xJYsGQDJzLCWoAZmNn1Fsh924H+UOuhcR5FrmZs=;
 b=P5iSQc2YsHbFndpGudB95jghHW2PNhjunGwX6V44vhTbQ47FnbxQgBdVQdOcavHCs270gv
 HvEg190ttsDWc/HyLp3FxoJAB39mwVfPzXrcob9wtKbcnWjMljKKGutLn/h+lfiK0mp0TN
 Fr06rV/gvXxs+Sz5QFj9rZKzI4Pn2hs2c5wqUDBsSA0n7q0ZwyYQ4iWrWrZm8kZuovc7tQ
 x6a0iRE2qlXZgCfDwZ6R5sjxeqfg0xKMmr33eAli3A51vzDC3+NnPfXnbkeY6cpC0LB59w
 vt0thzScAysu/CDtwqjhpY9H5xrtf0h+Sywht9iIhpe1AxK98QMLqZbjUszngg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=P5iSQc2Y
Subject: Re: [Buildroot] [PATCH v11 2/6] boot/uboot.mk: new zynqmp pmufw
 build option
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

On Mon, 4 Mar 2024 07:41:36 +0000
Neal Frager <neal.frager@amd.com> wrote:

> The new BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE option will enable u-boot to
> use the zynqmp-firmware package for building a pmufw.elf that gets included in
> the generated boot.bin.
> 
> If the BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE option is enabled, then the
> BR2_TARGET_UBOOT_ZYNQMP_PMUFW config for downloading a prebuilt pmufw will
> be ignored.
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
