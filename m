Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B715BC10F1A
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 07:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA4EE406D4;
	Tue,  7 May 2024 07:50:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PIJu6ZP-_iRl; Tue,  7 May 2024 07:50:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A723406AF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A723406AF;
	Tue,  7 May 2024 07:50:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F1C41BF32C
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 07:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 582BE606AA
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 07:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h8Is4qCaIG6a for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 07:50:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B6A246066F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6A246066F
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6A246066F
 for <buildroot@buildroot.org>; Tue,  7 May 2024 07:50:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E35D01C0010;
 Tue,  7 May 2024 07:50:50 +0000 (UTC)
Date: Tue, 7 May 2024 09:50:50 +0200
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Message-ID: <20240507095050.0db0e77c@windsurf>
In-Reply-To: <20240419061241.116608-1-eagle.alexander923@gmail.com>
References: <20240419061241.116608-1-eagle.alexander923@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715068251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4h40kqrwAn/HYdI2luJAZCcryRpNrwmaU6uBz8WbuuQ=;
 b=AF45MEWg1Ek2rjLH27qiN8i7bm0wMvfxUxXCcCjZ5DNDLKQ206M/9IP5qubk9YiaeXeBJB
 1ogApHTlOtDGOY03EuFSKe92908hsMUqAabIMl9vVYvv5o+mJA00Z9BAUy8YEqN0Sw5863
 QnVx2BhRYiPL68DyyjMQtyJk4VgK4wAa/5gS1F1rriJj7gs99w2AUSTNNdvPp4Hk6YiFxE
 GEBr1mh456oxyFR6vhGc/2Jx6s4SjygeQxwmGE/MxKsKYH/k4vwljFuz+SGgswVkZBnfZI
 80Fl0FJJie9IbUE85DoIdvAzXtazkQcc9C5Pcb+mF5z+Affc1Qlo0fLATP1yeA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AF45MEWg
Subject: Re: [Buildroot] [PATCH] libusbgx: Update package from git
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

Hello Alexander,

On Fri, 19 Apr 2024 09:12:41 +0300
Alexander Shiyan <eagle.alexander923@gmail.com> wrote:

> The current version is more than 6 years old. Update to the latest git
> version.
> The current version contains many fixes and improvements and supports
> several new types of USB gadgets.
> 
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>

Thanks for your patch. I have applied it, but after fixing a number of
small things.

First, the commit title should have been:

	package/libusbgx: bump to recent git version

i.e, "package/libusbgx" as prefix, no capital letter when starting the
title.

>  .../0001-Add-include-of-sys-sysmacro.h.patch  | 98 -------------------

The removal of this patch should have been explained in the commit log,
and also the .checkpackageignore file in Buildroot should have been
updated with the removal of this patch.

> -LIBUSBGX_VERSION = 0.2.0
> -LIBUSBGX_SITE = $(call github,libusbgx,libusbgx,libusbgx-v$(LIBUSBGX_VERSION))
> +LIBUSBGX_VERSION = a5bfa81017a9b2064bc449cf74f5f9d106445f62
> +LIBUSBGX_SITE = https://github.com/linux-usb-gadgets/libusbgx.git

The change from https://github.com/libusbgx ->
https://github.com/linux-usb-gadgets should have been explained in the
commit log, and the Config.in file should have been updated as well.

Also, there was not really any reason to switch to the git SITE_METHOD:
you can use $(call github,...) also with an arbitrary commit like this.

As said above: I fixed all those minor details when applying, and
pushed to master. Thanks a lot for your contribution!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
