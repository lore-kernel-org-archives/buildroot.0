Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FC3C02185
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 20:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8862B416A3;
	Fri, 17 Jan 2025 20:14:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ByidUP98szj1; Fri, 17 Jan 2025 20:14:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 065AC416D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 065AC416D7;
	Fri, 17 Jan 2025 20:14:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F48F69
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 20:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7C1A410DC
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 20:14:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K6nb3h2pQciY for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 20:14:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7CAF841084
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CAF841084
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7CAF841084
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 20:14:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id C436D780503;
 Fri, 17 Jan 2025 21:14:38 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:37024])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 17 Jan 2025 21:14:38 +0100
MIME-Version: 1.0
Date: Fri, 17 Jan 2025 21:14:38 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250116221636.2280438-1-james.hilliard1@gmail.com>
References: <20250116221636.2280438-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <faf12876f932a2bb4b6730ef89d907fc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737144880;
 bh=Zs/qtZx4jQyCqLyqBUqTRQXYpk+DKH+KSFbg9MSHLC0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ThKfu4zeol/+7QMMVTnsPztAevtOOm6ZWvhPEz0BeFtKxp25G8EIgS1Z678gDLtCF
 QOUjiAVIJz3DO8B0uTAvna5OVe/XwT07fkM5+cXOHRUGLIXJ3qAJeDBJ6dxY4ZK2hB
 2jmf+jz8qSquHNak7Hr4oQbCcXcZK0qFpgINZ76gjV4AkmMStdRQfHufau9rrZO2n0
 u3Dd9wq5LeV0GRPZ0YiNaP2SU5pfcg+cAz0uFav4E4nDxyrq5scNCg8yEvXL1B5s5x
 YlqjZMk53KDWBBRy/fHd8s+hf/UQHQcknzGP2vQys9nd9bX5l8sWkTscEhZhzRjLS4
 MmFxC4VS2y9Rg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ThKfu4ze
Subject: Re: [Buildroot] [PATCH 1/1] package/fwupd: bump to version 2.0.3
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

Thanks for the patch!

It introduces build failures. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/1630250184

You can reproduce those with the command "utils/test-pkg -a -p fwupd".
It seems the build failures can be different if it is run in the
Buildroot reference docker image (which you can run with
utils/docker-run). This means things form the host can be detected
during this package configuration.

See below:

On 16/01/2025 23:16, James Hilliard wrote:
> Drop no longer required libgudev dependency.

[...]

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...devdir-when-gudev-support-is-enabled.patch |  35 ------
>  package/fwupd/Config.in                       |   9 +-
>  package/fwupd/fwupd.hash                      |   2 +-
>  package/fwupd/fwupd.mk                        | 102 ++++++++----------
>  4 files changed, 52 insertions(+), 96 deletions(-)
>  delete mode 100644 
> package/fwupd/0001-Only-require-udevdir-when-gudev-support-is-enabled.patch
> 

> diff --git a/package/fwupd/Config.in b/package/fwupd/Config.in
> index 6a96358e5b..778f59bbeb 100644
> --- a/package/fwupd/Config.in
> +++ b/package/fwupd/Config.in
> @@ -2,11 +2,13 @@ config BR2_PACKAGE_FWUPD
>  	bool "fwupd"
>  	depends on !BR2_STATIC_LIBS # libxmlb
>  	depends on BR2_USE_WCHAR # libglib2
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libusb
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
>  	depends on BR2_USE_MMU # libglib2

In some cases, I have errors during configuration:

     
br-test-pkg/arm-aarch64/build/fwupd-2.0.3/plugins/gpio/meson.build:1:17: 
ERROR: C symbol GPIO_V2_LINE_FLAG_OUTPUT not found in header 
linux/gpio.h

The gpio plugin you always enable seems to requie the gpio v2 Kernel 
uapi.
It was introduced in Kernel ~5.10. So, this should add a dependency
on BR2_TOOLCHAIN_HEADERS_AT_LEAST_x.y. Maybe those plugins could be 
enabled
on package options, so the dependency can be added only on the option?

See:
https://github.com/fwupd/fwupd/blob/2.0.3/plugins/gpio/meson.build#L1

>  	select BR2_PACKAGE_LIBGLIB2
>  	select BR2_PACKAGE_LIBJCAT
>  	select BR2_PACKAGE_LIBXMLB
> +	select BR2_PACKAGE_LIBUSB
>  	select BR2_PACKAGE_ZLIB
>  	help
>  	  Fwupd is a simple daemon to allow session software
> @@ -14,6 +16,7 @@ config BR2_PACKAGE_FWUPD
> 
>  	  https://fwupd.org/
> 
> -comment "fwupd needs a toolchain w/ wchar, threads, dynamic library"
> +comment "fwupd needs a toolchain w/ wchar, threads, dynamic library, 
> gcc >= 4.9"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || 
> BR2_STATIC_LIBS
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> diff --git a/package/fwupd/fwupd.hash b/package/fwupd/fwupd.hash
> index 8da9dc3c66..f3a67508f2 100644
> --- a/package/fwupd/fwupd.hash
> +++ b/package/fwupd/fwupd.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  
> b86a2d7fe1b6cc0ac4f75f3351a78cb3c225880c9e20b932fa078ef472e9fcb2  
> fwupd-1.9.20.tar.xz
> +sha256  
> 73690175d0dd81849d729a0f247c69146ee9105c3c8c5d8428b64ad42d49b2f7  
> fwupd-2.0.3.tar.xz
>  sha256  
> dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  
> COPYING
> diff --git a/package/fwupd/fwupd.mk b/package/fwupd/fwupd.mk
> index 9283eb43aa..6846dea93f 100644
> --- a/package/fwupd/fwupd.mk
> +++ b/package/fwupd/fwupd.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -FWUPD_VERSION = 1.9.20
> +FWUPD_VERSION = 2.0.3
>  FWUPD_SITE = 
> https://github.com/fwupd/fwupd/releases/download/$(FWUPD_VERSION)
>  FWUPD_SOURCE = fwupd-$(FWUPD_VERSION).tar.xz
>  FWUPD_LICENSE = LGPL-2.1+
> @@ -14,6 +14,7 @@ FWUPD_DEPENDENCIES = \
>  	host-python-jinja2 \
>  	libglib2 \
>  	libjcat \
> +	libusb \
>  	libxmlb \
>  	zlib
> 
> @@ -24,34 +25,47 @@ FWUPD_CONF_OPTS = \
>  	-Ddocs=disabled \
>  	-Dlvfs=true \
>  	-Dman=false \
> -	-Dgusb=disabled \
>  	-Dpassim=disabled \
>  	-Dp2p_policy=none \
>  	-Dcbor=disabled \
>  	-Dplugin_acpi_phat=enabled \
> +	-Dplugin_android_boot=enabled \
> +	-Dplugin_bcm57xx=enabled \
>  	-Dplugin_cfu=disabled \
> +	-Dplugin_emmc=enabled \
>  	-Dplugin_ep963x=enabled \
>  	-Dplugin_fastboot=disabled \
> +	-Dplugin_gpio=enabled \
> +	-Dplugin_igsc=enabled \
> +	-Dplugin_intel_me=enabled \
> +	-Dplugin_kinetic_dp=enabled \
>  	-Dplugin_logitech_bulkcontroller=disabled \
>  	-Dplugin_logitech_scribe=disabled \
>  	-Dplugin_logitech_tap=disabled \
> +	-Dplugin_mediatek_scaler=enabled \
> +	-Dplugin_mtd=enabled \
> +	-Dplugin_nitrokey=enabled \
> +	-Dplugin_nvme=enabled \
> +	-Dplugin_parade_lspcon=enabled \
>  	-Dplugin_pixart_rf=enabled \
> +	-Dplugin_powerd=enabled \
> +	-Dplugin_realtek_mst=enabled \
> +	-Dplugin_scsi=enabled \
> +	-Dplugin_synaptics_mst=enabled \
>  	-Dplugin_tpm=disabled \
>  	-Dplugin_uefi_capsule=enabled \
>  	-Dplugin_uefi_capsule_splash=false \
> -	-Dplugin_nitrokey=enabled \
> -	-Dplugin_mtd=enabled \
> -	-Dplugin_intel_me=enabled \
> +	-Dplugin_uf2=enabled \
>  	-Dplugin_upower=enabled \
> -	-Dplugin_powerd=enabled \
>  	-Dqubes=false \
>  	-Dsupported_build=enabled \
>  	-Dlaunchd=disabled \
>  	-Dtests=false \
> +	-Dumockdev_tests=disabled \
>  	-Dmetainfo=true \
>  	-Dfish_completion=false \
> -	-Dcompat_cli=false \
> -	-Dthinklmi_compat=false \
> +	-Dudev=enabled \
> +	-Dvendor_metadata=false \
>  	-Dpython="$(HOST_DIR)/bin/python3"

Another error is:

     br-test-pkg/linaro-arm/build/fwupd-2.0.3/meson.build:313:4: ERROR: 
Problem encountered: could not auto-detect -Dvendor_ids_dir=

See:
https://github.com/fwupd/fwupd/blob/2.0.3/meson.build#L313

So there is possibly a "-Dvendor_ids_dir=..." missing.

Could you investigate those issues, and make sure
"utils/test-pkg -a -p fwupd" does not generate any failure please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
