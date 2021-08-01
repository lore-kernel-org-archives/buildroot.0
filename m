Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8057DC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:20:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4134F610A2
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4134F610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19DC1607EA;
	Sun,  1 Aug 2021 12:20:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XsbuLIjSzSY5; Sun,  1 Aug 2021 12:20:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57D9B6078F;
	Sun,  1 Aug 2021 12:20:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 026551BF2EF
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6B3C403A9
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:20:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id feBGZe0No_2f for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 12:20:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4FAF340393
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 12:20:33 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 c2-20020a0568303482b029048bcf4c6bd9so14792813otu.8
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 05:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PIfdRyrLpi3ofFjsA+q0OOdpX9rpAfif6XwLPCnigGY=;
 b=kPNTWEY4ad3k055fdNvz2q0nxW4ks4Kx90HELKu2U17wRtSHpKENDSw+g6HWMbGFMn
 u9arUBrDjYP8Ay7pI+hraXDMxjLnqKTOKiRCqVBiAIxHMd57g1s3893FnMdp11/AtH6k
 1PRTcFV5XejtCO1OgWA8UZV3cbtnIWifLRzF1q5Kno0iPfPmR+xduYckDXWt8eruv2HV
 BURZuOG1JiVBPt7FMiwO+SFxLVb7ga/BIZxfXQKGWVjodxlZMz9qIa3Xnr0DAgd7lkv/
 EAWcsMD7PVp8pQJpXLYtpcZJngZhJwN1xhj02GZBpyhvcUWeKr8xdx1rgs/shVaJ9MQk
 NmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PIfdRyrLpi3ofFjsA+q0OOdpX9rpAfif6XwLPCnigGY=;
 b=uZ2Se/arnSSHklucxgvVnu4K3hmG8sLD8WGq7UMOT5dAPD56tC1i+buWJZ3Fg/ktLo
 Ebs+XBWIgXIa5v10kpecIBV8OyhItQZwBSXMgNkW4frwYB83Dd8VTQ0fKzeLWUibigcj
 EqwjxXejJL9tUw8n9OjDqW9KVSHak4cWZMOqz9EmNXulZi3Mq9YSu05OeYi8ogDHOuCW
 9IzYODkSsPMiSlqX/HxwgwSHsIGwRe/GNsyelL40qp12qhLxG42hSw5JPbyzfSNp27F7
 7wePlOnAAY9yI94zu+B1PheVGzgvbDRdmeIN53uWDzvlXR1GmHRCIjQn6wKawL2lv1Wg
 +EEg==
X-Gm-Message-State: AOAM5308c2msxYxM42csoCVDRKXvI1p+Z/9lL6tLdCuxXhQ1VH5o9m75
 g2+Ktcf5hmwDL3cuVCZsSjtSa/j33CW/iEX4FUg=
X-Google-Smtp-Source: ABdhPJyuf9UWgvrvGug8Ao2HUQ1CmHBuJYBESP+mN6GhFmBDVX77I/GqX/DDLC/Sh3ZRcSLo3vJgr2Lf7nKyuSUizo0=
X-Received: by 2002:a9d:5f87:: with SMTP id g7mr8552951oti.278.1627820432233; 
 Sun, 01 Aug 2021 05:20:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210731222752.64315-1-james.hilliard1@gmail.com>
 <20210801120320.GS3189549@scaer>
In-Reply-To: <20210801120320.GS3189549@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 1 Aug 2021 06:20:21 -0600
Message-ID: <CADvTj4r54KSHW8MidzzNdR3W=xj3g3yG=Os1Sqnw2jHSc0kX7A@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sun, Aug 1, 2021 at 6:03 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2021-07-31 16:27 -0600, James Hilliard spake thusly:
> > This package has some udev tools to assist with printer autodetection.
>
> Sorry, but this is still not enough:
>
>     $ make check-package
>     package/Config.in:2123: Packages in: menu "Networking applications",
>                             are not alphabetically ordered;
>                             correct order: '-', '_', digits, capitals, lowercase;
>                             first incorrect package: dante
>
> Also:
>
>     $ make system-config-printer-configure
>     [...]
>     ./configure: line 7043: cups-config: command not found
>     [...]
>
> This is needed to set the path to the CUPS server executable (I guess):
>
>     $ cat -n configure.ac
>     [...]
>        36 cupsserverbindir="`cups-config --serverbin`"
>        37 AC_SUBST(cupsserverbindir)
>     [...]
>
> And thus:
>
>     $ grep cupsserverbin config.status
>     S["cupsserverbindir"]=""
>
> which is later used to locate the CUPS filters:
>
>     $ grep -nr cupsserverbindir .
>     ./cupshelpers/cupshelpers.py:873: [...] config.cupsserverbindir + "/filter:"
>     ./cupshelpers/cupshelpers.py:876: [...] add_missing (config.cupsserverbindir + "/filter/" + exe)
>     ./cupshelpers/config.py.in:24:cupsserverbindir="@cupsserverbindir@"
>
> So, maybe you have a cups-config in your PATH already, and that happens
> to provide the correct setting...
>
> [--SNIP--]
> > diff --git a/package/Config.in b/package/Config.in
> > index 5941e35c05..fa916370f0 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -2120,6 +2120,7 @@ menu "Networking applications"
> >       source "package/ctorrent/Config.in"
> >       source "package/cups/Config.in"
> >       source "package/cups-filters/Config.in"
> > +     source "package/system-config-printer/Config.in"
>
> Alphabetical order, please. Reported by:  make check-package
>
> [--SNIP--]
> > diff --git a/package/system-config-printer/system-config-printer.mk b/package/system-config-printer/system-config-printer.mk
> > new file mode 100644
> > index 0000000000..05dd2f5b46
> > --- /dev/null
> > +++ b/package/system-config-printer/system-config-printer.mk
> > @@ -0,0 +1,33 @@
> > +################################################################################
> > +#
> > +# system-config-printer
> > +#
> > +################################################################################
> > +
> > +SYSTEM_CONFIG_PRINTER_VERSION = 1.5.15
> > +SYSTEM_CONFIG_PRINTER_SOURCE = system-config-printer-$(SYSTEM_CONFIG_PRINTER_VERSION).tar.xz
> > +SYSTEM_CONFIG_PRINTER_SITE = https://github.com/OpenPrinting/system-config-printer/releases/download/v$(SYSTEM_CONFIG_PRINTER_VERSION)
> > +SYSTEM_CONFIG_PRINTER_LICENSE = GPL-2.0
>
> It really seems to be GPL-2.0-or-later, as specified in many files:
>
>     In check-device-ids.py:
>
>     ## This program is free software; you can redistribute it and/or modify
>     ## it under the terms of the GNU General Public License as published by
>     ## the Free Software Foundation; either version 2 of the License, or
>     ## (at your option) any later version.
>
> At a cursory glance, I could not spot a file that was GPL-2.0-only...
>
> > +SYSTEM_CONFIG_PRINTER_LICENSE_FILES = COPYING
> > +SYSTEM_CONFIG_PRINTER_DEPENDENCIES = cups host-intltool
>
> configure.ac also uses PKG_CHECK_MODULES(), so it needs to depend on
> host-pkgconf.
>
> > +SYSTEM_CONFIG_PRINTER_AUTORECONF = YES
>
> This needs an explanation why autoreconf is needed. We usually just name
> the patch that touches it:
>
>     # 0001-Add-option-to-disable-xmlto-manual-generation.patch
>     SYSTEM_CONFIG_PRINTER_AUTORECONF = YES
>
> (but I had to add another patch, so I've also listed it).
>
> > +
> > +ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
> > +SYSTEM_CONFIG_PRINTER_DEPENDENCIES += libglib2
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_LIBGLIB2)$(BR2_PACKAGE_LIBUSB)$(BR2_PACKAGE_HAS_UDEV),yyy)
> > +SYSTEM_CONFIG_PRINTER_CONF_OPTS = --with-udev-rules=yes
>
> In conditional blocks, always use append-assignement:
>
>     SYSTEM_CONFIG_PRINTER_CONF_OPTS += --with-udev-rules=yes
>
> This caused issues as I had to add this, earlier on the file:
>
>     SYSTEM_CONFIG_PRINTER_CONF_OPTS = --with-cups-config=...
>
> And I add to add the asociated patch that adds --with-cups-config.
>
> With all those changes: applied to master, thanks. Please review what I
> did in case I really borked something...
>
> Also, could you push that new patch 0002-configure-accept-non-system-cups-config.patch
> I added, to upstream, please?

Pull request opened:
https://github.com/OpenPrinting/system-config-printer/pull/234

>
> Regards,
> Yann E. MORIN.
>
> > +SYSTEM_CONFIG_PRINTER_DEPENDENCIES += libusb udev
> > +else
> > +SYSTEM_CONFIG_PRINTER_CONF_OPTS = --with-udev-rules=no
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> > +SYSTEM_CONFIG_PRINTER_CONF_OPTS += --with-systemdsystemunitdir=/usr/lib/systemd/system
> > +SYSTEM_CONFIG_PRINTER_DEPENDENCIES += systemd
> > +else
> > +SYSTEM_CONFIG_PRINTER_CONF_OPTS += --with-systemdsystemunitdir=no
> > +endif
> > +
> > +$(eval $(autotools-package))
> > --
> > 2.25.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
