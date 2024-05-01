Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C14C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 18:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7CEE402C9;
	Wed,  1 May 2024 18:11:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iBEoBwy5xqIL; Wed,  1 May 2024 18:11:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 461E94072B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 461E94072B;
	Wed,  1 May 2024 18:11:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7FC571BF429
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 18:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C2FD60BCE
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 18:11:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 70iIZOhkH5pU for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 18:11:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3C75060BCC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C75060BCC
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C75060BCC
 for <buildroot@buildroot.org>; Wed,  1 May 2024 18:11:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2C2E313F879;
 Wed,  1 May 2024 20:11:26 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 01 May 2024 20:11:25 +0200
Date: Wed, 1 May 2024 20:11:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Message-ID: <ZjKFzRNAsFI45dH7@landeda>
References: <20240501092328.323236-1-dm.chestnykh@gmail.com>
 <20240501092328.323236-2-dm.chestnykh@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240501092328.323236-2-dm.chestnykh@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714587088;
 bh=ztowqo1zrYdAi+H/u0NbMvGhK3+stYWfiFFEbV4ldyk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bUBt5/IB5wOD8Z5w3R98orXlu4STDZeae15KYNkHkK35vzo291W69zWK+djJixnFj
 N1qxgtifk+hsZ3+dcGxFKCDQMEjKndmcKwNUoilQ9uYKUcJVNX7ywE6fmUID+m7e18
 h31iOxfHfOOTQqaR6JUeD4OAHLmfWSoij/XFeWC62RgFzvHowNPfKCYt2Zdx3cVjav
 HEeFdRsQCPyfBy4IK2P1uDyRl6Ra2rsRFYXGQG2zBMuR8D+Y4B9PU1MoJeoAfnmlOB
 E7i7G4FjNb9rPbwAElH3dkVHfovsHhcFdg06oXGakrsFJ9YZY3xlkJypMnkHPpQ87+
 +k65hZQM82IIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=bUBt5/IB
Subject: Re: [Buildroot] [PATCH 2/3] configs/qemu_sparc_ss10_defconfig:
 Restore.
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dmitry, All,

On 2024-05-01 12:23 +0300, Dmitry Chestnykh spake thusly:
> With uClibc-ng-1.0.48 we can restore this config
> because now sparc systems work without reverting GCC commits.
> 
> Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
> ---
>  arch/Config.in                    |  5 -----
>  configs/qemu_sparc_ss10_defconfig | 28 ++++++++++++++++++++++++++++
>  2 files changed, 28 insertions(+), 5 deletions(-)
>  create mode 100644 configs/qemu_sparc_ss10_defconfig

This patch is doing two things:

 1. allow building an internal toolchain for sparc;
 2. (re)introduce a defconfig.

It should be two different patches, in the order above.

Regards,
Yann E. MORIN.

> diff --git a/arch/Config.in b/arch/Config.in
> index 9912f9fce6..e7349e83ae 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -216,11 +216,6 @@ config BR2_sh
>  config BR2_sparc
>  	bool "SPARC"
>  	select BR2_USE_MMU
> -	# uClibc-ng broken on sparc due to recent gcc changes
> -	# that need to be reverted since gcc 8.4, 9.3 and 10.1.
> -	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
> -	# gcc <= 10.x has been removed from Buildroot.
> -	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
>  	help
>  	  SPARC (from Scalable Processor Architecture) is a RISC
>  	  instruction set architecture (ISA) developed by Sun
> diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
> new file mode 100644
> index 0000000000..a8e3df9180
> --- /dev/null
> +++ b/configs/qemu_sparc_ss10_defconfig
> @@ -0,0 +1,28 @@
> +# Architecture
> +BR2_sparc=y
> +BR2_sparc_v8=y
> +
> +# System
> +BR2_SYSTEM_DHCP="eth0"
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_EXT2=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> +
> +# Image
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
> +
> +# Linux headers same as kernel
> +BR2_PACKAGE_HOST_LINUX_HEADERS_AS_KERNEL=y
> +
> +# Linux kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8.6"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux.config"
> +
> +# host-qemu for gitlab testing
> +BR2_PACKAGE_HOST_QEMU=y
> +BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
> -- 
> 2.44.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
