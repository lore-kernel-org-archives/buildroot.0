Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F154D44166
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 10:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9028960AB0;
	Fri, 12 Dec 2025 10:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6-cf6cXn7PJS; Fri, 12 Dec 2025 10:24:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D850560AA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765535056;
	bh=SYUVGDA5HzguenVp7F3gd1VlZZ+xjAcKTPyb1bVexXk=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=F3LWzdbk0w1zvMgiG2m5WOEBUlUExt2q6Q7ONcloR+jAfDwmPD/4q6NP1gTsyNjd1
	 RuchsZ0Cc4CGAvgNyvgGqp+t1vnQBEDlx8Y1jR4jHzkk6f7s/PF+zeaRSpCXDZhiQo
	 LGz18OfF++b56tYyOSnS4A3+/mI+rJAiPLLpzDB2CQJXWhjZZzAAE6mLfQhmUuz7s9
	 Z3s68O7J2iSbIGV+syIUpD/aY0stCNIdkihVG25wyepmOini6pGKTHrcIIeqGX7Q9G
	 r2nZRJEEesAvdH2SMrYIAQgzKv0f5DjJ3lBgs3kcAK5kfJNnPerR6WrX2OY5UrCttb
	 bh0qbC0FVReXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D850560AA0;
	Fri, 12 Dec 2025 10:24:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 20CCC2C6
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 10:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B2FB83626
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 10:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 86h1Z3MUS3JL for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 10:24:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 17CED835FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17CED835FB
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 17CED835FB
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 10:24:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 5154DC1935D;
 Fri, 12 Dec 2025 10:23:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 63EF1606DF;
 Fri, 12 Dec 2025 10:24:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 78AE1103C8E03; Fri, 12 Dec 2025 11:24:09 +0100 (CET)
Date: Fri, 12 Dec 2025 11:24:08 +0100
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <20251212112408.3e3b5b14@windsurf>
In-Reply-To: <20251212101533.820554-2-kory.maincent@bootlin.com>
References: <20251212101533.820554-1-kory.maincent@bootlin.com>
 <20251212101533.820554-2-kory.maincent@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765535050; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Co4P4c3oKaEuxcCAtq8WZujiPXFg4QaRw0akLVRLXsE=;
 b=D3nvif4CI1u4wKBBxnc3QeY7ewuUmIFuo84gGYxgNQ62BR8pgjg/OabX7SWgzJte1H0W/u
 yLsXd488UOY81+u70z50Uj13Wu6ENpTz+HmhUW5YFlDVg4/fuw6wNnv1SyML1RsS6l025l
 QSg73jDFCPHyFaBmZ+Xd/hU4Wbp5Q6NUXf1yLGUdyxFS6E1P1L3g4E/y5r2dS7YgjZqoEB
 OoynZ0lynI9UkepPdG7XOO7SV5jfgmSesmx6iAEBGhpY1xbUn78SqEUIyHL81qyR94l4YH
 hfS9lqEv1UsvySsdjcGS61NkvwzY1eLgAOOGMHD5Kh/dMVY1wcI5QhOFhxZfng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=D3nvif4C
Subject: Re: [Buildroot] [PATCH 1/3] configs/beaglebone: Bump to Linux
 mainline
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
Cc: Bajjuri Praneeth <praneeth@ti.com>, Bryan Brattlof <bb@ti.com>,
 Lothar Felten <lothar.felten@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 12 Dec 2025 10:15:28 +0000
Kory Maincent <kory.maincent@bootlin.com> wrote:

> diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
> index 86bf6bce9a..b27b97916e 100644
> --- a/configs/beaglebone_defconfig
> +++ b/configs/beaglebone_defconfig
> @@ -1,7 +1,6 @@
>  BR2_arm=y
>  BR2_cortex_a8=y
>  BR2_ARM_FPU_VFPV3=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y

This needs to be kept, but adjusted to the kernel version used.

>  BR2_GLOBAL_PATCH_DIR="board/beagleboard/beaglebone/patches"
>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> @@ -9,9 +8,8 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/beagleboard/beaglebone/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beaglebone/genimage.cfg"
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.12.34-ti-arm32-r12)/linux-6.12.34-ti-arm32-r12.tar.gz"
> -BR2_LINUX_KERNEL_DEFCONFIG="bb.org"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/ti/common/am335x/linux.config"

You can't do this: you need to specify a specific kernel version.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
