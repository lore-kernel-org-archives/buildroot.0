Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4802CA9ECC
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 20:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82C5A4055C;
	Sun, 11 Oct 2026 20:41:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rnHsDMEwF_Ot; Sun, 11 Oct 2026 20:41:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 37D9340566
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791751297;
	b=OtQvsDISHwobUHbA1z8ViGIcYOZVSuxo8LcdcGk8UjVQE/VMFvFEdS2APVoPRr14ccPS
	 vHbUeuVbqJ2J0iiuC1jzSqzCpBhfPWu4XupB8W6DSDwoNvcS35gg/OoTFPNLOoICl5eY1
	 qDBLt8TWUUzeSwQ1KRmKrYsD23plPIorml+dkH4rhTjqv/ll0CUHdpTaFM7Q0uQwq9nfx
	 dFGZCb8wOB2CWXEf2qQueOxivIbYI6my7fdF1JebaBbS0ATE9RbywSwXosjrb0I80efQb
	 AHgN/4v9As/iviNxTdXDl8dC5p7ICzqK3QbAuAQt4aeWU8NokjSBtyS3EKtQH94hEmw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791751297;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=DyWr6iC6vCEfkhmedCwPF1G/JP4Zc6gS5kvG4PJ7RUE=;
	b=A/T6Mj+s81eBjhXV2y3LFxtD42dpg/uQaiwtB6X647bcIEnupGXM3CsfyRn1qIqjcmt2
	 ne6BuV57XhhMgEVgv9z29tGug7fuBigTu2e1kbSQdpf8A2tjnFYQJOu6hm4FWEyAZl2yx
	 HQBtlC7rqAO3hVSeDHOfZ6Rmgs/K4JjJuOn9f4haO6rXoJLWhISVgZbbMk/dUBVAAfQ5I
	 Thk/Gryq/Y8iJA7UyYqckqOJMVJmgUJyvyWCbZVN1cxtT7XnJg6/fKF2AnhhfrKO+ToTP
	 lom8KaYc/dpKJ9EsKV08rC3DLLWo5HEgY4CAiYnaSMxjii0IwEPIJDFTk+73Crd7+xQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791751297;
	bh=DyWr6iC6vCEfkhmedCwPF1G/JP4Zc6gS5kvG4PJ7RUE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cDgsNuul+sXoZFvYx3Q3RWwbzUrlsmZ93IN77XZvzN3L6y8yYH2Zb2B6mK7QWA1F/
	 VNY/4pPGFwCSOTi/ScCz73kDVGIJdg4WrraRjUe8GgbX5Wz+/BZl3qY4R2cr4lf+ck
	 dkPz6gqxNul0nPrYT5OqydA0KFHWsaMmodDTc0e6ARNJdKAj0H643L6JmQ9cfx5az8
	 RcV5G9GQ87WdaT8kXDx7+4JSy1MJz5Y04oJDFtl/SMXH8zhK3rZHyFdqKroNBJ25T4
	 L+2jVKYvtMACebBWlD8ukSkGotu2pwnAbnAJQ07uLa4WmLeqlaq5vCjFt3uGk42PHN
	 Ezi2H4eLI6RkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37D9340566;
	Sun, 11 Oct 2026 20:41:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E2EC1A6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 20:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 148B440075
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 20:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XZYSNXy3-lHt for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 20:41:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B662C4005F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791751295;
 b=ct4t1O6ADWU+n3xR0Uw1k7IoKF0TDMLAuE1IBhtajaU699NCqdor9pRMJP2mkKxeT76l
 VQzv1lPl4/S5JYaK3Z9cYMbpeUhHOz0Tj2Xt34EcFvmRHCb6RcQXAttIA9bcCQdwaZFVf
 o4K82SrbFEUyBbTDCJ83JoDMv+4UCD8yqh5aBannPB1Iat+uCnAg8Vfttw8yYJ8H7a6YW
 ziSC1k11sVYTd39Pc5rtI1vDIc+3sg33b6/Mg/X0C+dRjjo8g/sW9OOcfWoTfDMqCSfRy
 6ER42vK8mr0WAX9lsju5z+M35JYy2Lc8LRG+jWurM/hKNisknxt5xYwK0c6LXTbEbfw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791751295;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=poZXe9oRdPLZkEc/XcaYBdOa6sHosD7PCFDaGoDjSVc=;
 b=Zlo2rH16nZZvqRPjiIIQDV4enM//0T4XJarDQZ/GCyyUAkpZqYNA5dHxv8fge/l5NOt0
 sVlygsVM6W4hqPcMb9+bxMe1n8/jnYF5mBcAyGDUL5ap0ZrkdBIxR93tJubdnXNQoLrK1
 cBgBwj+dNnI7Z9jb+xPuR1f/1C3lklfk8U+9bE7mlGNJeCf9KQ8P4c4xo+dsTKJiTBg3W
 4ZK8m20NIMA3bvrY9+IN4TDc1EwmcR+wVIhTH8Tn4K2IhPEMd2awoMlzJmzWrIa9DIfV9
 WLXIdeakPSebzE9ZDQFq7K4MJ1C3ryqMlyuyVjMSa0CdfduN3w1DGhu7Fr0YXy1AHUg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=g44Ne1+V; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B662C4005F
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 20:41:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3085AB979F97; Sun, 11 Oct 2026 22:41:30 +0200 (CEST)
Message-ID: <b5082743-948d-4433-8fcf-d25165bdc656@rnout.be>
Date: Sun, 11 Oct 2026 22:41:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Che-Wei Chuang <cnoize@andestech.com>, buildroot@buildroot.org
Cc: Leo Yu-Chi Liang <ycliang@andestech.com>
References: <20260111164921.2087908-1-cnoize@andestech.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260111164921.2087908-1-cnoize@andestech.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] board/andes/ae350: bump to AndeSight v5.4.x
 and add OP-TEE
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Che-Wei,

On 11/01/2026 17:49, Che-Wei Chuang via buildroot wrote:
> Update the Andes AE350 board support to align with the AndeSight v5.4.x
> software stack. This update includes the following changes:
> 
> - Bump Linux kernel to v6.6.49, and update U-Boot and OpenSBI to the
>    corresponding AndeSight v5.4.x custom tarballs for the QEMU Andes
>    AE350 machine.
> - Add optional support for OP-TEE (Open Portable Trusted Execution
>    Environment) via config fragments.
> - Update genimage_sdcard.cfg to align the final SD card image size to a
>    power of 2, which is required for correct QEMU emulation.
> - Modify post-build.sh to install all generated DTBs rather than a single
>    hardcoded DTB.
> - Add a patch for optee-test to disable fragmentation calculation, fixing
>    a build failure caused by struct mismatch between optee-test 4.6.0
>    and the older optee-os 4.3.0.

  Very good commit message, thank you!

  It would have been better to split off all the optee-related stuff in a 
separate commit. If your commit message contains a bullet list of changes, 
that's an indication that it's mixing too many things.

  This _could_ be split into four commits actually:

1. SD card
2. Update kernel etc.
3. Add qemu
4. Add op-tee

> Signed-off-by: Che-Wei Chuang <cnoize@andestech.com>

  I was going to apply, but it fails to build [1]. Probably because we updated 
opensbi...

  So I'll give a few more comments.

[snip]> --- /dev/null
> +++ b/board/andes/ae350/patches/optee-test/4.6.0/0001-xtest-stats-Disable-fragmentation-calculation-for-ol.patch

  The readme says to use optee-test 4.3.0, so how does this patch apply?
[snip]> +QEMU (AE350 simulation)
> +=======================
> +
> +To run the andes_ae350 machine model, use the QEMU version:
> +https://github.com/andestech/qemu
> +
> +Boot command example:
> +  qemu-system-riscv64 \
> +    -nographic \
> +    -M andes_ae350 \
> +    -cpu andes-ax45 \
> +    -m 2G -smp 1 \
> +    -bios none \
> +    -device loader,file=u-boot-spl.bin,addr=0x80000000 \
> +    -device loader,file=u-boot.itb,addr=0x80020000 \
> +    -device loader,file=dtb/ax45_c1_d_dsp_noncoherent_ae350.dtb,addr=0x801E0000 \
> +    -drive file=sdcard.img,format=raw,id=sd1 \
> +    -device sd-card,drive=sd1 \
> +    -net nic,model=atfmac100 \
> +    -net user,net=192.168.96.0/24,dhcpstart=192.168.96.10,\
> +domainname=andestech.com,hostfwd=tcp::9623-:23 \
> +    -gdb tcp::9696

  For the qemu_* defconfigs, in CI the readme.txt is parsed and this command is 
extracted to actually run the qemu command - which verifies that not only it 
builds, but it also runs. It would be nice if we could do the same for ae350.

  Note that that does require an update to the 
support/scripts/boot-qemu-image.py script because it now only supports qemu_* 
defconfigs. And you also have to install a start-qemu.sh script, like 
board/qemu/post-image.sh does. The latter is BTW advisable to do for this one as 
well.

> +OP-TEE OS (4.3.0)

  Why 4.3.0? Is that the latest supported by Andes? It's already 2 years old so 
I'm surprised...

> +=================
> +
> +The file `tee.bin` is the OP-TEE OS secure world binary.
> +It provides a Trusted Execution Environment (TEE) that runs alongside Linux in
> +secure mode.
> +
> +The OP-TEE OS binary (`tee.bin`) is packaged inside the `u-boot.itb` image on
> +the AE350 platform.
> +
> +OP-TEE provides the following core security services:
> +
> +- Secure execution of Trusted Applications (TAs)
> +- Secure key storage and cryptographic operations
> +- Hardware-backed isolation between Secure World and Normal World
> +- Secure monitor call (SMC) interface for Linux communication
> +
> +Linux communicates with OP-TEE through the standard OP-TEE Linux driver using
> +SMC calls. This allows normal world applications to access secure services
> +without exposing sensitive data to the Linux kernel.
> +
> +For the single-core configuration, use ax45_c1_d_dsp_noncoherent_ae350_optee DTS.
> +For the quad-core configuration, switch to ax45mp_c4_d_dsp_ae350_optee.
> +
> +To enable this feature, configure the following options in the Buildroot menuconfig:

  Instead of specifying all these menuconfig changes, I think it's better to 
simply have a separate defconfig for ae350 with optee.

> +Bootloaders  --->
> +[*] optee_os  --->
> +OP-TEE OS version (Custom tarball)  --->
> +URL of custom OP-TEE OS tarball:
> +  $(call github,andestech,optee_os,optee_ast540_v4.3)/optee_os-optee_ast540_v4.3.tar.gz
> +[*]   OP-TEE OS needs host-python-cryptography

[snip]> +OP-TEE User-space Configuration (4.3.0)
> +=======================================
> +
> +The OP-TEE user-space components are built from custom upstream
> +tarballs and provide Linux support for OP-TEE OS.
> +
> +They can be enabled from Buildroot menuconfig:
> +Target packages  --->
> +  Security  --->
> +
> +-*- optee-client
> +    optee-client version (Custom tarball)  --->
> +      URL of custom optee-client tarball:
> +        $(call github,OP-TEE,optee_client,4.3.0)/optee_client-4.3.0.tar.gz

  With a separate defconfig, this should still be part of the defconfig, but 
examples and test should not be, and just be mentioned in the readme.

> +
> +[*] optee-examples
> +    optee-examples version (Custom tarball)  --->
> +      URL of custom optee-examples tarball:
> +        $(call github,linaro-swg,optee_examples,4.3.0)/optee_examples-4.3.0.tar.gz
> +
> +[*] optee-test
> +    optee-test version (Custom tarball)  --->
> +      URL of custom optee-test tarball:
> +        $(call github,OP-TEE,optee_test,4.3.0)/optee_test-4.3.0.tar.gz
> +
[snip]
> diff --git a/configs/andes_ae350_45_defconfig b/configs/andes_ae350_45_defconfig
> index 80b780b6e0..1845228ebb 100644
> --- a/configs/andes_ae350_45_defconfig
> +++ b/configs/andes_ae350_45_defconfig
> @@ -11,22 +11,24 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/andes/ae350/genimage_sdcard.cfg"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,andestech,linux,v6.0.y-andes)/linux-v6.0.y-andes.tar.gz"
> -BR2_LINUX_KERNEL_DEFCONFIG="ae350_ax45mp"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,andestech,linux,ast-v5_4_1-release)/linux-ast-v5_4_1-release.tar.gz"

  It's very weird that the version number goes down... But I guess before it was 
the kernel version, and now it's the BSP release.

> +BR2_LINUX_KERNEL_DEFCONFIG="ae350_rv64_smp"
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/andes/ae350/linux.config.fragment"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="andes/ae350_ax45mp"
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="andes/ax45_c1_d_dsp_noncoherent_ae350"
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="30M"
>   # BR2_TARGET_ROOTFS_TAR is not set
>   BR2_TARGET_OPENSBI=y
> -BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
> -BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.6"
> +BR2_TARGET_OPENSBI_CUSTOM_TARBALL=y
 > +> +BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call 
github,andestech,opensbi,ast-v5_4_1-release)/opensbi-ast-v5_4_1-release.tar.gz"
>   BR2_TARGET_OPENSBI_PLAT="generic"
>   # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,andestech,uboot,ast-v5_4_1-release)/uboot-ast-v5_4_1-release.tar.gz"

  It's _very_ surprising that a board that was previously supported upstream now 
suddenly requires a vendor fork... Is it really a good idea to do that? Does the 
vendor fork have some advantages that upstream doesn't?

  Regards,
  Arnout

[1] https://gitlab.com/arnout/buildroot/-/jobs/17096686665



>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ae350_rv64_spl_xip"
>   BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/andes/ae350/uboot.config.fragment"
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> @@ -37,6 +39,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
>   BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
>   BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
>   BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SWDTB=1"
>   BR2_PACKAGE_HOST_ANDES_SPI_BURN=y
>   BR2_PACKAGE_HOST_DOSFSTOOLS=y
>   BR2_PACKAGE_HOST_GENIMAGE=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
