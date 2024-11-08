Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F488D5C0EF
	for <buildroot@archiver.kernel.org>; Fri,  8 Nov 2024 15:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D83798454A;
	Fri,  8 Nov 2024 15:36:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4-NBlRCMfnpz; Fri,  8 Nov 2024 15:36:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D584A84551
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D584A84551;
	Fri,  8 Nov 2024 15:36:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 54CB9C2
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 15:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3224642B8C
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 15:36:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X0Jn30R9OuTn for <buildroot@buildroot.org>;
 Fri,  8 Nov 2024 15:36:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9A3FC42B8D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A3FC42B8D
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A3FC42B8D
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 15:36:13 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::225])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 09630C175F
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 15:30:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8AC2B1C0005;
 Fri,  8 Nov 2024 15:30:04 +0000 (UTC)
Mime-Version: 1.0
Date: Fri, 08 Nov 2024 16:30:04 +0100
Message-Id: <D5GWKRKJILLR.3K3I9KOYZJ212@bootlin.com>
To: "Thomas Bonnefille" <thomas.bonnefille@bootlin.com>,
 <buildroot@buildroot.org>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, "Alistair
 Francis" <alistair@alistair23.me>, "Drew Fustini" <drew@beagleboard.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241106-extract-fw_fdt_path-v1-1-0983c183f71e@bootlin.com>
In-Reply-To: <20241106-extract-fw_fdt_path-v1-1-0983c183f71e@bootlin.com>
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1731079804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y7epWpXldye15P0MxtLx1hA7FjE5rd+ZPIFExOfpBgI=;
 b=F4OO2OYJo35XxRGTdZGrESG1zwqRt5Mlq1DneA5mzG6AMTqEVLGjIA9W9AzwtlaeTO7arq
 sINuvOn5vbZXfvyg2FfuktOOnCUVyvfpQ5erJAgXxQ2gM/kk/c6pjdgtZQzi9TxxFCQr3Y
 piQzUo3+S+lYSDbgmizxjnoXaJ0+gJhBNyTlWUlIuN7Mzb7mV+X0k4EMXZ8bni10V5h8Iv
 Ah9ijfnJqVWvJlWsIuT9DG+CZYbxrYRhe1W3hMScyIXd5IO6jq6Ddlwt0MQS64rXBl+2l0
 3cWWuCx+pGHKOdLV9WKOQojYoiHvD47I/kMBwgktglArr8+lef5Qf5nRzGDz+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F4OO2OYJ
Subject: Re: [Buildroot] [PATCH] boot/opensbi: remove dependency on
 fw_payload to pass FW_FDT_PATH
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
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,
I just noticed that there were something lacking in this patch:

On Wed Nov 6, 2024 at 3:27 PM CET, Thomas Bonnefille wrote:
> Currently, Buildroot requires the installation of fw_payload.bin to pass
> FW_FDT_PATH as a compile-time parameter.
>
> According to OpenSBI documentation[1], all firmware types can have an
> embedded flattened device tree.
>
> This commit removes the dependency on fw_payload.bin, allowing users to
> include the U-Boot flattened device tree using FW_FDT_PATH without
> installing fw_payload.
>
> [1] https://github.com/riscv-software-src/opensbi/blob/master/docs/firmware/fw.md
>
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
...
> --- a/boot/opensbi/opensbi.mk
> +++ b/boot/opensbi/opensbi.mk
> @@ -47,10 +47,11 @@ endif
>  ifeq ($(BR2_TARGET_OPENSBI_UBOOT_PAYLOAD),y)
>  OPENSBI_DEPENDENCIES += uboot
>  OPENSBI_MAKE_ENV += FW_PAYLOAD_PATH="$(BINARIES_DIR)/u-boot.bin"
> +endif
> +
>  ifeq ($(BR2_TARGET_OPENSBI_FW_FDT_PATH),y)

As Buildroot is using u-boot.dtb as the only way of passing the fdt to
OpenSBI. There is this line missing here :
   OPENSBI_DEPENDENCIES += uboot
Without it, OpenSBI can be built before U-Boot and so u-boot.dtb will
not exist yet.

>  OPENSBI_MAKE_ENV += FW_FDT_PATH="$(BINARIES_DIR)/u-boot.dtb"
>  endif

I'll soon send a second version of this patch.
Sorry for the inconvenience,

Regards,
Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
