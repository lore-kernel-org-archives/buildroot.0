Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E121FC433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 21:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EA1D4058A;
	Sat,  5 Feb 2022 21:18:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id baYDInELgI_I; Sat,  5 Feb 2022 21:18:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 119CC4058D;
	Sat,  5 Feb 2022 21:18:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBD771BF2CF
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 21:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA2E881CBA
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 21:18:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QgxIxPEfv4Pa for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 21:18:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 545C481CAD
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 21:18:10 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id o12so30181565eju.13
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 13:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=aCrnxKD9knYJo4Pf7qvKeHxFVzWyDXjKvqeBMnvWsDQ=;
 b=Ftrh1XH5KBiMXytglMtPI7UB8i6A7UJUTgNrnNwmBPs50cJ5j58oxcx74//cVsd2wj
 4mECg+vz2zBrWqrlaVmx/mhNZsPpMbe5IGePEjrka6dzkUPq8n+V6zn+8JuGV+usVW2R
 hMSpI8GPBo6zyaBiMMtiUKCvH3OX/vB21QLuf3DpYhcvuh+3YV9l+GuWTqDk+lhg0naO
 FVgQxhx2PFzpPvROBH2gLcuzWuL/Ry/XTHXLVnzOa4gHMmaWzqltUNwV5rIKD8eEd8M9
 xOjzodB9NGNq2eGiU9KW5JyeyFrhajtM938oW0Ktw9+SAHHBt/Z2LBfwKps4Bb34Lx05
 4kcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=aCrnxKD9knYJo4Pf7qvKeHxFVzWyDXjKvqeBMnvWsDQ=;
 b=gYIZBteE+GJi26RyrAIkkRERgI3bcLvMkelfvYAK9+CUXEK4TJQgOFsnEVn9x6EA6z
 QwheYSSBGgbw4w82Z7quAnOklSEfXpeAIYGPtcdZB0g+DveXuG8fSouuf7jJWSUxyP6s
 2RdHUcOEj8VU+cih/UhudYYkASq4L23d9wkSjdWJ6ybzFctfh3QhwHvsseII2Akl8nC/
 0+7H1BcfgiuY2uwLpL7M3a0nij2Wa25we1qSXMJ6zWLfUIsyzS+Hj830TclBRvun5TTg
 6VoX1054m3sfNza31KGQeANO6cpgWkQqhkUlHjbKU/0BW4/2FyEi0uoJej2ByaoGicTI
 gREg==
X-Gm-Message-State: AOAM5308sIafso0iEcgVzPxiYifZpGea26g1xgLXXttIKM7n7jBNivXJ
 6/1D7pQmO5JPuPEWkXIWymokNQ==
X-Google-Smtp-Source: ABdhPJyfHQcC47k68Vzt1EoaIMqLaDkN+gYiwXjEaOIc0XFo3wihPAp/6SeDlGPO8lK+hyNyOA+Aaw==
X-Received: by 2002:a17:907:9808:: with SMTP id
 ji8mr4442829ejc.12.1644095888373; 
 Sat, 05 Feb 2022 13:18:08 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id yr3sm285518ejb.166.2022.02.05.13.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 13:18:07 -0800 (PST)
Message-ID: <eee5f5fa-fb58-eba2-3347-a95a1e713a73@mind.be>
Date: Sat, 5 Feb 2022 22:18:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20220111211708.517341-1-yann.morin.1998@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220111211708.517341-1-yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH] package/zynq-boot-bin: drop legacy package
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/01/2022 22:17, Yann E. MORIN wrote:
> Since commit 6dd5a33c485c (zynq_zed: bump U-Boot to xilinx-v2016.2), we
> have no in-tree users of zynq-boot-bin.py, as U-Boot has since v2016.01
> been able to natively generate Xilinx images.
> 
> zynq-boot-bin.py is python2-only and there is zero chance that upstream
> will move it to python3. WE could carry a pytohn3-compatible copy, but
> that tool is now virtually unused.
> 
> 6 years have passed now; let it rest in peace at last.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>

  Applied to master, with an extension of the help text as suggested by Luca and 
pointing to the URL provided by James.

  Thanks!

  Regards,
  Arnout

> ---
>   Config.in.legacy                         |  7 +++++++
>   boot/uboot/Config.in                     | 12 ------------
>   boot/uboot/uboot.mk                      | 11 -----------
>   package/zynq-boot-bin/zynq-boot-bin.hash |  2 --
>   package/zynq-boot-bin/zynq-boot-bin.mk   | 22 ----------------------
>   5 files changed, 7 insertions(+), 47 deletions(-)
>   delete mode 100644 package/zynq-boot-bin/zynq-boot-bin.hash
>   delete mode 100644 package/zynq-boot-bin/zynq-boot-bin.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index b3e8d5a6d8..16d5ac40b3 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>   
>   comment "Legacy options removed in 2022.02"
>   
> +config BR2_TARGET_UBOOT_ZYNQ_IMAGE
> +	bool "Generate image for Xilinx Zynq"
> +	select BR2_LEGACY
> +	help
> +	  Since 2016.1, U-Boot can natively generate the Zynq boot image,
> +	  and so the Xilinx-specific format and tools have been removed.
> +
>   config BR2_KERNEL_HEADERS_5_14
>   	bool "kernel headers version 5.14.x are no longer supported"
>   	select BR2_LEGACY
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index c630fc6552..1fd4dede92 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -455,18 +455,6 @@ config BR2_TARGET_UBOOT_SPL_NAME
>   	  and TPL name is tpl/u-boot-tpl.bin but not always. SPL name is
>   	  MLO on OMAP and SPL on i.MX6 for example.
>   
> -config BR2_TARGET_UBOOT_ZYNQ_IMAGE
> -	bool "Generate image for Xilinx Zynq"
> -	depends on BR2_arm
> -	depends on BR2_TARGET_UBOOT_SPL
> -	depends on BR2_TARGET_UBOOT_FORMAT_DTB_IMG
> -	help
> -	  Generate the BOOT.BIN file from U-Boot's SPL. The image
> -	  boots the Xilinx Zynq chip without any FPGA bitstream.
> -	  A bitstream can be loaded by the U-Boot. The SPL searchs
> -	  for u-boot-dtb.img file so this U-Boot format is required
> -	  to be set.
> -
>   config BR2_TARGET_UBOOT_ZYNQMP
>   	bool "Boot on the Xilinx ZynqMP SoCs"
>   	depends on BR2_aarch64
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 574fc7089a..a61d1c8135 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -432,17 +432,6 @@ UBOOT_POST_BUILD_HOOKS += UBOOT_BUILD_OMAP_IFT
>   UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_INSTALL_OMAP_IFT_IMAGE
>   endif
>   
> -ifeq ($(BR2_TARGET_UBOOT_ZYNQ_IMAGE),y)
> -define UBOOT_GENERATE_ZYNQ_IMAGE
> -	$(HOST_DIR)/bin/python2 \
> -		$(HOST_DIR)/bin/zynq-boot-bin.py \
> -		-u $(@D)/$(firstword $(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME))) \
> -		-o $(BINARIES_DIR)/BOOT.BIN
> -endef
> -UBOOT_DEPENDENCIES += host-zynq-boot-bin
> -UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_GENERATE_ZYNQ_IMAGE
> -endif
> -
>   ifeq ($(BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC),y)
>   ifeq ($(BR2_TARGET_UBOOT_SPL),y)
>   UBOOT_CRC_ALTERA_SOCFPGA_INPUT_IMAGES = $(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME))
> diff --git a/package/zynq-boot-bin/zynq-boot-bin.hash b/package/zynq-boot-bin/zynq-boot-bin.hash
> deleted file mode 100644
> index 0bc23de197..0000000000
> --- a/package/zynq-boot-bin/zynq-boot-bin.hash
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# From https://raw.githubusercontent.com/Xilinx/u-boot-xlnx
> -sha1	940331ee02b0007099effa61e382fe7ea4174054	zynq-boot-bin.py
> diff --git a/package/zynq-boot-bin/zynq-boot-bin.mk b/package/zynq-boot-bin/zynq-boot-bin.mk
> deleted file mode 100644
> index deba5f4096..0000000000
> --- a/package/zynq-boot-bin/zynq-boot-bin.mk
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -################################################################################
> -#
> -# zynq-boot-bin
> -#
> -################################################################################
> -
> -ZYNQ_BOOT_BIN_VERSION = 2015.1
> -ZYNQ_BOOT_BIN_SOURCE = zynq-boot-bin.py
> -ZYNQ_BOOT_BIN_SITE = https://raw.githubusercontent.com/Xilinx/u-boot-xlnx/xilinx-v$(ZYNQ_BOOT_BIN_VERSION)/tools
> -ZYNQ_BOOT_BIN_LICENSE = GPL-3.0+
> -
> -HOST_ZYNQ_BOOT_BIN_DEPENDENCIES = host-python
> -
> -define HOST_ZYNQ_BOOT_BIN_EXTRACT_CMDS
> -	cp $(HOST_ZYNQ_BOOT_BIN_DL_DIR)/$(ZYNQ_BOOT_BIN_SOURCE) $(@D)
> -endef
> -
> -define HOST_ZYNQ_BOOT_BIN_INSTALL_CMDS
> -	$(INSTALL) -D -m 0755 $(@D)/$(ZYNQ_BOOT_BIN_SOURCE) $(HOST_DIR)/bin/$(ZYNQ_BOOT_BIN_SOURCE)
> -endef
> -
> -$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
