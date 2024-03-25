Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1256C54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 21:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82E4081497;
	Mon, 25 Mar 2024 21:45:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GiuznDoIH-De; Mon, 25 Mar 2024 21:45:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68954814B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68954814B5;
	Mon, 25 Mar 2024 21:45:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A532F1BF2CB
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 21:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9261140BF7
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 21:45:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6GESK4x4BV2o for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 21:45:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 46AC5405F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46AC5405F1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46AC5405F1
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 21:45:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6F67113F846;
 Mon, 25 Mar 2024 22:45:20 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 25 Mar 2024 22:45:20 +0100
Date: Mon, 25 Mar 2024 22:45:20 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Brian Mayer <bleemayer@gmail.com>
Message-ID: <ZgHwcNeIZdSD19Lz@landeda>
References: <CAB3eKoAK26-HuqGE+ewedW9-o6izS754ybr_KdanQwERZebapA@mail.gmail.com>
 <CAB3eKoAXBR9MSf1od3mqBnaBV1+xD8BYegFkRQo31UDSx0JQZw@mail.gmail.com>
 <CAB3eKoABoAsDrsdRZq8uCoxu3uExOMiAY9KsUBYGxoFD_nE-=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAB3eKoABoAsDrsdRZq8uCoxu3uExOMiAY9KsUBYGxoFD_nE-=Q@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711403123;
 bh=XXoOvH9blDYtOMdj4M0rtmUVSnqMakISA92A8D44C4k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZZdEZoilFu0Pn5/jGqUYslIEu/ApsRcmFfaNvV1MXaMHe0VNClnWmwMtvjpnOH5CR
 Akxj2aGAVPV+UtRxmt5O8X6QspzgLXLgKFH0xL1GoCrZAyA4Xl3Ia24UcxUUmZyrew
 cFZOkcRS5ddeKDLCo9fN7rSOSv/et1UHEiz2L4eb5fTGwLB3kbr0qAcrv8x/f5qtjY
 WBJutji3mOxvJj9Y9pu6sr4wri7cVL5BUrkaCtQyN0qyFliG/DlorvC5m/6SB2Lohj
 Nh9qnG378c7HYwocRQTGjTK1cDd0VHzpEcR2WK6vr7XZ6xkDEfwdeHVZGPdS350ae7
 Ke7YdqNtbRv3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZZdEZoil
Subject: Re: [Buildroot] [PATCH] package/sbase: new package
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

Brian, All,

On 2024-03-25 17:10 -0300, Brian Mayer spake thusly:
> sbase is a collection of unix tools that are inherently portable across
> UNIX and UNIX-like systems.
> 
> Signed-off-by: brian <git@myr.sh>

It seems something got slightly wrong when you sent the patch:
  - there was a first one with just the change to package/Config.in
  - then there was one with everything, but it got line-wrapped (see
    below)

This made patchwork miss the second one entirely:
    https://patchwork.ozlabs.org/project/buildroot/patch/CAB3eKoAXBR9MSf1od3mqBnaBV1+xD8BYegFkRQo31UDSx0JQZw@mail.gmail.com/

[--SNIP--]
> diff --git a/package/sbase/Config.in b/package/sbase/Config.in
> new file mode 100644
> index 0000000000..b6ef049b11
> --- /dev/null
> +++ b/package/sbase/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_SBASE
> +        bool "sbase"
> +        help
> +          sbase is a collection of unix tools that are inherently
> portable across
> +         UNIX and UNIX-like systems.
> +
> +         The complement of sbase is ubase[1] which is Linux-specific
> and provides

The lines have been line-wrapped. To avoid that, use 'git send-email'
which properly formats a patch for sending.

Also, it seems they were too long anywat. Please run:

    ./utils/docker-run make check-package

to validate asic coding style rules.

> +         all the non-portable tools. Together they are intended to form a base
> +         system similar to busybox but much smaller and suckless.
> +
> +          https://git.suckless.org/sbase/
> diff --git a/package/sbase/sbase.hash b/package/sbase/sbase.hash
> new file mode 100644
> index 0000000000..d13f3bd110
> --- /dev/null
> +++ b/package/sbase/sbase.hash
> @@ -0,0 +1 @@
> +sha256  af10b9995526b6367e6e11453f4762e4c67d2835ecba7257716b5024440e6f51
>  sbase-13898fa7a91155a60c4c0bd61d4b7693a2ff3f09-br1.tar.gz

Ditto, line-wrapped...

Regards,
Yann E. MORIN.

> diff --git a/package/sbase/sbase.mk b/package/sbase/sbase.mk
> new file mode 100644
> index 0000000000..373ec4965b
> --- /dev/null
> +++ b/package/sbase/sbase.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# sbase
> +#
> +################################################################################
> +
> +SBASE_VERSION = 13898fa7a91155a60c4c0bd61d4b7693a2ff3f09
> +SBASE_SITE = git://git.suckless.org/sbase
> +SBASE_SITE_METHOD = git
> +SBASE_LICENSE = MIT
> +SBASE_LICENSE_FILES = LICENSE README
> +SBASE_CPE_ID_VENDOR = sbase
> +
> +define SBASE_BUILD_CMDS
> +       $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
> +endef
> +
> +define SBASE_INSTALL_TARGET_CMDS
> +       $(MAKE) PREFIX=/usr DESTDIR=$(TARGET_DIR) -C $(@D) install
> +endef
> +
> +$(eval $(generic-package))
> --
> 2.44.0
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
