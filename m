Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD037C28CF5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 15:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 177E7403FC;
	Wed, 26 Jan 2022 15:52:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gtMmwvbaZ_Uv; Wed, 26 Jan 2022 15:52:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3582640167;
	Wed, 26 Jan 2022 15:52:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8AAC21BF4DD
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 15:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7987F605A0
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 15:52:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UL6xhOKDJ_bM for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 15:52:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5FA1560093
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 15:52:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E39721BF208;
 Wed, 26 Jan 2022 15:52:50 +0000 (UTC)
Date: Wed, 26 Jan 2022 16:52:49 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Jonathan Borne <jborne@kalray.eu>
Message-ID: <20220126165249.0445bdc9@windsurf>
In-Reply-To: <608336144.1670038.1643211044586.JavaMail.zimbra@kalray.eu>
References: <20220124173521.2236-1-jborne@kalray.eu> <87k0ep9gbx.fsf@tarshish>
 <20220124220238.1fa0568b@windsurf> <20220124212149.GJ2502@scaer>
 <20220124225356.03c1c658@windsurf>
 <608336144.1670038.1643211044586.JavaMail.zimbra@kalray.eu>
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
Cc: ysionneaux@kalray.eu, jmaselbas@kalray.eu,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Baruch Siach via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 26 Jan 2022 16:30:44 +0100 (CET)
Jonathan Borne <jborne@kalray.eu> wrote:

> Double negation is a bit confusing indeed, 
> maybe the message could be changed to 
> 
> # If we don't want full binutils on target
> ifeq ($(BR2_PACKAGE_BINUTILS_TARGET),n)

This is never going to be true, as disabled options have an empty
value. To work, it should be:

ifeq ($(BR2_PACKAGE_BINUTILS_TARGET),)

> Agreed! So if I understand correctly, as was suggested by Romain and Thomas,
> we could indeed get rid of
> 
> $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
> 
> in BINUTILS_INSTALL_TARGET_CMDS.

Yes!

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
