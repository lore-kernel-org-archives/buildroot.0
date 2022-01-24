Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD120C433FE
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 21:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 195624063A;
	Mon, 24 Jan 2022 21:02:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5z-p-xW51uQv; Mon, 24 Jan 2022 21:02:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29FE640573;
	Mon, 24 Jan 2022 21:02:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C7871BF3FB
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 21:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12C7141713
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 21:02:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PmMhzZzruQsl for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 21:02:42 +0000 (UTC)
X-Greylist: delayed 00:17:08 by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0058741712
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 21:02:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 86665E0003;
 Mon, 24 Jan 2022 21:02:39 +0000 (UTC)
Date: Mon, 24 Jan 2022 22:02:38 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20220124220238.1fa0568b@windsurf>
In-Reply-To: <87k0ep9gbx.fsf@tarshish>
References: <20220124173521.2236-1-jborne@kalray.eu> <87k0ep9gbx.fsf@tarshish>
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
 ysionneaux@kalray.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 24 Jan 2022 19:44:29 +0200
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> > Is there a reason behind this?  
> 
> As I understand that's because libiberty is static only. Buildroot does
> not copy static libraries to $(TARGET_DIR) because they are only used at
> build time, but not at run-time.

True, but it doesn't make sense to do that in
BINUTILS_INSTALL_TARGET_CMDS. It should go in
BINUTILS_INSTALL_STAGING_CMDS, where it is already present, as Romain
pointed out.

So basically:

        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install

needs to be dropped from BINUTILS_INSTALL_TARGET_CMDS, if indeed
libiberty is only installed as a static library.

However, taking a step back:

# We just want libbfd, libiberty and libopcodes,
# not the full-blown binutils in staging
define BINUTILS_INSTALL_STAGING_CMDS
        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(STAGING_DIR) install
        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/opcodes DESTDIR=$(STAGING_DIR) install
        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
endef

# If we don't want full binutils on target
ifneq ($(BR2_PACKAGE_BINUTILS_TARGET),y)
define BINUTILS_INSTALL_TARGET_CMDS
        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(TARGET_DIR) install
        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/opcodes DESTDIR=$(TARGET_DIR) install
        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
endef
endif

This is *extremely* suspicious. Indeed, we get the libraries
unconditionally installed in staging, so any other library or program
that we build after binutils can potentially link against thosze
libraries.

But we only install them conditionally in $(TARGET_DIR) if
BR2_PACKAGE_BINUTILS_TARGET=y.

This seems very bad to me. Both target and staging installations should
be done under the same condition.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
