Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53950C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 13:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D612402D2;
	Sun,  9 Jan 2022 13:28:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U-6jz94O5MID; Sun,  9 Jan 2022 13:27:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53BDA402BF;
	Sun,  9 Jan 2022 13:27:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F95A1BF4D7
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 13:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B63181947
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 13:27:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qitrpzBbg2I1 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 13:27:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F400280F5D
 for <buildroot@busybox.net>; Sun,  9 Jan 2022 13:27:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 1DCE4C0002;
 Sun,  9 Jan 2022 13:27:50 +0000 (UTC)
Date: Sun, 9 Jan 2022 14:27:48 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220109142748.4f7c1a59@windsurf>
In-Reply-To: <20201221203952.22168-3-ps.report@gmx.net>
References: <20201221203952.22168-1-ps.report@gmx.net>
 <20201221203952.22168-3-ps.report@gmx.net>
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

On Mon, 21 Dec 2020 21:39:51 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - add optional host-freetype dependency
> 
> Fixes:
> 
>   Command: .../host/bin/python2 .../build/qt5webengine-5.15.2/src/3rdparty/chromium/build/config/linux/pkg-config.py -p .../build/qt5webengine-5.15.2/host-bin/host-pkg-config freetype2
>   Returned 1.
>   stderr:
> 
>   Package freetype2 was not found in the pkg-config search path.
>   Perhaps you should add the directory containing `freetype2.pc'
>   to the PKG_CONFIG_PATH environment variable
>   Package 'freetype2', required by 'virtual:world', not found
>   Could not run pkg-config.
> 
>   See //build/linux/BUILD.gn:24:3: whence it was called.
>     pkg_config("freetype_from_pkgconfig") {
>     ^--------------------------------------
>   See //build/config/freetype/BUILD.gn:10:24: which caused the file to be included.
>       public_configs = [ "//build/linux:freetype_from_pkgconfig" ]
>                          ^--------------------------------------
>   Project ERROR: GN run error!
>   make[4]: *** [Makefile:82: sub-gn_run-pro-make_first] Error 3
>   make[3]: *** [Makefile:79: sub-core-make_first] Error 2
>   make[2]: *** [Makefile:49: sub-src-make_first] Error 2

I am falling into this issue while building the following defconfig:

BR2_arm=y
BR2_arm1176jzf_s=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5WEBENGINE=y
BR2_PACKAGE_RPI_USERLAND=y

Did you had the chance to investigate more deeply why having fontconfig
support in Qt leads qt5webengine wanting to find freetype2 on the host?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
