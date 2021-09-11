Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B99E3C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 12:55:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 611A0610C9
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 12:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 611A0610C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33FBD83004;
	Sat, 11 Sep 2021 12:55:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oM_0x4VK4LIy; Sat, 11 Sep 2021 12:55:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86C2282F57;
	Sat, 11 Sep 2021 12:55:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 87DE91BF31A
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 12:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7712A82F57
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 12:55:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x3m1TfJu6maD for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 12:55:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 884A682F11
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 12:55:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6c4a:f4f1:e14a:6e93])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 976E8B00539;
 Sat, 11 Sep 2021 14:55:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631364906;
 bh=05kNK+jCPYxuRJweqb6NTPABBJazW00zJY/NMINfNGE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AUWNtqPBcwhOvtntGKgTh4ZvtWsL9atGOdGt67I7lsuN4YbHSFEUDWLpY3CGDsmzL
 x27C6qXn/6yjaJBo+mQ8rp+icnaiXesPKGChsmYCiupslATdePVdfpOYHnFZsxsNje
 Lb39bKU5+Pp/3SNT2vinFi1OeprO1w0F+IKU8FYtOoHfKuG1HqCy+8jL8pi34sBZgk
 QA17g2S7B9TD8xzao66g5PkbPzGNMEM+yF2a6h3MAxeEfwRtZX7af0f3PxmeX548aa
 xexXybc/I30mvxwDTMPWuZXdg581hM3NONq+UJ3M/ZBzFP6+89uEyYqBLtET5e/gb6
 8k0Cy0Fl7uxqA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 11 Sep 2021 14:55:00 +0200
Date: Sat, 11 Sep 2021 14:55:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210911125500.GN1053080@scaer>
References: <20210908164536.474998-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210908164536.474998-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/uboot-tools: fix MKIMAGE_ARCH handling
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fabrice, All,

On 2021-09-08 18:45 +0200, Fabrice Fontaine spake thusly:
> Fix MKIMAGE_ARCH handling to avoid the following build failure:
> 
> /home/buildroot/autobuild/instance-0/output-1/build/host-uboot-tools-2021.07/tools/mkimage -C none -A openrisc -T script -d /home/buildroot/autobuild/instance-0/output-1/boot_script.txt /home/buildroot/autobuild/instance-0/output-1/build/host-uboot-tools-2021.07/tools/boot.scr
> 
> Invalid architecture, supported are:
[--SNIP--]
> 
> Strangely enough, we only have autobuilder failures since July 2021 even
> if or1k must be used since the addition of openriscv support in 2012:
> https://github.com/u-boot/u-boot/commit/3ddcaccda3824e1c7f7266d543e4c0eb3ea9851c

... even as or1k has been used since ...

> Fixes:
>  - http://autobuild.buildroot.org/results/c3f0f2a3fb87d74bfdaccf9b94c66f0b5bae7520
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Fix commit message to specify that autobuilder failures are raised
>    since July 2021
> 
>  package/uboot-tools/uboot-tools.mk | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
> index a87956d028..81f60963ec 100644
> --- a/package/uboot-tools/uboot-tools.mk
> +++ b/package/uboot-tools/uboot-tools.mk
> @@ -206,15 +206,15 @@ $(eval $(host-generic-package))
>  
>  MKIMAGE = $(HOST_DIR)/bin/mkimage
>  
> -# mkimage supports arm blackfin m68k microblaze mips mips64 nios2 powerpc ppc sh sparc sparc64 x86
> +# mkimage supports alpha arc arm arm64 blackfin ia64 invalid m68k microblaze mips mips64 nds32 nios2 or1k powerpc riscv s390 sandbox sh sparc sparc64 x86 x86_64 xtensa
>  # KERNEL_ARCH can be arm64 arc arm blackfin m68k microblaze mips nios2 powerpc sh sparc i386 x86_64 xtensa
> -# For arm64, arc, xtensa we'll just keep KERNEL_ARCH
> -# For mips64, we'll just keep mips
> -# For i386 and x86_64, we need to convert
> -ifeq ($(KERNEL_ARCH),x86_64)
> -MKIMAGE_ARCH = x86
> -else ifeq ($(KERNEL_ARCH),i386)
> +# For i386, we need to convert
> +# For openrisc, we need to convert
> +# For others, we'll just keep KERNEL_ARCH
> +ifeq ($(KERNEL_ARCH),i386)
>  MKIMAGE_ARCH = x86

But then, x86_64 should still be changed to x86, no?

Regards,
Yann E. MORIN.

> +else ifeq ($(KERNEL_ARCH),openrisc)
> +MKIMAGE_ARCH = or1k
>  else
>  MKIMAGE_ARCH = $(KERNEL_ARCH)
>  endif
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
