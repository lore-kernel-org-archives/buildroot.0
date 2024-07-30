Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37B1C3DA7F
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 20:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FD0440BB8;
	Tue, 30 Jul 2024 20:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4SQohL8m0qsF; Tue, 30 Jul 2024 20:38:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 332B140BAA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 332B140BAA;
	Tue, 30 Jul 2024 20:38:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4474F1BF423
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 20:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31CB340BA0
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 20:38:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wnIdjqNDxHOb for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 20:38:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BDFC240BAA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDFC240BAA
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BDFC240BAA
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 20:38:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 84C6540003;
 Tue, 30 Jul 2024 20:38:44 +0000 (UTC)
Date: Tue, 30 Jul 2024 22:38:43 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240730223843.628b0192@windsurf>
In-Reply-To: <20240730221630.7595f673@windsurf>
References: <20240728115817.743185-1-dm.chestnykh@gmail.com>
 <20240728180047.38c594f2@windsurf>
 <CA+RUeSqWVBsZYMV1S_2eDnLbEJY6E7o4aqDQjd9j=puoSs0cfQ@mail.gmail.com>
 <20240728221140.01aa7ed1@windsurf>
 <Zqcf31ivOCwqs+01@waldemar-brodkorb.de>
 <20240730221630.7595f673@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722371924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l2Z86N9pHJ3VWAaBxRkWzhOM8ao/IOFYK+hqFUifdlE=;
 b=kpe68vQKbNUwRxIjjkqAkpT/nCKC3d976nYo5jTqa4lWCwe1SUWpsIH/wHp1BS4hSZZzLV
 ju1P91SPmNCjvFjapTTgbEgkkexvGbhBQB/s99JQpgC/Gvgg9ZHGJxKtuat7bG5o8QmD5j
 QP4+s4v86iqk/cvBqauYm2vcE6//hQ6YbDcbGwkrPe8ahnGGET8WKFZLm81v/qNPcRAUk0
 igAqcIzaUFOjTQEOJ8Db/TyWPg4CNDIL41o9OlLSyV6voXIaBFrykVocbXiE8BFPsXLuBr
 1NaKSl94wrRkMJQn+ZJ/bWjvBOo8ylc4X3wXXIBWxIS3IZFtkTqcezb8NUgC6A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kpe68vQK
Subject: Re: [Buildroot] [PATCH] SuperH qemu issues
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
Cc: buildroot@buildroot.org, Dmitriy Chestnykh <dm.chestnykh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Waldemar,

On Tue, 30 Jul 2024 22:16:30 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> So I am right building the concatenation of this +
> qemu_sh4_r2d_defconfig to see what is the result.

I can confirm that:

BR2_sh=y
BR2_KERNEL_HEADERS_4_19=y
BR2_PACKAGE_GLIBC_KERNEL_COMPAT=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_TOOLCHAIN_BUILDROOT_FORTRAN=y
BR2_GCC_ENABLE_OPENMP=y
BR2_PACKAGE_HOST_GDB=y
BR2_PACKAGE_HOST_GDB_TUI=y
BR2_PACKAGE_HOST_GDB_PYTHON3=y
BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
BR2_SYSTEM_DHCP="eth0"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux.config"
BR2_LINUX_KERNEL_ZIMAGE=y
BR2_PACKAGE_GDB=y
BR2_TARGET_ROOTFS_INITRAMFS=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_HOST_QEMU=y
BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y

generates a system that doesn't boot:

$ ./host/bin/qemu-system-sh4 -M r2d -kernel images/zImage -append "console=ttySC1,115200 noiotrap" -serial null -serial stdio -net nic,model=rtl8139 -net user
VNC server running on 127.0.0.1:5900

and then nothing.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
