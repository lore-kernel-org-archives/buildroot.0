Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAC9D0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 20:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D8A2403CD;
	Sat, 26 Oct 2024 20:03:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rLZMOumexyfn; Sat, 26 Oct 2024 20:03:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19759403D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19759403D0;
	Sat, 26 Oct 2024 20:03:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C0C05C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19800403D0
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:03:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Htm19_WRg0L5 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 20:03:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B5AD3403CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5AD3403CD
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B5AD3403CD
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:03:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 84A831BF203;
 Sat, 26 Oct 2024 20:03:16 +0000 (UTC)
Date: Sat, 26 Oct 2024 22:03:15 +0200
To: Yu Chien Peter Lin via buildroot <buildroot@buildroot.org>
Cc: Yu Chien Peter Lin <peterlin@andestech.com>, tim609@andestech.com,
 ycliang@andestech.com
Message-ID: <20241026220315.64cf6970@windsurf>
In-Reply-To: <20240925072151.571744-1-peterlin@andestech.com>
References: <20240925072151.571744-1-peterlin@andestech.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729972997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RVUtI4I97uigIKldH/W7jHC9B8/IJaVRCC3a5hOHfJ8=;
 b=gB3ABKqkGJmS2ibyQbgkFk8rMs25pgUtKCCZAh1n1qf/5LTOJ3g2cQkUe63EN1UJ2lC6ph
 bustE9HXOxQl8tDeUiSkaV+tN3/JBNry0tvb7fZMp3G1KWeW5ng6JQeIx2see9+TT72aMY
 9t3mC/xCO9kysXF2ZkzuyJPeXfGQSIpSBf9MARbvZ4N3SxTS3fJbq892QxHFX//nIWf+T/
 XhwsLrSyKYCSQQ+aEgP68PFWAJCrvtRT+2lciLJ5m0AuY2hyj6IZ36fymsqdcWNw52wRQE
 q+slZiMgymyBchydIWXjy31xPo+e6ZFDXTNs38hEsp48vxa69E34MD5edehPuw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gB3ABKqk
Subject: Re: [Buildroot] [PATCH v4 0/4] Support Andes SPI_burn tool
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 25 Sep 2024 15:21:47 +0800
Yu Chien Peter Lin via buildroot <buildroot@buildroot.org> wrote:

> Yu-Chien Peter Lin (4):
>   package/andes-spi-burn: new package
>   configs/andes_ae350_45: Enable host-andes-spi-burn
>   board/andes/ae350: uboot.config.fragment: Support loading U-Boot on
>     RAM
>   board/andes/ae350: readme.txt: Add SPI_burn tool instructions

Thanks for this new version, series applied with minor updates to the
commit titles.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
