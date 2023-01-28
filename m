Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C37CC38142
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 01:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2D4E41037;
	Sat, 28 Jan 2023 01:02:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2D4E41037
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AgRQEoaDIDrp; Sat, 28 Jan 2023 01:02:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A475E40590;
	Sat, 28 Jan 2023 01:02:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A475E40590
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7847B1BF977
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 01:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5230D416E8
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 01:02:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5230D416E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VO4qSnasA3h1 for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 01:02:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAF25416E2
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AAF25416E2
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 01:02:02 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-142b72a728fso8693606fac.9
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 17:02:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dfh5ACGHaB0SCA7YtDAF4CDth5jh9iB4XFhBz8ZzIG8=;
 b=14qVHx6ONXv48y5QHhiFWeoNqKM7q7qYFxUOrMflrZ/IZZxvZsF4k7LgFW/96W1T4f
 LeN1SdEXjnyDJoIKUFBhyFSlL+ESXfi4VchzBR7yxMWwIb1sG0pdRdB4P0P2UQF6VtnK
 fpsuEU6eG0SWpzCfx5cOT///pfu9WxPygRrBogJfdU23WS3Hr+4946toFiWyoXggDWOy
 TfwouJAlioR8f9OWoSZk7JMELpls+6RwOrRmSAIKIDlkM/hlk84y2XwEO/ass2jt6D2F
 PAFAlX4R+6fWwRgRk8ZICMj6acU/EuNDn++rHM1JCX2cYZ5X7V6/BEq7m5eBHl9uiD1C
 Vfpw==
X-Gm-Message-State: AO0yUKVWLtyL0IdKSnHi3SQ5TyhfFSCz1zCyN0MzZbjZ5OkRPnVoqFlc
 rUz9zXgDTx8Kgcvb98VvoDBEyEIgT+53gZh69nk=
X-Google-Smtp-Source: AK7set9xALqze1fG7qnH0h5baZy4Bg6ksDkHQ6TtS3gHKs8+7C3l104kQ6Ig4v26kLzlFmdfN+oQSpWD7Ye3ztUi8Tw=
X-Received: by 2002:a05:6871:6aaa:b0:163:501b:e7b with SMTP id
 zf42-20020a0568716aaa00b00163501b0e7bmr606294oab.18.1674867721639; Fri, 27
 Jan 2023 17:02:01 -0800 (PST)
MIME-Version: 1.0
References: <20220728014402.142320-1-james.hilliard1@gmail.com>
 <20220728014402.142320-2-james.hilliard1@gmail.com>
 <20230111181535.GR151997@scaer>
In-Reply-To: <20230111181535.GR151997@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 27 Jan 2023 18:01:50 -0700
Message-ID: <CADvTj4rqs91z-LNao4H__r3W4vFwehy_v2njqege2+NhFJ6xVw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dfh5ACGHaB0SCA7YtDAF4CDth5jh9iB4XFhBz8ZzIG8=;
 b=g/y9mKsfHabQJyPbxVch/wZTGqN7PUR6f8X0QsbxQy5YtdqtpJwbxTAwp59hpDA+Cy
 3CCtXbQ6rrxfdX0yhDMSpw40oVwGeyLOV/roNo4SHHgF2jQ8vc1HF/8miQmOCCe6bRY7
 xV8tPea0NGQ9tLYXS55LH6zCGSdGUhHr/Tmk7znhBEGRK+wxgphN4UkbMnFm0WKJCta+
 SL9xtnoFOxr/3CdsxgsaGQVVoXsBV+lF7Dw19KMKqdecGbyTcDvQRWmDWxL5MKZwbBHe
 gdPsSOopxRxsMKszoFv0OkF/F/C8CA5aV5yM1aHT5Tbko3YIZm3fnUDO/dcC7a9KVnYf
 NRBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=g/y9mKsf
Subject: Re: [Buildroot] [PATCH 2/2] package/pkg-meson: generate relocatable
 pkgconfigs
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Jan 11, 2023 at 11:15 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2022-07-27 19:44 -0600, James Hilliard spake thusly:
> > This format prevents pkgconfig path issues when using meson's
> > built-in install functionality.
>
> "pkgconfig path issues" is vague: this is not helping understand why
> this change is needed.
>
> Please explain what is currently broken, and how that patch fixes the
> issue. If there were a pointer to one or a few autobuild issues, that
> would also help, and would answers Romain's question: what package(s)
> is(are) impacted?

Meson's install feature doesn't work correctly when using non-relocatable
format if you are installing to multiple desdir's. There's no autobuild issues
as we don't use meson's install feature yet.

>
> If I look at the pointer Romain provided, it states:
>
>     https://mesonbuild.com/Pkgconfig-module.html#relocatable-pkgconfig-files
>
>     By default, the files generated by pkg.generate contain a hardcoded
>     prefix path.
>
> Sure, I can see how that could be an issue. However, we already have two
> ways to fix that:
>
>   - for per-package directory, we have a generic fixup that replaces the
>     PPD base with the one for the current package, see:
>       - package/pkg-generic.mk lines 95-onward and 109-onward.
>       - b06294e9897e core/pkg-generic: fixup all PPD paths in a generic fashion
>
>   - for the SDK, we have a similar fixup, see:
>       - Makefile lines 597-onward
>       - support/misc/relocate-sdk.sh
>
> So, if those fixups are not enough, can you describe what they are
> missing, so that we can extend them?

The reason for making it relocatable via this meson flag is so that we can
continue to use a single build stage for both staging and target installs for
meson packages.

When using meson's install without relocatable the path's generated don't
play nice with different destination directory meson native installs, they work
with the ninja based different destination installs that we currently
use however.

This is due to the non-relocatable paths being effectively locked to
the expected
destination paths set at build time(which prevents destdir changing during
staging/target installs) and meson's install feature doing some
additional appending
manipulation in pkg-config files during install.

See previous discussion for more details:
https://lore.kernel.org/buildroot/CADvTj4qHOLX3cLsfc6Sc15-yJnKkjYFXLmQcRxhPapQOnbz0Vg@mail.gmail.com/

>
> This does not mean we can't apply this change (I even think it would be
> OK), but we really need to understand why we need it.
>
> Regards,
> Yann E. MORIN.
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/pkg-meson.mk | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> > index 156b005fdd..1830c7b10c 100644
> > --- a/package/pkg-meson.mk
> > +++ b/package/pkg-meson.mk
> > @@ -134,6 +134,7 @@ define $(2)_CONFIGURE_CMDS
> >       CXX_FOR_BUILD="$$(HOSTCXX)" \
> >       $$($$(PKG)_CONF_ENV) \
> >       $$(MESON) \
> > +             --pkgconfig.relocatable \
> >               --prefix=/usr \
> >               --libdir=lib \
> >               --default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
> > @@ -154,6 +155,7 @@ define $(2)_CONFIGURE_CMDS
> >       mkdir -p $$($$(PKG)_SRCDIR)/build
> >       $$(HOST_CONFIGURE_OPTS) \
> >       $$($$(PKG)_CONF_ENV) $$(MESON) \
> > +             --pkgconfig.relocatable \
> >               --prefix=$$(HOST_DIR) \
> >               --libdir=lib \
> >               --sysconfdir=$$(HOST_DIR)/etc \
> > --
> > 2.34.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
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
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
