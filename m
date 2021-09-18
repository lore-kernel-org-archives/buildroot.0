Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCACC433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 15:07:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51652611C8
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 15:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51652611C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 118AF606B6;
	Sat, 18 Sep 2021 15:07:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GEuDD23QX2Ok; Sat, 18 Sep 2021 15:07:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43DDC6060A;
	Sat, 18 Sep 2021 15:07:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 08F191BF861
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 15:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E94FA6060A
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 15:07:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cHEye71CaU3W for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 15:07:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DAFBA605E8
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 15:07:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 70BAB200348;
 Sat, 18 Sep 2021 17:07:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631977661;
 bh=kuanagYwDoToMYx7jxcLddUaDL037w70UYYesOre9+o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NUiX4yq/5b+J95KMede0tKpmlFjXs6fsfQBIy1hvIXkp5pxbQdOGUD8uTPTx71Gkd
 y7tiijKBcncJkG1FbKTByBWM6rr7h7hnOPStdeRo7gjAz9L2KtddKxKEsHmTGCJc7O
 DFINNWT1ARX1EREFp0u9rzNrueFQYKAz9o77CYBJuxiMdqA3lc72g54X3nG6S05IbD
 P/c6U2/qDqNz98tSQ1/7xaaAEu+FRwK9ysGJrH//WzEiK3huBhYVpUNA2YWAhhtA1/
 PFp5dn5z4WuZ10oa/8TaYNnWGQadZhdw3VHS3M2F6uqoYJuDwH6FiZgGi+TFZiGfF+
 aA1pYAWyPIOmw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 17:07:33 +0200
Date: Sat, 18 Sep 2021 17:07:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20210918150733.GS1053080@scaer>
References: <20210916170700.1123980-1-aduskett@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210916170700.1123980-1-aduskett@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/libglib2: bump version to 2.68.4
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
Cc: Adam Duskett <aduskett@rivian.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Adam, All,

On 2021-09-16 10:07 -0700, Adam Duskett spake thusly:
> From: Adam Duskett <aduskett@rivian.com>
> 
> Signed-off-by: Adam Duskett <aduskett@rivian.com>
> ---
>  package/libglib2/0002-remove-cpp-requirement.patch | 2 +-
>  package/libglib2/libglib2.hash                     | 4 ++--
>  package/libglib2/libglib2.mk                       | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libglib2/0002-remove-cpp-requirement.patch b/package/libglib2/0002-remove-cpp-requirement.patch
> index 9393bd258a..c402cbafa5 100644
> --- a/package/libglib2/0002-remove-cpp-requirement.patch
> +++ b/package/libglib2/0002-remove-cpp-requirement.patch
> @@ -35,7 +35,7 @@ index 4bbf4c2..ac59f4e 100644
>  @@ -1,4 +1,4 @@
>  -project('glib', 'c', 'cpp',
>  +project('glib', 'c',
> -   version : '2.68.2',
> +   version : '2.68.4',
>     # NOTE: We keep this pinned at 0.49 because that's what Debian 10 ships
>     meson_version : '>= 0.49.2',
>  @@ -10,7 +10,6 @@ project('glib', 'c', 'cpp',
> diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
> index 15e0085f78..d421e025ff 100644
> --- a/package/libglib2/libglib2.hash
> +++ b/package/libglib2/libglib2.hash
> @@ -1,4 +1,4 @@
> -# https://download.gnome.org/sources/glib/2.68/glib-2.68.2.sha256sum
> -sha256  ecc7798a9cc034eabdfd7f246e6dd461cdbf1175fcc2e9867cc7da7b7309e0fb  glib-2.68.2.tar.xz
> +# https://download.gnome.org/sources/glib/2.68/glib-2.68.4.sha256sum
> +sha256  62fd061d08a75492617e625a73e2c05e259f831acbb8e1f8b9c81f23f7993a3b  glib-2.68.4.tar.xz
>  # License files, locally calculated
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> index 4f13622e36..af73aeb3bf 100644
> --- a/package/libglib2/libglib2.mk
> +++ b/package/libglib2/libglib2.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBGLIB2_VERSION_MAJOR = 2.68
> -LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
> +LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4

    $ make libglib2-patch
    [...]
    Applying 0004-correctly-use-3-parameters-for-close_range.patch using patch:
    patching file glib/gspawn.c
    Reversed (or previously applied) patch detected!  Skipping patch.
    1 out of 1 hunk ignored -- saving rejects to file glib/gspawn.c.rej
    make[1]: *** [package/pkg-generic.mk:251: /home/ymorin/dev/buildroot/O/build/libglib2-2.68.4/.stamp_patched] Error 1
    make: *** [Makefile:23: _all] Error 2

Meh...

Regards,
Yann E. MORIN.

>  LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
>  LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
>  LIBGLIB2_LICENSE = LGPL-2.1+
> -- 
> 2.30.2
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
