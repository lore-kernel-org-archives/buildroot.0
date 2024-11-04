Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C46AD1CA03
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 22:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89B8380AFA;
	Mon,  4 Nov 2024 22:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qF5m9XsO5y4v; Mon,  4 Nov 2024 22:14:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DB0B804F1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DB0B804F1;
	Mon,  4 Nov 2024 22:14:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F28F9723
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 22:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E051F80D40
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 22:14:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MmvrTGSSNBhS for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 22:14:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B49FD80D4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B49FD80D4B
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B49FD80D4B
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 22:14:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D55420002;
 Mon,  4 Nov 2024 22:14:25 +0000 (UTC)
Date: Mon, 4 Nov 2024 23:14:24 +0100
To: Roberto Medina <robertoxmed@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20241104231424.4c39ed7d@windsurf>
In-Reply-To: <20241025093248.2015508-2-robertoxmed@gmail.com>
References: <20241025093248.2015508-1-robertoxmed@gmail.com>
 <20241025093248.2015508-2-robertoxmed@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730758465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Z1m6DpwI0kspZ2BXEXRkyVPs1GX2bzxFRnJT2JPiWY=;
 b=U6yxrzB10Jv90tuRoEnL+YCYJKt/0wn7jjhz496n0BGv3Au0qUZnoLXxkXFNbGdheW9itQ
 UgwadxES3BLXXalMlmaLTHacLc5ST2yPPaagnICVZSzmkysLrChYv5/6XedDF/+07DcbS+
 BSnQIImkIpjsgxFDcqo+zYWf77JYrcVZ9AtcQ1nZ2c9+UR+N3e198oSud5ZKfYvOivYrqc
 IzVxIJNL5zszzYHzilW/VDmvIBAlAWPur/IDFUwt28IM/ONmOqM+PiwapZxldnCsJLrrtm
 by4VKXdccQsQWgDilcY2PfgFSkZgeYQexlMCgAUFhZZxe935sGGopn5MnLO6MQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=U6yxrzB1
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/roc_pc_rk3399: Bump Linux,
 U-Boot, TF-A
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

Hello Roberto,

On Fri, 25 Oct 2024 10:32:48 +0100
Roberto Medina <robertoxmed@gmail.com> wrote:

> - Bump Linux to 6.6.56 (LTS).
> - Bump U-Boot to 2024.07, so it contains commit ebb0ad4eef0a ("arch: arm:
> mach-rockchip: Kconfig: Enable BOOTSTD_FULL for RK3399 and RK3588").
> - Bump TF-A to 2.11.
> - Enable hash checking: BR2_DOWNLOAD_FORCE_CHECK_HASHES.
> - Add relevant hashes in the patches folder for the board.
> - Use uClibc for toolchain instead of Glibc.

Thanks a lot for the new iteration, but why are you switching to
uclibc? We don't want our defconfigs to select particular toolchain
options: they should use the default provided by Buildroot.

Could you send a v3 without this change to uclibc, or provide an
explanation?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
