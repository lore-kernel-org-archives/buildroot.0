Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD38C433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 20:03:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6829C61164
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 20:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6829C61164
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FCD060EF6;
	Fri, 15 Oct 2021 20:03:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wAJnxE4IyXNw; Fri, 15 Oct 2021 20:03:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F3EC60EF7;
	Fri, 15 Oct 2021 20:03:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 479081BF41F
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 20:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 402BC83B1C
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 20:03:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3K_AjR160p95 for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 20:03:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2986A83211
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 20:03:17 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id ec8so42476130edb.6
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 13:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=O8xp86MX05O/tsWL5Ig56Oe9/lP9eEp3F7AGaM6WDOY=;
 b=W8M7XMFg/9a4gThoBq3mzsZw93XGyMsVHgegPXecRalscS4Q+6uZSBen1GTlinJ5Rv
 u1O05/UYEAHX+xky/XtwkZN382PKdlacf64GxCiaKL21Fgh8VfYO4FsDvI+hyASQjZOQ
 zALoX/ApjzzQ8uo3JyNx1CHPZRSDkzPkG+aAt0h/FZYf9IIw2V0fZQofWb601L3tuQZ5
 pZtLmPFgUO3VNFE1lyqwd8c23kh2EZZRtTadSPpx8m5KgMLTlf5kdF5yhZpNw3UycgfG
 gi5qxKmIU4HihpQRagYwGvbs6a38akF2I1GxzIAlyBu+neshIFCfKTpCWWRv6ToToPfZ
 L3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=O8xp86MX05O/tsWL5Ig56Oe9/lP9eEp3F7AGaM6WDOY=;
 b=yAgDGmMjOuPVHPX4+7PnRXfAHWZbaXSCwc7bXVXbFm9DBVpwfWxmSnRTUPlVKHJExk
 SFJWtoNlcdR0mL8iYp2hPH5CImnWXwDpgQmj+pGSidCli4hdk7cdmjkKTnyqjKHm/wIl
 YDCqumLS4iEs9MkhMLsiGokAT44O3MhF7fMZi7rF94AKlAQ20lk5zmxT0a6v9mXiZ4Nq
 mvv/4KYUHcV+kIB7vxiC2nJg31g/nqunnwk1JvON6RnjAwmyutnK6vpAlokQE6Xn5dzp
 ix2YiNNwA1xmSHLLbXQ1grTe6cDAPOhXgRR+WwgGAzmKYdMoxxjxs0zBc/DxiZwdZ8qK
 0New==
X-Gm-Message-State: AOAM532B2uQqFplfMTR6AUHEg3rQBkvQejUZYykURXbh2HaDLEyYizYc
 9GddEqUNKMF/+HAkK6QWjW+H9g==
X-Google-Smtp-Source: ABdhPJxQiLUWnPcMGk8X8UhKJ27c/dGCBJfHoE6XuKSn2VA6uLMIeFxPRLLoQtnAQOL0IA17/+JW2A==
X-Received: by 2002:a05:6402:90c:: with SMTP id
 g12mr20687771edz.198.1634328195299; 
 Fri, 15 Oct 2021 13:03:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id g23sm5289864edt.1.2021.10.15.13.03.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 13:03:14 -0700 (PDT)
Message-ID: <570f2af3-90b2-5e47-0926-3a829629ad48@mind.be>
Date: Fri, 15 Oct 2021 22:03:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
References: <20211004132740.34050-1-kory.maincent@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211004132740.34050-1-kory.maincent@bootlin.com>
Subject: Re: [Buildroot] [PATCH] boot/edk2: add support to build 32bit edk2
 when using x86_64 architecture
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
Cc: yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/10/2021 15:27, Kory Maincent wrote:
> Add BR2_TARGET_EDK2_PLATFORM_OVMF_I386 for x86_64 architecture.
> Update the management of EDK2_ARCH to follow the edk2 platform type in
> place of BR2 architecture.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   boot/edk2/Config.in |  2 +-
>   boot/edk2/edk2.mk   | 16 ++++++++--------
>   2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
> index 8e548cfc67..df723122ee 100644
> --- a/boot/edk2/Config.in
> +++ b/boot/edk2/Config.in
> @@ -25,7 +25,7 @@ choice
>   
>   config BR2_TARGET_EDK2_PLATFORM_OVMF_I386
>   	bool "i386"
> -	depends on BR2_i386
> +	depends on BR2_i386 || BR2_x86_64
>   	help
>   	  Platform configuration for a generic i386 target.
>   	  This platform will boot from flash address 0x0.
> diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
> index ab3cdad464..2b12de53cb 100644
> --- a/boot/edk2/edk2.mk
> +++ b/boot/edk2/edk2.mk
> @@ -14,14 +14,6 @@ EDK2_DEPENDENCIES = edk2-platforms host-python3 host-acpica host-util-linux
>   EDK2_INSTALL_TARGET = NO
>   EDK2_INSTALL_IMAGES = YES
>   
> -ifeq ($(BR2_i386),y)
> -EDK2_ARCH = IA32
> -else ifeq ($(BR2_x86_64),y)
> -EDK2_ARCH = X64
> -else ifeq ($(BR2_aarch64),y)
> -EDK2_ARCH = AARCH64
> -endif
> -
>   ifeq ($(BR2_ENABLE_DEBUG),y)
>   EDK2_BUILD_TYPE = DEBUG
>   else
> @@ -58,33 +50,39 @@ EDK2_BUILD_PACKAGES = $(@D)/Build/Buildroot
>   EDK2_PACKAGES_PATH = $(@D):$(EDK2_BUILD_PACKAGES):$(STAGING_DIR)/usr/share/edk2-platforms
>   
>   ifeq ($(BR2_TARGET_EDK2_PLATFORM_OVMF_I386),y)
> +EDK2_ARCH = IA32
>   EDK2_DEPENDENCIES += host-nasm
>   EDK2_PACKAGE_NAME = OvmfPkg
>   EDK2_PLATFORM_NAME = OvmfPkgIa32
>   EDK2_BUILD_DIR = OvmfIa32
>   
>   else ifeq ($(BR2_TARGET_EDK2_PLATFORM_OVMF_X64),y)
> +EDK2_ARCH = X64
>   EDK2_DEPENDENCIES += host-nasm
>   EDK2_PACKAGE_NAME = OvmfPkg
>   EDK2_PLATFORM_NAME = OvmfPkgX64
>   EDK2_BUILD_DIR = OvmfX64
>   
>   else ifeq ($(BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU),y)
> +EDK2_ARCH = AARCH64
>   EDK2_PACKAGE_NAME = ArmVirtPkg
>   EDK2_PLATFORM_NAME = ArmVirtQemu
>   EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)-$(EDK2_ARCH)
>   
>   else ifeq ($(BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU_KERNEL),y)
> +EDK2_ARCH = AARCH64
>   EDK2_PACKAGE_NAME = ArmVirtPkg
>   EDK2_PLATFORM_NAME = ArmVirtQemuKernel
>   EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)-$(EDK2_ARCH)
>   
>   else ifeq ($(BR2_TARGET_EDK2_PLATFORM_ARM_VEXPRESS_FVP_AARCH64),y)
> +EDK2_ARCH = AARCH64
>   EDK2_PACKAGE_NAME = Platform/ARM/VExpressPkg
>   EDK2_PLATFORM_NAME = ArmVExpress-FVP-AArch64
>   EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)
>   
>   else ifeq ($(BR2_TARGET_EDK2_PLATFORM_SOCIONEXT_DEVELOPERBOX),y)
> +EDK2_ARCH = AARCH64
>   EDK2_DEPENDENCIES += host-dtc arm-trusted-firmware
>   EDK2_PACKAGE_NAME = Platform/Socionext/DeveloperBox
>   EDK2_PLATFORM_NAME = DeveloperBox
> @@ -103,6 +101,7 @@ define EDK2_PRE_BUILD_SOCIONEXT_DEVELOPERBOX
>   endef
>   
>   else ifeq ($(BR2_TARGET_EDK2_PLATFORM_SOLIDRUN_ARMADA80X0MCBIN),y)
> +EDK2_ARCH = AARCH64
>   EDK2_DEPENDENCIES += host-dtc arm-trusted-firmware
>   EDK2_PACKAGE_NAME = Platform/SolidRun/Armada80x0McBin
>   EDK2_PLATFORM_NAME = Armada80x0McBin
> @@ -111,6 +110,7 @@ EDK2_BUILD_ENV += DTC_PREFIX=$(HOST_DIR)/bin/
>   EDK2_BUILD_OPTS += -D INCLUDE_TFTP_COMMAND
>   
>   else ifeq ($(BR2_TARGET_EDK2_PLATFORM_QEMU_SBSA),y)
> +EDK2_ARCH = AARCH64
>   EDK2_DEPENDENCIES += arm-trusted-firmware
>   EDK2_PACKAGE_NAME = Platform/Qemu/SbsaQemu
>   EDK2_PLATFORM_NAME = SbsaQemu
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
