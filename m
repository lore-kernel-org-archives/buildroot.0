Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661D1107BCD0
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 17:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24A3E81583;
	Fri, 13 Mar 2026 17:24:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ibNC7zli1FX2; Fri, 13 Mar 2026 17:24:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BB4B81585
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773422641;
	bh=VqsNPn2qcFxfVYhwgsc4SON8P6QG64nreEMvImCTSrg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dDl4p9MlqNhkduk9T5rFWW5QgCiJgUbpMcVKxRigNuQ/Qnedt3kK2BAbiiufduR6q
	 xV78Qippderi2h+duQiD6XSnNq32xuVa7n4Ts5msblHCt+MdfgcIpWdvZwBNcLyCKx
	 vOamOzwAU3+0cm98CUBajAvif92xH/tpO2M8kX2MrhfSAZ+PXQMXQU9O/1KfSZI+Vn
	 JsvfE0EOCpsp5G8kdgtgo3ph9Ph0VbhM5vOEhS+aGitipFPjRmvFtBFl/9RZblbhph
	 e+kHXlYkJ9aBPsRTecGyYgKII0mOfkZrQAMeW6EdbURtPeaOhhtntkZYzeQKRx6U/j
	 O1C8v9HMCQi/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BB4B81585;
	Fri, 13 Mar 2026 17:24:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E45CF1AF
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 17:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA3434050E
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 17:23:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y2R2dZRsnIWV for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 17:23:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3956240520
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3956240520
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3956240520
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 17:23:57 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MsHs0-1vmJVm1Jpi-00tPa0; Fri, 13
 Mar 2026 18:23:48 +0100
Message-ID: <474ac709-3c95-4689-a55e-949923490fb6@gmx.de>
Date: Fri, 13 Mar 2026 19:23:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: El Mehdi YOUNES <elmehdi.younes@smile.fr>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260313161825.1224877-1-elmehdi.younes@smile.fr>
 <20260313161825.1224877-4-elmehdi.younes@smile.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260313161825.1224877-4-elmehdi.younes@smile.fr>
X-Provags-ID: V03:K1:4ie1Xcx7d1redUdpMPkYYXhYG8cTOPzJP9ZN9HqHbiITECVOlIR
 Mr+tF/icyv3AFss2JfY5HzfyvAwBDcT3dTqifRjC7bdgc51Ef+MoXXLS34f4U82eipgNGtG
 68FcR5PzxeBapN9YN++FsNM0GTpj3iHRo/AzcfsmllGogGaeSepsHvFA4DqZ/NEmFhYgEzo
 Qr0eUQr+x1XtqcM7XavRw==
UI-OutboundReport: notjunk:1;M01:P0:iqqdKra0R30=;L8Ioi8BymvSr5O6YsAx89bGU26D
 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
 GhS8HBLAI7BkV0V6XS4/ioAXjKsXMo4vA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1773422628; x=1774027428; i=fiona.klute@gmx.de;
 bh=nBNDRgR8/u34GD/FRguFLTuquJFtVMkPfRMCiKVNVmI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=GiPehF+1c7FutmDn49bVx6aU9i7eo6Ph+tfn54pdG8Ynq2AMXH3k3YrpbGjxFqOk
 9NAI6zMzmomwC646JDEft/gqEUzgdizZfvfQhVF29AYCTmDB8Dh2v70SRlVGAtLZQ
 LJQGKw0Fsxe0yKTHdQsxieWgKoJEPx50cR7NelpeZuFNhKu8YDsm3cBxCRSAD9eRm
 4Q0YNQitSimBKkKaYaNrAdd07bPPgsftbztf8IlCfOlZogBrL9Hk9+rBJ8sxf1MSs
 cANDf8NlH+wcRv+BRe77rEDiA2U2k1koGm1LH/2FDzhGGbyt3NwrjPbKL6yIIJSoG
 awO8q/MNn+SzFvYD/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=GiPehF+1
Subject: Re: [Buildroot] [PATCH v2 4/6] linux: split HOSTCC from flags
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 13.03.26 um 18:18 schrieb El Mehdi YOUNES via buildroot:
> Rust-for-Linux invokes rustc like:
>    $(RUSTC_OR_CLIPPY) $(rust_common_flags) $(rustc_target_flags) \
>      -Clinker-flavor=gcc -Clinker=$(HOSTCC) (see:
> 	https://github.com/torvalds/linux/blob/master/rust/Makefile#L407).

Two nitpicks:

a) Linking to "master" is not going to be stable if changes to that 
Makefile are merged (indeed right now L407 does not point at that 
snippet), you need to pick a fixed tag (preferably) or commit.

b) The authoritative Linux kernel repository is the one on 
git.kernel.org [1, 2], not the Github mirror, please link that one.

Best regards,
Fiona

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
[2] 
https://www.kernel.org/doc/html/v6.19/process/submitting-patches.html#obtain-a-current-source-tree

> When Buildroot embeds flags into HOSTCC (e.g. HOSTCC="gcc <cflags> <ldflags>"),
> rustc treats the entire value as the linker program name; and it fails.
> 
> This patch passes a clean HOSTCC and moves flags to the dedicated host-side
> variables accepted by Kbuild:
>    - HOSTCC      := $(HOSTCC)
>    - HOSTCFLAGS  := $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))
>    - HOSTLDFLAGS := $(HOST_LDFLAGS)
> 
> Since Linux v4.19, Kbuild provides explicit variables for host flags, so splitting
> compiler vs flags is supported upstream (see:
>    https://github.com/torvalds/linux/commit/96f14fe738b69dd97a33efe3cc8ab330af5fd1f1
>    https://github.com/torvalds/linux/commit/b90a368000abe5e015e0b045ca2ff7c2173b94c0
>    https://github.com/torvalds/linux/commit/f92d19e0ef9bbbb2984845682e740934ad45473b  ).
> 
> But with this change we can have problems with older kernel versions
> (< 4.19), as the Buildroot commit below warned when avoiding HOSTCFLAGS
> to not override internal kernel flags:
>    https://gitlab.com/buildroot.org/buildroot/-/commit/dde090c299b0357fdb1a4ec44ad8d332ac57f65e
> 
> In this case we Added condition on BR2_LINUX_KERNEL_RUST_SUPPORT to split HOSTCC
> only when kernel rust support is activated, which it means only for
> kernel versions > 6.1
> 
> BR2_LINUX_KERNEL_RUST_SUPPORT is also introduced in Config.in as a hidden symbol
> to support this conditional logic, while the full user-facing configuration and
> its dependencies will be completed in the next commit.
> 
> Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
> ---
>   linux/Config.in |  3 +++
>   linux/linux.mk  | 11 ++++++++++-
>   2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 8033361e82..50b3042194 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -568,6 +568,9 @@ config BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3
>   	  Enable this option if you get a Linux kernel build failure
>   	  such as "python3: not found".
>   
> +config BR2_LINUX_KERNEL_RUST_SUPPORT
> +	bool
> +
>   # Linux extensions
>   source "linux/Config.ext.in"
>   
> diff --git a/linux/linux.mk b/linux/linux.mk
> index c61089bfe0..816e6d8cf4 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -157,7 +157,6 @@ endif
>   # Disable building host tools with -Werror: newer gcc versions can be
>   # extra picky about some code (https://bugs.busybox.net/show_bug.cgi?id=14826)
>   LINUX_MAKE_FLAGS = \
> -	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS))) $(HOST_LDFLAGS)" \
>   	ARCH=$(KERNEL_ARCH) \
>   	KCFLAGS="$(LINUX_CFLAGS)" \
>   	INSTALL_MOD_PATH=$(TARGET_DIR) \
> @@ -166,6 +165,16 @@ LINUX_MAKE_FLAGS = \
>   	REGENERATE_PARSERS=1 \
>   	DEPMOD=$(HOST_DIR)/sbin/depmod
>   
> +ifeq ($(BR2_LINUX_KERNEL_RUST_SUPPORT),y)
> +LINUX_MAKE_FLAGS += \
> +	HOSTCC="$(HOSTCC)" \
> +	HOSTCFLAGS="$(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
> +	HOSTLDFLAGS="$(HOST_LDFLAGS)"
> +else
> +LINUX_MAKE_FLAGS += \
> +	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS))) $(HOST_LDFLAGS)"
> +endif
> +
>   ifeq ($(BR2_REPRODUCIBLE),y)
>   LINUX_MAKE_ENV += \
>   	KBUILD_BUILD_VERSION=1 \
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
