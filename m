Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF585C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 20:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C6C460704;
	Mon,  3 Jun 2024 20:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aNWaG--rN8gE; Mon,  3 Jun 2024 20:56:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE76A60EC8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE76A60EC8;
	Mon,  3 Jun 2024 20:56:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CAFBF1BF2B6
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 20:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8C2640959
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 20:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lZ2EuGzytGMz for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 20:56:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5762940947
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5762940947
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5762940947
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 20:56:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8837513F88D;
 Mon,  3 Jun 2024 22:56:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jun 2024 22:56:29 +0200
Date: Mon, 3 Jun 2024 22:56:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <Zl4t_UNUKVRYdYk7@landeda>
References: <20240603115550.699332-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240603115550.699332-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717448191;
 bh=iblVKyfQJqTKfd9WdMOfMQzudZcqUblkaG5q5jnT1yg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=POnahmyRuhcKQ4q5gryZwfAo36CGk03vcjDN7ksE9GAWnt5dnWysfQoP6NgfomMeK
 TXxc5h3waOx45V++kgSy9rfx8aIRmgWj4cyxhr7RCwqyxiufaPfUYa3tZDa7JfgMCi
 ZA6kELEKigM352Jb+Ir84BVOjiptHjaBOe8JlbVvkp8+swuqAoiQ1R5umHeluDjEKB
 EqfVEXRge0A9l/2GquXktCLF4IJvO5Uofrh5UqsoaCakw4UGuVLfvhwkj6xd2xtJ7Y
 avabTjWR27Us824ZJiPNkZtuOzCQgOTDhQzj9bsRGurHO9bmOC1q7sheqX6dIjna36
 pxiM0DahUQ9Ag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=POnahmyR
Subject: Re: [Buildroot] [PATCH 1/2] boot/at91bootstrap: remove package
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
> The upstream is no longer available, no defconfigs use it and the package
> has been replaced 12 years ago with at91bootstrap3 with commit ca0d69c61cc
> (at91bootstrap3: new package), so remove it.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  Config.in.legacy                              |   7 +
>  boot/Config.in                                |   1 -
>  boot/at91bootstrap/0001-eabi-fix.patch        | 334 ------------------
>  .../0002-gcc-4.6.x-ldscript-fix.patch         |  29 --
>  .../0003-u-boot-relocation-fix.patch          | 284 ---------------

    $ ./utils/docker-run make check-package
    .checkpackageignore:99: ignored file boot/at91bootstrap/0001-eabi-fix.patch is missing
    .checkpackageignore:100: ignored file boot/at91bootstrap/0002-gcc-4.6.x-ldscript-fix.patch is missing
    .checkpackageignore:101: ignored file boot/at91bootstrap/0003-u-boot-relocation-fix.patch is missing

Applied to master with that fixed, thanks.

Regards,
Yann E. MORIN.

>  boot/at91bootstrap/Config.in                  |  49 ---
>  boot/at91bootstrap/at91bootstrap.hash         |   3 -
>  boot/at91bootstrap/at91bootstrap.mk           |  55 ---
>  8 files changed, 7 insertions(+), 755 deletions(-)
>  delete mode 100644 boot/at91bootstrap/0001-eabi-fix.patch
>  delete mode 100644 boot/at91bootstrap/0002-gcc-4.6.x-ldscript-fix.patch
>  delete mode 100644 boot/at91bootstrap/0003-u-boot-relocation-fix.patch
>  delete mode 100644 boot/at91bootstrap/Config.in
>  delete mode 100644 boot/at91bootstrap/at91bootstrap.hash
>  delete mode 100644 boot/at91bootstrap/at91bootstrap.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index b5a87d4e88..7e5bc28bae 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>  
>  comment "Legacy options removed in 2024.05"
>  
> +config BR2_TARGET_AT91BOOTSTRAP
> +	bool "at91bootstrap removed"
> +	select BR2_LEGACY
> +	help
> +	  Upstream for at91bootstrap 1.x is no longer available and
> +	  has been replaced by at91bootstrap3.
> +
>  config BR2_PACKAGE_ON2_8170_MODULES
>  	bool "on2-8170-modules removed"
>  	select BR2_LEGACY
> diff --git a/boot/Config.in b/boot/Config.in
> index 87e1b7c00e..3e00d28e56 100644
> --- a/boot/Config.in
> +++ b/boot/Config.in
> @@ -1,7 +1,6 @@
>  menu "Bootloaders"
>  
>  source "boot/afboot-stm32/Config.in"
> -source "boot/at91bootstrap/Config.in"
>  source "boot/at91bootstrap3/Config.in"
>  source "boot/at91dataflashboot/Config.in"
>  source "boot/arm-trusted-firmware/Config.in"
> diff --git a/boot/at91bootstrap/0001-eabi-fix.patch b/boot/at91bootstrap/0001-eabi-fix.patch
> deleted file mode 100644
> index eab3c20928..0000000000
> --- a/boot/at91bootstrap/0001-eabi-fix.patch
> +++ /dev/null
> @@ -1,334 +0,0 @@
> -When using an EABI toolchain, the default compilation generates
> -references to __aeabi_unwind_cpp_pr0(). This symbol is defined in
> -libgcc, but we don't want to use it for a bootloader.
> -
> -Therefore, this patch passes some additional CFLAGS to disable the
> -generation of such references by avoiding unwind tables, exceptions,
> -etc.
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ----
> - board/at91cap9adk/dataflash/Makefile      |    2 +-
> - board/at91cap9adk/norflash/Makefile       |    2 +-
> - board/at91cap9stk/nandflash/Makefile      |    2 +-
> - board/at91sam9260ek/dataflash/Makefile    |    2 +-
> - board/at91sam9260ek/nandflash/Makefile    |    2 +-
> - board/at91sam9261ek/dataflash/Makefile    |    2 +-
> - board/at91sam9261ek/nandflash/Makefile    |    2 +-
> - board/at91sam9263ek/dataflash/Makefile    |    2 +-
> - board/at91sam9263ek/nandflash/Makefile    |    2 +-
> - board/at91sam9g10ek/dataflash/Makefile    |    2 +-
> - board/at91sam9g10ek/nandflash/Makefile    |    2 +-
> - board/at91sam9g20ek/dataflash/Makefile    |    2 +-
> - board/at91sam9g20ek/nandflash/Makefile    |    2 +-
> - board/at91sam9g45ekes/nandflash/Makefile  |    2 +-
> - board/at91sam9m10ekes/dataflash/Makefile  |    2 +-
> - board/at91sam9m10ekes/nandflash/Makefile  |    2 +-
> - board/at91sam9m10g45ek/dataflash/Makefile |    2 +-
> - board/at91sam9m10g45ek/nandflash/Makefile |    2 +-
> - board/at91sam9rlek/dataflash/Makefile     |    2 +-
> - board/at91sam9rlek/nandflash/Makefile     |    2 +-
> - board/at91sam9xeek/dataflash/Makefile     |    2 +-
> - board/at91sam9xeek/nandflash/Makefile     |    2 +-
> - lib/Makefile                              |    2 +-
> - 23 files changed, 23 insertions(+), 23 deletions(-)
> -
> -Index: Bootstrap-v1.16/board/at91cap9adk/dataflash/Makefile
> -===================================================================
> ---- Bootstrap-v1.16.orig/board/at91cap9adk/dataflash/Makefile
> -+++ Bootstrap-v1.16/board/at91cap9adk/dataflash/Makefile
> -@@ -34,7 +34,7 @@
> - SIZE=$(CROSS_COMPILE)size
> - OBJCOPY=$(CROSS_COMPILE)objcopy
> - OBJDUMP=$(CROSS_COMPILE)objdump
> --CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL)
> -+CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
> - ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
> - 
> - # Linker flags.
> -Index: Bootstrap-v1.16/board/at91cap9adk/norflash/Makefile
> -===================================================================
> ---- Bootstrap-v1.16.orig/board/at91cap9adk/norflash/Makefile
> -+++ Bootstrap-v1.16/board/at91cap9adk/norflash/Makefile
> -@@ -34,7 +34,7 @@
> - SIZE=$(CROSS_COMPILE)size
> - OBJCOPY=$(CROSS_COMPILE)objcopy
> - OBJDUMP=$(CROSS_COMPILE)objdump
> --CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL)
> -+CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
> - ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
> - 
> - # Linker flags.
> -Index: Bootstrap-v1.16/board/at91cap9stk/nandflash/Makefile
> -===================================================================
> ---- Bootstrap-v1.16.orig/board/at91cap9stk/nandflash/Makefile
> -+++ Bootstrap-v1.16/board/at91cap9stk/nandflash/Makefile
> -@@ -37,7 +37,7 @@
> - SIZE=$(CROSS_COMPILE)size
> - OBJCOPY=$(CROSS_COMPILE)objcopy
> - OBJDUMP=$(CROSS_COMPILE)objdump
> --CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL)
> -+CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
> - ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -D$(BOARD) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
> - 
> - 
> -Index: Bootstrap-v1.16/board/at91sam9260ek/dataflash/Makefile
> -===================================================================
> ---- Bootstrap-v1.16.orig/board/at91sam9260ek/dataflash/Makefile
> -+++ Bootstrap-v1.16/board/at91sam9260ek/dataflash/Makefile
> -@@ -37,7 +37,7 @@
> - SIZE=$(CROSS_COMPILE)size
> - OBJCOPY=$(CROSS_COMPILE)objcopy
> - OBJDUMP=$(CROSS_COMPILE)objdump
> --CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL)
> -+CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
> - ASFLAGS=-g -mcpu=arm926ej-s -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
> - 
> - # Linker flags.
> -Index: Bootstrap-v1.16/board/at91sam9260ek/nandflash/Makefile
> -===================================================================
> ---- Bootstrap-v1.16.orig/board/at91sam9260ek/nandflash/Makefile
> -+++ Bootstrap-v1.16/board/at91sam9260ek/nandflash/Makefile
> -@@ -37,7 +37,7 @@
> - SIZE=$(CROSS_COMPILE)size
> - OBJCOPY=$(CROSS_COMPILE)objcopy
> - OBJDUMP=$(CROSS_COMPILE)objdump
> --CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL)
> -+CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
> - ASFLAGS=-g -mcpu=arm926ej-s -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
> - 
> - # Linker flags.
> -Index: Bootstrap-v1.16/board/at91sam9261ek/dataflash/Makefile
> -===================================================================
> ---- Bootstrap-v1.16.orig/board/at91sam9261ek/dataflash/Makefile
> -+++ Bootstrap-v1.16/board/at91sam9261ek/dataflash/Makefile
> -@@ -37,7 +37,7 @@
> - SIZE=$(CROSS_COMPILE)size
> - OBJCOPY=$(CROSS_COMPILE)objcopy
> - OBJDUMP=$(CROSS_COMPILE)objdump
> --CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL)
> -+CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
> - ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
> - 
> - # Linker flags.
> -Index: Bootstrap-v1.16/board/at91sam9261ek/nandflash/Makefile
> -===================================================================
> ---- Bootstrap-v1.16.orig/board/at91sam9261ek/nandflash/Makefile
> -+++ Bootstrap-v1.16/board/at91sam9261ek/nandflash/Makefile
> -@@ -37,7 +37,7 @@
> - SIZE=$(CROSS_COMPILE)size
> - OBJCOPY=$(CROSS_COMPILE)objcopy
> - OBJDUMP=$(CROSS_COMPILE)objdump
> --CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL)
> -+CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
> - ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
> - 
> - # Linker flags.
> -Index: Bootstrap-v1.16/board/at91sam9263ek/dataflash/Makefile
> -===================================================================
> ---- Bootstrap-v1.16.orig/board/at91sam9263ek/dataflash/Makefile
> -+++ Bootstrap-v1.16/board/at91sam9263ek/dataflash/Makefile
> -@@ -34,7 +34,7 @@
> - SIZE=$(CROSS_COMPILE)size
> - OBJCOPY=$(CROSS_COMPILE)objcopy
> - OBJDUMP=$(CROSS_COMPILE)objdump
> --CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL)
> -+CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
> - ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
> - 
> - # Linker flags.
> -Index: Bootstrap-v1.16/board/at91sam9263ek/nandflash/Makefile
> -===================================================================
> ---- Bootstrap-v1.16.orig/board/at91sam9263ek/nandflash/Makefile
> -+++ Bootstrap-v1.16/board/at91sam9263ek/nandflash/Makefile
> -@@ -33,7 +33,7 @@
> - SIZE=$(CROSS_COMPILE)size
> - OBJCOPY=$(CROSS_COMPILE)objcopy
> - OBJDUMP=$(CROSS_COMPILE)objdump
> --CCFLAGS=-g -mcpu=arm9 -O0 -Wall -D$(TARGET) -I$(INCL)
> -+CCFLAGS=-g -mcpu=arm9 -O0 -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
> - ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
> - 
> - # Linker flags.
> -Index: Bootstrap-v1.16/board/at91sam9g10ek/dataflash/Makefile
> -===================================================================
> ---- Bootstrap-v1.16.orig/board/at91sam9g10ek/dataflash/Makefile
> -+++ Bootstrap-v1.16/board/at91sam9g10ek/dataflash/Makefile
> -@@ -37,7 +37,7 @@
> - SIZE=$(CROSS_COMPILE)size
> - OBJCOPY=$(CROSS_COMPILE)objcopy
> - OBJDUMP=$(CROSS_COMPILE)objdump
> --CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL)
> -+CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
> - ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
> - 
> - # Linker flags.
> -Index: Bootstrap-v1.16/board/at91sam9g10ek/nandflash/Makefile
> -===================================================================
> ---- Bootstrap-v1.16.orig/board/at91sam9g10ek/nandflash/Makefile
> -+++ Bootstrap-v1.16/board/at91sam9g10ek/nandflash/Makefile
> -@@ -37,7 +37,7 @@
> - SIZE=$(CROSS_COMPILE)size
> - OBJCOPY=$(CROSS_COMPILE)objcopy
> - OBJDUMP=$(CROSS_COMPILE)objdump
> --CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL)
> -+CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
> - ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
> - 
> - # Linker flags.
> -Index: Bootstrap-v1.16/board/at91sam9g20ek/dataflash/Makefile
> -===================================================================
> ---- Bootstrap-v1.16.orig/board/at91sam9g20ek/dataflash/Makefile
> -+++ Bootstrap-v1.16/board/at91sam9g20ek/dataflash/Makefile
> -@@ -37,7 +37,7 @@
> - SIZE=$(CROSS_COMPILE)size
> - OBJCOPY=$(CROSS_COMPILE)objcopy
> - OBJDUMP=$(CROSS_COMPILE)objdump
> --CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL)
> -+CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
> - ASFLAGS=-g -mcpu=arm926ej-s -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
> - 
> - # Linker flags.
> -Index: Bootstrap-v1.16/board/at91sam9g20ek/nandflash/Makefile
> -===================================================================
> ---- Bootstrap-v1.16.orig/board/at91sam9g20ek/nandflash/Makefile
> -+++ Bootstrap-v1.16/board/at91sam9g20ek/nandflash/Makefile
> -@@ -37,7 +37,7 @@
> - SIZE=$(CROSS_COMPILE)size
> - OBJCOPY=$(CROSS_COMPILE)objcopy
> - OBJDUMP=$(CROSS_COMPILE)objdump
> --CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL)
> -+CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
> - ASFLAGS=-g -mcpu=arm926ej-s -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
> - 
> - # Linker flags.
> -Index: Bootstrap-v1.16/board/at91sam9g45ekes/nandflash/Makefile
> -===================================================================
> ---- Bootstrap-v1.16.orig/board/at91sam9g45ekes/nandflash/Makefile
> -+++ Bootstrap-v1.16/board/at91sam9g45ekes/nandflash/Makefile
> -@@ -37,7 +37,7 @@
> - SIZE=$(CROSS_COMPILE)size
> - OBJCOPY=$(CROSS_COMPILE)objcopy
> - OBJDUMP=$(CROSS_COMPILE)objdump
> --CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL)
> -+CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
> - ASFLAGS=-g -mcpu=arm926ej-s -c -O2 -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
> - 
> - # Linker flags.
> -Index: Bootstrap-v1.16/board/at91sam9m10ekes/dataflash/Makefile
> -===================================================================
> ---- Bootstrap-v1.16.orig/board/at91sam9m10ekes/dataflash/Makefile
> -+++ Bootstrap-v1.16/board/at91sam9m10ekes/dataflash/Makefile
> -@@ -37,7 +37,7 @@
> - SIZE=$(CROSS_COMPILE)size
> - OBJCOPY=$(CROSS_COMPILE)objcopy
> - OBJDUMP=$(CROSS_COMPILE)objdump
> --CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL)
> -+CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
> - ASFLAGS=-g -mcpu=arm926ej-s -c -O2 -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
> - 
> - # Linker flags.
> -Index: Bootstrap-v1.16/board/at91sam9m10ekes/nandflash/Makefile
> -===================================================================
> ---- Bootstrap-v1.16.orig/board/at91sam9m10ekes/nandflash/Makefile
> -+++ Bootstrap-v1.16/board/at91sam9m10ekes/nandflash/Makefile
> -@@ -37,7 +37,7 @@
> - SIZE=$(CROSS_COMPILE)size
> - OBJCOPY=$(CROSS_COMPILE)objcopy
> - OBJDUMP=$(CROSS_COMPILE)objdump
> --CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL)
> -+CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
> - ASFLAGS=-g -mcpu=arm926ej-s -c -O2 -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
> - 
> - # Linker flags.
> -Index: Bootstrap-v1.16/board/at91sam9m10g45ek/dataflash/Makefile
> -===================================================================
> ---- Bootstrap-v1.16.orig/board/at91sam9m10g45ek/dataflash/Makefile
> -+++ Bootstrap-v1.16/board/at91sam9m10g45ek/dataflash/Makefile
> -@@ -37,7 +37,7 @@
> - SIZE=$(CROSS_COMPILE)size
> - OBJCOPY=$(CROSS_COMPILE)objcopy
> - OBJDUMP=$(CROSS_COMPILE)objdump
> --CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL)
> -+CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
> - ASFLAGS=-g -mcpu=arm926ej-s -c -O2 -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
> - 
> - # Linker flags.
> -Index: Bootstrap-v1.16/board/at91sam9m10g45ek/nandflash/Makefile
> -===================================================================
> ---- Bootstrap-v1.16.orig/board/at91sam9m10g45ek/nandflash/Makefile
> -+++ Bootstrap-v1.16/board/at91sam9m10g45ek/nandflash/Makefile
> -@@ -37,7 +37,7 @@
> - SIZE=$(CROSS_COMPILE)size
> - OBJCOPY=$(CROSS_COMPILE)objcopy
> - OBJDUMP=$(CROSS_COMPILE)objdump
> --CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL)
> -+CCFLAGS=-g -mcpu=arm926ej-s -O2 -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
> - ASFLAGS=-g -mcpu=arm926ej-s -c -O2 -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
> - 
> - # Linker flags.
> -Index: Bootstrap-v1.16/board/at91sam9rlek/dataflash/Makefile
> -===================================================================
> ---- Bootstrap-v1.16.orig/board/at91sam9rlek/dataflash/Makefile
> -+++ Bootstrap-v1.16/board/at91sam9rlek/dataflash/Makefile
> -@@ -37,7 +37,7 @@
> - SIZE=$(CROSS_COMPILE)size
> - OBJCOPY=$(CROSS_COMPILE)objcopy
> - OBJDUMP=$(CROSS_COMPILE)objdump
> --CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL)
> -+CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
> - ASFLAGS=-g -mcpu=arm926ej-s -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
> - 
> - # Linker flags.
> -Index: Bootstrap-v1.16/board/at91sam9rlek/nandflash/Makefile
> -===================================================================
> ---- Bootstrap-v1.16.orig/board/at91sam9rlek/nandflash/Makefile
> -+++ Bootstrap-v1.16/board/at91sam9rlek/nandflash/Makefile
> -@@ -37,7 +37,7 @@
> - SIZE=$(CROSS_COMPILE)size
> - OBJCOPY=$(CROSS_COMPILE)objcopy
> - OBJDUMP=$(CROSS_COMPILE)objdump
> --CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL)
> -+CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
> - ASFLAGS=-g -mcpu=arm926ej-s -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
> - 
> - # Linker flags.
> -Index: Bootstrap-v1.16/board/at91sam9xeek/dataflash/Makefile
> -===================================================================
> ---- Bootstrap-v1.16.orig/board/at91sam9xeek/dataflash/Makefile
> -+++ Bootstrap-v1.16/board/at91sam9xeek/dataflash/Makefile
> -@@ -38,7 +38,7 @@
> - SIZE=$(CROSS_COMPILE)size
> - OBJCOPY=$(CROSS_COMPILE)objcopy
> - OBJDUMP=$(CROSS_COMPILE)objdump
> --CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL)
> -+CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
> - ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
> - 
> - # Linker flags.
> -Index: Bootstrap-v1.16/board/at91sam9xeek/nandflash/Makefile
> -===================================================================
> ---- Bootstrap-v1.16.orig/board/at91sam9xeek/nandflash/Makefile
> -+++ Bootstrap-v1.16/board/at91sam9xeek/nandflash/Makefile
> -@@ -38,7 +38,7 @@
> - SIZE=$(CROSS_COMPILE)size
> - OBJCOPY=$(CROSS_COMPILE)objcopy
> - OBJDUMP=$(CROSS_COMPILE)objdump
> --CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL)
> -+CCFLAGS=-g -mcpu=arm9 -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
> - ASFLAGS=-g -mcpu=arm9 -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
> - 
> - # Linker flags.
> -Index: Bootstrap-v1.16/lib/Makefile
> -===================================================================
> ---- Bootstrap-v1.16.orig/lib/Makefile
> -+++ Bootstrap-v1.16/lib/Makefile
> -@@ -37,7 +37,7 @@
> - SIZE=$(CROSS_COMPILE)size
> - OBJCOPY=$(CROSS_COMPILE)objcopy
> - OBJDUMP=$(CROSS_COMPILE)objdump
> --CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL)
> -+CCFLAGS=-g -mcpu=arm926ej-s -Os -Wall -D$(TARGET) -I$(INCL) -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables
> - ASFLAGS=-g -mcpu=arm926ej-s -c -Os -Wall -D$(TARGET) -I$(INCL) -DTOP_OF_MEM=$(TOP_OF_MEMORY)
> - 
> - # Linker flags.
> diff --git a/boot/at91bootstrap/0002-gcc-4.6.x-ldscript-fix.patch b/boot/at91bootstrap/0002-gcc-4.6.x-ldscript-fix.patch
> deleted file mode 100644
> index e4ed04e865..0000000000
> --- a/boot/at91bootstrap/0002-gcc-4.6.x-ldscript-fix.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From b783d1f9bf985c0981e755bd2c13e091e9d6837f Mon Sep 17 00:00:00 2001
> -From: Gregory Hermant <gregory.hermant@calao-systems.com>
> -Date: Tue, 6 Nov 2012 09:38:50 +0100
> -Subject: [PATCH] at91bootstrap: fix overlap linker issue
> -
> -The linker script of the at91bootstrap package has to be modified when
> -built from gcc-4.6.x version. Indeed a section named text.startup is
> -created and has to be added into the text section.
> -
> -Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
> ----
> - elf32-littlearm.lds |    1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/elf32-littlearm.lds b/elf32-littlearm.lds
> -index a33952f..4f3ba25 100644
> ---- a/elf32-littlearm.lds
> -+++ b/elf32-littlearm.lds
> -@@ -7,6 +7,7 @@ SECTIONS
> - 	.text : { 
> - 		_stext = .;
> - 		*(.text)
> -+		*(.text*)
> - 		*(.rodata)                 /* read-only data (constants) */
> - 		*(.rodata*)
> - 		. = ALIGN(4);
> --- 
> -1.7.9.5
> -
> diff --git a/boot/at91bootstrap/0003-u-boot-relocation-fix.patch b/boot/at91bootstrap/0003-u-boot-relocation-fix.patch
> deleted file mode 100644
> index 0c9b9114cb..0000000000
> --- a/boot/at91bootstrap/0003-u-boot-relocation-fix.patch
> +++ /dev/null
> @@ -1,284 +0,0 @@
> -From d4e4a1aad559e35d84b445d1379be94ad036984e Mon Sep 17 00:00:00 2001
> -From: Alexandre Belloni <alexandre.belloni@piout.net>
> -Date: Thu, 25 Oct 2012 22:57:14 +0200
> -Subject: [PATCH] u-boot relocation fix
> -
> -Every AT91SAM plaforms were broken between 2010.12 and 2011.03 because
> -of the relocation changes.
> -
> -We have to get JUMP_ADDR consistant with what is used by u-boot
> -(CONFIG_SYS_TEXT_BASE).
> -
> -I didn't know what to do with at91sam9m10g45ek as it doesn't seems to be
> -converted yet. But anyway, that means that it is either not working or
> -doesn't care so changing it here shouldn't harm.
> -
> -We also have to increase the IMG_SIZE as u-boot as grown larger than the
> -default value. As requested on the u-boot ML, we assume that it could
> -be up to 495kB big.
> -
> -It means that now, you have to flash your kernel at 0x00084000 instead
> -of 0x00042000. And so you also have to load it from that adress from
> -u-boot.
> -
> -Then, remember that you could decrease IMG_SIZE to boot faster.
> -
> -Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>
> ----
> - board/at91sam9260ek/dataflash/at91sam9260ek.h      |    4 ++--
> - board/at91sam9260ek/nandflash/at91sam9260ek.h      |    2 +-
> - board/at91sam9261ek/dataflash/at91sam9261ek.h      |    4 ++--
> - board/at91sam9261ek/nandflash/at91sam9261ek.h      |    2 +-
> - board/at91sam9263ek/dataflash/at91sam9263ek.h      |    4 ++--
> - board/at91sam9263ek/nandflash/at91sam9263ek.h      |    2 +-
> - board/at91sam9g10ek/dataflash/at91sam9g10ek.h      |    4 ++--
> - board/at91sam9g10ek/nandflash/at91sam9g10ek.h      |    2 +-
> - board/at91sam9g20ek/dataflash/at91sam9g20ek.h      |    4 ++--
> - board/at91sam9g20ek/nandflash/at91sam9g20ek.h      |    2 +-
> - board/at91sam9m10ekes/dataflash/at91sam9m10ekes.h  |    2 +-
> - .../at91sam9m10g45ek/dataflash/at91sam9m10g45ek.h  |    2 +-
> - board/at91sam9rlek/dataflash/at91sam9rlek.h        |    4 ++--
> - board/at91sam9rlek/nandflash/at91sam9rlek.h        |    2 +-
> - board/at91sam9xeek/dataflash/at91sam9xeek.h        |    4 ++--
> - board/at91sam9xeek/nandflash/at91sam9xeek.h        |    2 +-
> - 16 files changed, 23 insertions(+), 23 deletions(-)
> -
> -diff --git a/board/at91sam9260ek/dataflash/at91sam9260ek.h b/board/at91sam9260ek/dataflash/at91sam9260ek.h
> -index 1834246..91081a1 100644
> ---- a/board/at91sam9260ek/dataflash/at91sam9260ek.h
> -+++ b/board/at91sam9260ek/dataflash/at91sam9260ek.h
> -@@ -74,10 +74,10 @@
> - #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS1_DATAFLASH	/* Boot on SPI NCS0 */
> - 
> - #define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
> --#define	IMG_SIZE		0x33900			/* Image Size in DataFlash    */
> -+#define	IMG_SIZE		0x7BC00			/* Image Size in DataFlash    */
> - 
> - #define MACH_TYPE       0x44B       /* AT91SAM9260-EK */
> --#define JUMP_ADDR		0x23F00000		/* Final Jump Address 	      */
> -+#define JUMP_ADDR		0x21F00000		/* Final Jump Address 	      */
> - 
> - /* ******************************************************************* */
> - /* Application Settings                                                */
> -diff --git a/board/at91sam9260ek/nandflash/at91sam9260ek.h b/board/at91sam9260ek/nandflash/at91sam9260ek.h
> -index 2cac601..f8fdff2 100644
> ---- a/board/at91sam9260ek/nandflash/at91sam9260ek.h
> -+++ b/board/at91sam9260ek/nandflash/at91sam9260ek.h
> -@@ -92,7 +92,7 @@
> - #define	IMG_SIZE		0x40000		/* Image Size in NandFlash    */
> - 
> - #define MACH_TYPE       	0x44B		/* AT91SAM9260-EK */
> --#define JUMP_ADDR		0x23F00000	/* Final Jump Address 	      */
> -+#define JUMP_ADDR		0x21F00000	/* Final Jump Address 	      */
> - 
> - /* ******************************************************************* */
> - /* Application Settings                                                */
> -diff --git a/board/at91sam9261ek/dataflash/at91sam9261ek.h b/board/at91sam9261ek/dataflash/at91sam9261ek.h
> -index 8ce30e9..276ba3d 100644
> ---- a/board/at91sam9261ek/dataflash/at91sam9261ek.h
> -+++ b/board/at91sam9261ek/dataflash/at91sam9261ek.h
> -@@ -97,10 +97,10 @@
> - #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS0_DATAFLASH	/* Boot on SPI NCS0 */
> - 
> - #define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
> --#define	IMG_SIZE		0x33900			/* Image Size in DataFlash    */
> -+#define	IMG_SIZE		0x7BC00			/* Image Size in DataFlash    */
> - 
> - #define MACH_TYPE       0x350       /* AT91SAM9261-EK */
> --#define JUMP_ADDR		0x23F00000		/* Final Jump Address 	      */
> -+#define JUMP_ADDR		0x21F00000		/* Final Jump Address 	      */
> - 
> - /* ******************************************************************* */
> - /* Application Settings                                                */
> -diff --git a/board/at91sam9261ek/nandflash/at91sam9261ek.h b/board/at91sam9261ek/nandflash/at91sam9261ek.h
> -index badc3ac..e628c97 100644
> ---- a/board/at91sam9261ek/nandflash/at91sam9261ek.h
> -+++ b/board/at91sam9261ek/nandflash/at91sam9261ek.h
> -@@ -114,7 +114,7 @@
> - #define	IMG_SIZE		0x40000		/* Image Size in NandFlash    */
> - 
> - #define MACH_TYPE       	0x350		/* AT91SAM9261-EK */
> --#define JUMP_ADDR		0x23F00000	/* Final Jump Address 	      */
> -+#define JUMP_ADDR		0x21F00000	/* Final Jump Address 	      */
> - 
> - /* ******************************************************************* */
> - /* Application Settings                                                */
> -diff --git a/board/at91sam9263ek/dataflash/at91sam9263ek.h b/board/at91sam9263ek/dataflash/at91sam9263ek.h
> -index 5c9da4b..870f9e2 100644
> ---- a/board/at91sam9263ek/dataflash/at91sam9263ek.h
> -+++ b/board/at91sam9263ek/dataflash/at91sam9263ek.h
> -@@ -96,10 +96,10 @@
> - #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS0_DATAFLASH	/* Boot on SPI NCS0 */
> - 
> - #define IMG_ADDRESS 			0x8400			/* Image Address in DataFlash */
> --#define	IMG_SIZE			0x33900			/* Image Size in DataFlash    */
> -+#define	IMG_SIZE			0x7BC00			/* Image Size in DataFlash    */
> - 
> - #define MACH_TYPE       		0x4B2       		/* AT91SAM9263-EK */
> --#define JUMP_ADDR			0x23F00000		/* Final Jump Address 	      */
> -+#define JUMP_ADDR			0x21F00000		/* Final Jump Address 	      */
> - 
> - /* ******************************************************************* */
> - /* Application Settings                                                */
> -diff --git a/board/at91sam9263ek/nandflash/at91sam9263ek.h b/board/at91sam9263ek/nandflash/at91sam9263ek.h
> -index 505afc7..8ab4f46 100644
> ---- a/board/at91sam9263ek/nandflash/at91sam9263ek.h
> -+++ b/board/at91sam9263ek/nandflash/at91sam9263ek.h
> -@@ -108,7 +108,7 @@
> - #define	IMG_SIZE	0x40000		/* Image Size in NandFlash    */
> - 
> - #define MACH_TYPE       1202       	/* AT91SAM9263-EK */
> --#define JUMP_ADDR	0x23F00000	/* Final Jump Address 	      */
> -+#define JUMP_ADDR	0x21F00000	/* Final Jump Address 	      */
> - 
> - /* ******************************************************************* */
> - /* Application Settings                                                */
> -diff --git a/board/at91sam9g10ek/dataflash/at91sam9g10ek.h b/board/at91sam9g10ek/dataflash/at91sam9g10ek.h
> -index b2faf44..f4f556b 100644
> ---- a/board/at91sam9g10ek/dataflash/at91sam9g10ek.h
> -+++ b/board/at91sam9g10ek/dataflash/at91sam9g10ek.h
> -@@ -98,10 +98,10 @@
> - #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS0_DATAFLASH	/* Boot on SPI NCS0 */
> - 
> - #define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
> --#define	IMG_SIZE		0x33900			/* Image Size in DataFlash    */
> -+#define	IMG_SIZE		0x7BC00			/* Image Size in DataFlash    */
> - 
> - #define MACH_TYPE       0x350       /* AT91SAM9261-EK */
> --#define JUMP_ADDR		0x23F00000		/* Final Jump Address 	      */
> -+#define JUMP_ADDR		0x21F00000		/* Final Jump Address 	      */
> - 
> - /* ******************************************************************* */
> - /* Application Settings                                                */
> -diff --git a/board/at91sam9g10ek/nandflash/at91sam9g10ek.h b/board/at91sam9g10ek/nandflash/at91sam9g10ek.h
> -index 66c40a3..6c3ecda 100644
> ---- a/board/at91sam9g10ek/nandflash/at91sam9g10ek.h
> -+++ b/board/at91sam9g10ek/nandflash/at91sam9g10ek.h
> -@@ -115,7 +115,7 @@
> - #define	IMG_SIZE		0x40000		/* Image Size in NandFlash    */
> - 
> - #define MACH_TYPE       	0x350		/* AT91SAM9G10-EK */
> --#define JUMP_ADDR		0x23F00000	/* Final Jump Address 	      */
> -+#define JUMP_ADDR		0x21F00000	/* Final Jump Address 	      */
> - 
> - /* ******************************************************************* */
> - /* Application Settings                                                */
> -diff --git a/board/at91sam9g20ek/dataflash/at91sam9g20ek.h b/board/at91sam9g20ek/dataflash/at91sam9g20ek.h
> -index eea0439..7fc70d6 100644
> ---- a/board/at91sam9g20ek/dataflash/at91sam9g20ek.h
> -+++ b/board/at91sam9g20ek/dataflash/at91sam9g20ek.h
> -@@ -75,10 +75,10 @@
> - #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS1_DATAFLASH	/* Boot on SPI NCS1 */
> - 
> - #define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
> --#define	IMG_SIZE		0x33900			/* Image Size in DataFlash */
> -+#define	IMG_SIZE		0x7BC00			/* Image Size in DataFlash */
> - 
> - #define MACH_TYPE		0x658			/* AT91SAM9G20-EK */
> --#define JUMP_ADDR		0x23F00000		/* Final Jump Address */
> -+#define JUMP_ADDR		0x21F00000		/* Final Jump Address */
> - 
> - /* ******************************************************************* */
> - /* Application Settings                                                */
> -diff --git a/board/at91sam9g20ek/nandflash/at91sam9g20ek.h b/board/at91sam9g20ek/nandflash/at91sam9g20ek.h
> -index 31bd499..e797e4d 100644
> ---- a/board/at91sam9g20ek/nandflash/at91sam9g20ek.h
> -+++ b/board/at91sam9g20ek/nandflash/at91sam9g20ek.h
> -@@ -93,7 +93,7 @@
> - #define	IMG_SIZE		0x40000			/* Image Size in NandFlash */
> - 
> - #define MACH_TYPE		0x658			/* AT91SAM9G20-EK */
> --#define JUMP_ADDR		0x23F00000		/* Final Jump Address */
> -+#define JUMP_ADDR		0x21F00000		/* Final Jump Address */
> - 
> - /* ******************************************************************* */
> - /* Application Settings                                                */
> -diff --git a/board/at91sam9m10ekes/dataflash/at91sam9m10ekes.h b/board/at91sam9m10ekes/dataflash/at91sam9m10ekes.h
> -index a60fd41..5587a00 100644
> ---- a/board/at91sam9m10ekes/dataflash/at91sam9m10ekes.h
> -+++ b/board/at91sam9m10ekes/dataflash/at91sam9m10ekes.h
> -@@ -89,7 +89,7 @@
> - #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS0_DATAFLASH	/* Boot on SPI NCS0 */
> - 
> - #define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
> --#define	IMG_SIZE		0x33900			/* Image Size in DataFlash */
> -+#define	IMG_SIZE		0x7BC00			/* Image Size in DataFlash */
> - 
> - #define MACH_TYPE		0x9CD			/* AT91SAM9M10-EKES */
> - #define JUMP_ADDR		0x73F00000		/* Final Jump Address */
> -diff --git a/board/at91sam9m10g45ek/dataflash/at91sam9m10g45ek.h b/board/at91sam9m10g45ek/dataflash/at91sam9m10g45ek.h
> -index 5c726b5..9090097 100644
> ---- a/board/at91sam9m10g45ek/dataflash/at91sam9m10g45ek.h
> -+++ b/board/at91sam9m10g45ek/dataflash/at91sam9m10g45ek.h
> -@@ -85,7 +85,7 @@
> - #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS0_DATAFLASH	/* Boot on SPI NCS0 */
> - 
> - #define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
> --#define	IMG_SIZE		0x33900			/* Image Size in DataFlash */
> -+#define	IMG_SIZE		0x7BC00			/* Image Size in DataFlash */
> - 
> - #define MACH_TYPE		0x726			/* AT91SAM9M10G45-EK */
> - #define JUMP_ADDR		0x73F00000		/* Final Jump Address */
> -diff --git a/board/at91sam9rlek/dataflash/at91sam9rlek.h b/board/at91sam9rlek/dataflash/at91sam9rlek.h
> -index 05c42dc..150f17e 100644
> ---- a/board/at91sam9rlek/dataflash/at91sam9rlek.h
> -+++ b/board/at91sam9rlek/dataflash/at91sam9rlek.h
> -@@ -89,10 +89,10 @@
> - #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS0_DATAFLASH	/* Boot on SPI NCS0 */
> - 
> - #define IMG_ADDRESS 	0x8400		/* Image Address in DataFlash */
> --#define	IMG_SIZE	0x33900		/* Image Size in DataFlash    */
> -+#define	IMG_SIZE	0x7BC00		/* Image Size in DataFlash    */
> - 
> - #define MACH_TYPE       1326       	/* AT91SAM9RL-EK */
> --#define JUMP_ADDR	0x23F00000	/* Final Jump Address 	      */
> -+#define JUMP_ADDR	0x21F00000	/* Final Jump Address 	      */
> - 
> - /* ******************************************************************* */
> - /* Application Settings                                                */
> -diff --git a/board/at91sam9rlek/nandflash/at91sam9rlek.h b/board/at91sam9rlek/nandflash/at91sam9rlek.h
> -index 656b4ba..594db8f 100644
> ---- a/board/at91sam9rlek/nandflash/at91sam9rlek.h
> -+++ b/board/at91sam9rlek/nandflash/at91sam9rlek.h
> -@@ -112,7 +112,7 @@
> - #define	IMG_SIZE		0x40000		/* Image Size in NandFlash    */
> - 
> - #define MACH_TYPE       1326       		/* AT91SAM9RL-EK */
> --#define JUMP_ADDR		0x23F00000	/* Final Jump Address 	      */
> -+#define JUMP_ADDR		0x21F00000	/* Final Jump Address 	      */
> - 
> - /* ******************************************************************* */
> - /* Application Settings                                                */
> -diff --git a/board/at91sam9xeek/dataflash/at91sam9xeek.h b/board/at91sam9xeek/dataflash/at91sam9xeek.h
> -index 27d1822..08e515d 100644
> ---- a/board/at91sam9xeek/dataflash/at91sam9xeek.h
> -+++ b/board/at91sam9xeek/dataflash/at91sam9xeek.h
> -@@ -74,10 +74,10 @@
> - #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS1_DATAFLASH	/* Boot on SPI NCS1 */
> - 
> - #define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
> --#define	IMG_SIZE		0x33900			/* Image Size in DataFlash    */
> -+#define	IMG_SIZE		0x7BC00			/* Image Size in DataFlash    */
> - 
> - #define MACH_TYPE		0x44B			/* AT91SAM9XE-EK same id as AT91SAM9260-EK*/
> --#define JUMP_ADDR		0x23F00000		/* Final Jump Address 	      */
> -+#define JUMP_ADDR		0x21F00000		/* Final Jump Address 	      */
> - 
> - /* ******************************************************************* */
> - /* Application Settings                                                */
> -diff --git a/board/at91sam9xeek/nandflash/at91sam9xeek.h b/board/at91sam9xeek/nandflash/at91sam9xeek.h
> -index 5dbc63e..9fac7cb 100644
> ---- a/board/at91sam9xeek/nandflash/at91sam9xeek.h
> -+++ b/board/at91sam9xeek/nandflash/at91sam9xeek.h
> -@@ -94,7 +94,7 @@
> - #define	IMG_SIZE		0x40000		/* Image Size in NandFlash    */
> - 
> - #define MACH_TYPE		0x44B			/* AT91SAM9XE-EK same id as AT91SAM9260-EK*/
> --#define JUMP_ADDR		0x23F00000		/* Final Jump Address 	      */
> -+#define JUMP_ADDR		0x21F00000		/* Final Jump Address 	      */
> - 
> - /* ******************************************************************* */
> - /* Application Settings                                                */
> --- 
> -1.7.9.5
> -
> diff --git a/boot/at91bootstrap/Config.in b/boot/at91bootstrap/Config.in
> deleted file mode 100644
> index 0f6430fd8d..0000000000
> --- a/boot/at91bootstrap/Config.in
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -config BR2_TARGET_AT91BOOTSTRAP
> -	bool "AT91 Bootstrap"
> -	depends on BR2_arm926t
> -	help
> -	  AT91Bootstrap is a first level bootloader for the Atmel AT91
> -	  devices. It integrates algorithms for:
> -	  - Device initialization such as clock configuration, PIO
> -	    settings...
> -	  - Peripheral drivers such as PIO, PMC or SDRAMC...
> -	  - Physical media algorithm such as DataFlash, NandFlash, NOR
> -	    Flash...
> -
> -if	BR2_TARGET_AT91BOOTSTRAP
> -
> -config BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR
> -	string "custom patch dir"
> -	help
> -	  If your board requires custom patches, add the path to the
> -	  directory containing the patches here. The patches must be
> -	  named at91bootstrap-<version>-<something>.patch.
> -
> -	  Most users may leave this empty
> -
> -config BR2_TARGET_AT91BOOTSTRAP_BOARD
> -	string "Bootstrap board"
> -	default ""
> -	help
> -	  This is used to do a make <board>_config
> -
> -choice
> -	prompt "Boot Memory"
> -	default BR2_TARGET_AT91BOOTSTRAP_DATAFLASH
> -	help
> -	  Select Chip for which AT91 bootstrap should be built
> -
> -config BR2_TARGET_AT91BOOTSTRAP_DATAFLASH
> -	bool "Data Flash"
> -
> -config BR2_TARGET_AT91BOOTSTRAP_NANDFLASH
> -	bool "NAND Flash"
> -
> -endchoice
> -
> -config BR2_TARGET_AT91BOOTSTRAP_MEMORY
> -	string
> -	default	"dataflash"	if	BR2_TARGET_AT91BOOTSTRAP_DATAFLASH
> -	default	"nandflash"	if	BR2_TARGET_AT91BOOTSTRAP_NANDFLASH
> -
> -endif
> diff --git a/boot/at91bootstrap/at91bootstrap.hash b/boot/at91bootstrap/at91bootstrap.hash
> deleted file mode 100644
> index d9f8db8897..0000000000
> --- a/boot/at91bootstrap/at91bootstrap.hash
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# locally computed
> -sha256  d66192a274247f4baa39fa932eadf903d7add55641d89d30402f967c4f2282a5  AT91Bootstrap1.16.zip
> -sha256  6a3ac5dfcf19e6bac1b1109d30d72818768a3855e2594b84fe2b012b5fe0e77b  include/sdramc.h
> diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
> deleted file mode 100644
> index 385957b5d4..0000000000
> --- a/boot/at91bootstrap/at91bootstrap.mk
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -################################################################################
> -#
> -# at91bootstrap
> -#
> -################################################################################
> -
> -AT91BOOTSTRAP_VERSION = 1.16
> -AT91BOOTSTRAP_SITE = ftp://www.at91.com/pub/at91bootstrap
> -AT91BOOTSTRAP_SOURCE = AT91Bootstrap$(AT91BOOTSTRAP_VERSION).zip
> -AT91BOOTSTRAP_LICENSE = BSD-Source-Code
> -AT91BOOTSTRAP_LICENSE_FILES = include/sdramc.h
> -
> -AT91BOOTSTRAP_BOARD = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_BOARD))
> -AT91BOOTSTRAP_MEMORY = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_MEMORY))
> -AT91BOOTSTRAP_MAKE_SUBDIR = board/$(AT91BOOTSTRAP_BOARD)/$(AT91BOOTSTRAP_MEMORY)
> -AT91BOOTSTRAP_BINARY = $(AT91BOOTSTRAP_MAKE_SUBDIR)/$(AT91BOOTSTRAP_MEMORY)_$(AT91BOOTSTRAP_BOARD).bin
> -
> -AT91BOOTSTRAP_INSTALL_IMAGES = YES
> -AT91BOOTSTRAP_INSTALL_TARGET = NO
> -
> -define AT91BOOTSTRAP_EXTRACT_CMDS
> -	$(UNZIP) -d $(BUILD_DIR) $(AT91BOOTSTRAP_DL_DIR)/$(AT91BOOTSTRAP_SOURCE)
> -	mv $(BUILD_DIR)/Bootstrap-v$(AT91BOOTSTRAP_VERSION)/* $(@D)
> -	rmdir $(BUILD_DIR)/Bootstrap-v$(AT91BOOTSTRAP_VERSION)
> -endef
> -
> -ifneq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR)),)
> -define AT91BOOTSTRAP_APPLY_CUSTOM_PATCHES
> -	$(APPLY_PATCHES) $(@D) $(BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR) \*.patch
> -endef
> -
> -AT91BOOTSTRAP_POST_PATCH_HOOKS += AT91BOOTSTRAP_APPLY_CUSTOM_PATCHES
> -endif
> -
> -# The at91bootstrap Makefile doesn't support customizing
> -# CFLAGS/LDFLAGS, so we cheat and pass our custom flags through CC and
> -# LD.
> -define AT91BOOTSTRAP_BUILD_CMDS
> -	$(MAKE1) CROSS_COMPILE=$(TARGET_CROSS) \
> -		CC="$(TARGET_CC) -fno-stack-protector" \
> -		LD="$(TARGET_CC) -fno-PIE" \
> -		-C $(@D)/$(AT91BOOTSTRAP_MAKE_SUBDIR)
> -endef
> -
> -define AT91BOOTSTRAP_INSTALL_IMAGES_CMDS
> -	cp $(@D)/$(AT91BOOTSTRAP_BINARY) $(BINARIES_DIR)
> -endef
> -
> -$(eval $(generic-package))
> -
> -ifeq ($(BR2_TARGET_AT91BOOTSTRAP)$(BR_BUILDING),yy)
> -ifeq ($(AT91BOOTSTRAP_BOARD),)
> -$(error No AT91Bootstrap board name set. Check your BR2_TARGET_AT91BOOTSTRAP_BOARD setting)
> -endif
> -endif
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
