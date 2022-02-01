Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836B7C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 19:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F131D60F6A;
	Tue,  1 Feb 2022 19:01:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rsYVld-6CY1Q; Tue,  1 Feb 2022 19:01:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 370F760B1B;
	Tue,  1 Feb 2022 19:01:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9A8871BF5D7
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 19:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95E35401D6
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 19:01:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S0DFv3wMgt-J for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 19:01:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71188400C4
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 19:01:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1171:7d10:f9ea:da54])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 33F39B005AB;
 Tue,  1 Feb 2022 20:01:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1643742093;
 bh=Bjl73JdcRdoGb5lifcs4roDk/ir2ocpEodn+mo5OBXs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HulLyl/rEHJk2TcqXPYY69B38QU7TQvxAWTiWpDKrc9eOE67K0eeMF57UZuOIyxcp
 9+RNAhtMq8shKCmmGuKEGocniUWyYTc5x7EDwv4mvF4aSjRo57ADC2W0zsDEmJ+afE
 mVF3erqQC2J3790Wtl1Qn3pSSkKC1YKtQhtl1HlA2e2Zn3lWsElX51cr9P/1ZD8SNk
 lYlzsgOWfiM4uyMCtiQrupxr3SjATEXOdudP4Ky/3sbvbSKpk3VJIOkcQX3SxFO026
 DvmiTQY1RahSTPQde2wgMgdqVUge9HoR5e/rimL2wR2ch2dk6Pt2zK24oyAv7m/k3F
 ifhjD9XvwKB3g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 01 Feb 2022 20:01:26 +0100
Date: Tue, 1 Feb 2022 20:01:26 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Message-ID: <20220201190126.GW457876@scaer>
References: <20220201091342.143010-1-michael@amarulasolutions.com>
 <20220201171441.GV457876@scaer>
 <CAOf5uwmK-+jU3eRRPQ4NqKaFq=OUSBTK-_kRXTc6cEsGiwm=Gg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOf5uwmK-+jU3eRRPQ4NqKaFq=OUSBTK-_kRXTc6cEsGiwm=Gg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] boot/uboot: add support for bundling TEE in
 BIN format into U-Boot
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
Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Michael, All,

On 2022-02-01 18:57 +0100, Michael Nazzareno Trimarchi spake thusly:
> On Tue, Feb 1, 2022 at 6:14 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2022-02-01 10:13 +0100, Michael Trimarchi spake thusly:
> > > Some U-Boot platforms (e.g. nxp) can bundle OPTEE's tee.bin
> > > into the U-Boot image using binman. This patch brings the necessary changes to
> > > enable this feature.

Also, comit log not nicely formatted: it should be wrapped at ~72 chars
on every lines.

> > > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > > ---
[--SNIP--]
> > >  ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE),y)
> > >  UBOOT_DEPENDENCIES += optee-os
> > > +ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_ELF),y)
> > >  UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
                         ,^^^^^^^^^^^^^^^^^^^^^^^^^^^
Note this for later ----/

> > > +define UBOOT_COPY_TEE_FIRMWARE
> > > +     cp $(BINARIES_DIR)/tee.elf $(@D)/
> > Why do you need to copy it, when TEE is pointing to the original in
> > $(BINARIESD_DIR), just above, and that has worked well so far?
> The copy are needed to binman to include it

As far as I understand it, BR2_TARGET_UBOOT_NEEDS_OPTEE_ELF is supposed
to behave like the code we had so far, and so far we did not have the
copy, and that seems that it worked OK without the copy.

Now you are adding the copy: why was it not needed before, and why is it
needed now?

And if binman needs it in the source tree, then why do we point the TEE
variable to the original location in BINARIES_DIR, as I highlighted
above?

> > > +endef
> > > +UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_TEE_FIRMWARE
> > > +else
> > > +UBOOT_MAKE_OPTS += BL32=$(BINARIES_DIR)/tee.bin
> > > +define UBOOT_COPY_TEE_FIRMWARE
> > > +     cp $(BINARIES_DIR)/tee-raw.bin $(@D)/tee.bin
> > Ditto: why do you need to copy it, when TEE, just above, also points to
> > the original in $(BINARIES_DIR) ?
> Same as above

Ditto.

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
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
