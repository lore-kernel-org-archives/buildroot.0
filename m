Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FB4C25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56BE382303;
	Mon,  6 May 2024 20:11:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T32Fj_x2V9rl; Mon,  6 May 2024 20:11:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CFC482313
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CFC482313;
	Mon,  6 May 2024 20:11:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4BAC41BF3E8
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3895D4058E
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:11:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pSDnRToapiWA for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:11:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3C9D740108
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C9D740108
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C9D740108
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:11:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC2AA1C0003;
 Mon,  6 May 2024 20:11:40 +0000 (UTC)
Date: Mon, 6 May 2024 22:11:39 +0200
To: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Message-ID: <20240506221139.3fe56f1c@windsurf>
In-Reply-To: <20240430-optee-update-v2-9-5bdc2f940db1@ti.com>
References: <20240430-optee-update-v2-0-5bdc2f940db1@ti.com>
 <20240430-optee-update-v2-9-5bdc2f940db1@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715026301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OUmjprQL4ZjW/eIu+adK2mW5nSIoxaMpVMLxRfypnEU=;
 b=bdNZ7EtVr+KwvXoJreLdUVDADIe5IrdaRxKvZtRV0FXAPg0lWWN4QQZEH3ueKX3a2w/bQJ
 YsI6GMKdQPCnwcbfku3px22VxDlhlqeNc/PqIyaG2UYOLiZTdeBTohC1pQvifQOVi42vcS
 vThzrjajfxlMZ1f52LDHxqf4eQ/onbt9e8u6SBHYsYrjSB7m5ndTo0PpNziUKaaPBJOGxB
 24dxT11JWyt9jxpB4GJR3xH796v7ROENu+LT8JiegwTjZhu52t2Uo5FYXEPsCgEgcw3bip
 Q1TcS1rMwZsZfWCPfp55dX0i2RWWe1fmpACqKRtuSTuQnpZAYc7kb7jLVyoDhQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bdNZ7EtV
Subject: Re: [Buildroot] [PATCH RESEND v2 09/11]
 configs/ti_am62x_sk_defconfig: bump kernel to v6.8.8
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Romain Naour <romain.naour@smile.fr>,
 Bryan Brattlof <bb@ti.com>, Etienne Carriere <etienne.carriere@foss.st.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 2 May 2024 11:26:59 -0500
Bryan Brattlof via buildroot <buildroot@buildroot.org> wrote:

> diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
> index fbceca791161e..070eaa42bfa7e 100644
> --- a/configs/ti_am62x_sk_defconfig
> +++ b/configs/ti_am62x_sk_defconfig
> @@ -1,5 +1,4 @@
>  BR2_aarch64=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y

This should have stayed there, but become:

BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8=y

and ditto for the am64x_sk patch, of course.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
