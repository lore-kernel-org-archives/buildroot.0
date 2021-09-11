Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D050FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:46:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4310961212
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4310961212
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA868400FC;
	Sat, 11 Sep 2021 16:46:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tFuhOY1KcqKR; Sat, 11 Sep 2021 16:46:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEE24401C3;
	Sat, 11 Sep 2021 16:46:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A88B21BF388
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 975D0404F3
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:45:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9pSuIoiJWpfZ for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 16:45:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A01E9404EF
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 16:45:56 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 o16-20020a9d2210000000b0051b1e56c98fso6897924ota.8
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 09:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ll0mLhjq7y3AxRsGfT9GFdX7gTyQvB9OCDWqP80naa8=;
 b=LWhWiSpiGE2q7KbfZvlzXCZyaWWAT0xeKauU7z2mVh8U27N/rSkqKALqF6fg9A3EaD
 n/dD9mU+uvhG/TPzihTdTgDLTuZVKdPxosNmN2a6HQFdeRl3KH1ZC4UFSSdL1ESKrEt2
 QkXGFrmfsFTKP/JSsiG2RrQNDUZXN5hpNTyYb1n28I4sPdsPOrxufp/cWCIZxHBLS0x6
 mjzv3MNC1Le20in9qVnkVmrRHHXqzbZHjKTdmj/nMK5V1xqL/NKFtN2X3qomsImS6Fh1
 BaD53NwJnyixdqCAfXBJrgppzV5WMcaoRVf50wcPtmpSEZ27AXf/pi1XC0RXdbsiLLF8
 iKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ll0mLhjq7y3AxRsGfT9GFdX7gTyQvB9OCDWqP80naa8=;
 b=h8KI63Yw0bR0k5Ao1FyOhpt3CFs9OceuyTvQw3PyUQ6VBs3JmXW5GMID4taWQnE8tz
 jSamb5QNn5MG3zDfXyZ0SsU/FB6CrxsOho4cLnRNNhF+au44cNMbAhmfIroa8xU/TgpJ
 17d/AmQJjHO6HpqZiuPi6GKSAQgHMshxFkQLPSgqnl9dPTeHCyUFH/OVoVxBNNkOCqu8
 Zj+HsjnuP9mBqzt8IblNn1iiiyH9HduQlsiWu8EfQBD6UZzuBUIQTkrVMm69/GUWTVEG
 YgR8/8OLDNbCnwFIa6erx/FrvPhEuKFzuRNGVTnVhElj9b1eV2esuCI50uctYkTrgTyd
 IuQg==
X-Gm-Message-State: AOAM532VBZwGI+y6vVwlTOTjAuVM/6/13PNBHZdYIDjuClFme3aRuG86
 Cwv2/Nd1bKxzoXqN9ac0mXer4VTWWg1Q+az30O0=
X-Google-Smtp-Source: ABdhPJyQ9FkiquI4JN74heNaW7kNCQgTsD1o5rXk4Dd5cvFqFkPhNgeKxPOCTDoh0wMaI9pe1SOHhPOZNL9p5Xmji9U=
X-Received: by 2002:a9d:200b:: with SMTP id n11mr2971568ota.30.1631378755528; 
 Sat, 11 Sep 2021 09:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210911151031.41146-1-james.hilliard1@gmail.com>
 <20210911163700.GS1053080@scaer>
In-Reply-To: <20210911163700.GS1053080@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 11 Sep 2021 10:45:44 -0600
Message-ID: <CADvTj4o_UWqGwcW=J2qH5HGLkn54ui1-qVHSOimkrJdk83DAhQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/swupdate: add option to enable
 USB install
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
Cc: =?UTF-8?B?SsO2cmcgS3JhdXNl?= <joerg.krause@embedded.rocks>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

On Sat, Sep 11, 2021 at 10:37 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2021-09-11 09:10 -0600, James Hilliard spake thusly:
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/swupdate/Config.in          | 7 +++++++
> >  package/swupdate/swupdate-usb.rules | 2 ++
> >  package/swupdate/swupdate.mk        | 3 +++
> >  3 files changed, 12 insertions(+)
> >  create mode 100644 package/swupdate/swupdate-usb.rules
> >
> > diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
> > index 6b832cfcbf..54a99b73d5 100644
> > --- a/package/swupdate/Config.in
> > +++ b/package/swupdate/Config.in
> > @@ -60,6 +60,13 @@ config BR2_PACKAGE_SWUPDATE_CONFIG
> >         I you wish to use your own modified swupdate configuration
> >         file specify the config file location with this option.
> >
> > +config BR2_PACKAGE_SWUPDATE_USB
> > +     bool "swupdate usb"
> > +     default y
>
> Options should not default to 'y', unless there is a good reason for
> that, in which case it should be dully explained in the commit log.

Hmm, I have this defaulting to yes for consistency with meta-swupdate.

>
> > +     depends on BR2_PACKAGE_SYSTEMD
> > +     help
> > +       Enable update from USB disk.
> > +
> >  config BR2_PACKAGE_SWUPDATE_WEBSERVER
> >       bool "swupdate webserver"
> >       default y
> > diff --git a/package/swupdate/swupdate-usb.rules b/package/swupdate/swupdate-usb.rules
> > new file mode 100644
> > index 0000000000..b4efd0b733
> > --- /dev/null
> > +++ b/package/swupdate/swupdate-usb.rules
> > @@ -0,0 +1,2 @@
> > +ACTION=="add", KERNEL=="sd*", SUBSYSTEM=="block", ENV{ID_BUS}=="usb", ENV{ID_FS_USAGE}=="filesystem", TAG+="systemd", ENV{SYSTEMD_WANTS}+="swupdate-usb@%k.service"
> > +
>
> Spurious trailing empty line.

Ah, that must have been in meta-swupdate as well.

>
> Also, I concur with Arnout: this is a bit dangerous, and users must be
> made aware, in one form or another, that they should really setup a PKI
> to sign their swu, or anyone with physical access to the device will be
> able to update to arbitrary firmwares.

I mean, that's not really specific to this, swupdate has multiple
install methods
that all have optional signature validation. For example the webserver is really
no different than usb install when it comes to needing validation to prevent
arbitrary firmwares from being installed.

>
> Regards,
> Yann E. MORIN.
>
> > diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
> > index c49af7ebf7..c06106e2ee 100644
> > --- a/package/swupdate/swupdate.mk
> > +++ b/package/swupdate/swupdate.mk
> > @@ -252,6 +252,9 @@ define SWUPDATE_INSTALL_INIT_SYSTEMD
> >               $(TARGET_DIR)/usr/lib/systemd/system/swupdate.socket
> >       $(INSTALL) -D -m 644 package/swupdate/swupdate-usb@.service \
> >               $(TARGET_DIR)/usr/lib/systemd/system/swupdate-usb@.service
> > +     $(if $(BR2_PACKAGE_SWUPDATE_USB), \
> > +             $(INSTALL) -D -m 644 package/swupdate/swupdate-usb.rules \
>
> I know this is not enforced everywhere, and that the CWD at runtime is
> always the top-level of the buildroot tree, but I'd really like that we
> refer to the package directory using the appropriate variable, rather
> than hard-coding it, like $(SWUPDATE_PKGDIR):
>
>     $(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/swupdate-usb.rules ...

Ah, I had just copied the existing style used here, I'll send a patch
reworking that
for swupdate.

>
> Regards,
> Yann E. MORIN.
>
> > +                     $(TARGET_DIR)/lib/udev/rules.d/swupdate-usb.rules)
> >       $(INSTALL) -D -m 644 package/swupdate/swupdate-progress.service \
> >               $(TARGET_DIR)/usr/lib/systemd/system/swupdate-progress.service
> >       $(INSTALL) -D -m 644 package/swupdate/tmpfiles-swupdate.conf \
> > --
> > 2.25.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@lists.buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
