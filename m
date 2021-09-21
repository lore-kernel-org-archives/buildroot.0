Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE62C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 17:26:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB71260EE0
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 17:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB71260EE0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 782C160EA2;
	Tue, 21 Sep 2021 17:26:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vdOGCukYH8pt; Tue, 21 Sep 2021 17:26:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC52260E52;
	Tue, 21 Sep 2021 17:26:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CFCD1BF3C2
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 17:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8964460E52
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 17:26:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mOD4UOV9OUuL for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 17:26:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D65460C06
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 17:26:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4418:deb7:2fe6:b1b9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id E6F9A19F5AF;
 Tue, 21 Sep 2021 19:26:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632245194;
 bh=NRTXYhz9NQgCJCEgXOdEdzU8qqWLFj5J5jEodvw1+ds=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PG/ravzvZemegv3K6NxrUOcnUmLFTRgjs254nJtGdxrBjlpUd7vrDhIqcPgVMMZOl
 LkHZ5kizXipj8ei3gG9hgGdszYTA7D8wq66hmCgjD6sb8qkd2W7YXfpTxyUMaBKW6a
 XCUZ61SAJiIlSp/CZ+I3Umw4h8QDhR3LJjsS4Uq6zkF2hADIvQTKWlnTaVHJ7A5mxq
 1Bi1vRvKE590ebVNwzFraWqWFlnPGN8oSBLZu4Q600sMhK9CYdG5QJuqvffhW62WD/
 Yw6/M/VX4hglNPb50PTWMsqRV5YcOxwEsNdEx1e9e+BKH3EOr4Gqvow0M5zXE/h56C
 OfZCiuyqntgrA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 21 Sep 2021 19:26:25 +0200
Date: Tue, 21 Sep 2021 19:26:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20210921172625.GX1053080@scaer>
References: <20210921132829.56405-1-kory.maincent@bootlin.com>
 <20210921132829.56405-2-kory.maincent@bootlin.com>
 <20210921163727.GW1053080@scaer>
 <e171aeb5-bf5b-d766-e59f-6092a9f69d16@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e171aeb5-bf5b-d766-e59f-6092a9f69d16@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 1/6] boot/grub2: add support to build
 multiple Grub2 configurations in the same build
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
Cc: Kory Maincent <kory.maincent@bootlin.com>, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Arnout, All,

On 2021-09-21 19:20 +0200, Arnout Vandecappelle spake thusly:
> On 21/09/2021 18:37, Yann E. MORIN wrote:
> >On 2021-09-21 15:28 +0200, Kory Maincent spake thusly:
> [snip]
> >>  ifeq ($(BR2_TARGET_GRUB2_I386_PC),y)
> >[--SNIP removals--]
> >>+GRUB2_IMAGE_i386-pc = $(BINARIES_DIR)/grub.img
> >>+GRUB2_CFG_i386-pc = $(TARGET_DIR)/boot/grub/grub.cfg
> >>+GRUB2_PREFIX_i386-pc = ($(GRUB2_BOOT_PARTITION))/boot/grub
> >>+GRUB2_TARGET_i386-pc = i386
> >>+GRUB2_PLATFORM_i386-pc = pc
> >>+GRUB2_BUILTIN_i386-pc = PC
> >>+GRUB2_TUPLES += i386-pc
> >>+endif
> >
> >Any reason why you have decided not to got with the construct I
> >suggested:
> >     GRUB2_TUPLES-$(BR2_TARGET_GRUB2_I386_PC) += i386-pc
> >
> >and then use $(GRUB2_TUPLES-y) when iterating?
> 
>  Well, it's a bigger diff compared to what you have now. Especially because
> you have to keep the GRUB2_IMAGE_i386-pc etc. part, it's only TUPLES that
> you can use like that.
> 
>  Also, I think the -y approach is good only when you have may options
> (because it is slightly more difficult to parse) - we have 5 options here,
> which is a bit borderline.
> 
>  However, this approach becomes a lot more attractive if we eliminate the
> conditions:

Of course! I should have stated that explicitly, but in my mind it was
obvious that the conditions would disapear, and that'd we'd keep only
the -y assignments.

> GRUB2_IMAGE_i386-pc = $(BINARIES_DIR)/grub.img
> GRUB2_CFG_i386-pc = $(TARGET_DIR)/boot/grub/grub.cfg
> GRUB2_PREFIX_i386-pc = ($(GRUB2_BOOT_PARTITION))/boot/grub
> GRUB2_TARGET_i386-pc = i386
> GRUB2_PLATFORM_i386-pc = pc
> GRUB2_BUILTIN_i386-pc = PC
> GRUB2_TUPLES-$(BR2_TARGET_GRUB2_I386_PC) += i386-pc
> 
> GRUB2_IMAGE_i386-efi = $(BINARIES_DIR)/efi-part/EFI/BOOT/bootia32.efi
> GRUB2_CFG_i386-efi = $(BINARIES_DIR)/efi-part/EFI/BOOT/grub.cfg
> GRUB2_PREFIX_i386-efi = /EFI/BOOT
> GRUB2_TARGET_i386-efi = i386
> GRUB2_PLATFORM_i386-efi = efi
> GRUB2_BUILTIN_i386-efi = EFI
> GRUB2_TUPLES-$(BR2_TARGET_GRUB2_I386_EFI) += i386-efi

Exactly!

> >Note: this is used everywhere in the kernel tree, and we already use
> >that construct in quite a few places, so it would not be totally new
> >and not totally unkown either:
> >
> >     $ git grep -E -- '[_-]\$\([^)]+\)[[:space:]]*\+=' '*.mk'
> >
> >But OK, the multi-conditions work as good if you don't like the -y
> >stuff.
> >
> >>+ifeq ($(BR2_TARGET_GRUB2_I386_EFI),y)
> >>+GRUB2_IMAGE_i386-efi = $(BINARIES_DIR)/efi-part/EFI/BOOT/bootia32.efi
> >>+GRUB2_CFG_i386-efi = $(BINARIES_DIR)/efi-part/EFI/BOOT/grub.cfg
> >>+GRUB2_PREFIX_i386-efi = /EFI/BOOT
> >>+GRUB2_TARGET_i386-efi = i386
> >>+GRUB2_PLATFORM_i386-efi = efi
> >>+GRUB2_BUILTIN_i386-efi = EFI
> >
> >All those GRUB2_BUILTIN_$(tuple) variables are just so that you can do a
> >double indeirection alter on, which is highly unreadable.
> >
> >What about assigning the options directly:
> >
> >     GRUB2_CONFIG_i386-pc = $(GRUB2_BUILTIN_CONFIG_PC)
> >     GRUB2_MODULES_i386-pc = $(GRUB2_BUILTIN_MODULES_PC)
> >     GRUB2_CONFIG_i386-efi = $(GRUB2_BUILTIN_CONFIG_EFI)
> >     GRUB2_MODULES_i386-efi = $(GRUB2_BUILTIN_MODULES_EFI)
> 
>  Still feels over-complicated, but I can't think of anything better. But
> it's definitely an improvement over the BUILTIN_$(tuple).

Agreed, it's not a panacea, but it's still more legible.

Regards,
Yann E. MORIN.

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
