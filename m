Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4DAC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 05:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DA5B60F05;
	Wed, 27 Apr 2022 05:42:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s8SN6qqRtW6m; Wed, 27 Apr 2022 05:42:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1613B60B70;
	Wed, 27 Apr 2022 05:42:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 877CA1BF4D5
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 05:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8334141836
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 05:42:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4qmpOgUxbmJD for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 05:42:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 69B6841834
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 05:42:19 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id r12so1570333iod.6
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 22:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VJYVmFuMBoNWQBy9ARQDrsxUSy0FDw9HtqF7Jj9fpBE=;
 b=KBAqEOLPHySk5GlUPcns8tSxOBgw+pPZ8fc3zM2zdkQGqy3JKLe5PC8ub1DLcttYKs
 S1Btc1X+vKt4amgFXpTPygkJqVNjMpjh9PJ0Ao2IawOOWHM4Hn3Iam9zMbltW90dQrw7
 roAp0h9geuJuMm0hSM9Xcef+YATMALDlHpAI+SOeZ/P8nFIUtVSyXTvkUQ82Ext6OE6y
 S9ahMeBP5wcG/E0QV6jzOshlEvh+BAWrhsaZghh9kTnvIPuHhdgf9UHIBA8SI7aoXsK1
 OT3y4zrYolagHisessD3GNPdO4zBDGzqUOp+5L6OULexoojED/Xf8PWJ5iEtbJ13mkGf
 ckWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VJYVmFuMBoNWQBy9ARQDrsxUSy0FDw9HtqF7Jj9fpBE=;
 b=wsMNpzM0/3WfrUUz/l0gGM1n9LxzhvCkviKseLnCZavwXMLek9SwkecorN6hfh9zTU
 SYZ+9byodATigKr8OsxS1LiYlPe/s6bckwnp1/yhT1F2An9rqu/Mr4PtcuYpxxJTqitN
 CAsnIYUtD048Qg+w6XW6QT8ByNasKgBb8Z7IhwBQDQzsv8Hn7MOaNHNl7WSa66VqUtCe
 hAxttWN+jLihtJ7Vcgdbye9TUApgTybvXWEMY8Vlm6u4i6iKEE2JhAiL9YxRd+d49php
 Rf09SWxyvndkF+o8SBuODy7T2+8h6tiMwIZsOz1ZcAcXOWNfPvfKNNDA0/PLWdEsaOHR
 lZPQ==
X-Gm-Message-State: AOAM532tZKW2guaqonKefvmySbp8IfYiB5Uy2ObSRvOJeSDh2RInt3bn
 Bq2zJMVjFuQlLsXrQfdqulA6aBjJ/cxI1H77ZYc=
X-Google-Smtp-Source: ABdhPJzz9JXhxeXwgKXcT/b9LrM8a4Gzr65N8SUQ9q/djBbTYr1u3mOK3b36L/YT36YCKQ8rWk55i6a6h1aOdSiFH4I=
X-Received: by 2002:a05:6e02:18c8:b0:2cd:8f11:e9ed with SMTP id
 s8-20020a056e0218c800b002cd8f11e9edmr6495655ilu.310.1651038138426; Tue, 26
 Apr 2022 22:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220401063930.2158692-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220401063930.2158692-1-alistair.francis@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 27 Apr 2022 15:41:51 +1000
Message-ID: <CAKmqyKMZGTL2SY6+d6vv=WpqpdcV0Ze+90pi=X7A=8Q8hVdw1g@mail.gmail.com>
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Subject: Re: [Buildroot] [PATCH 1/2] boot/opensbi: Bump to version 1.0
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Apr 1, 2022 at 4:39 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Ping!

Alistair

> ---
>  ...Makefile-Don-t-specify-mabi-or-march.patch | 37 -------------
>  ...Makefile-unconditionally-disable-SSP.patch | 53 -------------------
>  boot/opensbi/Config.in                        |  4 +-
>  boot/opensbi/opensbi.hash                     |  2 +-
>  4 files changed, 3 insertions(+), 93 deletions(-)
>  delete mode 100644 boot/opensbi/0.9/0001-Makefile-Don-t-specify-mabi-or-march.patch
>  delete mode 100644 boot/opensbi/0.9/0002-Makefile-unconditionally-disable-SSP.patch
>
> diff --git a/boot/opensbi/0.9/0001-Makefile-Don-t-specify-mabi-or-march.patch b/boot/opensbi/0.9/0001-Makefile-Don-t-specify-mabi-or-march.patch
> deleted file mode 100644
> index 5f554a6c24..0000000000
> --- a/boot/opensbi/0.9/0001-Makefile-Don-t-specify-mabi-or-march.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From f5871e1f3650d6c8a032928cb5d8ca00c275c377 Mon Sep 17 00:00:00 2001
> -From: Alistair Francis <alistair.francis@wdc.com>
> -Date: Fri, 15 Feb 2019 14:57:41 -0800
> -Subject: [PATCH] Makefile: Don't specify mabi or march
> -
> -To avoid
> -    can't link double-float modules with soft-float modules
> -errors when building 32-bit openSBI don't specify mabi or march.
> -
> -Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ----
> - Makefile | 2 --
> - 1 file changed, 2 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index ae68f55..10851fc 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -145,7 +145,6 @@ GENFLAGS   +=      $(firmware-genflags-y)
> - CFLAGS                =       -g -Wall -Werror -nostdlib -fno-strict-aliasing -O2
> - CFLAGS                +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
> - CFLAGS                +=      -mno-save-restore -mstrict-align
> --CFLAGS                +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
> - CFLAGS                +=      -mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
> - CFLAGS                +=      $(GENFLAGS)
> - CFLAGS                +=      $(platform-cflags-y)
> -@@ -158,7 +157,6 @@ CPPFLAGS   +=      $(firmware-cppflags-y)
> - ASFLAGS               =       -g -Wall -nostdlib -D__ASSEMBLY__
> - ASFLAGS               +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
> - ASFLAGS               +=      -mno-save-restore -mstrict-align
> --ASFLAGS               +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
> - ASFLAGS               +=      -mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
> - ASFLAGS               +=      $(GENFLAGS)
> - ASFLAGS               +=      $(platform-asflags-y)
> ---
> -2.20.1
> -
> diff --git a/boot/opensbi/0.9/0002-Makefile-unconditionally-disable-SSP.patch b/boot/opensbi/0.9/0002-Makefile-unconditionally-disable-SSP.patch
> deleted file mode 100644
> index c4edd37f1a..0000000000
> --- a/boot/opensbi/0.9/0002-Makefile-unconditionally-disable-SSP.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -From e389d5fbc296e496db15368b2b621e0f178f7f34 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sat, 8 May 2021 21:28:10 +0200
> -Subject: [PATCH] Makefile: unconditionally disable SSP
> -
> -Though -nostdlib is passed in {C,+AS,DTSCPP}FLAGS, -fno-stack-protector
> -must also be passed to avoid linking errors related to undefined
> -references to '__stack_chk_guard' and '__stack_chk_fail' if toolchain
> -enforces -fstack-protector.
> -
> -Fixes:
> - - https://gitlab.com/kubu93/buildroot/-/jobs/1247043359
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://github.com/riscv/opensbi/pull/211]
> ----
> - Makefile | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index eeffe6b..1419360 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -203,7 +203,7 @@ GENFLAGS   +=      $(libsbiutils-genflags-y)
> - GENFLAGS      +=      $(platform-genflags-y)
> - GENFLAGS      +=      $(firmware-genflags-y)
> -
> --CFLAGS                =       -g -Wall -Werror -ffreestanding -nostdlib -fno-strict-aliasing -O2
> -+CFLAGS                =       -g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing -O2
> - CFLAGS                +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
> - CFLAGS                +=      -mno-save-restore -mstrict-align
> - CFLAGS                +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
> -@@ -217,7 +217,7 @@ CPPFLAGS   +=      $(GENFLAGS)
> - CPPFLAGS      +=      $(platform-cppflags-y)
> - CPPFLAGS      +=      $(firmware-cppflags-y)
> -
> --ASFLAGS               =       -g -Wall -nostdlib -D__ASSEMBLY__
> -+ASFLAGS               =       -g -Wall -nostdlib -fno-stack-protector -D__ASSEMBLY__
> - ASFLAGS               +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
> - ASFLAGS               +=      -mno-save-restore -mstrict-align
> - ASFLAGS               +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
> -@@ -236,7 +236,7 @@ MERGEFLAGS +=      -r
> - MERGEFLAGS    +=      -b elf$(PLATFORM_RISCV_XLEN)-littleriscv
> - MERGEFLAGS    +=      -m elf$(PLATFORM_RISCV_XLEN)lriscv
> -
> --DTSCPPFLAGS   =       $(CPPFLAGS) -nostdinc -nostdlib -fno-builtin -D__DTS__ -x assembler-with-cpp
> -+DTSCPPFLAGS   =       $(CPPFLAGS) -nostdinc -nostdlib -fno-stack-protector -fno-builtin -D__DTS__ -x assembler-with-cpp
> -
> - # Setup functions for compilation
> - define dynamic_flags
> ---
> -2.30.2
> -
> diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
> index f1443498d9..1e1bdc344b 100644
> --- a/boot/opensbi/Config.in
> +++ b/boot/opensbi/Config.in
> @@ -19,7 +19,7 @@ choice
>           Select the specific OpenSBI version you want to use
>
>  config BR2_TARGET_OPENSBI_LATEST_VERSION
> -       bool "0.9"
> +       bool "1.0"
>
>  config BR2_TARGET_OPENSBI_CUSTOM_VERSION
>         bool "Custom version"
> @@ -57,7 +57,7 @@ endif
>
>  config BR2_TARGET_OPENSBI_VERSION
>         string
> -       default "0.9"   if BR2_TARGET_OPENSBI_LATEST_VERSION
> +       default "1.0"   if BR2_TARGET_OPENSBI_LATEST_VERSION
>         default BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE \
>                 if BR2_TARGET_OPENSBI_CUSTOM_VERSION
>         default "custom"        if BR2_TARGET_OPENSBI_CUSTOM_TARBALL
> diff --git a/boot/opensbi/opensbi.hash b/boot/opensbi/opensbi.hash
> index 3b6d97c42d..1a626e6357 100644
> --- a/boot/opensbi/opensbi.hash
> +++ b/boot/opensbi/opensbi.hash
> @@ -1,3 +1,3 @@
>  # locally computed
> -sha256  60f995cb3cd03e3cf5e649194d3395d0fe67499fd960a36cf7058a4efde686f0  opensbi-0.9.tar.gz
> +sha256  a5efaeb24f5ee88d13d5788e4e00623ff312ee12c0bf736aa75a6ad9a850fb76  opensbi-1.0.tar.gz
>  sha256  82d13fb1bf6bb162629deeea9eb9c117e74548d3b707e478967691fe79a68e21  COPYING.BSD
> --
> 2.35.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
