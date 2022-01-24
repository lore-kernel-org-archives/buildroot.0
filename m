Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90899C433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 21:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BEBE60F22;
	Mon, 24 Jan 2022 21:54:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eDn5i32khtAU; Mon, 24 Jan 2022 21:54:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3987660B03;
	Mon, 24 Jan 2022 21:54:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5357A1BF5B5
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 21:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FD4760B03
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 21:54:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pslm9gR5z8Nq for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 21:54:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1755B60AAB
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 21:53:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B16D01BF207;
 Mon, 24 Jan 2022 21:53:57 +0000 (UTC)
Date: Mon, 24 Jan 2022 22:53:56 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220124225356.03c1c658@windsurf>
In-Reply-To: <20220124212149.GJ2502@scaer>
References: <20220124173521.2236-1-jborne@kalray.eu> <87k0ep9gbx.fsf@tarshish>
 <20220124220238.1fa0568b@windsurf> <20220124212149.GJ2502@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [RFC PATCH 0/1] Fix binutils/libiberty target
 install directory
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
Cc: Jonathan Borne <jborne@kalray.eu>, jmaselbas@kalray.eu,
 ysionneaux@kalray.eu, Baruch Siach via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 24 Jan 2022 22:21:49 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > # We just want libbfd, libiberty and libopcodes,
> > # not the full-blown binutils in staging
> > define BINUTILS_INSTALL_STAGING_CMDS
> >         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(STAGING_DIR) install
> >         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/opcodes DESTDIR=$(STAGING_DIR) install
> >         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
> > endef
> > 
> > # If we don't want full binutils on target
> > ifneq ($(BR2_PACKAGE_BINUTILS_TARGET),y)
> > define BINUTILS_INSTALL_TARGET_CMDS
> >         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(TARGET_DIR) install
> >         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/opcodes DESTDIR=$(TARGET_DIR) install
> >         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
> > endef
> > endif
> > 
> > This is *extremely* suspicious. Indeed, we get the libraries
> > unconditionally installed in staging, so any other library or program
> > that we build after binutils can potentially link against thosze
> > libraries.
> > 
> > But we only install them conditionally in $(TARGET_DIR) if
> > BR2_PACKAGE_BINUTILS_TARGET=y.
> > 
> > This seems very bad to me. Both target and staging installations should
> > be done under the same condition.  
> 
> Not really. You missed the fact that binutils is an autotools package.
> 
> As such, when BR2_PACKAGE_BINUTILS_TARGET=n, then the full binutils are
> instaleld in target, so the libs will be installed in target.

Aah, indeed, the condition is:

ifneq ($(BR2_PACKAGE_BINUTILS_TARGET),y)

> So whatever gets in staging is present in target, but target can be a
> superset of what is in staging, so whatever links to a binutils lib from
> staging will find it in target.

Correct!

Thanks for pointing me at my own mistake :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
