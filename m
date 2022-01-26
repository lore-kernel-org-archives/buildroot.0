Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D4FC433EF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 22:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 462F861016;
	Wed, 26 Jan 2022 22:17:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MMO-mzYarhqO; Wed, 26 Jan 2022 22:17:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7989361005;
	Wed, 26 Jan 2022 22:17:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BFBC71BF475
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD9E784D8E
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:17:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JeOr6sNZedw6 for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 22:17:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6570484D8A
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 22:17:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:61f5:fb85:a06d:c0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9BCDC13F879;
 Wed, 26 Jan 2022 23:17:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1643235430;
 bh=LEGXU61IHXLtLp55JOSS7B7e5fVIOsvfwbeqZrYtsmM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PcdfGNVYVsSBdPppymV2NDoa8jYP2PDI48ARVYXGswJ5+1TgrVB6V/+5ouOrHypvi
 UMTiNEsvbgQHDzXcTggwcl6gLLKXvFoVIYOzhydIomEF77wToqLgHol3Af81LVqoFI
 0YQV6SAO9X0HpxqbOs7wpvwUFVeZmodl+KxFwylo0zSRdJAFFQh98kjd7J2TFhFGvQ
 q5BPEqIYf3dcgSqKUkDrI5eXVERa+zeN5B3yZSRv6doQg69XxD4GKtl9e7mA9dzPr1
 OByDdNRuugYr/spF/5VbZBR155oRKqxMw/acLs0caQ8vdPGeMtwfOhTuLnLe5a38L4
 hvHCkmkjL7IwA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 26 Jan 2022 23:17:08 +0100
Date: Wed, 26 Jan 2022 23:17:08 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Evgeni Dobrev <evgeni@studio-punkt.com>
Message-ID: <20220126221708.GK457876@scaer>
References: <20220124104116.12902-1-evgeni@studio-punkt.com>
 <20220124104116.12902-2-evgeni@studio-punkt.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220124104116.12902-2-evgeni@studio-punkt.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] fs: fix /tmp and /run clean-up in POSIX
 shells
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

Evgeni, All,

On 2022-01-24 11:41 +0100, Evgeni Dobrev via buildroot spake thusly:
> In POSIX sh, ^ in place of ! in glob bracket expressions
> is undefined.
> 
> Signed-off-by: Evgeni Dobrev <evgeni@studio-punkt.com>
> ---
>  fs/common.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index 45beb5ae7b..64a94d9ad8 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -186,7 +186,7 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
>  
>  	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),\
>  		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
> -	echo "rm -rf $$(TARGET_DIR)/run/* $$(TARGET_DIR)/run/.[^.]* $$(TARGET_DIR)/tmp/* $$(TARGET_DIR)/tmp/.[^.]*" >> $$(FAKEROOT_SCRIPT)
> +	echo "rm -rf $$(TARGET_DIR)/run/* $$(TARGET_DIR)/run/.[!.]* $$(TARGET_DIR)/tmp/* $$(TARGET_DIR)/tmp/.[!.]*" >> $$(FAKEROOT_SCRIPT)

TIL that bracket expressions are actually valid and specified by POSIX.

But we do guarantee that we do have bash as a shell when running
Buildroot, so I think it is fair to also run the fs script with bash:


    diff --git a/fs/common.mk b/fs/common.mk
    index 45beb5ae7b..f8a6da6bc4 100644
    --- a/fs/common.mk
    +++ b/fs/common.mk
    @@ -172,7 +172,7 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
     		$$(BASE_TARGET_DIR)/ \
     		$$(TARGET_DIR)
     
    -	echo '#!/bin/sh' > $$(FAKEROOT_SCRIPT)
    +	echo '#!$(SHELL)' > $$(FAKEROOT_SCRIPT)
     	echo "set -e" >> $$(FAKEROOT_SCRIPT)
     
     	echo "chown -h -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)

However, $(SHELL) is not always correct, so we'd probably need:

    diff --git a/Makefile b/Makefile
    index 5fc7137e5a..bb9955f5b6 100644
    --- a/Makefile
    +++ b/Makefile
    @@ -30,7 +30,7 @@
     # we want bash as shell
     SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
     	 else if [ -x /bin/bash ]; then echo /bin/bash; \
    -	 else echo sh; fi; fi)
    +	 else which sh; fi; fi)
     
     # Set O variable if not already done on the command line;
     # or avoid confusing packages that can use the O=<dir> syntax for out-of-tree

But in the end this is quite more changes than what you propose.

Can we also shorten the command?

    echo "rm -rf $$(TARGET_DIR)/{run,tmp}/* $$(TARGET_DIR)/{run,tmp}/.[!.]*" >> $$(FAKEROOT_SCRIPT)

Regards,
Yann E. MORIN.

>  	$$(call PRINTF,$$(ROOTFS_REPRODUCIBLE)) >> $$(FAKEROOT_SCRIPT)
>  	$$(call PRINTF,$$(ROOTFS_SELINUX)) >> $$(FAKEROOT_SCRIPT)
>  	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
> -- 
> 2.34.1
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
