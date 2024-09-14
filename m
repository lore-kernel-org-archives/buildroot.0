Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365EFC021B1
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 20:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0704280BE7;
	Sat, 14 Sep 2024 20:16:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AcUF-SsVCXJ2; Sat, 14 Sep 2024 20:16:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28EF58104D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28EF58104D;
	Sat, 14 Sep 2024 20:16:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2AF7B1BF3A4
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 20:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D94034063A
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 20:15:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ONqD4BDeA0P1 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 20:15:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A9AA24062C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9AA24062C
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A9AA24062C
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 20:15:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A82A920004;
 Sat, 14 Sep 2024 20:15:55 +0000 (UTC)
Date: Sat, 14 Sep 2024 22:15:54 +0200
To: Niklas Cassel via buildroot <buildroot@buildroot.org>
Message-ID: <20240914221554.56a2af95@windsurf>
In-Reply-To: <20240909182103.3667296-2-niklas.cassel@wdc.com>
References: <20240909182103.3667296-1-niklas.cassel@wdc.com>
 <20240909182103.3667296-2-niklas.cassel@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726344956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AeLGtXvpcS4xv0pMbuiJeH5+CavyrUdrVFEr7VpBqxs=;
 b=YDqRM6mDYHM1hMWGwTQzLblP0i5AjVtSjxO7MjoRSTZZzytNJCLrG/GqaVbux96EcRkoeS
 YfAe25LmUR95eZ/3x/fHPeyP9BMmCwbSDx0nmfnqjEs3Za8HPOkGCc8Vxp5r5lTLvnU9hM
 gkccSjRDXOzFa3aT872SPnRDLah5dCa2rutQqfEd8tK8z+98wyon4Gks6Z6EOsWJdmb5Sy
 SDeY7rvAI7uxeOzb4vI5pmQQFz5GHYMn3YA1oHY9f3YC7xAiii+ULHcuE1aiNWPCikVBjj
 4BGz0hqgtnUtW3nD9S1CgzRoIsxC6usgmRhfobWUBXb15CymYk5sxz3b6i5ESA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YDqRM6mD
Subject: Re: [Buildroot] [PATCH 1/2] configs/rock5b: enable mdev to enable
 automatic module loading
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Damien Le Moal <dlemoal@kernel.org>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>, Niklas Cassel <cassel@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  9 Sep 2024 20:21:02 +0200
Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:

> From: Niklas Cassel <cassel@kernel.org>
> 
> Enable mdev so that coldplug will automatically load kernel modules that
> were unavailable before rootfs was mounted.
> 
> mdev will also enable hotplug so that kernel modules will be automatically
> loaded when a new device is inserted in e.g. USB or PCIe after boot.
> 
> Before this change:
> $ lsmod | wc -l
> 0
> 
> After this change:
> $ lsmod | wc -l
> 43
> 
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>  configs/rock5b_defconfig | 1 +
>  1 file changed, 1 insertion(+)

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
