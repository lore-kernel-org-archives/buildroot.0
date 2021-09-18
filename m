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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07E4BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 19:54:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99AFF61051
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 19:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 99AFF61051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D8D240494;
	Sat, 18 Sep 2021 19:54:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g8iYgYopk6kd; Sat, 18 Sep 2021 19:54:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A339340470;
	Sat, 18 Sep 2021 19:54:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 810C51BF40A
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 19:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70A76605D8
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 19:54:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U8iC7omueZOY for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 19:54:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7319A605CF
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 19:54:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9DAE5B0054C;
 Sat, 18 Sep 2021 21:54:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631994884;
 bh=+B5fvQEve9r0wJU7cTXFPdLFBz8TpCkgGu9+UiOe2x4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nQoACgIitltg8OBtI4H8deH3Xu/gKb4U1JpKpaC+6XBajGOMwgLqxtID3H3tKYYg6
 Q6MHkUemi6knXe1jhSKRR7xDwxDuC8Uua1sRbVYHatuIHnVkQDXDYPdtjIYkaTvWyB
 LoLizTjgPPly1mUnuRge4NMf1b5/AXGWfkBNsniFrrDVz59TtN+FUH4H5NeIaFy1+E
 fLNYLvuIlzYxvzgjBH74NxzQ6RF7l3yx/xGBI4P8armird6jTLgKhM7jCoVZfmeLsi
 nzexH6nl11XCOTC4lAesN9Ar228Q/5LGzhdLLpD8LLdf97xSEu/DCPu0kn4nEdl0UC
 ju/8/VijyL0kw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 21:54:35 +0200
Date: Sat, 18 Sep 2021 21:54:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: yegorslists@googlemail.com
Message-ID: <20210918195435.GJ1053080@scaer>
References: <20210914162158.15045-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210914162158.15045-1-yegorslists@googlemail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/libqmi: bump to version 1.30.2
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Aleksander Morgado <aleksander@aleksander.es>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Yegor, All,

On 2021-09-14 18:21 +0200, yegorslists--- via buildroot spake thusly:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Remove the upstreamed patch.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Sorry, I did not notice you had sent this bump before I applied Petr's
patch.

Regards,
Yann E. MORIN.

> ---
>  ...build-meson-fix-introspection-option.patch | 33 -------------------
>  package/libqmi/libqmi.hash                    |  2 +-
>  package/libqmi/libqmi.mk                      |  2 +-
>  3 files changed, 2 insertions(+), 35 deletions(-)
>  delete mode 100644 package/libqmi/0001-build-meson-fix-introspection-option.patch
> 
> diff --git a/package/libqmi/0001-build-meson-fix-introspection-option.patch b/package/libqmi/0001-build-meson-fix-introspection-option.patch
> deleted file mode 100644
> index 0528868025..0000000000
> --- a/package/libqmi/0001-build-meson-fix-introspection-option.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From bfb066419f288764edbade1e27e93a5dda59a5f4 Mon Sep 17 00:00:00 2001
> -From: Aleksander Morgado <aleksander@aleksander.es>
> -Date: Fri, 6 Aug 2021 10:32:22 +0200
> -Subject: [PATCH] build,meson: fix introspection option
> -
> -Using -Dintrospection=false would actually not disable it. There is no
> -longer an "auto" option for the introspection support, it will be
> -either enabled or disabled depending on what the user asks
> -for (default enabled).
> -
> -Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ----
> - meson.build | 5 ++++-
> - 1 file changed, 4 insertions(+), 1 deletion(-)
> -
> -diff --git a/meson.build b/meson.build
> -index b25bca57..d28e5601 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -218,7 +218,10 @@ version_conf.set10('QMI_QRTR_SUPPORTED', enable_qrtr)
> - version_conf.set10('QMI_RMNET_SUPPORTED', enable_rmnet)
> -
> - # introspection support
> --enable_gir = dependency('gobject-introspection-1.0', version: '>= 0.9.6', required: get_option('introspection')).found()
> -+enable_gir = get_option('introspection')
> -+if enable_gir
> -+  dependency('gobject-introspection-1.0', version: '>= 0.9.6')
> -+endif
> -
> - random_number = qmi_minor_version + meson.version().split('.').get(1).to_int()
> -
> ---
> -2.17.0
> diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
> index 0373bb4e75..1f2da45ac0 100644
> --- a/package/libqmi/libqmi.hash
> +++ b/package/libqmi/libqmi.hash
> @@ -1,4 +1,4 @@
>  # Locally computed:
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> -sha256  c0421684c12697c448077dd5c0a66c6f745deab3558af578e3f10307c8a0c564  libqmi-1.30.0.tar.gz
> +sha256  2eb7c7971b91a64ad830643b0170cff692a69bf0f093ca61d72d3f466a0272d4  libqmi-1.30.2.tar.gz
> diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
> index 05fd3ae9af..cd2c2719f9 100644
> --- a/package/libqmi/libqmi.mk
> +++ b/package/libqmi/libqmi.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBQMI_VERSION = 1.30.0
> +LIBQMI_VERSION = 1.30.2
>  LIBQMI_SITE = https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/archive/$(LIBQMI_VERSION)
>  LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
>  LIBQMI_LICENSE_FILES = COPYING COPYING.LIB
> -- 
> 2.17.0
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
