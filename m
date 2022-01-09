Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7469C4332F
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 13:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58E1B81A73;
	Sun,  9 Jan 2022 13:44:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RrPI3-ex8m0g; Sun,  9 Jan 2022 13:44:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA17981A92;
	Sun,  9 Jan 2022 13:44:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 341AF1BF4D7
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 13:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22ECE81A92
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 13:44:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uwLmWSUubzeo for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 13:44:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25B2581A73
 for <buildroot@busybox.net>; Sun,  9 Jan 2022 13:44:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id BE2AEC0002;
 Sun,  9 Jan 2022 13:44:31 +0000 (UTC)
Date: Sun, 9 Jan 2022 14:44:30 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220109144430.1064ea1c@windsurf>
In-Reply-To: <20220109142748.4f7c1a59@windsurf>
References: <20201221203952.22168-1-ps.report@gmx.net>
 <20201221203952.22168-3-ps.report@gmx.net>
 <20220109142748.4f7c1a59@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/qt5webengine: add optional
 host-freetype/host-libjpeg dependency
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
Cc: Arthur Courtel <arthur.courtel@smile.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 =?UTF-8?B?R2HDq2w=?= Portay <gael.portay@collabora.com>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@busybox.net,
 Martin Bark <martin@barkynet.com>,
 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 9 Jan 2022 14:27:48 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> I am falling into this issue while building the following defconfig:
> 
> BR2_arm=y
> BR2_arm1176jzf_s=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_PACKAGE_QT5=y
> BR2_PACKAGE_QT5WEBENGINE=y
> BR2_PACKAGE_RPI_USERLAND=y
> 
> Did you had the chance to investigate more deeply why having fontconfig
> support in Qt leads qt5webengine wanting to find freetype2 on the host?

Interestingly, in commit
https://github.com/meta-qt5/meta-qt5/commit/280487f20bca829527a597d6263b0344a01917ac#diff-f0ffde666f6ff0282f8400203b3ba20968494d3c7245106eca761bd79baa1c78R26
the meta-qt5 layer, when upgrading Qt to 5.15.2 added jpeg-native and
freetype-native as new unconditional dependencies.

But there are no explanations. Is it really because the Chromium stuff
is building a host tool with freetype/jpeg, or is it just a workaround
for some incorrect behavior of the Chromium build process that needs
freetype/jpeg on the target, but checks for them on the host?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
