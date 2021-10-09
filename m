Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36CEDC433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 00:20:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E87960FC2
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 00:20:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E87960FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AD7540691;
	Sat,  9 Oct 2021 00:20:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fV0Tqh0V0xhM; Sat,  9 Oct 2021 00:20:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 864E24063A;
	Sat,  9 Oct 2021 00:20:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 48A791C1127
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 00:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38B8E83774
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 00:20:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4WKwQBHG6NeU for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 00:20:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4036883760
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 00:20:24 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id n63so15821936oif.7
 for <buildroot@buildroot.org>; Fri, 08 Oct 2021 17:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VryCYzkDsI/mbwsPXJyPTwuV3WeliayrZ4Nja14Hw9Y=;
 b=hsBVHHpg5ttvfdz+5gSotWI3f7GkJSqvHMoerTP0CrkYASlxOuXbP4jU6FL8zUzPEV
 ouHc6KaOhLYqH6cmdQEDcIbNVL15ZRefB5uxTtOW+goVxHA+B9ZXhkX79qMBAsmvTJMf
 HZichtkFf6dTB2c2z/rXifXk6N1JxM1jlT4Hq62UEyoyKQpE+tKXS5PgU35Q97ayYNQs
 SxhHvLdEnM52yyVfgmoJgpHfzaMMVH4Hd1k8syNQeuUw2zBQal4HbwTcAD803RdJYSER
 /+11/5Zq55xipHj3GiqtVeRlIVlaBeAS0puV6rSPaUyGjMzo+DJs+GzqutH/uVKqD0N+
 7Ybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VryCYzkDsI/mbwsPXJyPTwuV3WeliayrZ4Nja14Hw9Y=;
 b=zl4xrdGVe1ggoRoFRKXdsS/15KoP7OJWyFg7Lt1QD6mOIGziqtnJE6/qIRIWqWsyZI
 ai5vMM3ccTMdhmGaaMuQf81tgoAu5y+2h8NhO0+9FFBCVR4OpFfI/G+umCDyjrTbwOGp
 fs/K+pTtsB0e7OYt3YYAr3EKCHDnEZrvQQJd5mPjwVYhfDzHdji8g4AGNVjEtf+J2G9N
 FqyQVcVVPgv5/E3ciOjuGO+kGpJy0Oo2SKBOi6UQMUUo7Yx8rPjWWREd0ZOj42dE7F28
 YzRuSUI5nwWk4KLfgfMwN0dEPXBWVlMtsqr9goDiRt9cqSiUGHoMXCZdHMlVTyJFbB3Z
 di7A==
X-Gm-Message-State: AOAM530gtsAM714M+vW7mS283HspYEOEV6LM3zWSusR+Cuwq6dlefbhA
 Q6vKcBsCryKrKqL+jXsXaJGY9cQUGsnnbmGHc1M=
X-Google-Smtp-Source: ABdhPJxdjqiVp1uH72o/NV7UsRkJa1x1dg+Fyc2YdfO/VMX9vOBaCYrptP5nDZlXKK45rGGfmYk3AywYjKUsfzI6L58=
X-Received: by 2002:a05:6808:171c:: with SMTP id
 bc28mr18873576oib.18.1633738823296; 
 Fri, 08 Oct 2021 17:20:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211008204342.370220-1-aduskett@gmail.com>
 <20211008204342.370220-3-aduskett@gmail.com>
 <20211008231657.43d2f9aa@windsurf>
In-Reply-To: <20211008231657.43d2f9aa@windsurf>
From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 8 Oct 2021 17:20:12 -0700
Message-ID: <CAFSsvmo16LvCngmCUeO+At9QWys11aaDZzE40DgLbrNYbQ6e6A@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v3 2/2] package/nodejs: bump version to
 14.17.6
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
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Oh for Pete's sake! I will fix it asap!

Adam

On Fri, Oct 8, 2021 at 2:16 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Fri,  8 Oct 2021 13:43:42 -0700
> Adam Duskett <aduskett@gmail.com> wrote:
>
> > Changes include:
> >   - Remove the dependency on Python2, as nodejs 14 supports Python 3.
> >   - Remove --without-snapshot as it's no longer a supported config option.
> >   - Remove /openssl to the shared-openssl-includes config option, as the build
> >     system automatically appends /openssl to the includes path.
> >
> >   - Add a qemu wrapper. V8's JIT infrastructure requires binaries such as
> >     mksnapshot and mkpeephole to be run in the host during the build.
> >     However, these binaries must have the same bit-width as the target
> >     (e.g. a x86_64 host targeting ARMv6 needs to produce a 32-bit binary).
> >     To work around this issue, cross-compile the binaries for the target and
> >     run them on the host with QEMU, much like gobject-introspection.
> >
> > Signed-off-by: Adam Duskett <aduskett@gmail.com>
> > ---
> >  .../0001-add-qemu-wrapper-support.patch       | 76 ++++++++++++++++++
> >  package/nodejs/Config.in                      | 15 +++-
> >  package/nodejs/nodejs.hash                    |  6 +-
> >  package/nodejs/nodejs.mk                      | 78 +++++++++++--------
> >  package/nodejs/v8-qemu-wrapper.in             | 12 +++
> >  5 files changed, 146 insertions(+), 41 deletions(-)
> >  create mode 100644 package/nodejs/0001-add-qemu-wrapper-support.patch
> >  create mode 100644 package/nodejs/v8-qemu-wrapper.in
> >
> > diff --git a/package/nodejs/0001-add-qemu-wrapper-support.patch b/package/nodejs/0001-add-qemu-wrapper-support.patch
> > new file mode 100644
> > index 0000000000..9b81e3adab
> > --- /dev/null
> > +++ b/package/nodejs/0001-add-qemu-wrapper-support.patch
> > @@ -0,0 +1,76 @@
> > +From fa09fa3ad6a21ae0b35fb860f76d1762e5f29972 Mon Sep 17 00:00:00 2001
> > +From: Adam Duskett <aduskett@gmail.com>
> > +Date: Mon, 27 Sep 2021 12:55:09 -0700
> > +Subject: [PATCH] 1
>
> This is perhaps a bit weak as a commit title and commit description :-)
>
>
> > +# V8's JIT infrastructure requires binaries such as mksnapshot and
> > +# mkpeephole to be run in the host during the build. However, these
> > +# binaries must have the same bit-width as the target (e.g. a x86_64
> > +# host targeting ARMv6 needs to produce a 32-bit binary). To work around this
> > +# issue, cross-compile the binaries for the target and run them on the
> > +# host with QEMU, much like gobject-introspection.
> > +define NODEJS_INSTALL_V8_QEMU_WRAPPER
> > +     $(INSTALL) -D -m 755 $(NODEJS_PKGDIR)/v8-qemu-wrapper.in \
> > +             $(@D)/out/Release/v8-qemu-wrapper
> > +     $(SED) "s%@QEMU_USER@%$(QEMU_USER)%g" \
> > +             $(@D)/out/Release/v8-qemu-wrapper
> > +     $(SED) "s%@TOOLCHAIN_HEADERS_VERSION@%$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)%g" \
> > +             $(@D)/out/Release/v8-qemu-wrapper
> > +     $(SED) "s%@QEMU_USERMODE_ARGS@%$(call qstrip,$(BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS))%g" \
> > +             $(@D)/out/Release/v8-qemu-wrapper
> > +endef
> > +NODEJS_PRE_CONFIGURE_HOOKS += NODEJS_INSTALL_V8_QEMU_WRAPPER
> >
> > +define NODEJS_WRAPPER_FIXUP
> > +     $(SED) "s%@MAYBE_WRAPPER@%'<(PRODUCT_DIR)/v8-qemu-wrapper',%g" $(@D)/node.gyp
> > +     $(SED) "s%@MAYBE_WRAPPER@%'<(PRODUCT_DIR)/v8-qemu-wrapper',%g" $(@D)/tools/v8_gypfiles/v8.gyp
> > +endef
> > +NODEJS_PRE_CONFIGURE_HOOKS += NODEJS_WRAPPER_FIXUP
> >
> > +# Do not run the qemu-wrapper for the host build.
> > +define HOST_NODEJS_WRAPPER_FIXUP
> > +     $(SED) "s%@MAYBE_WRAPPER@%%g" $(@D)/node.gyp
> > +     $(SED) "s%@MAYBE_WRAPPER@%%g" $(@D)/tools/v8_gypfiles/v8.gyp
> > +endef
> > +HOST_NODEJS_PRE_CONFIGURE_HOOKS += HOST_NODEJS_WRAPPER_FIXUP
>
> Would have been great for MAYBE_WRAPPER to be a ./configure option :-)
> But fair enough.
>
> Overall, except the commit title/log of the patch, I don't see much
> problem with this patch.
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
