Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF7BC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 20:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EE3280B2A;
	Tue, 23 Jul 2024 20:28:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yHfPSBS7QtRN; Tue, 23 Jul 2024 20:28:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DF1280B65
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DF1280B65;
	Tue, 23 Jul 2024 20:28:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A881F1BF27E
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 20:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A28EF80B65
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 20:28:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u2T57QmkD1LS for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 20:28:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8362C80B2A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8362C80B2A
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8362C80B2A
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 20:28:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C008040005;
 Tue, 23 Jul 2024 20:28:30 +0000 (UTC)
Date: Tue, 23 Jul 2024 22:28:29 +0200
To: Etienne Carriere <etienne.carriere@foss.st.com>
Message-ID: <20240723222829.1526e8c3@windsurf>
In-Reply-To: <20240723163025.2733492-1-etienne.carriere@foss.st.com>
References: <20240723163025.2733492-1-etienne.carriere@foss.st.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721766511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iDztmM8lLcHDwMDbfcLJ7sFf/AQdsp4rwNBVEcpszH4=;
 b=k6w63Vfv4mdVGDur9qyMDtM7Xoouqi4j5Fc7fqhJvyJY0PM01lFWyzC2KGJXezRFZMRlbI
 8C1AMeatwL+mhGViKXtt2lJIGfLg58DAJRJ5qyjUc0P8Z73LXj8LtBBg3BGuYB1HHsv/oc
 LgCrnRCr9yXn9SmjsYJCcQDppYUUaarIYNQ+e9BI+x0gLz53Fo/AJHP6ZVEQIOkJD5G4dX
 3QjY/aIjskm1ujiF0DPWpX/2KKQnYzH7FKew0KcfC+I+gPNMIRiNip8EaFECB0hgyMkrR2
 bKcBRzTgMl08xmGFCzAO4Yite77DhNuG2qIyyqoiTQVrzWVvN2BpGtMcw3D1EQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=k6w63Vfv
Subject: Re: [Buildroot] [PATCH v2 1/2] configs/qemu_arm_vexpress_tz: bump
 tf-a and u-boot versions
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 23 Jul 2024 18:30:24 +0200
Etienne Carriere <etienne.carriere@foss.st.com> wrote:

> Bump TF-A to version v2.10 and U-Boot to version v2024.07 for
> Qemu arm-vexpress/trustzone board config.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
> ---
>  configs/qemu_arm_vexpress_tz_defconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks for the patch. However, are you sure you tested it? Indeed this
defconfig has BR2_DOWNLOAD_FORCE_CHECK_HASHES=y, which means all hashes
are checked. So when you bump components, it cannot be done without
updating hashes in board/qemu/patches/. Please note that those hash
files are shared by all qemu defconfigs. Could you check this?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
