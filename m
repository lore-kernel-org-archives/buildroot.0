Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44A7C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 13:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70550400B6;
	Fri, 12 Jul 2024 13:28:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FfuHGXzqhBKt; Fri, 12 Jul 2024 13:28:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B9E240305
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B9E240305;
	Fri, 12 Jul 2024 13:28:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B3241BF57C
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88CE68462F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:28:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xXzBEXUugxur for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 13:28:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6935F8462C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6935F8462C
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6935F8462C
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:28:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4316C0003;
 Fri, 12 Jul 2024 13:28:11 +0000 (UTC)
Date: Fri, 12 Jul 2024 15:28:10 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240712152810.4a4f12f3@windsurf>
In-Reply-To: <20240228202414.719244-2-buildroot@bubu1.eu>
References: <20240228202414.719244-1-buildroot@bubu1.eu>
 <20240228202414.719244-2-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720790891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9fLJZga+CnU7FuDi9tnVk0QObl8zizHjC97FkD1s79o=;
 b=hnnGYYnDOiXcJDKpx/B2242hZFuM4rckyPkmko60tmW68VpC3wPj5FQCxPxYi8DBWq0M38
 xDymjIKahar+VcdTsKCbv9JImCzypNFanxVechXAEIyp7wQsTlrn5uDauApybCwyARrz0X
 OqIpq5qkI31/cjjG8NUazyqnjeF8JfjvzsLgsAP/VRKRFYcpMKQILTJw+oTd7DyKRNnYer
 1IOywxM9kbcj0+MuoDfSNbmlsDBokbZhzBnOxxu6KO764TcHKpJjEV8OvfReekWQlapsA0
 OiwiG9Eay3wh1snAkzPsIdTa36ZuxJ3ICDwA0CYOKt91aWy2qO7No5Qm3vXdOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hnnGYYnD
Subject: Re: [Buildroot] [PATCH v2 2/2] package/picotool: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>, Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Marcus,

On Wed, 28 Feb 2024 21:24:13 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> +config BR2_PACKAGE_PICOTOOL
> +	bool "picotool"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_HOST_GCC_AT_LEAST_4_9 # libusb
> +	select BR2_PACKAGE_LIBUSB
> +	select BR2_PACKAGE_PICO_SDK
> +	help
> +	  picotool is a tool for inspecting rp2040 binaries and
> +	  interacting with rp2040 devices when they are in bootsel
> +	  mode or devices USBstdio support from the Raspberry Pi Pico
> +	  SDK.
> +
> +	  https://github.com/raspberrypi/picotool

Could you give some details on the use case for having picotool on your
target? In which context is your RP2040 connected to your target
system generated by Buildroot?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
