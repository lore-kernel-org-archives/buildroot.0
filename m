Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F35C54E69
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 10:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00C38415CA;
	Fri, 15 Mar 2024 10:38:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yi2Ad44yg0yi; Fri, 15 Mar 2024 10:38:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B229D415CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B229D415CF;
	Fri, 15 Mar 2024 10:38:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 57ED01BF976
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 10:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51EE6417F0
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 10:38:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JyOia_uf2Uur for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 10:38:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.130.47;
 helo=dd5108.kasserver.com; envelope-from=dev@andin.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 79853400CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79853400CE
Received: from dd5108.kasserver.com (dd5108.kasserver.com [85.13.130.47])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79853400CE
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 10:38:10 +0000 (UTC)
Received: from [192.168.178.43] (ipb21bd56e.dynamic.kabel-deutschland.de
 [178.27.213.110])
 by dd5108.kasserver.com (Postfix) with ESMTPSA id 15EAA5244ED1;
 Fri, 15 Mar 2024 11:38:07 +0100 (CET)
Message-ID: <089b0e6e-0050-4e8f-b7fb-249209bd33a3@andin.de>
Date: Fri, 15 Mar 2024 11:38:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230911061940.2392419-1-james.hilliard1@gmail.com>
From: Andreas Naumann <dev@andin.de>
In-Reply-To: <20230911061940.2392419-1-james.hilliard1@gmail.com>
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=andin.de; 
 s=kas202403131123; t=1710499087;
 bh=FI/V9pnIJQeADtX4GHJHHGXBcAhNGsxzyRD2Wy25Gho=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=mUmhADwfOQrRhls5j6ewEQ/WBIa369q1kKBwZ8myi6nA7sMfOu+LxKKN5h33YE9bA
 frsI1w/Vy6meS17uDeouROeSkFa1md8PSR1/PnxK04p8S+b+UKPqoDDcm4evoQit+Y
 RIGEavxn0fxRRNTNR9232qtnhqQ2vNN+9b3L+AlOK01I3e+zgnqCe47eMHCw+0mzOT
 JSHAAc8VyTEcHHfbb9qdJDqcfher8U47WR5R+ZEsAGxn1YbEbgTKv7rM6xaCYkjRo2
 p+Ged9UjXCwsiSyaQsk18T1fVzKmtCxwzwQwYgtpxoVp3LnzEK8MXeqRli00hVhi+5
 txa07oVtTRvZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=andin.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=andin.de header.i=@andin.de header.a=rsa-sha256
 header.s=kas202403131123 header.b=mUmhADwf
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot: add support for
 u-boot-initial-env install
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James, all,


Am 11.09.23 um 08:19 schrieb James Hilliard:
> This file is needed by libubootenv for fw_printenv/fw_setenv and
> library API's to function when the environment is empty.
> 
> See details:
> https://github.com/sbabic/libubootenv/tree/v0.3.4#replacement-old-tools
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   boot/uboot/Config.in | 7 +++++++
>   boot/uboot/uboot.mk  | 8 ++++++++
>   2 files changed, 15 insertions(+)

Another solution could be to automatically install it if libubootenv is
selected. But that might be a bit unforeseable magic. Not sure if this
is wanted.
To me it's good as is.

Reviewed-by: Andreas Naumann <anaumann@ultratronik.de>
Tested-by: Andreas Naumann <anaumann@ultratronik.de>
[compile-time tested with wandboard_defconfig]


> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 21f19db890..d7f2912ebc 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -506,6 +506,13 @@ config BR2_TARGET_UBOOT_SPL_NAME
>   	  and TPL name is tpl/u-boot-tpl.bin but not always. SPL name is
>   	  MLO on OMAP and SPL on i.MX6 for example.
>   
> +config BR2_TARGET_UBOOT_INITIAL_ENV
> +	bool "Install u-boot-initial-env"
> +	help
> +	  Install the U-Boot u-boot-initial-env on the target.
> +
> +	  This file is typically required by libubootenv.
> +
>   config BR2_TARGET_UBOOT_ZYNQMP
>   	bool "Boot on the Xilinx ZynqMP SoCs"
>   	depends on BR2_aarch64
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index dda606a880..491f654cec 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -138,6 +138,14 @@ UBOOT_MAKE_TARGET += u-boot.stm32
>   endif
>   endif
>   
> +ifeq ($(BR2_TARGET_UBOOT_INITIAL_ENV),y)
> +UBOOT_MAKE_TARGET += u-boot-initial-env
> +define UBOOT_INSTALL_UBOOT_INITIAL_ENV
> +	$(INSTALL) -D -m 0644 $(@D)/u-boot-initial-env $(TARGET_DIR)/etc/u-boot-initial-env
> +endef
> +UBOOT_POST_INSTALL_TARGET_HOOKS += UBOOT_INSTALL_UBOOT_INITIAL_ENV
> +endif
> +
>   ifeq ($(BR2_TARGET_UBOOT_FORMAT_CUSTOM),y)
>   UBOOT_BINS += $(call qstrip,$(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME))
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
