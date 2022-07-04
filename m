Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B5DC43334
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 22:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 424B34091C;
	Mon,  4 Jul 2022 22:24:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 424B34091C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xVLGmA5NWht2; Mon,  4 Jul 2022 22:24:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1898440605;
	Mon,  4 Jul 2022 22:24:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1898440605
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E90001BF3EB
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 22:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D111260E09
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 22:23:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D111260E09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OZ4snJ7HbhdT for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 22:23:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC1B660D4B
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC1B660D4B
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 22:23:56 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-10bd4812c29so9080883fac.11
 for <buildroot@buildroot.org>; Mon, 04 Jul 2022 15:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TDOuO2cShtNpfC8c7XdzgRcvnwvI70x6bFyl5NaJ3zk=;
 b=JRIG79cjIGeL29G1tPO6z/+0kc6Buw8g5ocafjG3Trl7OaOvdGdRva2khB1/lw9N1U
 zXYv4W4u3TmvEE4SVPEC/al/b80fOVYIUmUSBuDk5fpffr0myckhp0mIyRKrMymyhHAN
 Mil6ROEgmxCxq1kDyp94y745RIpyhP7tpzL7sDU+d+NlJHO+eoraMOTUtHeQ//5H5Adz
 j+IOtsbzTP0L6nqvCHHfHHpUE+MjGvBhhk8Gu5NrSDWYPDVPAvnz2KuSO9m8isg2lJto
 XTcDrdAYiD6sD3x/jDsr8ap9L0BZ6ZvJS+JeJmQp3WhfMwaUBH0Upu5omzVKtksKJHww
 XQ8Q==
X-Gm-Message-State: AJIora8XHxdzE8+JvtSyK8EYOzbDi4SHyqEXmwwr1hgGq7ZFww3zPajg
 ghRgZlHQRWpGElyjjswtwgJ+fjTe3QK1CuDL3aazikvMzmc=
X-Google-Smtp-Source: AGRyM1tL+xfph3CIAtcoJTmzE2I+H+5aJNN75pOy6EJ8J2a3sbcABb5Q31BFB+Qbf4BD3yD7dbx+KBUA05jCfQS+m10=
X-Received: by 2002:a05:6870:538b:b0:101:17f2:d6e with SMTP id
 h11-20020a056870538b00b0010117f20d6emr20529350oan.200.1656973435745; Mon, 04
 Jul 2022 15:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220506104658.3174243-1-foss+buildroot@0leil.net>
 <20220704200426.GJ2521@scaer>
 <165697299387.1729656.13686816775756809776@Monstersaurus>
In-Reply-To: <165697299387.1729656.13686816775756809776@Monstersaurus>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 4 Jul 2022 16:23:44 -0600
Message-ID: <CADvTj4oWNe=EpE_etEEpv43AGgi0fQq0vBcU8Q6RPbRTeO-4JQ@mail.gmail.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=TDOuO2cShtNpfC8c7XdzgRcvnwvI70x6bFyl5NaJ3zk=;
 b=OPgrq8+mPoeTNTcT6+S0eQgAYPd7mzSbp/145dkgrtSS34PVAtTHo6b+BldPjPABft
 XSVu9ksIHFM8bQVQePSm5GdW113nfZwFPYfLKjFOyw/dL185uEIaEn6lu+kDG+dx7HHi
 y1ztw/JRSC2STwOBnWZqwDS1ofMTHyZL5v/Dl7CsRDkzuFTCBrNnBeaHySQXtZ1HJO6C
 aQVEhrgRh2tidA/+Uc384D3KdrY7fSpsFvZwy0vV3SheHVM/qWu6hvZxDYCX8jHqzx3v
 gJLkru9pLX1H6KCEut0XzKHiTiW2fwehpBJKCuMHCPmSAKFE8LsMezZLlMywYqUKcg2D
 skdA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OPgrq8+m
Subject: Re: [Buildroot] [PATCH v2] package/libcamera: strip symbols before
 signing IPA libs
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss+buildroot@0leil.net>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Jul 4, 2022 at 4:16 PM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> Quoting Yann E. MORIN (2022-07-04 21:04:26)
> > Quentin, All,
> >
> > Kieran, some question for you toward the end... ;-)
> >
> > On 2022-05-06 12:46 +0200, Quentin Schulz spake thusly:
> > > From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> > >
> > > Open-Source IPA shlibs need to be signed in order to be runnable within
> > > the same process, otherwise they are deemed Closed-Source and run in
> > > another process and communicate over IPC.
> > >
> > > The shlib installed on the target should be the same as the one signed
> > > by libcamera during package creation otherwise the signature won't match
> > > the shlib.
> > >
> > > Buildroot sanitizes RPATH in a post build process. meson gets rid of
> > > rpath while installing so we don't need to do it manually.
> > >
> > > Buildroot may strip symbols, so we need to do the same before signing.
> > > Since meson install target is also signing the IPA shlibs, let's strip
> > > them before this happens.
> > >
> > > Cc: Quentin Schulz <foss+buildroot@0leil.net>
> > > Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> >
> > Applied to master, thanks.
> >
> > However, this is a bit fragile, since libcamera may ultimately decide to
> > do the signing during the build phase (the install step is supposed to
> > be just about copying files around in theory).
> >
> > So maybe:
> >  1. Buildroot needs to learn about FOO_STRIP_EXCLUDE_FILES/DIRS
> >  2. libcamera needs an option -Dstip-ipa=true/false
> >  3. libcamera.mk needs to set LIBCAMERA_STRIP_EXCLUDE_FILES/DIRS
> >
> > Kieran, what do you think?
>
> I think if we change how or when the signing happens on the libcamera
> side - it would/should only be towards a path to simplify things so we
> don't need to strip, so I don't think we need to do anything extra here
> at the moment.
>
> I think tracking the stripping of files is a pain, and we should find a
> way to sign only the relevant sections which don't get stripped ;-) But
> unfortunately - that's a bit more work, and not likely to happen in the
> near-ish future, unless anyone thinks 'that sounds easy' and wants to try.

Easiest option for now IMO is probably a 3 state meson flag like:
-Dsandbox={on,off,signature}

That way one can default to -Dsandbox=off when not using closed source
components and only enable the signature validation when using them.

>
> --
> Kieran
>
> >
> > Regards,
> > Yann E. MORIN.
> >
> > > ---
> > >
> > > v2:
> > >  - use LIBCAMERA_POST_BUILD_HOOKS instead of replacing
> > >  LIBCAMERA_INSTALL_TARGET_CMDS,
> > >  - add handling of BR2_STRIP_EXCLUDE_FILES to not strip files which
> > >  shouldn't,
> > >  - added --no-run-if-empty to xargs, in case no IPA is selected,
> > >  - removed stderr redirect and pipe to true to not hide useful
> > >  information or fail the build if strip does not work,
> > >
> > >  package/libcamera/libcamera.mk | 20 ++++++++++++++++++++
> > >  1 file changed, 20 insertions(+)
> > >
> > > diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> > > index 77381ab3ca..41d6a5abef 100644
> > > --- a/package/libcamera/libcamera.mk
> > > +++ b/package/libcamera/libcamera.mk
> > > @@ -104,4 +104,24 @@ LIBCAMERA_DEPENDENCIES += libexecinfo
> > >  LIBCAMERA_LDFLAGS = $(TARGET_LDFLAGS) -lexecinfo
> > >  endif
> > >
> > > +# Open-Source IPA shlibs need to be signed in order to be runnable within the
> > > +# same process, otherwise they are deemed Closed-Source and run in another
> > > +# process and communicate over IPC.
> > > +# Buildroot sanitizes RPATH in a post build process. meson gets rid of rpath
> > > +# while installing so we don't need to do it manually here.
> > > +# Buildroot may strip symbols, so we need to do the same before signing
> > > +# otherwise the signature won't match the shlib on the rootfs. Since meson
> > > +# install target is signing the shlibs, we need to strip them before.
> > > +LIBCAMERA_STRIP_FIND_CMD = \
> > > +     find $(@D)/build/src/ipa \
> > > +     $(if $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES)), \
> > > +             -not \( $(call findfileclauses,$(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) ) \
> > > +     -type f -name 'ipa_*.so' -print0
> > > +
> > > +define LIBCAMERA_BUILD_STRIP_IPA_SO
> > > +     $(LIBCAMERA_STRIP_FIND_CMD) | xargs --no-run-if-empty -0 $(STRIPCMD)
> > > +endef
> > > +
> > > +LIBCAMERA_POST_BUILD_HOOKS += LIBCAMERA_BUILD_STRIP_IPA_SO
> > > +
> > >  $(eval $(meson-package))
> > > --
> > > 2.35.1
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot@buildroot.org
> > > https://lists.buildroot.org/mailman/listinfo/buildroot
> >
> > --
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
