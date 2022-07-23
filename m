Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45549C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 08:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8D9F84B16;
	Sat, 23 Jul 2022 08:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8D9F84B16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MwvyS31Zwy-K; Sat, 23 Jul 2022 08:36:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E85BA84B12;
	Sat, 23 Jul 2022 08:36:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E85BA84B12
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55B721BF2C7
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 08:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C31040A45
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 08:36:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C31040A45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z_2mrhCXCAED for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 08:36:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A509E40142
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A509E40142
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 08:36:41 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d13so1654584wrn.10
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 01:36:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=F3cylo0XQdXR4b2QN8jl8AlkpfVwpL+J1eqRqBSxTfI=;
 b=BcP/mp4aBL5/E/QeBtKmDsJ7zFumOr0dtvJaz4+DvSOvNEyQfIW+YiJQwHhH4wxmjO
 o7o8sHw5Nzr4hcQi3FsE8xJcfXSvnP7eQb7LpGQQYJst+B8DTnlaOEI43xqQfatkwO/F
 jFhR1U9ixtHb4jb5GovP8ZedXSBtyu90COJ2AafuxH2e14S5n5wrMGUQMISvehbP793w
 0XQrQAa2mhlXoyz4UCru2W2MWLcC4zhOzd8/Ev0FXPFJXZ11YRBJ6pfJ/bet8Gtt8O9f
 ha3+kE7i7QupwLNHybuEO6MzeZpLvx/ut9v1Xmv7sKMaPBII8VJybH5obDM4mX0rKkJW
 K9Vw==
X-Gm-Message-State: AJIora8OkdTjCTwCgxgz4fwgsuWwuo8DV19DyhAay4PWUUiBL88Hu79X
 ZkIz9tJPo+YwAGP+sH8mE80uhQ==
X-Google-Smtp-Source: AGRyM1t6aTVCtv12B1bRpOIYpH3YwI1LfXzr7+So0ZEqhD0/uUJcQOxZMKDOkozl5uG6CnOC01ovOg==
X-Received: by 2002:a05:6000:1092:b0:21d:6df8:d082 with SMTP id
 y18-20020a056000109200b0021d6df8d082mr2165962wrw.68.1658565399213; 
 Sat, 23 Jul 2022 01:36:39 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c2cd600b003a2f96935c0sm7227882wmc.9.2022.07.23.01.36.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 01:36:38 -0700 (PDT)
Message-ID: <c71055c4-fc62-4c81-da60-b0e73fd59b0d@mind.be>
Date: Sat, 23 Jul 2022 10:36:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20220721082645.2593370-1-thomas.petazzoni@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220721082645.2593370-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=F3cylo0XQdXR4b2QN8jl8AlkpfVwpL+J1eqRqBSxTfI=;
 b=SqR6aPHS6M6RLBfs1EOVKoi8CrwxMVTC45HAwCAWpZUfC4gnXcX/YhsRcPD3S7WLpN
 1IHDTmRO8s7GPX3n7ed8JJM2pudJTDHQGFLAZ2XLuP9IKq1A4b6tU3EqeNVZfZlQOWrC
 9d96BlsXBXkA8X0WJjEvwNrRX+5DNPUUL6d3OLhu9bizGa+cWF+bf9AUVbZ1/NdTMcq5
 ODArItMY34ep47Y4mwXjYToWPQ/S1CBp8zS2NU6c4yAO8r+nULLQZBqKrz+nYe7lTo/L
 s+WY0WoQXSRYZIkNju4/bbf6/s+SKk0H3nITAni65cqXgVuFipqty3+YvDbxeLk4Nt8I
 w6Dg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SqR6aPHS
Subject: Re: [Buildroot] [PATCH] package/gnu-efi: bump to version 3.0.14
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



On 21/07/2022 10:26, Thomas Petazzoni via buildroot wrote:
> Patch 0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch
> is refreshed to accommodate with conflicting upstream changes.
> 
> Patch 0002-Revert-efilink-fix-build-with-gcc-4.8.patch is dropped as
> it is upstream as of commit
> 8b2da2c2247af28bd681a9c8e3231559964c80a6 ("Revert "efilink: fix build
> with gcc 4.8"").
> 
> A new patch is needed to fix the build on mips64.
> 
> While at it, fix the hash file to use the new spacing convention.
> 
> Fixes:
> 
>    http://autobuild.buildroot.net/results/a9a7372615e3fbe4b8abda946706d1ccadf28931/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> Note: the new patch has been submitted usptream, but the Sourceforge
> mailing list archive is so slow that the mail hasn't appeared yet.

  I added the link and applied to master, thanks.

  Regards,
  Arnout

> 
>   ...n-t-override-ARCH-when-cross-compili.patch | 10 ++--
>   ...evert-efilink-fix-build-with-gcc-4.8.patch | 38 ------------
>   ...support-__mips64-to-recognize-mips64.patch | 59 +++++++++++++++++++
>   package/gnu-efi/gnu-efi.hash                  |  8 +--
>   package/gnu-efi/gnu-efi.mk                    |  2 +-
>   5 files changed, 69 insertions(+), 48 deletions(-)
>   delete mode 100644 package/gnu-efi/0002-Revert-efilink-fix-build-with-gcc-4.8.patch
>   create mode 100644 package/gnu-efi/0002-inc-efi-.h-also-support-__mips64-to-recognize-mips64.patch
> 
> diff --git a/package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch b/package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch
> index c256541781..2eb9c5a062 100644
> --- a/package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch
> +++ b/package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch
> @@ -1,4 +1,4 @@
> -From 3452721eafae90749f4af63264c412f398460b15 Mon Sep 17 00:00:00 2001
> +From b2dbeec5063265eb0121342c24a900a4888712a7 Mon Sep 17 00:00:00 2001
>   From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>   Date: Sun, 20 Jan 2019 21:07:11 +0100
>   Subject: [PATCH] Make.defaults: don't override ARCH when cross-compiling
> @@ -15,18 +15,18 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>    1 file changed, 1 insertion(+), 1 deletion(-)
>   
>   diff --git a/Make.defaults b/Make.defaults
> -index ba743f1..a0e5632 100755
> +index 47ed361..7420344 100755
>   --- a/Make.defaults
>   +++ b/Make.defaults
>   @@ -67,7 +67,7 @@ ARCH         ?= $(shell $(HOSTCC) -dumpmachine | cut -f1 -d- | sed -e s,i[345678
>    
>    # Get ARCH from the compiler if cross compiling
>    ifneq ($(CROSS_COMPILE),)
> --  override ARCH := $(shell $(CC) -dumpmachine | cut -f1 -d-| sed -e s,i[3456789]86,ia32, -e 's,armv7.*,arm,' )
> -+  ARCH := $(shell $(CC) -dumpmachine | cut -f1 -d-| sed -e s,i[3456789]86,ia32, -e 's,armv7.*,arm,' )
> +-  override ARCH := $(shell $(CC) -dumpmachine | cut -f1 -d-| sed -e s,i[3456789]86,ia32, -e 's,armv[67].*,arm,' )
> ++  ARCH := $(shell $(CC) -dumpmachine | cut -f1 -d-| sed -e s,i[3456789]86,ia32, -e 's,armv[67].*,arm,' )
>    endif
>    
>    # FreeBSD (and possibly others) reports amd64 instead of x86_64
>   --
> -2.14.1
> +2.36.1
>   
> diff --git a/package/gnu-efi/0002-Revert-efilink-fix-build-with-gcc-4.8.patch b/package/gnu-efi/0002-Revert-efilink-fix-build-with-gcc-4.8.patch
> deleted file mode 100644
> index 5a08c24254..0000000000
> --- a/package/gnu-efi/0002-Revert-efilink-fix-build-with-gcc-4.8.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From 1f7b2e5bd6603b30202a66b6317a41e2be85742b Mon Sep 17 00:00:00 2001
> -From: Esben Haabendal <esben@haabendal.dk>
> -Date: Tue, 26 Mar 2019 13:37:02 +0100
> -Subject: [PATCH] Revert "efilink: fix build with gcc 4.8"
> -
> -This reverts commit 6335e5c697c57d8b5854b8202de3733bcb151ca6, as it breaks
> -gcc builds with '-nostdinc' flag.
> -
> -The fix in 1a53d8f88a452847b25f9689f9a08dbcf82c86e4
> -(Fix for problem with undeclared intptr_t type), which is also merged
> -fixes the same problem, without causing breakage.
> -
> -Signed-off-by: Esben Haabendal <esben@haabendal.dk>
> -Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> -[Upstream status:
> -https://sourceforge.net/p/gnu-efi/code/merge-requests/6/]
> ----
> - inc/efilink.h | 4 ----
> - 1 file changed, 4 deletions(-)
> -
> -diff --git a/inc/efilink.h b/inc/efilink.h
> -index b69a6fd..cc5aa2d 100644
> ---- a/inc/efilink.h
> -+++ b/inc/efilink.h
> -@@ -1,10 +1,6 @@
> - #ifndef _EFI_LINK_H
> - #define _EFI_LINK_H
> -
> --#if defined(__GNUC__)
> --#include <stdint.h>
> --#endif
> --
> - /*++
> -
> - Copyright (c) 1998  Intel Corporation
> ---
> -2.20.1
> -
> diff --git a/package/gnu-efi/0002-inc-efi-.h-also-support-__mips64-to-recognize-mips64.patch b/package/gnu-efi/0002-inc-efi-.h-also-support-__mips64-to-recognize-mips64.patch
> new file mode 100644
> index 0000000000..1a3693c040
> --- /dev/null
> +++ b/package/gnu-efi/0002-inc-efi-.h-also-support-__mips64-to-recognize-mips64.patch
> @@ -0,0 +1,59 @@
> +From 2c0ad0d7547558be59ef10dd289e619373341704 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Thu, 21 Jul 2022 09:47:49 +0200
> +Subject: [PATCH] inc/efi*.h: also support __mips64 to recognize mips64
> +
> +gcc built-in define for the MIPS64 architecture is __mips64, not
> +__mips64__, so the current condition did not match for gcc. See
> +https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/mips/mips.h;h=47aac9d3d61245c4d3df5dbd0bbcd833190de7c3;hb=2d280e7eafc086e9df85f50ed1a6526d6a3a204d#l431
> +in the gcc source.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + inc/efi.h      | 2 +-
> + inc/efilib.h   | 2 +-
> + inc/efirtlib.h | 2 +-
> + 3 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/inc/efi.h b/inc/efi.h
> +index 43c832e..b193932 100644
> +--- a/inc/efi.h
> ++++ b/inc/efi.h
> +@@ -48,7 +48,7 @@ Revision History
> + #include "aarch64/efibind.h"
> + #elif defined (_M_ARM) || defined(__arm__)
> + #include "arm/efibind.h"
> +-#elif defined (_M_MIPS64) || defined(__mips64__)
> ++#elif defined (_M_MIPS64) || defined(__mips64__) || defined(__mips64)
> + #include "mips64el/efibind.h"
> + #elif defined (__riscv) && __riscv_xlen == 64
> + #include "riscv64/efibind.h"
> +diff --git a/inc/efilib.h b/inc/efilib.h
> +index 9f748ad..a2b39b2 100644
> +--- a/inc/efilib.h
> ++++ b/inc/efilib.h
> +@@ -31,7 +31,7 @@ Revision History
> + #include "aarch64/efilibplat.h"
> + #elif defined (_M_ARM) || defined(__arm__)
> + #include "arm/efilibplat.h"
> +-#elif defined (_M_MIPS64) || defined(__mips64__)
> ++#elif defined (_M_MIPS64) || defined(__mips64__) || defined(__mips64)
> + #include "mips64el/efilibplat.h"
> + #elif defined (__riscv) && __riscv_xlen == 64
> + #include "riscv64/efilibplat.h"
> +diff --git a/inc/efirtlib.h b/inc/efirtlib.h
> +index 8643061..518859e 100644
> +--- a/inc/efirtlib.h
> ++++ b/inc/efirtlib.h
> +@@ -30,7 +30,7 @@ Revision History
> + #include "aarch64/efilibplat.h"
> + #elif defined (_M_ARM) || defined(__arm__)
> + #include "arm/efilibplat.h"
> +-#elif defined (_M_MIPS64) || defined(__mips64__)
> ++#elif defined (_M_MIPS64) || defined(__mips64__) || defined(__mips64)
> + #include "mips64el/efilibplat.h"
> + #elif defined (__riscv) && __riscv_xlen == 64
> + #include "riscv64/efilibplat.h"
> +--
> +2.36.1
> +
> diff --git a/package/gnu-efi/gnu-efi.hash b/package/gnu-efi/gnu-efi.hash
> index bf9792b290..599d234436 100644
> --- a/package/gnu-efi/gnu-efi.hash
> +++ b/package/gnu-efi/gnu-efi.hash
> @@ -1,6 +1,6 @@
>   # From http://sourceforge.net/projects/gnu-efi/files
> -md5 960a8379b6f95ee73d7778b70bf2a089 gnu-efi-3.0.10.tar.bz2
> -sha1 a51b81eda97c0acbf3ac86123f298d3c0e396ce5 gnu-efi-3.0.10.tar.bz2
> +md5  e2902ad09d53d7a94dc96a449dbb4058  gnu-efi-3.0.14.tar.bz2
> +sha1  e46b3726478838e85d0a79d0a0d3508c4f2995cf  gnu-efi-3.0.14.tar.bz2
>   # Locally computed
> -sha256 f12082a3a5f0c3e38c67262a9f34245d139ac2cdfc0a0bdcf03c9b1f56fa4fed  gnu-efi-3.0.10.tar.bz2
> -sha256 42d352e9c28dd446fd0209cd6f75588c8e41f0934540bb382bbd61c752360265  README.efilib
> +sha256  b73b643a0d5697d1f396d7431448e886dd805668789578e3e1a28277c9528435  gnu-efi-3.0.14.tar.bz2
> +sha256  42d352e9c28dd446fd0209cd6f75588c8e41f0934540bb382bbd61c752360265  README.efilib
> diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
> index 06bf254738..13e925302d 100644
> --- a/package/gnu-efi/gnu-efi.mk
> +++ b/package/gnu-efi/gnu-efi.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GNU_EFI_VERSION = 3.0.10
> +GNU_EFI_VERSION = 3.0.14
>   GNU_EFI_SOURCE = gnu-efi-$(GNU_EFI_VERSION).tar.bz2
>   GNU_EFI_SITE = http://downloads.sourceforge.net/project/gnu-efi
>   GNU_EFI_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
