Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B78CD74945
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 22:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2C5440143;
	Tue, 29 Oct 2024 22:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5so96Xx7wWxJ; Tue, 29 Oct 2024 22:21:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85E7C4014B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85E7C4014B;
	Tue, 29 Oct 2024 22:21:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C0D854EC0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 22:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99823606F6
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 22:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ohSLzF4XZl_A for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 22:21:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 85350600C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85350600C9
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85350600C9
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 22:21:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D9E2760005;
 Tue, 29 Oct 2024 22:21:19 +0000 (UTC)
Date: Tue, 29 Oct 2024 23:21:18 +0100
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20241029232118.7d67f24a@windsurf>
In-Reply-To: <f068d8afdff3043860dcd894bc5076c1b3817ea5.1727425450.git.baruch@tkos.co.il>
References: <f068d8afdff3043860dcd894bc5076c1b3817ea5.1727425450.git.baruch@tkos.co.il>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730240481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bbMGmJq4ftteZmJLXBuNrux5kTYPAYduCNhmtRKVlyc=;
 b=FUxDAyhSjG8exlBlYwUaMOZiB3LlSxcn6TJ7WOnh5X3AQc4BO+KJAhlUQWQZDVPpX+SjIX
 oM03UixlOMOIXXawzohoWKi9HC1/vHhqUH/4tZWEvqbbUZ3JxZrFjSJMX+FXdPSLSOmo2h
 i581P+A1fDFopdtCUedVJ0cI+PDimvFZSB/7d6jszxUA3GieDYVxVY33gYk6vlnG4C7yNc
 UaxuyWz09DIU3+fuT9zNUbfI39H1U1YQeIeSmfbxDVPpxAmDQpVLViu1/2DaXGHlwZg7Dt
 gqQCa56W+OmJdGzeH16BPffH9SnTQ68ZDeys0XBJS+Ew9Y30DnrDZGIaNvdVeA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FUxDAyhS
Subject: Re: [Buildroot] [PATCH] package/ebtables: remove
 KERNEL_64_USERSPACE_32 workaround
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 27 Sep 2024 11:24:10 +0300
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> This workaround breaks build with gcc 14.
> 
> Upstream developers acknowledged[1] the 32/64 compatibility issue more
> than 3 years ago, but no proper fix has been applied. Specifically, for
> aarch64 we don't even enable BR2_KERNEL_64_USERLAND_32, so this
> workaround is not effective there.
> 
> The least we can do is make ebtables depend on
> !BR2_KERNEL_64_USERLAND_32.
> 
> [1] https://lore.kernel.org/all/20210518181730.13436-1-patrickdepinguin@gmail.com/
> 
> Fixes:
> http://autobuild.buildroot.net/results/680674c2b61209b505efa022a8fd9751ddc5fd47/
> http://autobuild.buildroot.net/results/60f8f5f087111ec3f300dc7979363de5a9f64f08/
> 
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .checkpackageignore                           |   2 -
>  ...estore-KERNEL_64_USERSPACE_32-checks.patch | 105 ------------------
>  ...-option-enable-kernel-64-userland-32.patch |  51 ---------
>  package/ebtables/Config.in                    |   2 +
>  package/ebtables/ebtables.mk                  |   6 -
>  5 files changed, 2 insertions(+), 164 deletions(-)
>  delete mode 100644 package/ebtables/0002-ebtables.h-restore-KERNEL_64_USERSPACE_32-checks.patch
>  delete mode 100644 package/ebtables/0003-configure.ac-add-option-enable-kernel-64-userland-32.patch

Applied to master, after propagating the dependency to
BR2_PACKAGE_LIBVIRT_DAEMON, which selects ebtables.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
