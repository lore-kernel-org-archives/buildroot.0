Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01437C4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 09:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE27C4175A;
	Sun,  5 May 2024 09:21:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eeYbEd5sYlkl; Sun,  5 May 2024 09:21:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32F8941E4E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32F8941E4E;
	Sun,  5 May 2024 09:21:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9063F1BF4E7
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 09:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CFBA400F9
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 09:21:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 965yLGZUcOrM for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 09:21:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1A8AB40B3F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A8AB40B3F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A8AB40B3F
 for <buildroot@buildroot.org>; Sun,  5 May 2024 09:21:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E2E8C13F89C;
 Sun,  5 May 2024 11:21:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 May 2024 11:21:40 +0200
Date: Sun, 5 May 2024 11:21:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Brandon Maier <brandon.maier@collins.com>
Message-ID: <ZjdPpKQw4Z1sKwi9@landeda>
References: <20240503020000.3168109-1-brandon.maier@collins.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240503020000.3168109-1-brandon.maier@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714900904;
 bh=knvI2sPJ/WfXMB94/l2KnBKjfh/ex+/LERG4/ksYkIg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B6uT1pNjLMVW2fT28q+ajHybLJ8EwhnQDq4EFi8HwfwDXVQfjuYYD+87AYUEoqn9Z
 qfoVkKGhDDhEXx3/t882CHJFqwnVAMDKpFShxKHCrETQqBDILbsn4IiFd+UUpXpLxA
 MYci0dEMZcsNf7QBSbmwkmX8H00jzkIIHmaysyL5qN6BLes1eouQrpauPnyM0x/1Cf
 ylscFQnVy+qVcDbga2cIs+hgOWJp6ObCH0mCUkbGwpfiHKb6n8yCrN85jbSTy7IiaB
 OFv+GPBRGwV7Ao3vfpZStsSfbLmS/xXs8Htg0TdnqZ49Il/KYjMoeilrnqyFobu0H0
 zfxe0f5MhzTkg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=B6uT1pNj
Subject: Re: [Buildroot] [PATCH v3 1/4] package/bats-support: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Brandon, All,

On 2024-05-03 01:59 +0000, Brandon Maier via buildroot spake thusly:
> This library provides support functions needed by the bats-assert and
> bats-file libraries.
> 
> This library does not provide an installer. Manually install the files
> under /usr/lib/bats/bats-support which is what the Arch Linux package
> does[1]. This makes the library loadable using `bats_load_library`[2].
> 
> [1] https://gitlab.archlinux.org/archlinux/packaging/packages/bats-support/-/blob/main/PKGBUILD?ref_type=heads
> [2] https://bats-core.readthedocs.io/en/stable/writing-tests.html#bats-load-library-load-system-wide-libraries
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
[--SNIP--]
> diff --git a/package/Config.in b/package/Config.in
> index 38e9c94198..f1da714418 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -170,6 +170,7 @@ endmenu
>  menu "Development tools"
>  	source "package/avocado/Config.in"
>  	source "package/bats-core/Config.in"
> +	source "package/bats-support/Config.in"

While this looks like the thing to do, including the bats sub-packages
from here is sub-optimal. Indeed, when all the series is applied, the
menuconfig will look something like:

    [ ] bats-assert (NEW)
    [*] bats
    [ ]   bats-file (NEW)
    [ ]   bats-support (NEW)

This is not very nice-looking.

Instead, I've moved the 'source' statements to the bats-core package
itself (elided for brevity; check the actual package for exact code):

    config BR2_PACKAGE_BATS_CORE
        bool "bats-core"

    if BR2_PACKAGE_BATS_CORE

    source "package/bats-assert/Config.in"
    source "package/bats-file/Config.in"
    source "package/bats-support/Config.in"

    endif

Now the menuconfig looks nicer:

    [*] bats
    [ ]   bats-assert (NEW)
    [ ]   bats-file (NEW)
    [ ]   bats-support (NEW)

As a consequence of the includes now being guarded by the if-endif
conditional block, the dependency on bats-core is no longer needed on
each package, so I also dropped it.

Series applied to master with this little cleanup, thanks!

Regards,
Yann E. MORIN.

>  	source "package/binutils/Config.in"
>  	source "package/bitwise/Config.in"
>  	source "package/bsdiff/Config.in"
> diff --git a/package/bats-support/Config.in b/package/bats-support/Config.in
> new file mode 100644
> index 0000000000..24b49cee1d
> --- /dev/null
> +++ b/package/bats-support/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_BATS_SUPPORT
> +	bool "bats-support"
> +	depends on BR2_PACKAGE_BATS_CORE # runtime
> +	help
> +	  bats-support is a supporting library providing common
> +	  functions to test helper libraries written for Bats.
> +
> +	  https://github.com/bats-core/bats-support
> diff --git a/package/bats-support/bats-support.hash b/package/bats-support/bats-support.hash
> new file mode 100644
> index 0000000000..847f39e7c7
> --- /dev/null
> +++ b/package/bats-support/bats-support.hash
> @@ -0,0 +1,5 @@
> +# Locally calculated
> +sha256  7815237aafeb42ddcc1b8c698fc5808026d33317d8701d5ec2396e9634e2918f  bats-support-0.3.0.tar.gz
> +
> +# License files
> +sha256  36ffd9dc085d529a7e60e1276d73ae5a030b020313e6c5408593a6ae2af39673  LICENSE
> diff --git a/package/bats-support/bats-support.mk b/package/bats-support/bats-support.mk
> new file mode 100644
> index 0000000000..765e08ffce
> --- /dev/null
> +++ b/package/bats-support/bats-support.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# bats-support
> +#
> +################################################################################
> +
> +BATS_SUPPORT_VERSION = 0.3.0
> +BATS_SUPPORT_SITE = $(call github,bats-core,bats-support,v$(BATS_SUPPORT_VERSION))
> +BATS_SUPPORT_LICENSE = CC0-1.0
> +BATS_SUPPORT_LICENSE_FILES = LICENSE
> +
> +define BATS_SUPPORT_INSTALL_TARGET_CMDS
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib/bats/bats-support/src
> +	$(INSTALL) -m 0755 $(@D)/*.bash -t $(TARGET_DIR)/usr/lib/bats/bats-support
> +	$(INSTALL) -m 0755 $(@D)/src/*.bash -t $(TARGET_DIR)/usr/lib/bats/bats-support/src
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 2.44.0
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
