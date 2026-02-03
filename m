Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBAAE8306D
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 09:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE966811BB;
	Tue,  3 Feb 2026 09:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GGWQZNZ0k-Vq; Tue,  3 Feb 2026 09:18:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C2E881249
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770110303;
	bh=OEfKIfxdVMI3UTZSJPoi8s7XCHZpFaSVxNlpB50tnPs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XxHauHYYeUSWEr92McVsyG2RJ9ZoNQILuGZpsWAYx7Pb3QLwPDBltwMIWvEAVo5I6
	 pioyBzZcVM2hy5z0++yi6PxmxxB8sPZY8hYobbF+2nkhugCP3AQKQuYap/j52wLngE
	 D6FurOlEZefHaKqI4nlZ71VaJDJJVGBfMLNK2MXrfBV//ujx4zHRQxq0GMJHx3w90g
	 0vQNqs809uSv9X3mVlrtwz9ZVERWz9eiI7+f12w0qiDOHm/ebNJoNIAtHtYqB7NNZV
	 GfUe+f4leGeSTLn78kvkM32+jUsmtlgH/BDSt1OUoIa0y0ybsqU3IHclA0IEyHFW8R
	 ZOLwceTjh6WIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C2E881249;
	Tue,  3 Feb 2026 09:18:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AB0FF4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 09:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0904E40BDA
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 09:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L5AB-DrBe8QU for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 09:18:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 06CD040B9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06CD040B9F
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06CD040B9F
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 09:18:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0E3931A2BB7
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 09:18:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D01EB60728;
 Tue,  3 Feb 2026 09:18:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B2B57119A8888; Tue,  3 Feb 2026 10:18:16 +0100 (CET)
Date: Tue, 3 Feb 2026 10:18:16 +0100
To: Jakob Kastelic <kastelic.jakob@gmail.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, 
 Sergey Matyukevich <geomatsi@gmail.com>, Dick Olsson <hi@senzilla.io>
Message-ID: <aYG7ivWuzoMMuR2-@windsurf>
References: <20241219214555.3435133-1-jkastelic@thinksrs.com>
 <20250917024541.1480367-3-kastelic.jakob@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250917024541.1480367-3-kastelic.jakob@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770110297; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=ZrJJucF+tVQVNWSQPfrgIkVHk4/rpv2Lqzes23JIWZQ=;
 b=QWUqwHTku2ypepiqsph9CIvUO8HYebSJtL+ntkVRLEyP5Tv96DYvlcjSa01aQ+PtKbt/HL
 iWLs6u1dqd+oqx4aRsCaI37NGH5Row6clz29vKMSNXe48vYM/s3Dg0skIQcpaBTEnWXewH
 iV073v/NFIRmg1ylaF4lw7pkRFF3TCAXzCIO84yzVDXBCPrZb/yBztG1jofo3VZZs6bmcP
 YE2YZ0a3avJ/2QRBEPeDjmSns1aXwYI0FxZhIesFNcE4bQbELLp8OPdpgIGqr3+j+yiEdY
 WTk9Iw6uaxHQ8LyrQIcqdCY0qhIDPT/pzG6Rpid7uEm3O03wu7ptEXA1d8QT6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=QWUqwHTk
Subject: Re: [Buildroot] [PATCH v2 2/2]
 configs/qemu_arm_vexpress_tz_falcon_defconfig: new
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

Hello,

On Tue, Sep 16, 2025 at 07:45:41PM -0700, Jakob Kastelic wrote:
> This commit adds a new configuration, in which TF-A loads Linux directly
> (as BL33) under Qemu. This defconfig can be used to test the new TF-A
> flag, BR2_TARGET_ARM_TRUSTED_FIRMWARE_LINUX_AS_BL33.
> 
> Signed-off-by: Jakob Kastelic <kastelic.jakob@gmail.com>

Thanks for your patch! However, rather than having it as a defconfig,
we would prefer to have it as a runtime test, which builds this
configuration and boots it under Qemu.

There's already a TF-A test in
support/testing/tests/boot/test_atf.py. However, this existing test
only performs build testing of TF-A. In your case, we would also want
to boot the system into Qemu as part of the test.

You can for example have a look at
support/testing/tests/boot/test_edk2.py which also does run-time
testing in Qemu.

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 16d9ee892b..227b239bea 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3537,3 +3537,6 @@ F:	package/quazip/
>  F:	package/shapelib/
>  F:	package/simple-mail/
>  F:	package/tinc/
> +
> +N:	Jakob Kastelic <kastelic.jakob@gmail.com>
> +F:	configs/qemu_arm_vexpress_tz_falcon_defconfig

Make sure to add this entry not at the end of the file, but at the
right place based on the alphabetic ordering of developer names.

> diff --git a/board/qemu/arm-vexpress-tz-falcon/patch-dts.sh b/board/qemu/arm-vexpress-tz-falcon/patch-dts.sh
> new file mode 100755
> index 0000000000..896ae317b5
> --- /dev/null
> +++ b/board/qemu/arm-vexpress-tz-falcon/patch-dts.sh
> @@ -0,0 +1,21 @@
> +#!/bin/sh
> +
> +set -u
> +set -e
> +
> +QEMU_BOARD_DIR="$(dirname "$0")"
> +INITRD_ADDR=$(sed -n 's/.*addr=\(0x[0-9a-fA-F]*\).*/\1/p' "${QEMU_BOARD_DIR}/readme.txt" | head -n1)
> +ROOTFS_SIZE=$(stat -c %s "${BINARIES_DIR}/rootfs.cpio.gz")
> +INITRD_END=$(printf '0x%x' $((0x${INITRD_ADDR#0x} + ROOTFS_SIZE)))
> +TMP_DTB="${BINARIES_DIR}/falcon.tmp.dtb"
> +FINAL_DTB="${BINARIES_DIR}/falcon.dtb"
> +
> +# Extract the DTB from Qemu
> +qemu-system-arm -smp 1 -s -m 1024 -d unimp \
> +	-machine virt,dumpdtb="${TMP_DTB}",secure=on -cpu cortex-a15
> +
> +# Insert intramfs address into /chosen
> +fdtput -t x "${TMP_DTB}" /chosen linux,initrd-start "${INITRD_ADDR}"
> +fdtput -t x "${TMP_DTB}" /chosen linux,initrd-end "${INITRD_END}"
> +
> +mv "${TMP_DTB}" "${FINAL_DTB}"

Wouldn't the test be simpler if you were to mount a real rootfs from
storage, instead of using an initrd?

> diff --git a/configs/qemu_arm_vexpress_tz_falcon_defconfig b/configs/qemu_arm_vexpress_tz_falcon_defconfig
> new file mode 100644
> index 0000000000..5ca6e74668
> --- /dev/null
> +++ b/configs/qemu_arm_vexpress_tz_falcon_defconfig
> @@ -0,0 +1,36 @@
> +BR2_arm=y
> +BR2_cortex_a15=y
> +BR2_ARM_FPU_VFPV3D16=y

In the runtime test infrastructure, you will want to use an external
toolchain (there are based toolchain configurations available that
might work).

> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
> +BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/arm-vexpress-tz/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/arm-vexpress-tz-falcon/patch-dts.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
> +BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/linux.fragment"
> +BR2_PACKAGE_OPENSSL=y
> +BR2_PACKAGE_OPTEE_EXAMPLES=y
> +BR2_PACKAGE_OPTEE_TEST=y

If you have these on the target, then the runtime test should ideally
run the OP-TEE tests?

Could you rework, and send a new iteration?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
