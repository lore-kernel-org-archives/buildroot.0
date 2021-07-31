Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09155C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 11:22:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD13160EC0
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 11:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD13160EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 769C16075D;
	Sat, 31 Jul 2021 11:22:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 74CxcfeydSbr; Sat, 31 Jul 2021 11:22:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96E8260754;
	Sat, 31 Jul 2021 11:21:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3321E1BF846
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 11:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 224188376D
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 11:21:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Pd7Pd0WBPP8 for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 11:21:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B87E83750
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 11:21:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:bd5f:2690:7a2e:30fd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 9E16E780316;
 Sat, 31 Jul 2021 13:21:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627730512;
 bh=tyxun0wHIy1kg/BcjDNmZZPTYbxGaDUmbaUXHaBKG5I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BFY6+n4dt2Wsk/QwL2mFi44Zzf4foJ3NxZ16UvGca7GDZrFy+Ozbu7ndGohLMy/BB
 /j3uiqt0vmDpa4XqUYyT5GLe3RxC2D/Mq+czSoPj+B/cO7pl6X3BTPCX9JhkDMJyhu
 b42LOL5frptidgewUkaaaXuBx5TcwLgvZ6t8kplkwKLkaML1dxvxhLBRLo1JPgUBrk
 KeHXVzpLndGJJjSi8+TJ1kK77v89BK7ijxW56NGDKLE+A1GpsqtISuQ9ks4ud+Bc8q
 rLy159ZjMtYkjQ1DTDMlGqNW0qQ6Fnct6B8TdIgHHIAr3v480v3VBR7+Q+LauOSWuk
 5a9B6yWjUtfEA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 31 Jul 2021 13:21:46 +0200
Date: Sat, 31 Jul 2021 13:21:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20210731112146.GL3189549@scaer>
References: <20210726185110.3333950-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210726185110.3333950-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 1/1] package/system-config-printer: new
 package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

James, All,

On 2021-07-26 12:51 -0600, James Hilliard spake thusly:
> This package has some udev tools to assist with printer autodetection.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>   - update patch to merged upstream version
> ---
>  package/Config.in                             |  1 +
>  ...n-to-disable-xmlto-manual-generation.patch | 73 +++++++++++++++++++
>  package/system-config-printer/Config.in       |  7 ++
>  .../system-config-printer.hash                |  3 +
>  .../system-config-printer.mk                  | 32 ++++++++
>  5 files changed, 116 insertions(+)
>  create mode 100644 package/system-config-printer/0001-Add-option-to-disable-xmlto-manual-generation.patch
>  create mode 100644 package/system-config-printer/Config.in
>  create mode 100644 package/system-config-printer/system-config-printer.hash
>  create mode 100644 package/system-config-printer/system-config-printer.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 12b1323fc2..2bd507c993 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2116,6 +2116,7 @@ menu "Networking applications"
>  	source "package/ctorrent/Config.in"
>  	source "package/cups/Config.in"
>  	source "package/cups-filters/Config.in"
> +	source "package/system-config-printer/Config.in"
>  	source "package/dante/Config.in"
>  	source "package/darkhttpd/Config.in"
>  	source "package/dehydrated/Config.in"
> diff --git a/package/system-config-printer/0001-Add-option-to-disable-xmlto-manual-generation.patch b/package/system-config-printer/0001-Add-option-to-disable-xmlto-manual-generation.patch
> new file mode 100644
> index 0000000000..e2cf395811
> --- /dev/null
> +++ b/package/system-config-printer/0001-Add-option-to-disable-xmlto-manual-generation.patch
> @@ -0,0 +1,73 @@
> +From 731c8d7e1f9edb527785d61f74031a5e5846554b Mon Sep 17 00:00:00 2001
> +From: James Hilliard <james.hilliard1@gmail.com>
> +Date: Sun, 25 Jul 2021 16:30:59 -0600
> +Subject: [PATCH] Add option to disable xmlto manual generation.
> +
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +[james.hilliard1@gmail.com: backport from upstream commit
> +95e0b461f5a46c74b00287aca65732ea2fc9d69b]
> +---
> + Makefile.am  | 7 ++++++-
> + configure.ac | 5 +++++

This patch touches configure.ac and Makefile.am, so...

[--SNIP--]
> diff --git a/package/system-config-printer/system-config-printer.mk b/package/system-config-printer/system-config-printer.mk
> new file mode 100644
> index 0000000000..5a796515e3
> --- /dev/null
> +++ b/package/system-config-printer/system-config-printer.mk
> @@ -0,0 +1,32 @@
> +################################################################################
> +#
> +# system-config-printer
> +#
> +################################################################################
> +
> +SYSTEM_CONFIG_PRINTER_VERSION = 1.5.15
> +SYSTEM_CONFIG_PRINTER_SOURCE = system-config-printer-$(SYSTEM_CONFIG_PRINTER_VERSION).tar.xz
> +SYSTEM_CONFIG_PRINTER_SITE = https://github.com/OpenPrinting/system-config-printer/releases/download/v$(SYSTEM_CONFIG_PRINTER_VERSION)
> +SYSTEM_CONFIG_PRINTER_LICENSE = GPL-2.0
> +SYSTEM_CONFIG_PRINTER_LICENSE_FILES = COPYING
> +SYSTEM_CONFIG_PRINTER_DEPENDENCIES = cups

... you need: SYSTEM_CONFIG_PRINTER_AUTORECONF = YES

Otherwise, the autotools ,achinery will try to run autorconf on its
own, and may/will fail because it is goign to be using the host's
autoreconf et al., without the envirnement and options we need in the
Buildroot context.

Care to have a look and respin, please?

Regards,
Yann E. MORIN.

> +ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
> +SYSTEM_CONFIG_PRINTER_DEPENDENCIES += libglib2
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBGLIB2)$(BR2_PACKAGE_LIBUSB)$(BR2_PACKAGE_HAS_UDEV),yyy)
> +SYSTEM_CONFIG_PRINTER_CONF_OPTS = --with-udev-rules=yes
> +SYSTEM_CONFIG_PRINTER_DEPENDENCIES += libusb udev
> +else
> +SYSTEM_CONFIG_PRINTER_CONF_OPTS = --with-udev-rules=no
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +SYSTEM_CONFIG_PRINTER_CONF_OPTS += --with-systemdsystemunitdir=/usr/lib/systemd/system
> +SYSTEM_CONFIG_PRINTER_DEPENDENCIES += systemd
> +else
> +SYSTEM_CONFIG_PRINTER_CONF_OPTS += --with-systemdsystemunitdir=no
> +endif
> +
> +$(eval $(autotools-package))
> -- 
> 2.25.1
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
