Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 836C3C433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 13:10:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2A04610FD
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 13:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2A04610FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7CA940181;
	Fri,  5 Nov 2021 13:10:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tdTUihmSefzL; Fri,  5 Nov 2021 13:10:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3A75401BA;
	Fri,  5 Nov 2021 13:10:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D7DB1BF304
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 13:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BAEF60763
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 13:10:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id buUW7AH62f_q for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 13:10:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1EE25605E4
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 13:10:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id D6087FF808;
 Fri,  5 Nov 2021 13:10:43 +0000 (UTC)
Date: Fri, 5 Nov 2021 14:10:42 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20211105141042.7ac80413@windsurf>
In-Reply-To: <20211105123848.6356-2-peter@korsgaard.com>
References: <20211105123848.6356-1-peter@korsgaard.com>
 <20211105123848.6356-2-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] configs/nezha_defconfig: new defconfig
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
Cc: samuel@sholland.org, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Howdy,

Thanks for this! It's obviously great, just a couple of nits, see below.

On Fri,  5 Nov 2021 13:38:47 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> diff --git a/board/nezha/post-build.sh b/board/nezha/post-build.sh
> new file mode 100755
> index 0000000000..9d38b13b84
> --- /dev/null
> +++ b/board/nezha/post-build.sh
> @@ -0,0 +1,6 @@
> +#!/bin/sh
> +BOARD_DIR=$(dirname $0)
> +
> +# Bring the extlinux.conf file in
> +install -D -m 0644 ${BOARD_DIR}/extlinux.conf \
> +	${TARGET_DIR}/boot/extlinux/extlinux.conf

Probably you don't even need a post-build script here, the
extlinux.conf could just be added to the rootfs using a rootfs overlay.


> new file mode 100644
> index 0000000000..f04404b9a4
> --- /dev/null
> +++ b/configs/nezha_defconfig
> @@ -0,0 +1,36 @@
> +BR2_riscv=y
> +BR2_GLOBAL_PATCH_DIR="board/nezha/patches"
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/nezha/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/nezha/genimage.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/smaeul/linux.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="012f5a3d01be6d44e32c74bb3637ec281790b297"

Here...


> +BR2_TARGET_OPENSBI=y
> +BR2_TARGET_OPENSBI_CUSTOM_GIT=y
> +BR2_TARGET_OPENSBI_CUSTOM_REPO_URL="https://github.com/smaeul/opensbi"
> +BR2_TARGET_OPENSBI_CUSTOM_REPO_VERSION="b9125c6f8909d1cc0417795737fc13cb6297ff11"

Here...

> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/smaeul/u-boot"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="62392d3b8a624a80646c1876533336f90140088d"

.. and here

We normally use the github macro to download a tarball instead of a
full Git repository.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
