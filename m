Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D7BC021AA
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 18:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D8F7605A1;
	Sat, 14 Sep 2024 18:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l3QGWZh4MD68; Sat, 14 Sep 2024 18:45:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B35706076D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B35706076D;
	Sat, 14 Sep 2024 18:45:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B6C271BF31D
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFFAF4060B
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h4UTvZf5xxsY for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 18:45:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E37F8405FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E37F8405FD
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E37F8405FD
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 18:45:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [IPv6:2a02:61:a2::3f4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id B63447804FD;
 Sat, 14 Sep 2024 20:45:03 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 14 Sep 2024 20:45:03 +0200
Date: Sat, 14 Sep 2024 20:45:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Hugo Cornelis <hugo.cornelis@essensium.com>
Message-ID: <ZuXZr1Wjgi6AvDpq@landeda>
References: <20240914172710.2917184-1-hugo.cornelis@essensium.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240914172710.2917184-1-hugo.cornelis@essensium.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726339505;
 bh=GD8UDpP1EWRd91jJAWQG0Pcwzj2XFVJ7GOdRny/1MVw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r3LL633H7NGPLZJTWoIfgFiyzfgOT50WGPHqG8aAVQiwRIKwKcdO9ZoDsmje0OCRv
 1Z0JSezPqcbNH4CxXAruLYBxuaOKQGtSnwsX9S8kMb8rjiqKJDviwj59Otq9YYr0JH
 KFXdfD2+0shRzYT3i09SxWhhIIvfyH/5k+19MhFwCN5os6lQAW7QZ1yeCNDKxuBppz
 Qi938Nc211THrWwuTNrAfMBJUj78LjMpB+BnK1y43NAJR58+XHbn01+iqbLxUKsdU5
 Cc/BDSgUSOU3UHaLAVHQggwbDu9tP6R/I5l8tHrrsZGr/82CSBPS42SJTCqXb0Elon
 ILv/gHm8NnuVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=r3LL633H
Subject: Re: [Buildroot] [PATCH 1/1] package/procps-ng: link the w command
 with systemd or elogin libs.
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

On 2024-09-14 19:27 +0200, Hugo Cornelis via buildroot spake thusly:
> The build of procps-ng was broken when systemd was enabled.  Applying
> commit ca004d46 of procps-ng upstream to explictly link the 'w'
> command to libsystemd or elogind even though libproc2 is linked to it.
> 
> This was (likely) broken since the upgrade to procps-ng v4.0.4 with
> commit d79f40dbbe98983bc657d4c82d46b38b8283351b.
> 
> Fixes: http://autobuild.buildroot.org/results/e8b/e8bae7bfd7d6a7987f3afa199d8d944429144817/build-end.log

I've also added Fixes: tag for the issue in gitlab:
    https://gitlab.com/buildroot.org/buildroot/-/issues/28

(But that did not actually auto-closed the issue, unfortunately, but
obviously that's not on you.)

> Signed-off-by: Hugo Cornelis <hugo.cornelis@essensium.com>
> ---
>  ...1-build-sys-Add-systemd-elogind-to-w.patch | 48 +++++++++++++++++++
>  package/procps-ng/procps-ng.mk                |  3 ++
>  2 files changed, 51 insertions(+)
>  create mode 100644 package/procps-ng/0001-build-sys-Add-systemd-elogind-to-w.patch
> 
> diff --git a/package/procps-ng/0001-build-sys-Add-systemd-elogind-to-w.patch b/package/procps-ng/0001-build-sys-Add-systemd-elogind-to-w.patch
> new file mode 100644
> index 0000000000..3fecb4746d
> --- /dev/null
> +++ b/package/procps-ng/0001-build-sys-Add-systemd-elogind-to-w.patch
> @@ -0,0 +1,48 @@
> +From 788248ee631b3b5f82073c36320fc3f4a3c8f9ba Mon Sep 17 00:00:00 2001
> +From: Craig Small <csmall@dropbear.xyz>
> +Date: Thu, 31 Aug 2023 22:24:23 +1000
> +Subject: [PATCH 1/1] build-sys: Add systemd/elogind to w

    $ ./utils/docker-run make check-package
    package/procps-ng/0001-build-sys-Add-systemd-elogind-to-w.patch:4: generate your patches with 'git format-patch -N'

I've fixed that when applying to master, thanks!

Regards,
Yann E. MORIN.

> +Depending on the compiler flags, w needs to be explictly linked
> +to libsystemd or elogind even though libproc2 is linked to it.
> +
> +Signed-off-by: Craig Small <csmall@dropbear.xyz>
> +Upstream: https://gitlab.com/procps-ng/procps/-/commit/ca004d4657d5e8b468a4552ede429be53193a3a9
> +Signed-off-by: Hugo Cornelis <hugo.cornelis@essensium.com>
> +---
> + Makefile.am | 7 +++++++
> + NEWS        | 3 +++
> + 2 files changed, 10 insertions(+)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index f70c8fb1..ddfc0141 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -149,6 +149,13 @@ endif
> + 
> + dist_man_MANS += man/w.1
> + src_w_SOURCES = src/w.c local/fileutils.c
> ++src_w_LDADD = $(LDADD)
> ++if WITH_SYSTEMD
> ++src_w_LDADD += @SYSTEMD_LIBS@
> ++endif
> ++if WITH_ELOGIND
> ++src_w_LDADD += @ELOGIND_LIBS@
> ++endif
> + else
> +   EXTRA_DIST += man/w.1
> + endif
> +diff --git a/NEWS b/NEWS
> +index 3f2158d4..4ad9f74e 100644
> +--- a/NEWS
> ++++ b/NEWS
> +@@ -1,3 +1,6 @@
> ++procps-ng-NEXT
> ++---------------
> ++
> + procps-ng-4.0.4
> + ---------------
> +   * library (API & ABI unchanged)
> +-- 
> +2.34.1
> +
> diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
> index 2f28e3571e..1002d6340f 100644
> --- a/package/procps-ng/procps-ng.mk
> +++ b/package/procps-ng/procps-ng.mk
> @@ -14,6 +14,9 @@ PROCPS_NG_INSTALL_STAGING = YES
>  PROCPS_NG_DEPENDENCIES = ncurses host-pkgconf $(TARGET_NLS_DEPENDENCIES)
>  PROCPS_NG_CONF_OPTS = LIBS=$(TARGET_NLS_LIBS)
>  
> +# Applying 0001-build-sys-Add-systemd-elogind-to-w.patch touches Makefile.am
> +PROCPS_NG_AUTORECONF = YES
> +
>  ifeq ($(BR2_PACKAGE_SYSTEMD),y)
>  PROCPS_NG_DEPENDENCIES += systemd
>  PROCPS_NG_CONF_OPTS += --with-systemd
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
