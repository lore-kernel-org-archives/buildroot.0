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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A27FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 15:31:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B83CB6126A
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 15:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B83CB6126A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 963E684206;
	Sat, 18 Sep 2021 15:31:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IeIVW1dJaknT; Sat, 18 Sep 2021 15:31:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5D0F841A7;
	Sat, 18 Sep 2021 15:31:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AAC3C1BF861
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 15:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A65C6400C3
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 15:31:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R2WcJyFGbMcQ for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 15:30:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A9B14000B
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 15:30:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B1C2DB00563;
 Sat, 18 Sep 2021 17:30:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631979057;
 bh=3aoUZSh+MUXMKBlhV2CeF244ueiUYVMrQKryVHQyb3k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZSmEsGkfQheayHd0f9KGhax4rI9+jOFs8DbmX7qBxUjhZXj4Z9C2lI2iM89CJHYDo
 0jmFTFDpcKo+84RP9tpwU5nv6RFA3p+G2Iq/SjG1urOgG5ev1wzmSnPnsF/xhNBCYX
 t+UQaD3JvbqQ496F8zO+aV/ip70N0kBYFdU7XSc5h5gvTp5MqbKgBz6AuX8PxjXeN0
 5Ys7WDSfoZiQqnI8078PhuGI97/44P4Nj5GvS4bNCA7CgCUQwcAX+y+1/0qUgOsm/K
 iBZW7bPvP4SNSFyVdxvETdPBiJWZhQG8EuSr6u0uVHXuj9JWSyi7RHYKyRnFZakBQz
 JKJk8RuEBRV7w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 17:30:50 +0200
Date: Sat, 18 Sep 2021 17:30:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20210918153050.GZ1053080@scaer>
References: <20210915191513.14918-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210915191513.14918-1-petr.vorel@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libqmi: bump version to 1.30.2
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
Cc: Aleksander Morgado <aleksander@aleksander.es>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Petr, All,

On 2021-09-15 21:15 +0200, Petr Vorel spake thusly:
> Drop patch from this release.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Applied to master, thanks.

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
