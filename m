Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6997CA9ECA
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 19:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A1FA80C4D;
	Sun, 11 Oct 2026 19:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id veoGZBZSKhQ9; Sun, 11 Oct 2026 19:16:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 794E680C93
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791746173;
	b=DSyWZMQ7G0JyIqrTkjPFLSttgmhpM/C9ZBDUs/FXA6gkytolTDb2o05vCFr0oFoPsHJm
	 beEZ/9swTiCzCBFi2A4ShjUSpw+lGDy/+6sHBMv1fB1lAJCn0y37s84vqnSt6msbrPrxM
	 dxZXstgxpiMJzrwPzNJPj2k1YFos1RfXTef/iWPvUvKdPoSvFDqaV0JfGvvnf1EvE4pqF
	 Sni3UcATvohjM1CWdjKII8kxERfimr0E2kYsfkagiC9Sa/zXms7MWI3dDEdL5ndG0SA2e
	 tqonTkZPYmRPV0sQQT3gcy7QQZ5K+eU5EzpRT/tS7Zft/QCMS3zqcUZ2UDEfIP9EfXg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791746173;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=d3EDURqER/Uuru+KdJCRcLVvqZBGMlczZYn5xuZojQY=;
	b=q8DGuN+OqNOXN30WJrWFFbX1zAYOeHdPNOTvlFt8Ia35V+zyiQhRb5sp3B9fCMe8lFDX
	 SNUMk2tV4Z6JJ5XO6V3sPayhEMNDOIINgyEHYOST9FDz31Gs4cdL3sFo07CZa+JO/RqyO
	 +SOzG5ztnXrGVPNO1Ha67DZh/X/zf9mUD5wWq4+vEa2QgFwcd+dzQgngnjwThqpJvMgdq
	 wwGqgtRhcEQcI8AeTT21hBZ8mcMiQegdlUr0etel2x/yQGYlw4V1kS4oExXQ57kXTKjo/
	 f770B0dMe0kG3Mq9l79gq8y8C8Hg9E9MdBIQQxq4l3a9aylmG0dKgArPTbZKc2f9vRA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791746173;
	bh=d3EDURqER/Uuru+KdJCRcLVvqZBGMlczZYn5xuZojQY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sFyrxY9hwblnXQXrYzVC4fMCm3O9WgSbVI1GuFyn7NfbgWig6j0etEFRUMTUvu+rH
	 QULEAOGgdOBOM0YP0d81OJBCs0ogJShEenh3+1bGAb3NW7zEDC8k6CibB8aFhd52D4
	 GCFzW+Ce5d5tZ3Us76uadtv8/ZOJuATu6buKvoyV0+aoI4kHcPRUfLeN3/iCXD7HqW
	 xEQzFSHUy5H3m2ESw1q2IatGn5E7OYB0CU3w4nItGrc7NL/DCWnL0ePinAtOmPUi/Q
	 aWVSIiNSBtGugkwbHNeKnn9oUT97kKOVT35oIwaBjMcpmM8p88lnyTi8GZfqK3Rgal
	 lUpUi6zenkECA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 794E680C93;
	Sun, 11 Oct 2026 19:16:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A8EAC75
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B0AD80C93
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IyuUXZ5gkzzV for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 19:16:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5A23780C4D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791746170;
 b=nBLhtwBkZI+/YpYm08/ksyZ7zDyiVpW/vkXjT+qo4oPqoKFag3P1JReWx50tHzYlm9cA
 eMfsvyNRPYwWE1rIBcsNqh7LNXo8BOabH2Mvm9LMhdsQTLF1KFPVExOHEOWJyqIwryRz7
 XOQzb9uvE8iZj7q4C7LoPkDzVqm1b2xpvXUaxU+Y2ZScub2s54zLpTBZy0OlJ/T5EJBdR
 KvcnEzTFQ9YKsLmpSxw+RVz1gELjt94XxsbX/AqhK9P5H7kJxejFZTjEvhFNuKKQWF1UZ
 bIB+R7M3V0ukG/y57EiheKOTcZm078eklllpBgopC74lE5NxBaaHtKFEDnqDXgRGieA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791746170;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=K5W/cHJuJNpQBatVwmYG5djSPNnGu5oA9yMJ4RgiOnU=;
 b=jvyTAoiJhdd8ggZnTitjHlqs6por+ZbDhm74ONbW8wCudbY0DQta7mJwBfoBonGH/oD4
 Q6Mt4FvC8KJz72Q/b34ytyEHIRLltMLwYdz6MMSigL//HFhUOLI/Ua8rpJ39kYMFQwXjl
 QRmuaNdUGzCVvaL6LZXGAspUKw9Fq92jDKqSWA6XxuCnzDg1iNHSqZ6RlKe82mgVnxl9r
 OYAO65QkogoSiL0i0lNRS1FvYHMiGHMOfugQD0369iVni97tFvwW3Y7ghQpvqp4bF7yLs
 G2Otq/QclTdqY140E32WPpQr1MfJeOwHG09w7nTJ3AYZPQaQkCENGSAFadAkexcQF5A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=bngYkJAi; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A23780C4D
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:16:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C7125B97A168; Sun, 11 Oct 2026 21:16:05 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Arnout Vandecappelle <arnout@rnout.be>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 =?UTF-8?q?Jos=C3=A9=20Mendes?= <jp.baltazar.mendes@gmail.com>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Sun, 11 Oct 2026 21:15:49 +0200
Message-ID: <179174589255.232021.14124341316194662170.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20250207171458.1127620-4-fiona.klute@gmx.de>
References: <20250207171458.1127620-4-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v3 3/3]
 configs/raspberrypicm4io_64_uboot_defconfig: new defconfig
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 07 Feb 2025 18:14:58 +0100, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>
> The new config deviates from the existing
> configs/raspberrypicm4io_64_defconfig only as far as necessary to
> demonstrate booting through U-Boot instead of having the firmware load
> the kernel directly. The sample boot script loads the kernel from the
> rootfs and uses the device tree provided by the firmware, and should
> be compatible with any RPi device that runs U-Boot.
>
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

 Applied to master, thanks!

 I still think it would be better to have _only_ a uboot defconfig and
document in the readme how to remove it, but you never did that and this
defconfig is useful so let's merge it :-)

> ---
> The config I'm usually using is a bit different, including using a
> mainline kernel (which seems strongly preferable to me), but for
> defconfig maintenance staying close to the other RPi defconfigs is
> probably easiest.
>
> Changes v2 -> v3:
> * Regenerate defconfig according to current standards
> * Modify boot.scr.in so the script should work on any RPi device
>
>  board/raspberrypi/boot.scr.in                 | 18 +++++++++
>  .../raspberrypi/config_cm4io_64bit_uboot.txt  | 23 +++++++++++
>  board/raspberrypi/readme.txt                  |  4 ++
>  configs/raspberrypicm4io_64_uboot_defconfig   | 40 +++++++++++++++++++
>  4 files changed, 85 insertions(+)
>  create mode 100644 board/raspberrypi/boot.scr.in
>  create mode 100644 board/raspberrypi/config_cm4io_64bit_uboot.txt
>  create mode 100644 configs/raspberrypicm4io_64_uboot_defconfig
>
> diff --git a/board/raspberrypi/boot.scr.in b/board/raspberrypi/boot.scr.in
> new file mode 100644
> index 0000000000..1ba733ceaa
> --- /dev/null
> +++ b/board/raspberrypi/boot.scr.in
> @@ -0,0 +1,18 @@
> +# Please note that this is only a sample, we recommend you to change
> +# it to fit your needs. You should override this file using
> +# BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE.
> +
> +# On most Raspberry Pi boards UART0 is ttyAMA0, Raspberry Pi 5 is
> +# different.
> +if test "$board_name" = "5 Model B"; then
> +    env set serial_uart "ttyAMA10,115200"
> +else
> +    env set serial_uart "ttyAMA0,115200"
> +fi
> +env set bootargs "root=/dev/mmcblk0p2 rootwait console=tty1 console=${serial_uart}"
> +
> +# load kernel from the root partition
> +load mmc 0:2 ${kernel_addr_r} boot/Image
> +
> +# boot using the FDT provided by firmware
> +booti ${kernel_addr_r} - ${fdt_addr}
> diff --git a/board/raspberrypi/config_cm4io_64bit_uboot.txt b/board/raspberrypi/config_cm4io_64bit_uboot.txt
> new file mode 100644
> index 0000000000..eef929186c
> --- /dev/null
> +++ b/board/raspberrypi/config_cm4io_64bit_uboot.txt
> @@ -0,0 +1,23 @@
> +# Please note that this is only a sample, we recommend you to change it to fit
> +# your needs.
> +# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
> +# See http://buildroot.org/manual.html#rootfs-custom
> +# and http://elinux.org/RPiconfig for a description of config.txt syntax
> +
> +start_file=start4.elf
> +fixup_file=fixup4.dat
> +
> +kernel=u-boot.bin
> +
> +# Enable UART0 for serial console on ttyAMA0
> +dtoverlay=miniuart-bt
> +
> +# enable RTC
> +dtparam=i2c_vc=on
> +dtoverlay=i2c-rtc,pcf85063a,i2c_csi_dsi
> +
> +# enable dwc2 USB controller (USB 2.0)
> +dtoverlay=dwc2,dr_mode=host
> +
> +# enable 64bits support
> +arm_64bit=1
> diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
> index 64f0e2a26f..6bf76df2ef 100644
> --- a/board/raspberrypi/readme.txt
> +++ b/board/raspberrypi/readme.txt
> @@ -69,6 +69,10 @@ or for CM4 (on IO Board - 64 bit):
>  
>    $ make raspberrypicm4io_64_defconfig
>  
> +or to boot CM4 (on IO Board - 64 bit) using U-Boot:
> +
> +  $ make raspberrypicm4io_64_uboot_defconfig
> +
>  For model 5 B:
>  
>    $ make raspberrypi5_defconfig
> diff --git a/configs/raspberrypicm4io_64_uboot_defconfig b/configs/raspberrypicm4io_64_uboot_defconfig
> new file mode 100644
> index 0000000000..056c9051b6
> --- /dev/null
> +++ b/configs/raspberrypicm4io_64_uboot_defconfig
> @@ -0,0 +1,40 @@
> +BR2_aarch64=y
> +BR2_cortex_a72=y
> +BR2_ARM_FPU_VFPV4=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
> +BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> +BR2_SYSTEM_DHCP="eth0"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm4io-64/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm4io-64/post-image.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"

 I updated this to align with the current raspberrypicm4io_64_defconfig.

 Regards,
 Arnout


> +BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-cm4"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +BR2_PACKAGE_XZ=y
> +BR2_PACKAGE_RPI_FIRMWARE=y
> +BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
> +BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypicm4io-64/config_cm4io_64bit_uboot.txt"
> +BR2_PACKAGE_KMOD=y
> +BR2_PACKAGE_KMOD_TOOLS=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rpi_arm64"
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_KMOD_XZ=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_RASPBERRYPI_USBBOOT=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/raspberrypicm4io-64/boot.scr.in"
> -- 
> 2.47.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
