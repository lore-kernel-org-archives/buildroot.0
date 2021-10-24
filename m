Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A144AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 12:59:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 139B560F46
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 12:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 139B560F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF4EF6081E;
	Sun, 24 Oct 2021 12:59:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DorKddkTt8rL; Sun, 24 Oct 2021 12:59:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 435B96081B;
	Sun, 24 Oct 2021 12:59:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C7F8B1BF2A2
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 12:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C544180D41
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 12:59:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8cb2qJEVM74h for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 12:59:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B700580D3E
 for <buildroot@busybox.net>; Sun, 24 Oct 2021 12:59:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id DE385240006;
 Sun, 24 Oct 2021 12:59:43 +0000 (UTC)
Date: Sun, 24 Oct 2021 14:59:42 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20211024145942.12b18d03@windsurf>
In-Reply-To: <20211023071201.1016688-2-francois.perrad@gadz.org>
References: <20211023071201.1016688-1-francois.perrad@gadz.org>
 <20211023071201.1016688-2-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/4] configs/stm32mp157*_dk*: dk2 is a
 superset of dk1
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 23 Oct 2021 09:11:59 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> the daughter board (DK2) contains a 4" LCD with backlight and touchscreen.

The DK2 is not a daughter board. The DK1 and DK2 are two separate
boards. Even though they share a lot of common aspects, the DK2 is not
a daughter board.

For example, the DK2 has a WiFi/Bluetooth chip, which the DK1 doesn't
have, and this is not on a daughter board (and actually also not
properly handled by your fragment, which only cares about the display
and not WiFi/BT).

Overall, I am not sure if this commit is a real improvement. I agree
that the two Linux kernel configuration files have a lot in common, but
switching to using a fragment makes it much harder to update the kernel
configuration file.

So I'm not fully against it, but I'm not sure this commit really
improves anything.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
