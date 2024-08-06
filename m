Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA16C52D70
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 21:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73F996086D;
	Tue,  6 Aug 2024 21:14:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5TufrrCnO0_q; Tue,  6 Aug 2024 21:14:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7513260847
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7513260847;
	Tue,  6 Aug 2024 21:14:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 65A311BF30B
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 21:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53AFF6084D
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 21:14:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NIJHUJd630WH for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 21:14:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BE46B60792
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE46B60792
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BE46B60792
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 21:14:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8FCB60002;
 Tue,  6 Aug 2024 21:13:57 +0000 (UTC)
Date: Tue, 6 Aug 2024 23:13:56 +0200
To: Taras Zaporozhets <zaporozhets.taras@gmail.com>
Message-ID: <20240806231356.184b6ecd@windsurf>
In-Reply-To: <20240311215903.10569-1-zaporozhets.taras@gmail.com>
References: <20240311215903.10569-1-zaporozhets.taras@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722978837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VjesvmnZFL+H3wCpD6htwHy0eEr3LtwulyxKUOZveXY=;
 b=RTy+/J3ox4i2wqwsFfr/a6rYctjTT2qHkPuXRxDH8PSDelsfU/zPDcfNA4o9DqPiCsgKsU
 LWUymneMEy2Ljf//H3b3vrZfCi7cmaAX8jOxtIzMZkuQHYdJyOplMTt0A1SorCGcn5VIUL
 0TYMOc8z1r6T2V7dT07cw6paXXj4vSkfNo+9lc5v1JWNfxHXl2mz/QGJ01bZMw4Vzjl8QW
 mXRYbX6TQBXnzkC/DFESeL3sHUzBUkQZ00vE2/Yv6w/ldWIheJDizRLDW3eHZBlSrpe6Dj
 +JnsrzYHW0JmoeU+LlPxjbaE6hxJm1gIjxHFymrJay1Yww455OrQM+Z+1xiFfQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RTy+/J3o
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot: allow to use custom
 ps7_init files for zynq7000 SoC
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Taras,

On Mon, 11 Mar 2024 22:59:03 +0100
Taras Zaporozhets <zaporozhets.taras@gmail.com> wrote:

> Similar to zynqmp, add an option to pass init files from the outside.
> 
> Signed-off-by: Taras Zaporozhets <zaporozhets.taras@gmail.com>

Thanks for your patch, and sorry for the long delay in getting back to
you.

> +ifeq ($(BR2_TARGET_UBOOT_ZYNQ),y)
> +
> +UBOOT_ZYNQ_PS7_INIT = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQ_PS7_INIT_FILE))
> +UBOOT_ZYNQ_PS7_INIT_PATH = $(shell readlink -f $(UBOOT_ZYNQ_PS7_INIT))
> +
> +ifneq ($(UBOOT_ZYNQ_PS7_INIT),)
> +define UBOOT_ZYNQ_KCONFIG_PS7_INIT
> +	$(call KCONFIG_SET_OPT,CONFIG_XILINX_PS_INIT_FILE,"$(UBOOT_ZYNQ_PS7_INIT_PATH)")
> +endef
> +endif
> +
> +endif # BR2_TARGET_UBOOT_ZYNQ

However, I believe this patch is not really necessary. Unless I'm
missing something, it is just defining a particular option of the
U-Boot configuration, and we're not going to add a Buildroot option for
each and every U-Boot option. Instead, you can define this option
directly in the U-Boot configuration. If you have an existing U-Boot
configuration and don't want to touch it, you can use a "configuration
fragment" referenced by BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES to
override just this particular option.

Let me know if that would work for you?

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
