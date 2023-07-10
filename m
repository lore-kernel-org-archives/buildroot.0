Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00833EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 21:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BC48417D5;
	Mon, 10 Jul 2023 21:41:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BC48417D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s7vIxpOtZ-VB; Mon, 10 Jul 2023 21:41:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99BE0417F6;
	Mon, 10 Jul 2023 21:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99BE0417F6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9EDC91BF33B
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 21:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 787FB401B7
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 21:41:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 787FB401B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VyBxL6cvNn3H for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 21:41:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7CE9400DD
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7CE9400DD
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 21:41:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:6136:4573:86f4:937d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0ACDF200402;
 Mon, 10 Jul 2023 23:41:28 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 10 Jul 2023 23:41:27 +0200
Date: Mon, 10 Jul 2023 23:41:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20230710214127.GB188780@scaer>
References: <20230710094148.308395-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230710094148.308395-1-heiko.thiery@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1689025294;
 bh=OVYT0ZSFvzfzV/BOqOBFyE9qXgoh+mHfVP8XKe2S5rs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MTc9Lej9joSO2lEjhANYaHV/Zk7oFhfvNrcbprfCPSfk+TjJ2btbYrHtrRahNm1r7
 0QxJ0nHEVTB4RAHGFsij/Gtj3RXlBOQrsO1G0+V4ymDL1PmzlzdTdNhEd4SGfaEcBh
 m9wdROoHsVRv1CmpBMrc9saru52xUyI+LgPBLQkws5M5AAbicELGm+lb+zUmh8ACrg
 jCjenyXwEYT/sPKbqFCqlpuADNY49toRwcVGh2H1eVH50559n+oMs2uCBLpVLm101s
 igYiCB5hfBoqMavZAFz3G1NzKl6Jym4WNrj0wrz9koXkdkkus3cmI8ezXqUv2x/Nws
 Lcs+3eWRj+Osg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MTc9Lej9
Subject: Re: [Buildroot] [PATCH v2] boot/arm-trusted-firmware: fix build
 issue with binutils 2.39+
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Heiko, All,

On 2023-07-10 11:41 +0200, Heiko Thiery spake thusly:
> The new version of binutils introduces a new warning when linking. The
> new warninng is enabled by default. To fix the issue this warning is
> disabled by adding the patches to the arm-trusted-firmware package
> v{2.2..2.8}. This is a backport of an upstream commit [1]
> 
> Since there are too many defconfigs that use the arm-trusted-firmware
> package, it is not practical to create a global-patch-dir for all of them.
> Therefore the patches are only in the package directory.
> 
> [1] https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996186
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996189
> 
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Cc: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> 
> ---
> v2: change the commit message to state why we add the patch to the
>     package directory
> ---
>  ...-add-support-for-new-binutils-versio.patch | 58 +++++++++++++++++
>  ...dd-support-for-new-binutils-versions.patch | 62 +++++++++++++++++++
>  ...dd-support-for-new-binutils-versions.patch | 62 +++++++++++++++++++
>  ...dd-support-for-new-binutils-versions.patch | 62 +++++++++++++++++++
>  ...dd-support-for-new-binutils-versions.patch | 62 +++++++++++++++++++
>  ...dd-support-for-new-binutils-versions.patch | 62 +++++++++++++++++++
>  ...dd-support-for-new-binutils-versions.patch | 62 +++++++++++++++++++

    $ make check-package
    boot/arm-trusted-firmware/v2.2/0001-PATCH-feat-build-add-support-for-new-binutils-versio.patch:0: missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)
    boot/arm-trusted-firmware/v2.3/0001-feat-build-add-support-for-new-binutils-versions.patch:0: missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)
    boot/arm-trusted-firmware/v2.4/0001-feat-build-add-support-for-new-binutils-versions.patch:0: missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)
    boot/arm-trusted-firmware/v2.5/0001-feat-build-add-support-for-new-binutils-versions.patch:0: missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)
    boot/arm-trusted-firmware/v2.6/0001-feat-build-add-support-for-new-binutils-versions.patch:0: missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)
    boot/arm-trusted-firmware/v2.7/0001-feat-build-add-support-for-new-binutils-versions.patch:0: missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)
    boot/arm-trusted-firmware/v2.8/0001-feat-build-add-support-for-new-binutils-versions.patch:0: missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)

I fixed that, and applied to master, thanks.

Regards,
Yann E. MORIN.

>  7 files changed, 430 insertions(+)
>  create mode 100644 boot/arm-trusted-firmware/v2.2/0001-PATCH-feat-build-add-support-for-new-binutils-versio.patch
>  create mode 100644 boot/arm-trusted-firmware/v2.3/0001-feat-build-add-support-for-new-binutils-versions.patch
>  create mode 100644 boot/arm-trusted-firmware/v2.4/0001-feat-build-add-support-for-new-binutils-versions.patch
>  create mode 100644 boot/arm-trusted-firmware/v2.5/0001-feat-build-add-support-for-new-binutils-versions.patch
>  create mode 100644 boot/arm-trusted-firmware/v2.6/0001-feat-build-add-support-for-new-binutils-versions.patch
>  create mode 100644 boot/arm-trusted-firmware/v2.7/0001-feat-build-add-support-for-new-binutils-versions.patch
>  create mode 100644 boot/arm-trusted-firmware/v2.8/0001-feat-build-add-support-for-new-binutils-versions.patch
> 
> diff --git a/boot/arm-trusted-firmware/v2.2/0001-PATCH-feat-build-add-support-for-new-binutils-versio.patch b/boot/arm-trusted-firmware/v2.2/0001-PATCH-feat-build-add-support-for-new-binutils-versio.patch
> new file mode 100644
> index 0000000000..2375de0eef
> --- /dev/null
> +++ b/boot/arm-trusted-firmware/v2.2/0001-PATCH-feat-build-add-support-for-new-binutils-versio.patch
> @@ -0,0 +1,58 @@
> +From 5e1beb793c06352e87c46eca1144ff1fe8555103 Mon Sep 17 00:00:00 2001
> +From: Heiko Thiery <heiko.thiery@gmail.com>
> +Date: Mon, 10 Jul 2023 10:43:03 +0200
> +Subject: [PATCH] [PATCH] feat(build): add support for new binutils versions
> +
> +Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
> +of a new warning when linking the bl*.elf in the form:
> +
> +  ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
> +  ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> +  ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
> +  ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions
> +
> +These new warnings are enbaled by default to secure elf binaries:
> + - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
> + - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
> +
> +Fix it in a similar way to what the Linux kernel does, see:
> +https://lore.kernel.org/all/20220810222442.2296651-1-ndesaulniers@google.com/
> +
> +Following the reasoning there, we set "-z noexecstack" for all linkers
> +(although LLVM's LLD defaults to it) and optional add
> +--no-warn-rwx-segments since this a ld.bfd related.
> +
> +Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> +Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
> +Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
> +
> +Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> +---
> + Makefile | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 721246d51..5893cf422 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -297,11 +297,16 @@ endif
> + 
> + GCC_V_OUTPUT		:=	$(shell $(CC) -v 2>&1)
> + 
> ++TF_LDFLAGS              +=      -z noexecstack
> ++
> + ifneq ($(findstring armlink,$(notdir $(LD))),)
> + TF_LDFLAGS		+=	--diag_error=warning --lto_level=O1
> + TF_LDFLAGS		+=	--remove --info=unused,unusedsymbols
> + else
> +-TF_LDFLAGS		+=	--fatal-warnings -O1
> ++# With ld.bfd version 2.39 and newer new warnings are added. Skip those since we
> ++# are not loaded by a elf loader.
> ++TF_LDFLAGS              +=      $(call ld_option, --no-warn-rwx-segments)
> ++TF_LDFLAGS              +=      -O1
> + TF_LDFLAGS		+=	--gc-sections
> + endif
> + TF_LDFLAGS		+=	$(TF_LDFLAGS_$(ARCH))
> +-- 
> +2.30.2
> +
> diff --git a/boot/arm-trusted-firmware/v2.3/0001-feat-build-add-support-for-new-binutils-versions.patch b/boot/arm-trusted-firmware/v2.3/0001-feat-build-add-support-for-new-binutils-versions.patch
> new file mode 100644
> index 0000000000..9b5a9dba97
> --- /dev/null
> +++ b/boot/arm-trusted-firmware/v2.3/0001-feat-build-add-support-for-new-binutils-versions.patch
> @@ -0,0 +1,62 @@
> +From 0f75b03c008eacb9818af3a56dc088e72a623d17 Mon Sep 17 00:00:00 2001
> +From: Marco Felsch <m.felsch@pengutronix.de>
> +Date: Wed, 9 Nov 2022 12:59:09 +0100
> +Subject: [PATCH] feat(build): add support for new binutils versions
> +
> +Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
> +of a new warning when linking the bl*.elf in the form:
> +
> +  ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
> +  ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> +  ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
> +  ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions
> +
> +These new warnings are enbaled by default to secure elf binaries:
> + - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
> + - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
> +
> +Fix it in a similar way to what the Linux kernel does, see:
> +https://lore.kernel.org/all/20220810222442.2296651-1-ndesaulniers@google.com/
> +
> +Following the reasoning there, we set "-z noexecstack" for all linkers
> +(although LLVM's LLD defaults to it) and optional add
> +--no-warn-rwx-segments since this a ld.bfd related.
> +
> +Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> +[Retrieved and rebased from
> +https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c]
> +Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> +Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
> +Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
> +---
> + Makefile | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 1ddb7b844..470956b19 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -416,6 +416,8 @@ endif
> + 
> + GCC_V_OUTPUT		:=	$(shell $(CC) -v 2>&1)
> + 
> ++TF_LDFLAGS		+=	-z noexecstack
> ++
> + # LD = armlink
> + ifneq ($(findstring armlink,$(notdir $(LD))),)
> + TF_LDFLAGS		+=	--diag_error=warning --lto_level=O1
> +@@ -442,7 +444,10 @@ TF_LDFLAGS		+=	$(subst --,-Xlinker --,$(TF_LDFLAGS_$(ARCH)))
> + 
> + # LD = gcc-ld (ld) or llvm-ld (ld.lld) or other
> + else
> +-TF_LDFLAGS		+=	--fatal-warnings -O1
> ++# With ld.bfd version 2.39 and newer new warnings are added. Skip those since we
> ++# are not loaded by a elf loader.
> ++TF_LDFLAGS		+=	$(call ld_option, --no-warn-rwx-segments)
> ++TF_LDFLAGS		+=	-O1
> + TF_LDFLAGS		+=	--gc-sections
> + # ld.lld doesn't recognize the errata flags,
> + # therefore don't add those in that case
> +-- 
> +2.30.2
> +
> diff --git a/boot/arm-trusted-firmware/v2.4/0001-feat-build-add-support-for-new-binutils-versions.patch b/boot/arm-trusted-firmware/v2.4/0001-feat-build-add-support-for-new-binutils-versions.patch
> new file mode 100644
> index 0000000000..9b5a9dba97
> --- /dev/null
> +++ b/boot/arm-trusted-firmware/v2.4/0001-feat-build-add-support-for-new-binutils-versions.patch
> @@ -0,0 +1,62 @@
> +From 0f75b03c008eacb9818af3a56dc088e72a623d17 Mon Sep 17 00:00:00 2001
> +From: Marco Felsch <m.felsch@pengutronix.de>
> +Date: Wed, 9 Nov 2022 12:59:09 +0100
> +Subject: [PATCH] feat(build): add support for new binutils versions
> +
> +Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
> +of a new warning when linking the bl*.elf in the form:
> +
> +  ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
> +  ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> +  ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
> +  ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions
> +
> +These new warnings are enbaled by default to secure elf binaries:
> + - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
> + - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
> +
> +Fix it in a similar way to what the Linux kernel does, see:
> +https://lore.kernel.org/all/20220810222442.2296651-1-ndesaulniers@google.com/
> +
> +Following the reasoning there, we set "-z noexecstack" for all linkers
> +(although LLVM's LLD defaults to it) and optional add
> +--no-warn-rwx-segments since this a ld.bfd related.
> +
> +Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> +[Retrieved and rebased from
> +https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c]
> +Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> +Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
> +Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
> +---
> + Makefile | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 1ddb7b844..470956b19 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -416,6 +416,8 @@ endif
> + 
> + GCC_V_OUTPUT		:=	$(shell $(CC) -v 2>&1)
> + 
> ++TF_LDFLAGS		+=	-z noexecstack
> ++
> + # LD = armlink
> + ifneq ($(findstring armlink,$(notdir $(LD))),)
> + TF_LDFLAGS		+=	--diag_error=warning --lto_level=O1
> +@@ -442,7 +444,10 @@ TF_LDFLAGS		+=	$(subst --,-Xlinker --,$(TF_LDFLAGS_$(ARCH)))
> + 
> + # LD = gcc-ld (ld) or llvm-ld (ld.lld) or other
> + else
> +-TF_LDFLAGS		+=	--fatal-warnings -O1
> ++# With ld.bfd version 2.39 and newer new warnings are added. Skip those since we
> ++# are not loaded by a elf loader.
> ++TF_LDFLAGS		+=	$(call ld_option, --no-warn-rwx-segments)
> ++TF_LDFLAGS		+=	-O1
> + TF_LDFLAGS		+=	--gc-sections
> + # ld.lld doesn't recognize the errata flags,
> + # therefore don't add those in that case
> +-- 
> +2.30.2
> +
> diff --git a/boot/arm-trusted-firmware/v2.5/0001-feat-build-add-support-for-new-binutils-versions.patch b/boot/arm-trusted-firmware/v2.5/0001-feat-build-add-support-for-new-binutils-versions.patch
> new file mode 100644
> index 0000000000..9b5a9dba97
> --- /dev/null
> +++ b/boot/arm-trusted-firmware/v2.5/0001-feat-build-add-support-for-new-binutils-versions.patch
> @@ -0,0 +1,62 @@
> +From 0f75b03c008eacb9818af3a56dc088e72a623d17 Mon Sep 17 00:00:00 2001
> +From: Marco Felsch <m.felsch@pengutronix.de>
> +Date: Wed, 9 Nov 2022 12:59:09 +0100
> +Subject: [PATCH] feat(build): add support for new binutils versions
> +
> +Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
> +of a new warning when linking the bl*.elf in the form:
> +
> +  ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
> +  ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> +  ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
> +  ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions
> +
> +These new warnings are enbaled by default to secure elf binaries:
> + - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
> + - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
> +
> +Fix it in a similar way to what the Linux kernel does, see:
> +https://lore.kernel.org/all/20220810222442.2296651-1-ndesaulniers@google.com/
> +
> +Following the reasoning there, we set "-z noexecstack" for all linkers
> +(although LLVM's LLD defaults to it) and optional add
> +--no-warn-rwx-segments since this a ld.bfd related.
> +
> +Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> +[Retrieved and rebased from
> +https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c]
> +Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> +Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
> +Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
> +---
> + Makefile | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 1ddb7b844..470956b19 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -416,6 +416,8 @@ endif
> + 
> + GCC_V_OUTPUT		:=	$(shell $(CC) -v 2>&1)
> + 
> ++TF_LDFLAGS		+=	-z noexecstack
> ++
> + # LD = armlink
> + ifneq ($(findstring armlink,$(notdir $(LD))),)
> + TF_LDFLAGS		+=	--diag_error=warning --lto_level=O1
> +@@ -442,7 +444,10 @@ TF_LDFLAGS		+=	$(subst --,-Xlinker --,$(TF_LDFLAGS_$(ARCH)))
> + 
> + # LD = gcc-ld (ld) or llvm-ld (ld.lld) or other
> + else
> +-TF_LDFLAGS		+=	--fatal-warnings -O1
> ++# With ld.bfd version 2.39 and newer new warnings are added. Skip those since we
> ++# are not loaded by a elf loader.
> ++TF_LDFLAGS		+=	$(call ld_option, --no-warn-rwx-segments)
> ++TF_LDFLAGS		+=	-O1
> + TF_LDFLAGS		+=	--gc-sections
> + # ld.lld doesn't recognize the errata flags,
> + # therefore don't add those in that case
> +-- 
> +2.30.2
> +
> diff --git a/boot/arm-trusted-firmware/v2.6/0001-feat-build-add-support-for-new-binutils-versions.patch b/boot/arm-trusted-firmware/v2.6/0001-feat-build-add-support-for-new-binutils-versions.patch
> new file mode 100644
> index 0000000000..9b5a9dba97
> --- /dev/null
> +++ b/boot/arm-trusted-firmware/v2.6/0001-feat-build-add-support-for-new-binutils-versions.patch
> @@ -0,0 +1,62 @@
> +From 0f75b03c008eacb9818af3a56dc088e72a623d17 Mon Sep 17 00:00:00 2001
> +From: Marco Felsch <m.felsch@pengutronix.de>
> +Date: Wed, 9 Nov 2022 12:59:09 +0100
> +Subject: [PATCH] feat(build): add support for new binutils versions
> +
> +Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
> +of a new warning when linking the bl*.elf in the form:
> +
> +  ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
> +  ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> +  ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
> +  ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions
> +
> +These new warnings are enbaled by default to secure elf binaries:
> + - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
> + - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
> +
> +Fix it in a similar way to what the Linux kernel does, see:
> +https://lore.kernel.org/all/20220810222442.2296651-1-ndesaulniers@google.com/
> +
> +Following the reasoning there, we set "-z noexecstack" for all linkers
> +(although LLVM's LLD defaults to it) and optional add
> +--no-warn-rwx-segments since this a ld.bfd related.
> +
> +Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> +[Retrieved and rebased from
> +https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c]
> +Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> +Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
> +Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
> +---
> + Makefile | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 1ddb7b844..470956b19 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -416,6 +416,8 @@ endif
> + 
> + GCC_V_OUTPUT		:=	$(shell $(CC) -v 2>&1)
> + 
> ++TF_LDFLAGS		+=	-z noexecstack
> ++
> + # LD = armlink
> + ifneq ($(findstring armlink,$(notdir $(LD))),)
> + TF_LDFLAGS		+=	--diag_error=warning --lto_level=O1
> +@@ -442,7 +444,10 @@ TF_LDFLAGS		+=	$(subst --,-Xlinker --,$(TF_LDFLAGS_$(ARCH)))
> + 
> + # LD = gcc-ld (ld) or llvm-ld (ld.lld) or other
> + else
> +-TF_LDFLAGS		+=	--fatal-warnings -O1
> ++# With ld.bfd version 2.39 and newer new warnings are added. Skip those since we
> ++# are not loaded by a elf loader.
> ++TF_LDFLAGS		+=	$(call ld_option, --no-warn-rwx-segments)
> ++TF_LDFLAGS		+=	-O1
> + TF_LDFLAGS		+=	--gc-sections
> + # ld.lld doesn't recognize the errata flags,
> + # therefore don't add those in that case
> +-- 
> +2.30.2
> +
> diff --git a/boot/arm-trusted-firmware/v2.7/0001-feat-build-add-support-for-new-binutils-versions.patch b/boot/arm-trusted-firmware/v2.7/0001-feat-build-add-support-for-new-binutils-versions.patch
> new file mode 100644
> index 0000000000..9b5a9dba97
> --- /dev/null
> +++ b/boot/arm-trusted-firmware/v2.7/0001-feat-build-add-support-for-new-binutils-versions.patch
> @@ -0,0 +1,62 @@
> +From 0f75b03c008eacb9818af3a56dc088e72a623d17 Mon Sep 17 00:00:00 2001
> +From: Marco Felsch <m.felsch@pengutronix.de>
> +Date: Wed, 9 Nov 2022 12:59:09 +0100
> +Subject: [PATCH] feat(build): add support for new binutils versions
> +
> +Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
> +of a new warning when linking the bl*.elf in the form:
> +
> +  ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
> +  ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> +  ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
> +  ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions
> +
> +These new warnings are enbaled by default to secure elf binaries:
> + - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
> + - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
> +
> +Fix it in a similar way to what the Linux kernel does, see:
> +https://lore.kernel.org/all/20220810222442.2296651-1-ndesaulniers@google.com/
> +
> +Following the reasoning there, we set "-z noexecstack" for all linkers
> +(although LLVM's LLD defaults to it) and optional add
> +--no-warn-rwx-segments since this a ld.bfd related.
> +
> +Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> +[Retrieved and rebased from
> +https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c]
> +Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> +Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
> +Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
> +---
> + Makefile | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 1ddb7b844..470956b19 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -416,6 +416,8 @@ endif
> + 
> + GCC_V_OUTPUT		:=	$(shell $(CC) -v 2>&1)
> + 
> ++TF_LDFLAGS		+=	-z noexecstack
> ++
> + # LD = armlink
> + ifneq ($(findstring armlink,$(notdir $(LD))),)
> + TF_LDFLAGS		+=	--diag_error=warning --lto_level=O1
> +@@ -442,7 +444,10 @@ TF_LDFLAGS		+=	$(subst --,-Xlinker --,$(TF_LDFLAGS_$(ARCH)))
> + 
> + # LD = gcc-ld (ld) or llvm-ld (ld.lld) or other
> + else
> +-TF_LDFLAGS		+=	--fatal-warnings -O1
> ++# With ld.bfd version 2.39 and newer new warnings are added. Skip those since we
> ++# are not loaded by a elf loader.
> ++TF_LDFLAGS		+=	$(call ld_option, --no-warn-rwx-segments)
> ++TF_LDFLAGS		+=	-O1
> + TF_LDFLAGS		+=	--gc-sections
> + # ld.lld doesn't recognize the errata flags,
> + # therefore don't add those in that case
> +-- 
> +2.30.2
> +
> diff --git a/boot/arm-trusted-firmware/v2.8/0001-feat-build-add-support-for-new-binutils-versions.patch b/boot/arm-trusted-firmware/v2.8/0001-feat-build-add-support-for-new-binutils-versions.patch
> new file mode 100644
> index 0000000000..9b5a9dba97
> --- /dev/null
> +++ b/boot/arm-trusted-firmware/v2.8/0001-feat-build-add-support-for-new-binutils-versions.patch
> @@ -0,0 +1,62 @@
> +From 0f75b03c008eacb9818af3a56dc088e72a623d17 Mon Sep 17 00:00:00 2001
> +From: Marco Felsch <m.felsch@pengutronix.de>
> +Date: Wed, 9 Nov 2022 12:59:09 +0100
> +Subject: [PATCH] feat(build): add support for new binutils versions
> +
> +Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
> +of a new warning when linking the bl*.elf in the form:
> +
> +  ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
> +  ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> +  ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
> +  ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions
> +
> +These new warnings are enbaled by default to secure elf binaries:
> + - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
> + - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
> +
> +Fix it in a similar way to what the Linux kernel does, see:
> +https://lore.kernel.org/all/20220810222442.2296651-1-ndesaulniers@google.com/
> +
> +Following the reasoning there, we set "-z noexecstack" for all linkers
> +(although LLVM's LLD defaults to it) and optional add
> +--no-warn-rwx-segments since this a ld.bfd related.
> +
> +Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> +[Retrieved and rebased from
> +https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c]
> +Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> +Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
> +Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
> +---
> + Makefile | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 1ddb7b844..470956b19 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -416,6 +416,8 @@ endif
> + 
> + GCC_V_OUTPUT		:=	$(shell $(CC) -v 2>&1)
> + 
> ++TF_LDFLAGS		+=	-z noexecstack
> ++
> + # LD = armlink
> + ifneq ($(findstring armlink,$(notdir $(LD))),)
> + TF_LDFLAGS		+=	--diag_error=warning --lto_level=O1
> +@@ -442,7 +444,10 @@ TF_LDFLAGS		+=	$(subst --,-Xlinker --,$(TF_LDFLAGS_$(ARCH)))
> + 
> + # LD = gcc-ld (ld) or llvm-ld (ld.lld) or other
> + else
> +-TF_LDFLAGS		+=	--fatal-warnings -O1
> ++# With ld.bfd version 2.39 and newer new warnings are added. Skip those since we
> ++# are not loaded by a elf loader.
> ++TF_LDFLAGS		+=	$(call ld_option, --no-warn-rwx-segments)
> ++TF_LDFLAGS		+=	-O1
> + TF_LDFLAGS		+=	--gc-sections
> + # ld.lld doesn't recognize the errata flags,
> + # therefore don't add those in that case
> +-- 
> +2.30.2
> +
> -- 
> 2.30.2
> 

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
