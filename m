Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ADB4C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:03:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E482610CE
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E482610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07037404AC;
	Sun,  1 Aug 2021 12:03:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ghxi5dpTnck2; Sun,  1 Aug 2021 12:03:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 285E9404AE;
	Sun,  1 Aug 2021 12:03:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9A3A11BF836
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 877D040383
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:03:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Blm8PfQnuh-A for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 12:03:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF02040155
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 12:03:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:89a2:641e:9d1f:2c0d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 65C205FF7A;
 Sun,  1 Aug 2021 14:03:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627819406;
 bh=wRpbytLRLurnUB4CS8yNq6HE/FwKAOXNT7JdwOruVRc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MQYFuhRbnwuCc/mlYDhfTH+R4JW1Jp39dQBuRrapVGJSypzJ9H+Vp6BLbq+K8K3PT
 PbbLOmeAJn7rgOcvNoAfzlWW9EECgaXXqKkFiTNNQV5JVceSpxiITn+eCNHUPWi0EH
 QxxZvPT+stJDF5nWNPPC5xP95TNqAa+5IEiWCgyS4LJqb06nZXzjPBR4BzyuiqNixf
 O7BBNRQ8j2ZlmuKMxJKduF0yRCm3fQuV28LF8HXhqtwBRHXWJ0dFEK1YVGTyOH6mOE
 VX7zngndftBvt0PiOulBNi08rjvODsjodanUnhwPUfU+ua9v9L/kj2IuwVNzpc4MnH
 kKNcYWWZ7cSHA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 Aug 2021 14:03:20 +0200
Date: Sun, 1 Aug 2021 14:03:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20210801120320.GS3189549@scaer>
References: <20210731222752.64315-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210731222752.64315-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 1/1] package/system-config-printer: new
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

On 2021-07-31 16:27 -0600, James Hilliard spake thusly:
> This package has some udev tools to assist with printer autodetection.

Sorry, but this is still not enough:

    $ make check-package
    package/Config.in:2123: Packages in: menu "Networking applications",
                            are not alphabetically ordered;
                            correct order: '-', '_', digits, capitals, lowercase;
                            first incorrect package: dante

Also:

    $ make system-config-printer-configure
    [...]
    ./configure: line 7043: cups-config: command not found
    [...]

This is needed to set the path to the CUPS server executable (I guess):

    $ cat -n configure.ac
    [...]
       36 cupsserverbindir="`cups-config --serverbin`"
       37 AC_SUBST(cupsserverbindir)
    [...]

And thus:

    $ grep cupsserverbin config.status
    S["cupsserverbindir"]=""

which is later used to locate the CUPS filters:

    $ grep -nr cupsserverbindir .
    ./cupshelpers/cupshelpers.py:873: [...] config.cupsserverbindir + "/filter:"
    ./cupshelpers/cupshelpers.py:876: [...] add_missing (config.cupsserverbindir + "/filter/" + exe)
    ./cupshelpers/config.py.in:24:cupsserverbindir="@cupsserverbindir@"

So, maybe you have a cups-config in your PATH already, and that happens
to provide the correct setting...

[--SNIP--]
> diff --git a/package/Config.in b/package/Config.in
> index 5941e35c05..fa916370f0 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2120,6 +2120,7 @@ menu "Networking applications"
>  	source "package/ctorrent/Config.in"
>  	source "package/cups/Config.in"
>  	source "package/cups-filters/Config.in"
> +	source "package/system-config-printer/Config.in"

Alphabetical order, please. Reported by:  make check-package

[--SNIP--]
> diff --git a/package/system-config-printer/system-config-printer.mk b/package/system-config-printer/system-config-printer.mk
> new file mode 100644
> index 0000000000..05dd2f5b46
> --- /dev/null
> +++ b/package/system-config-printer/system-config-printer.mk
> @@ -0,0 +1,33 @@
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

It really seems to be GPL-2.0-or-later, as specified in many files:

    In check-device-ids.py:

    ## This program is free software; you can redistribute it and/or modify
    ## it under the terms of the GNU General Public License as published by
    ## the Free Software Foundation; either version 2 of the License, or
    ## (at your option) any later version.

At a cursory glance, I could not spot a file that was GPL-2.0-only...

> +SYSTEM_CONFIG_PRINTER_LICENSE_FILES = COPYING
> +SYSTEM_CONFIG_PRINTER_DEPENDENCIES = cups host-intltool

configure.ac also uses PKG_CHECK_MODULES(), so it needs to depend on
host-pkgconf.

> +SYSTEM_CONFIG_PRINTER_AUTORECONF = YES

This needs an explanation why autoreconf is needed. We usually just name
the patch that touches it:

    # 0001-Add-option-to-disable-xmlto-manual-generation.patch
    SYSTEM_CONFIG_PRINTER_AUTORECONF = YES

(but I had to add another patch, so I've also listed it).

> +
> +ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
> +SYSTEM_CONFIG_PRINTER_DEPENDENCIES += libglib2
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBGLIB2)$(BR2_PACKAGE_LIBUSB)$(BR2_PACKAGE_HAS_UDEV),yyy)
> +SYSTEM_CONFIG_PRINTER_CONF_OPTS = --with-udev-rules=yes

In conditional blocks, always use append-assignement:

    SYSTEM_CONFIG_PRINTER_CONF_OPTS += --with-udev-rules=yes

This caused issues as I had to add this, earlier on the file:

    SYSTEM_CONFIG_PRINTER_CONF_OPTS = --with-cups-config=...

And I add to add the asociated patch that adds --with-cups-config.

With all those changes: applied to master, thanks. Please review what I
did in case I really borked something...

Also, could you push that new patch 0002-configure-accept-non-system-cups-config.patch
I added, to upstream, please?

Regards,
Yann E. MORIN.

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
