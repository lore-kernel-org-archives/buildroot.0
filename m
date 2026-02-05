Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3445E9128E
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 08:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4376940D75;
	Thu,  5 Feb 2026 08:04:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ad--nNc_pmix; Thu,  5 Feb 2026 08:04:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B7BF40D5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770278650;
	bh=5jmu6Gp/Zx6rcAvqVSnVRIoPRHVTxHMH0DtsscjygXQ=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=WTVEztRPhBK8nLUtwBLR/W2FWurf4QFpXrhE4klnsvMOfZixffHFWhvisSav8728X
	 yNbYdWU6enKZOyh5pSlG2VRmGGwQzrUBCZJ/d+Qn1unAkT41SfEsQHqAAnUk3H47Jn
	 UmRgxslKUOR2kshvIsc0QraXKRuQ+WJownqf1BClp/BncHK8tX96I+Z8VFqAsDHUBc
	 EEv08nYfLPKpj4FQh7GMTQfkNafwU17L216YUL+FoLaoiSwW7S1uJV7yNO9fbWSGeF
	 6OGA+pshMBT+P5MdszJ9WiND2HbaIqQCtLhTXOGMnD/rR4AQYYT12dbgGJnsJq+8Dj
	 vkXgW9mkA9AbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B7BF40D5C;
	Thu,  5 Feb 2026 08:04:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 89B61F5
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 08:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76285610C4
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 08:04:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b8XaNy7Ha4MT for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 08:04:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4BA6D6086A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BA6D6086A
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BA6D6086A
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 08:04:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D1FD0C243A5;
 Thu,  5 Feb 2026 08:04:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D1A08606FD;
 Thu,  5 Feb 2026 08:04:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1D6F2119A865B; Thu,  5 Feb 2026 09:04:00 +0100 (CET)
Date: Thu, 5 Feb 2026 09:04:00 +0100
To: Jakob Kastelic <kastelic.jakob@gmail.com>
Message-ID: <aYROFVF83L7W63bN@windsurf>
References: <20250917024541.1480367-3-kastelic.jakob@gmail.com>
 <20260205044622.1808469-1-kastelic.jakob@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260205044622.1808469-1-kastelic.jakob@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770278643; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=aUxp/n9DNBUG0yW8VCZj5nqqN+JL4/mGgYpu5MC2gFU=;
 b=v5Y9fNDgsTSRBWgAFIS4cyVs7tDRQMkq52SMFVzb0y2UZUhi4iqtzi8R1DDWj8wblz8CXl
 RpJjA6IiSuE1kZ9mGj105FrNXpYUDXjfQBDAZa1HOMSatWDuu4I4/r018N8NGZQvDgy1Dv
 faor0TIQT+GIBp9ZCS3JYm56rP9LdxpTh9k3o0Jn2KeZJjmc4hVF6FQdqAq6NzoPniRt0i
 j2QpCj0hc0pcimaGfjDyi3sSBnyDdr1I8WmHMgrXx0R9jhiTJ9tWjc2KMHVJISSOoU0alR
 gs01uFBVHPhRqCdKY8x1hoPX+oQzIrBbFg+QXPFExxF5YUd4gGoDh9h2r1+v4A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=v5Y9fNDg
Subject: Re: [Buildroot] [PATCH v3] support/testing/tests/boot/test_atf.py:
 test BL33
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
Cc: Romain Naour <romain.naour@gmail.com>, Dick Olsson <hi@senzilla.io>,
 Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Thanks for the patch!

On Wed, Feb 04, 2026 at 08:46:22PM -0800, Jakob Kastelic wrote:

> +class TestATFNoUBoot(infra.basetest.BRTest):
> +    config = \
> +        """
> +        BR2_arm=y
> +        BR2_cortex_a15=y
> +        BR2_ARM_FPU_VFPV3D16=y
> +        BR2_TOOLCHAIN_BUILDROOT_CXX=y

Can we use an external toolchain instead?

> +        BR2_TARGET_ROOTFS_EXT2=y
> +        BR2_TARGET_ROOTFS_EXT2_4=y
> +        BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
> +        BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
> +        BR2_DOWNLOAD_FORCE_CHECK_HASHES=y

Not really useful for tests I'd say, and this would mean the test
would fail when we update qemu defconfigs as the test would no longer
be aligned with the hashes in board/qemu/patches/.

> +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +        BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/arm-vexpress-tz/post-build.sh"
> +        BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
> +        BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.7"
> +        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
> +        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/linux.fragment"
> +        BR2_PACKAGE_OPENSSL=y
> +        BR2_PACKAGE_OPTEE_EXAMPLES=y
> +        BR2_PACKAGE_OPTEE_TEST=y
> +        BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> +        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7"
> +        BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu"
> +        BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
> +        BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
> +        BR2_TARGET_ARM_TRUSTED_FIRMWARE_LINUX_AS_BL33=y
> +        BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="BL32_RAM_LOCATION=tdram"
> +        BR2_TARGET_OPTEE_OS=y
> +        BR2_TARGET_OPTEE_OS_NEEDS_DTC=y
> +        BR2_TARGET_OPTEE_OS_PLATFORM="vexpress-qemu_virt"
> +        BR2_PACKAGE_HOST_QEMU=y
> +        BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
> +        """
> +
> +    def patch_dts(self):
> +        """
> +        Place the rootfs into the kernel command line via the DTB.
> +
> +        In qemu-system-arm, -append is only allowed with -kernel option. Since
> +        we are using the -bios option to load TF-A (which in turn loads the
> +        kernel), we have to manually patch the DTB to add the root option.
> +        """
> +        dtb = os.path.join(self.builddir, "images", "qemu.dtb")
> +        rootfs = os.path.join(self.builddir, "images", "rootfs.ext4")
> +        flash = os.path.join(self.builddir, "images", "flash.bin")
> +        qemu = os.path.join(self.builddir, "host", "bin", "qemu-system-arm")
> +        fdtput = os.path.join(self.builddir, "host", "bin", "fdtput")
> +
> +        # get the DTB from Qemu
> +        subprocess.run([
> +            qemu, "-machine", f"virt,dumpdtb={dtb}", "-machine",
> +            "secure=on", "-cpu", "cortex-a15"
> +            ], check=True)
> +
> +        # insert kernel command line argument into DTB
> +        subprocess.run([fdtput, "-t", "s", f"{dtb}", "/chosen", "bootargs",
> +            "root=/dev/vda" ], check=True)
> +
> +        return dtb, rootfs, flash
> +
> +    def test_run(self):
> +        dtb, rootfs, flash = self.patch_dts()
> +
> +        self.emulator.boot(arch="arm", options=[
> +            "-machine", f"virt", "-machine",

Why f"virt" and not just "virt" ?

Otherwise, looks good to me!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
