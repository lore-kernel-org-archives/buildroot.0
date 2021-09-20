Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8769BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 16:26:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 068C260FA0
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 16:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 068C260FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADA9860817;
	Mon, 20 Sep 2021 16:26:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AzNWwsgc61hI; Mon, 20 Sep 2021 16:26:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 013B2605ED;
	Mon, 20 Sep 2021 16:26:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 822231BF3D5
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 16:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 722BC82C33
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 16:26:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WWIQMjr37VLI for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 16:26:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82C9182983
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 16:26:45 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id p2so25532348oif.1
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 09:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+cGT59/FbAS+oYtGJKX4E2SDnpco03BDdIg5y5WEMV8=;
 b=a1O8lGJTffaqoT9n+gltvAzU3CW6jZx269hCdBovi6BYU4VcL04fi5cuaT5wIpG7xs
 8nK+aiy2eGedw0TYvPwKIuLV7AFKsQTTDnbbX0eAuWr/JhBuh/gw2E4XsaYVSCpJytf6
 P3NE3PF2YFWL0lc+w6VNcayRnE4N5V+jkCSFecK9fcqy9ufi/Ah61vjYezqRmZtINxil
 4NMTsMS1STPNXR9l6L6TRQaY8EIZbblmqRgGLRb8NjvBIRr7R/p+Q3im5TR2dMbvvXcP
 GCzPV3tO7jjwhb1taG3qjpLMMc3PqVbOQs7lZW6aBtlPU6IjLfJEUL/j0F29wnfeqlSh
 P3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+cGT59/FbAS+oYtGJKX4E2SDnpco03BDdIg5y5WEMV8=;
 b=DtDQPwF41KuokaTvFmBYab4043+mCvwgKTueGPMCEoyyJEIRIzi2nP0zOfTgM0yHMf
 U8lDC+7cBj2gD0agR2tfaOCIqEWRb+WeXdvdsJvff/n3id4kPsiWYHcJeZcwrLGjIbsu
 9a1vv53EkPGjZik+OUf+DfU1ApSfBn5weg92Wsn9uvIKrxIq0P8zdGPQdCET/qLfQRFc
 slxPw653OYTVM0NZ80W7d54RgoPHgQQ8dhPohempNME7QWuI9DSz1LiOxvhOk271+1XM
 ydHk7HlSBK7wHEIAORuiD8bQ9JaoB67WHBKCOJ7K+pWfsNHD+s8EE+Ojfx234MtAwR0/
 Ci6w==
X-Gm-Message-State: AOAM531aeDgBI+IaQuOl+PsmAXYFcTEaSDP3LSH4Q7j86K3U+iqCbnFx
 m3IUuNdl7T6tVHdKS5aPu01KaeP4IcRjCoZwu+4=
X-Google-Smtp-Source: ABdhPJwXsL3vRzn5RU3oQ7Q5IpEyKMMTwqgbV7ExCY3YmK9mfxjTgqnhdCD2EMwHtfJXl8AUuh1iM/RFiVZlca0gRpY=
X-Received: by 2002:a54:4199:: with SMTP id 25mr5017206oiy.108.1632155204325; 
 Mon, 20 Sep 2021 09:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210916170700.1123980-1-aduskett@gmail.com>
 <20210918150733.GS1053080@scaer>
In-Reply-To: <20210918150733.GS1053080@scaer>
From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 20 Sep 2021 09:26:33 -0700
Message-ID: <CAFSsvmotgKMsT+i473tpg3Qx_h7V=vMjjh95XvcpvCqUzz8qfg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH] package/libglib2: bump version to 2.68.4
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
Cc: Adam Duskett <aduskett@rivian.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

I based the patch off of next by mistake! Fixing now!

Sorry about that!

On Sat, Sep 18, 2021 at 8:07 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Adam, All,
>
> On 2021-09-16 10:07 -0700, Adam Duskett spake thusly:
> > From: Adam Duskett <aduskett@rivian.com>
> >
> > Signed-off-by: Adam Duskett <aduskett@rivian.com>
> > ---
> >  package/libglib2/0002-remove-cpp-requirement.patch | 2 +-
> >  package/libglib2/libglib2.hash                     | 4 ++--
> >  package/libglib2/libglib2.mk                       | 2 +-
> >  3 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/package/libglib2/0002-remove-cpp-requirement.patch b/package/libglib2/0002-remove-cpp-requirement.patch
> > index 9393bd258a..c402cbafa5 100644
> > --- a/package/libglib2/0002-remove-cpp-requirement.patch
> > +++ b/package/libglib2/0002-remove-cpp-requirement.patch
> > @@ -35,7 +35,7 @@ index 4bbf4c2..ac59f4e 100644
> >  @@ -1,4 +1,4 @@
> >  -project('glib', 'c', 'cpp',
> >  +project('glib', 'c',
> > -   version : '2.68.2',
> > +   version : '2.68.4',
> >     # NOTE: We keep this pinned at 0.49 because that's what Debian 10 ships
> >     meson_version : '>= 0.49.2',
> >  @@ -10,7 +10,6 @@ project('glib', 'c', 'cpp',
> > diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
> > index 15e0085f78..d421e025ff 100644
> > --- a/package/libglib2/libglib2.hash
> > +++ b/package/libglib2/libglib2.hash
> > @@ -1,4 +1,4 @@
> > -# https://download.gnome.org/sources/glib/2.68/glib-2.68.2.sha256sum
> > -sha256  ecc7798a9cc034eabdfd7f246e6dd461cdbf1175fcc2e9867cc7da7b7309e0fb  glib-2.68.2.tar.xz
> > +# https://download.gnome.org/sources/glib/2.68/glib-2.68.4.sha256sum
> > +sha256  62fd061d08a75492617e625a73e2c05e259f831acbb8e1f8b9c81f23f7993a3b  glib-2.68.4.tar.xz
> >  # License files, locally calculated
> >  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> > diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> > index 4f13622e36..af73aeb3bf 100644
> > --- a/package/libglib2/libglib2.mk
> > +++ b/package/libglib2/libglib2.mk
> > @@ -5,7 +5,7 @@
> >  ################################################################################
> >
> >  LIBGLIB2_VERSION_MAJOR = 2.68
> > -LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
> > +LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
>
>     $ make libglib2-patch
>     [...]
>     Applying 0004-correctly-use-3-parameters-for-close_range.patch using patch:
>     patching file glib/gspawn.c
>     Reversed (or previously applied) patch detected!  Skipping patch.
>     1 out of 1 hunk ignored -- saving rejects to file glib/gspawn.c.rej
>     make[1]: *** [package/pkg-generic.mk:251: /home/ymorin/dev/buildroot/O/build/libglib2-2.68.4/.stamp_patched] Error 1
>     make: *** [Makefile:23: _all] Error 2
>
> Meh...
>
> Regards,
> Yann E. MORIN.
>
> >  LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
> >  LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
> >  LIBGLIB2_LICENSE = LGPL-2.1+
> > --
> > 2.30.2
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
