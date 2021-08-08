Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE65C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 07:40:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E006B60FC1
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 07:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E006B60FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7C47402E7;
	Sun,  8 Aug 2021 07:40:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aiyaEypoByD3; Sun,  8 Aug 2021 07:40:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FECC402C1;
	Sun,  8 Aug 2021 07:40:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E0A91BF5A9
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 07:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BBF6401CB
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 07:40:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5OMmgWI-lV2I for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 07:40:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE52F40150
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 07:40:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6435:5a60:3dd3:9849])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id BCE82780331;
 Sun,  8 Aug 2021 09:40:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1628408423;
 bh=YNrqi552qJMhv1/CExrOWWvRGCsr4hOWJx0EqogdS3A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fUfWQTtBIvpf5nUzKge3fkec5giuKIWp5r51F7dLv9rVKwejf+phhPryickDUSfTw
 seTzuQ/MvMRzQYdI/WWDK6KQ/gwIPpu90pbxWH0tJ5VYVIQfklHKTI2vg6oXCqY0nG
 DAHe4Iag7DMsnE0T+okKG3yVOSqMDcUrUjW1PMxMMBHMqw2DYLFLpCVkLT/1sxHm0G
 TvZucrvdrfQl9dERixMzAaTJmuqVFBd7bUo2ySzFnF7ENE05eScRpZRq/it1MSyifu
 CXyVYEUYD/jhcyeqZbxDtM7PLV+ZhDF5Itk914pbqPKg3l+BkNHjYF/o7eAT4DryLF
 LHiF1wS+uj3Iw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 08 Aug 2021 09:40:18 +0200
Date: Sun, 8 Aug 2021 09:40:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210808074018.GH27036@scaer>
References: <20210807201428.1796318-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210807201428.1796318-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2,1/1] package/guile: fix build on riscv32
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-07 22:14 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure on riscv32:
> 
> system/base/target.scm:132:16: In procedure triplet-pointer-size:
> unknown CPU word size "riscv32"
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/6705630c1484239ec8b73d57ebc2e2570fbfc8f8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Set wordsize to 4 instead of 8
> 
>  ...stem-base-target.scm-support-riscv32.patch | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/guile/0004-module-system-base-target.scm-support-riscv32.patch
> 
> diff --git a/package/guile/0004-module-system-base-target.scm-support-riscv32.patch b/package/guile/0004-module-system-base-target.scm-support-riscv32.patch
> new file mode 100644
> index 0000000000..a988d2d995
> --- /dev/null
> +++ b/package/guile/0004-module-system-base-target.scm-support-riscv32.patch
> @@ -0,0 +1,33 @@
> +From 6142350d7c0562b0525462abdd41309ae0faa2eb Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 6 Aug 2021 19:49:37 +0200
> +Subject: [PATCH] module/system/base/target.scm: support riscv32
> +
> +Fix the following build failure on riscv32:
> +
> +system/base/target.scm:132:16: In procedure triplet-pointer-size:
> +unknown CPU word size "riscv32"
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/6705630c1484239ec8b73d57ebc2e2570fbfc8f8
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + module/system/base/target.scm | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/module/system/base/target.scm b/module/system/base/target.scm
> +index 2088cd866..dba46664d 100644
> +--- a/module/system/base/target.scm
> ++++ b/module/system/base/target.scm
> +@@ -116,6 +116,7 @@
> + 
> +           ((string-match "^x86_64-.*-gnux32" triplet) 4)  ; x32
> + 
> ++          ((string-match "32$" cpu) 4)

I was thinking that '32$' might be too hard a hammer, but it does not
seem that there are that many systems which cpu name ends in 32, but
are not 32-bit. config.guess and config.sub don't know about any, at
least...

Applied to master, thanks.

Please, submit this patch upstream. ;-)

Regards,
Yann E. MORIN.

> +           ((string-match "64$" cpu) 8)
> +           ((string-match "64_?[lbe][lbe]$" cpu) 8)
> +           ((member cpu '("sparc" "powerpc" "mips" "mipsel" "nios2" "m68k" "sh3" "sh4")) 4)
> +-- 
> +2.30.2
> +
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
