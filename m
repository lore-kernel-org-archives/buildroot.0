Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3E8C43334
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 05:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36AF883455;
	Tue, 26 Jul 2022 05:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36AF883455
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K5MadMhsdAJn; Tue, 26 Jul 2022 05:00:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 061BE8329E;
	Tue, 26 Jul 2022 05:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 061BE8329E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E1111BF2B1
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 05:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A0854039D
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 05:00:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A0854039D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 04b-AjdZ_XOo for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 05:00:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8588400CB
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E8588400CB
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 05:00:11 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-10d9213b77aso17401000fac.5
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 22:00:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EpNBE5Tgc1hZdF4BnaGxpuEh5whXhg1v6maa7lqnXP4=;
 b=Xg+xljiKuoPciHHI4BaVnOt5IcUQT9p8ev627Ugb7NYC1qDDSCToAMNdBj8MZFD3oG
 Hw3pFXbF3AlGPSl4XuUydZlV9q5pbkaeDDZvtIrV23x29ipzZjFdAPDJ7GhjNdbV2lc9
 BR6kt1+WNkG5i+ud4zAxDvwIwhgyn83MqDTjD875ul1ThGAsYpibfsVjy5OZzWSWdeeE
 KKVI4JK9bljSh7nvxyUMdhufR7kQixzIZnBerb+349B8CsCgRkvcNQjJ8yHlVmtncllC
 KxaW97CC2vh2Gn4YFtW/d3fzeJ9R2SNGS9jAFkXNWlDTQkRfLsxWVVF9HUXYT3sB4h+4
 spCw==
X-Gm-Message-State: AJIora+wj23e1uYVmd1YMQjAXis7C1wz9bKgp5IKee8D/xzH6OkYXFgq
 RUJqqkayCKQid7T4isp2mhQBi8rVSSOa8JtlN9g=
X-Google-Smtp-Source: AGRyM1sAuWSW0alzztyCJh80x6n452IeIucBKRqaMS5fkWIZ4CplndlTxzHbTa2BAxMYqXDykxY0E7BADMzlRrbIlXc=
X-Received: by 2002:a05:6870:8314:b0:10c:cc1a:57fc with SMTP id
 p20-20020a056870831400b0010ccc1a57fcmr16093732oae.153.1658811610901; Mon, 25
 Jul 2022 22:00:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220722060936.566534-1-james.hilliard1@gmail.com>
 <20220724153736.GY2641@scaer> <d3dd1b44-33a2-0260-fe89-e93fb71a0209@mind.be>
In-Reply-To: <d3dd1b44-33a2-0260-fe89-e93fb71a0209@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 25 Jul 2022 22:59:58 -0600
Message-ID: <CADvTj4ps6SNy2oQ0UFYYkkjK39ubTiBtFd4RSp4hMvjdB1ywPA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=EpNBE5Tgc1hZdF4BnaGxpuEh5whXhg1v6maa7lqnXP4=;
 b=b20RlrkI6irDrIXaGZYCYeAzLA+UsZpaf9dSfpodhbou5jy//2cKJ2ZD1tFAxchwDL
 xZoXwT6HoK7PpjrD/FM/o4fnsRXXw9bBfBspEGTcOiPOXkMQJaW0DFU2DEMD5s5dZWF6
 ZOIT/BIdVdNJRA2JcPuoumsjelXFHaDyQ+EhNqyEGf0tOBXlxhR3JbLKayA5CMw9L/Ml
 PqY6WQNubFl/eUdykijnk1q8QMlrLgTnqr3/UJ/izAheYkkzO7uIXMzvgHOAMM+1cI+v
 bVflx7a6R8pS+nW1hjHNVAE+B0OF8lJetKFmCCsjdDrooDG7awMGV8u3x2pP8v0YrMs3
 GhGg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=b20RlrkI
Subject: Re: [Buildroot] [PATCH v3 1/1] package/pkg-meson: use meson to
 build/install packages
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
 Samuel Martin <s.martin49@gmail.com>, buildroot <buildroot@buildroot.org>,
 Norbert Lange <nolange79@gmail.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Jul 24, 2022 at 1:30 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 24/07/2022 17:37, Yann E. MORIN wrote:
> > James, All,
> >
> > On 2022-07-22 00:09 -0600, James Hilliard spake thusly:
> >> As of version 0.54.0 meson has had the ability to build and install
> >> packages rather than having to run ninja directly as before.
> >>
> >> This will allow us to use features such as meson install tags in
> >> the future which require meson to be used for the installation.
> >>
> >> It appears we need to ensure the cmake prefix path is set for the
> >> meson generated relocatable pkg-config format to work properly.
> >>
> >> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >> ---
> > [--SNIP--]
> >> diff --git a/docs/manual/adding-packages-meson.txt b/docs/manual/adding-packages-meson.txt
> >> index 029c8c2488..c8aed65c2f 100644
> >> --- a/docs/manual/adding-packages-meson.txt
> >> +++ b/docs/manual/adding-packages-meson.txt
> >> @@ -125,8 +125,8 @@ will therefore only use a few of them.
> >>     +c_link_args+, +cpp_args+, +cpp_link_args+, +sys_root+, and
> >>     +pkg_config_libdir+.
> >>
> >> -* +FOO_NINJA_ENV+, to specify additional environment variables to pass to
> >> -  +ninja+, meson companion tool in charge of the build operations. By default,
> >> +* +FOO_MESON_ENV+, to specify additional environment variables to pass to
> >> +  +meson+, meson tool in charge of the build/install operations. By default,
> >>     empty.
> >
> > IIRC, the topic of what to do about external packages that set their
> > FOO_NINJA_ENV, was raised in a previous iteration.
> >
> > I understand that the conclusion was basically "the probability is low,
> > we don't handle it". This should have been noted in the commit log.

Added a note in v4 commit log.

> >
> >>   * +FOO_NINJA_OPTS+, to specify a space-separated list of targets to build. By
> >
> > Now that we use meson to build and instal, does it still make sense to
> > have FOO_NINJA_OPTS to be the list of targets to install?
> >
> > I mean, isn't there a way to tell meson what to install, instead?
>
>   FOO_NINJA_OPTS could theoretically be used to control other things about
> ninja, e.g. warnings and debugging. Though I don't really see why you'd ever
> want to do that in a buildroot package.

There might be some use cases in which it makes sense to use it to control
what gets built...I figured best just keep it for now.

>
> >
> > [--SNIP--]
> >> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> >> index 3b1db35fb6..4fa620080d 100644
> >> --- a/package/pkg-cmake.mk
> >> +++ b/package/pkg-cmake.mk
> >> @@ -90,6 +90,8 @@ define $(2)_CONFIGURE_CMDS
> >>      $$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> >>              -DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
> >>              -DCMAKE_INSTALL_PREFIX="/usr" \
> >> +            -DCMAKE_PREFIX_PATH="$$(STAGING_DIR)/usr" \
>
>   Wouldn't it be better to put this in the toolchainfile?

So it seems we just need to remove this from the toolchainfile instead actually:
https://patchwork.ozlabs.org/project/buildroot/patch/20220726044425.72570-1-james.hilliard1@gmail.com/

>
> >> +            -DPKG_CONFIG_USE_CMAKE_PREFIX_PATH=ON \
>
>   This one as well, I guess.
>
> >
> > But doesn't that needs to be in a separate patch? I mean, does it not
> > make sense opn its own?
>
>   +1.
>
>   The commit message of that patch could also explain better what it does exactly.
>
> >
> > [--SNIP--]
> >> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> >> index 0835e08e3a..de5817d5da 100644
> >> --- a/package/pkg-meson.mk
> >> +++ b/package/pkg-meson.mk
> > [--SNIP--]
> >> @@ -138,6 +138,7 @@ define $(2)_CONFIGURE_CMDS
> >>      $$(MESON) \
> >>              --prefix=/usr \
> >>              --libdir=lib \
> >> +            --pkgconfig.relocatable \
> >
> > Please explain what that means and why this is needed in the context of
> > a target package.
>
>   And also it should probably be a separate patch - pkgconfig stuff should be
> done at configure time, not at build time, so using meson to start the build
> shouldn't really be related to it.

This is inside of $(2)_CONFIGURE_CMDS so it is done at configure time AFAIU.

>
> >
> >>              --default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
> >>              --buildtype=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release) \
> >>              --cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
> >> @@ -156,10 +157,11 @@ define $(2)_CONFIGURE_CMDS
> >>      mkdir -p $$($$(PKG)_SRCDIR)/build
> >>      $$(HOST_CONFIGURE_OPTS) \
> >>      $$($$(PKG)_CONF_ENV) $$(MESON) \
> >> -            --prefix=$$(HOST_DIR) \
> >> +            --prefix=/ \
> >
> > It is very weird that host packages are configured with / as prefix, and
> > then installed in HOST_DIR set as DEST_DIR.
>
>   It's not weird, it's wrong! There is no reasonable explanation how this can be
> correct. We are really installing stuff in that specific location, any paths
> should refer to that location and not a path beginning with /.

Well from my understanding when using relocatable mode/meson install the
prefix is appended to the destdir similar to how it works for target/staging
directories.

>
>   If for some reason meson doesn't work when the prefix is not / or /usr or
> /usr/local, it's a bug in meson, really.

I think the issue is in how prefix and destdir get combined.

>
>   Regards,
>   Arnout
>
> >
> > I guess this is working thanks to --pkgconfig.relocatable a few lines
> > below?
> >
> > This must be explained in the commit log (and probably a little comment
> > above $(2)_CONFIGURE_CMDS for host packages.
> >
> >>              --libdir=lib \
> >> -            --sysconfdir=$$(HOST_DIR)/etc \
> >> -            --localstatedir=$$(HOST_DIR)/var \
> >> +            --pkgconfig.relocatable \
> >> +            --sysconfdir=etc \
> >> +            --localstatedir=var \
>
>   These two could be correct, however, since I think they're taken relative to
> prefix (the default values are absolute because the default prefix is /usr and
> sysconfdir is /etc, not /usr/etc - but in our case a relative path is fine).
>
>   Regards,
>   Arnout
>
> >
> > Ditto for etc and var?
> >
> > So, to make it easier to follow, I'd change the ordering:
> >
> >      --pkgconfig.relocatable \
> >      --prefix=/ \
> >      --sysconfdir=etc \
> >      --localstatedir=var \

Reordered in v4.

> >
> > Regards,
> > Yann E. MORIN.
> >
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
