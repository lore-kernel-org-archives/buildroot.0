Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B01C25B4F
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 14:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28B6C40234;
	Thu,  9 May 2024 14:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a6XUUJJWcyay; Thu,  9 May 2024 14:33:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8E0F401C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8E0F401C1;
	Thu,  9 May 2024 14:33:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D25A21BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDE4581358
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:33:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4-y29n3RHjsQ for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 14:33:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B13DA81335
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B13DA81335
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B13DA81335
 for <buildroot@buildroot.org>; Thu,  9 May 2024 14:33:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA00A1C0005;
 Thu,  9 May 2024 14:33:46 +0000 (UTC)
Date: Thu, 9 May 2024 16:33:45 +0200
To: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Message-ID: <20240509163345.4b91eca5@windsurf>
In-Reply-To: <20240416192736.90072-1-dm.chestnykh@gmail.com>
References: <20240416192736.90072-1-dm.chestnykh@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715265227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1YQofJXJgG6ZGet/7knzFq0wQQrUU3TXaBRAfJ40G54=;
 b=Uo+z1aY4AHTWSFm/GJngqh1Din45RqUAw8gAbg5PSTQRXVq+a9rOUP8L03ZQrmnPXLxZ1E
 sUmCtrmCRZLikCJ6oIwNefP0OGp4LL6TM9biedx/3oLdl9wBIfPfG0H8lKP0DAb50z07WM
 C6DFPkBNGCK0+yQ62Rx/0HxW59xteqMd4uDzLZOJNrFDQq6eaKuw1o/h18XGVVxWk/moyh
 XUY0ajg5cmDH2jOb9LZm0lOHun0Gz0Ugfkzmp+8xGyX6D36biyP8jK/KjfdDSKu9yVLEh/
 L6giMykxtgaupmo0xr8TtgE2faFMf75/k8+GVxhC4bfwtDIRti8fGF3/WS4Slw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Uo+z1aY4
Subject: Re: [Buildroot] [PATCH] package/busybox: Fallback to -g2 in if -g3
 is enabled.
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
Cc: yann.morin.1998@free.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dmitry,

On Tue, 16 Apr 2024 22:27:36 +0300
Dmitry Chestnykh <dm.chestnykh@gmail.com> wrote:

> Linker process hangs if busybox was built with -g3,
> so fallback to -g2 in this case.
> The issue can be reproduced for example with
> qemu_aarch64_virt_defconfig by selecting BR2_DEBUG_3.
> 
> Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>

Thanks for your patch. However, this is more of a workaround than a
real fix, indeed the linker shouldn't hang at -g3.

Does this happen on all architectures? Does it happen regardless of the
compiler optimization level selected? Did you report the bug to
upstream binutils?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
