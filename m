Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CF5C25B78
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 20:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15AAC60EF2;
	Mon,  3 Jun 2024 20:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SGnunIManLCk; Mon,  3 Jun 2024 20:57:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 112E160871
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 112E160871;
	Mon,  3 Jun 2024 20:57:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 727941BF2B6
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 20:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D58E83143
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 20:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yew7ht_fOHG4 for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 20:57:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 20FD882003
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20FD882003
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20FD882003
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 20:57:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 70FAC13F88E;
 Mon,  3 Jun 2024 22:57:30 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jun 2024 22:57:30 +0200
Date: Mon, 3 Jun 2024 22:57:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <Zl4uOmS9qGg5S9rr@landeda>
References: <20240603115550.699332-1-peter@korsgaard.com>
 <20240603115550.699332-2-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240603115550.699332-2-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717448252;
 bh=aJVtRRFx+QJ2wCAVkiKG9p9ysNcaicvprhh0eTxK/6Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cawbBkK7m2Yj8/T5Hl9Mp4XTUVI4ZXMHYWSHVwbifkGEWHxgVUDlthglHrloVnCDV
 x+P3WpXp+YjwvBpQVsbvB8n/SGUGG2kuPnTkV3lP8tZVMlVbAM0JbKz507c0Ag94kz
 iWCYz1It3HLiUV2xY+3eR+lP5B/6XSXkJQlgdLC57KjuO/IX1tyAIth2XfsP2TVONI
 O2owRh83O8wsJBlJGVqitLEiahfaJ9n79OjYchD4a3hNiXvfM2cXL+m9IBJjSX1UJa
 O4kpyj403E+uVhWf2pu3hkvFJo8xq5FvUj0FZOBcZzfgc1Kz2SHqqzX7MSo0FbkFU2
 eUUAd6OnYXvIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cawbBkK7
Subject: Re: [Buildroot] [PATCH 2/2] boot/at91dataflashboot: remove package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2024-06-03 13:55 +0200, Peter Korsgaard spake thusly:
> At91dataflashboot is an ancient (2006) fork of at91bootstrap1 specifically
> for the Atmel/Microchip AT45 series (dataflash) of serial flashes.
> 
> The package hasn't seen any meaningful updates since, is not used by any
> defconfigs and at91bootstrap3 nowadays has AT45 support - So remove the
> package.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  Config.in.legacy                              |  6 +++
>  boot/Config.in                                |  1 -
>  .../0001-do-not-install.patch                 | 22 ----------
>  boot/at91dataflashboot/0002-eabi-fixes.patch  | 43 -------------------

    $ ./utils/docker-run make check-package
    .checkpackageignore:99: ignored file boot/at91dataflashboot/0001-do-not-install.patch is missing
    .checkpackageignore:100: ignored file boot/at91dataflashboot/0002-eabi-fixes.patch is missing

Applied to master with that fixed, thanks.

Regards,
Yann E. MORIN.

>  boot/at91dataflashboot/Config.in              |  3 --
>  boot/at91dataflashboot/at91dataflashboot.hash |  2 -
>  boot/at91dataflashboot/at91dataflashboot.mk   | 28 ------------
>  7 files changed, 6 insertions(+), 99 deletions(-)
>  delete mode 100644 boot/at91dataflashboot/0001-do-not-install.patch
>  delete mode 100644 boot/at91dataflashboot/0002-eabi-fixes.patch
>  delete mode 100644 boot/at91dataflashboot/Config.in
>  delete mode 100644 boot/at91dataflashboot/at91dataflashboot.hash
>  delete mode 100644 boot/at91dataflashboot/at91dataflashboot.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 7e5bc28bae..f0bff5191f 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -153,6 +153,12 @@ config BR2_TARGET_AT91BOOTSTRAP
>  	  Upstream for at91bootstrap 1.x is no longer available and
>  	  has been replaced by at91bootstrap3.
>  
> +config BR2_TARGET_AT91DATAFLASHBOOT
> +	bool "at91dataflashboot removed"
> +	select BR2_LEGACY
> +	help
> +	  at91dataflashboot has been replaced by at91bootstrap3.
> +
>  config BR2_PACKAGE_ON2_8170_MODULES
>  	bool "on2-8170-modules removed"
>  	select BR2_LEGACY
> diff --git a/boot/Config.in b/boot/Config.in
> index 3e00d28e56..14e0ca65fa 100644
> --- a/boot/Config.in
> +++ b/boot/Config.in
> @@ -2,7 +2,6 @@ menu "Bootloaders"
>  
>  source "boot/afboot-stm32/Config.in"
>  source "boot/at91bootstrap3/Config.in"
> -source "boot/at91dataflashboot/Config.in"
>  source "boot/arm-trusted-firmware/Config.in"
>  source "boot/barebox/Config.in"
>  source "boot/beaglev-ddrinit/Config.in"
> diff --git a/boot/at91dataflashboot/0001-do-not-install.patch b/boot/at91dataflashboot/0001-do-not-install.patch
> deleted file mode 100644
> index 41d97ad20e..0000000000
> --- a/boot/at91dataflashboot/0001-do-not-install.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Disable the automatic installation of at91dataflashboot since it tries
> -to install things to /tftpboot, which is not possible when not
> -building as root.
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ----
> - Makefile |    2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -Index: at91dataflashboot-1.05/Makefile
> -===================================================================
> ---- at91dataflashboot-1.05.orig/Makefile
> -+++ at91dataflashboot-1.05/Makefile
> -@@ -40,7 +40,7 @@
> - 
> - I=config.h com.h dataflash.h embedded_services.h main.h stdio.h include/AT91RM9200.h include/lib_AT91RM9200.h 
> - 
> --all: 	clean $(BINNAME) $(LSSNAME) install
> -+all: 	clean $(BINNAME) $(LSSNAME)
> - 	$(SIZE) $(OUTNAME)
> - 
> - # C objects here
> diff --git a/boot/at91dataflashboot/0002-eabi-fixes.patch b/boot/at91dataflashboot/0002-eabi-fixes.patch
> deleted file mode 100644
> index e38905f7cb..0000000000
> --- a/boot/at91dataflashboot/0002-eabi-fixes.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -Get at91dataflashboot to build with EABI toolchains, by providing the
> -__aeabi_uidiv and __aeabi_uidivmod symbols. The code is based on
> -U-Boot's code.
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ----
> - _udivsi3.S |   14 ++++++++++++++
> - 1 file changed, 14 insertions(+)
> -
> -Index: DataflashBoot-1.05/_udivsi3.S
> -===================================================================
> ---- DataflashBoot-1.05.orig/_udivsi3.S
> -+++ DataflashBoot-1.05/_udivsi3.S
> -@@ -12,8 +12,11 @@
> - 	.text
> - 	.globl	 __udivsi3
> - 	.type  __udivsi3       ,function
> -+        .globl  __aeabi_uidiv
> -+        .type   __aeabi_uidiv ,function
> - 	.align	0
> -  __udivsi3      :
> -+ __aeabi_uidiv:
> - 	cmp	divisor, #0
> - 	beq	Ldiv0
> - 	mov	curbit, #1
> -@@ -68,6 +71,17 @@
> - 	mov	r0, #0			@ about as wrong as it could be
> - 	ldmia	sp!, {pc}
> - 	.size  __udivsi3       , . -  __udivsi3
> -+
> -+.globl __aeabi_uidivmod
> -+__aeabi_uidivmod:
> -+
> -+        stmfd   sp!, {r0, r1, ip, lr}
> -+        bl      __aeabi_uidiv
> -+        ldmfd   sp!, {r1, r2, ip, lr}
> -+        mul     r3, r0, r2
> -+        sub     r1, r1, r3
> -+        mov     pc, lr
> -+
> - /* # 235 "libgcc1.S" */
> - /* # 320 "libgcc1.S" */
> - /* # 421 "libgcc1.S" */
> diff --git a/boot/at91dataflashboot/Config.in b/boot/at91dataflashboot/Config.in
> deleted file mode 100644
> index 8b37d84409..0000000000
> --- a/boot/at91dataflashboot/Config.in
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -config BR2_TARGET_AT91DATAFLASHBOOT
> -	bool "AT91 DataFlashBoot"
> -	depends on BR2_arm && BR2_arm926t
> diff --git a/boot/at91dataflashboot/at91dataflashboot.hash b/boot/at91dataflashboot/at91dataflashboot.hash
> deleted file mode 100644
> index 57df4e5389..0000000000
> --- a/boot/at91dataflashboot/at91dataflashboot.hash
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# locally computed
> -sha256  2cfeb6a9236e1a743c8010f05e504dbc92169ef42d9a6cf7948954a577bfc386  DataflashBoot-1.05.tar.bz2
> diff --git a/boot/at91dataflashboot/at91dataflashboot.mk b/boot/at91dataflashboot/at91dataflashboot.mk
> deleted file mode 100644
> index cb329a90df..0000000000
> --- a/boot/at91dataflashboot/at91dataflashboot.mk
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -################################################################################
> -#
> -# at91dataflashboot
> -#
> -################################################################################
> -
> -AT91DATAFLASHBOOT_VERSION = 1.05
> -AT91DATAFLASHBOOT_SOURCE = DataflashBoot-$(AT91DATAFLASHBOOT_VERSION).tar.bz2
> -AT91DATAFLASHBOOT_SITE = ftp://www.at91.com/pub/buildroot
> -
> -AT91DATAFLASHBOOT_INSTALL_TARGET = NO
> -AT91DATAFLASHBOOT_INSTALL_IMAGES = YES
> -
> -AT91DATAFLASHBOOT_CFLAGS = $(TARGET_CFLAGS) -fno-stack-protector
> -ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
> -AT91DATAFLASHBOOT_CFLAGS += -marm
> -endif
> -
> -define AT91DATAFLASHBOOT_BUILD_CMDS
> -	make -C $(@D) CROSS_COMPILE=$(TARGET_CROSS) \
> -		CFLAGS="$(AT91DATAFLASHBOOT_CFLAGS)"
> -endef
> -
> -define AT91DATAFLASHBOOT_INSTALL_IMAGES_CMDS
> -	cp $(@D)/DataflashBoot-$(AT91DATAFLASHBOOT_VERSION).bin $(BINARIES_DIR)
> -endef
> -
> -$(eval $(generic-package))
> -- 
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
