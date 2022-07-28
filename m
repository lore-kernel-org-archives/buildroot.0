Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860ECC19F2B
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 01:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1203882ACD;
	Thu, 28 Jul 2022 01:54:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1203882ACD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 85DZMDlDdjdb; Thu, 28 Jul 2022 01:54:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D07BC829EE;
	Thu, 28 Jul 2022 01:53:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D07BC829EE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 05CFD1BF393
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 01:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF25160EDE
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 01:53:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF25160EDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jfOuXiVp7YQk for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 01:53:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 813F560EC4
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 813F560EC4
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 01:53:55 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id h188so517825oia.13
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 18:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QXMXF0BC/TU1y0zfCIa+J+yELXhBdbd8OAHWPe952ms=;
 b=zFO11h8U5GCa500lj2Ryr72osX+03udIoGIx7Gto6TayIgMquTKvQJttva4xQv+TUH
 lNT02xmoKJaCvQWpOUrnqMJ1nPUVw0N6GbTJSpFBSBzDqjwl22c63UfUftJ+MVQ0t9qM
 PaGCT+mv4QQoyAwZejK3K8noP7MYNTGt5jqKgVqqCX7XtuHfUrF1wmo2foxCDz6UdURY
 eMyW/AXbf5PxMzj/5gh/etNygz+rPkBdVUBHfvK9ViDSbe7QGnr8zR/2+vWlGEhRdjVr
 wMzqqxMrUybwCh6GKbzDXG/u4O2iTKP35zodxMtTqsQPA6Ll0sJUZ9RjvihHgT/onPmx
 bgHQ==
X-Gm-Message-State: AJIora+rDeeP6nPtrAH6t+5zd7gzO+UTLpPS1Oex8wIq1YZatbDX5D5I
 D7xrD9LwXqdhr2GMmQzOl7I6j1DUxQNVKwxTO8E=
X-Google-Smtp-Source: AGRyM1t2XveLA2eNy/sjsibEUg6BLx5yfh5qBx7Khutxk7RGI6VoZDW4XpR+QLty6Uwe0ktNoB8rHakICe782efznFM=
X-Received: by 2002:a54:488d:0:b0:33a:87b3:31a with SMTP id
 r13-20020a54488d000000b0033a87b3031amr3107995oic.153.1658973234482; Wed, 27
 Jul 2022 18:53:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220722060936.566534-1-james.hilliard1@gmail.com>
 <20220724153736.GY2641@scaer> <d3dd1b44-33a2-0260-fe89-e93fb71a0209@mind.be>
 <CADvTj4ps6SNy2oQ0UFYYkkjK39ubTiBtFd4RSp4hMvjdB1ywPA@mail.gmail.com>
 <23a6eba2-06fd-8579-9815-214b3656daf7@mind.be>
In-Reply-To: <23a6eba2-06fd-8579-9815-214b3656daf7@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 27 Jul 2022 19:53:43 -0600
Message-ID: <CADvTj4qQ0pwW184-xdBvezPO6RrMgN3-T3benq2FkMHiGXWeAA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=QXMXF0BC/TU1y0zfCIa+J+yELXhBdbd8OAHWPe952ms=;
 b=LjHIdr+QiC5n809wanDSXZUgMT1LGFADp0vNRaJc8OC8ySZME523FkQW6D8XW44bLR
 3bcz+Oae31cGwWl1QjOtr59mEB5LOD6WHIWfLDQKHApIRDOGwGF9fDEcWvh5McPjpKaD
 ehzYpXQWsXPSidwDHH2HDfV3jRxbXboLVZCv4pGcV8cD0EgJDE2WFmQHEIx2jaf7lpzp
 VsAUTw2EEjcsHCfTn3wdCqXKlFCcWoW6prmZfOkImC01P8D7Al5XLGiJu0WDErMF/Hg6
 S0SR1KYg+vWFJPwBvBeNek7CDH/9/1pKtkRhO2cuF9+XCi85svQsx8tagCfVPAm3YfER
 F+mQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LjHIdr+Q
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

On Tue, Jul 26, 2022 at 1:31 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 26/07/2022 06:59, James Hilliard wrote:
> > On Sun, Jul 24, 2022 at 1:30 PM Arnout Vandecappelle <arnout@mind.be> wrote:
> >>
> >>
> >>
> >> On 24/07/2022 17:37, Yann E. MORIN wrote:
> >>> James, All,
> >>>
> >>> On 2022-07-22 00:09 -0600, James Hilliard spake thusly:
> >>>> As of version 0.54.0 meson has had the ability to build and install
> >>>> packages rather than having to run ninja directly as before.
> >>>>
> >>>> This will allow us to use features such as meson install tags in
> >>>> the future which require meson to be used for the installation.
> >>>>
> >>>> It appears we need to ensure the cmake prefix path is set for the
> >>>> meson generated relocatable pkg-config format to work properly.
> >>>>
> >>>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> [snip]
> >>>>    * +FOO_NINJA_OPTS+, to specify a space-separated list of targets to build. By
> >>>
> >>> Now that we use meson to build and instal, does it still make sense to
> >>> have FOO_NINJA_OPTS to be the list of targets to install?
> >>>
> >>> I mean, isn't there a way to tell meson what to install, instead?
> >>
> >>    FOO_NINJA_OPTS could theoretically be used to control other things about
> >> ninja, e.g. warnings and debugging. Though I don't really see why you'd ever
> >> want to do that in a buildroot package.
> >
> > There might be some use cases in which it makes sense to use it to control
> > what gets built...I figured best just keep it for now.
>
>   If it is used to control what gets built, then Yann's remark applies - it
> should be passed to meson itself, not to ninja. That is, assuming that "meson
> build" does have a way to specify what gets built.

Well it's being passed by meson to ninja directly I think.

>
>
> >>>> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> >>>> index 3b1db35fb6..4fa620080d 100644
> >>>> --- a/package/pkg-cmake.mk
> >>>> +++ b/package/pkg-cmake.mk
> >>>> @@ -90,6 +90,8 @@ define $(2)_CONFIGURE_CMDS
> >>>>       $$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> >>>>               -DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
> >>>>               -DCMAKE_INSTALL_PREFIX="/usr" \
> >>>> +            -DCMAKE_PREFIX_PATH="$$(STAGING_DIR)/usr" \
> >>
> >>    Wouldn't it be better to put this in the toolchainfile?
> >
> > So it seems we just need to remove this from the toolchainfile instead actually:
> > https://patchwork.ozlabs.org/project/buildroot/patch/20220726044425.72570-1-james.hilliard1@gmail.com/
>
>   The problem is, the toolchainfile is not only meant to be used in Buildroot
> itself, but also by external builds (using the SDK). The idea is that it should
> be sufficient to call cmake with an option pointing to the toolchain file to do
> a build externally. That's why we have the pkgconfig setting in there.

This seems to work:
https://patchwork.ozlabs.org/project/buildroot/patch/20220728014402.142320-1-james.hilliard1@gmail.com/

>
>
> >>>> +            -DPKG_CONFIG_USE_CMAKE_PREFIX_PATH=ON \
> >>
> >>    This one as well, I guess.
> >>
> >>>
> >>> But doesn't that needs to be in a separate patch? I mean, does it not
> >>> make sense opn its own?
> >>
> >>    +1.
> >>
> >>    The commit message of that patch could also explain better what it does exactly.
> >>
> >>>
> >>> [--SNIP--]
> >>>> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> >>>> index 0835e08e3a..de5817d5da 100644
> >>>> --- a/package/pkg-meson.mk
> >>>> +++ b/package/pkg-meson.mk
> >>> [--SNIP--]
> >>>> @@ -138,6 +138,7 @@ define $(2)_CONFIGURE_CMDS
> >>>>       $$(MESON) \
> >>>>               --prefix=/usr \
> >>>>               --libdir=lib \
> >>>> +            --pkgconfig.relocatable \
> >>>
> >>> Please explain what that means and why this is needed in the context of
> >>> a target package.
> >>
> >>    And also it should probably be a separate patch - pkgconfig stuff should be
> >> done at configure time, not at build time, so using meson to start the build
> >> shouldn't really be related to it.
> >
> > This is inside of $(2)_CONFIGURE_CMDS so it is done at configure time AFAIU.
>
>   The patch is about "use meson to build/install packages". It is very weird
> that calling meson instead of ninja in the build step would require to do
> something different in the configure step.

Well meson does do some extra stuff when using meson's install compared
with just ninja, it also supports additional features like tag
filtering during install.

>
>
> >>>>               --default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
> >>>>               --buildtype=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release) \
> >>>>               --cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
> >>>> @@ -156,10 +157,11 @@ define $(2)_CONFIGURE_CMDS
> >>>>       mkdir -p $$($$(PKG)_SRCDIR)/build
> >>>>       $$(HOST_CONFIGURE_OPTS) \
> >>>>       $$($$(PKG)_CONF_ENV) $$(MESON) \
> >>>> -            --prefix=$$(HOST_DIR) \
> >>>> +            --prefix=/ \
> >>>
> >>> It is very weird that host packages are configured with / as prefix, and
> >>> then installed in HOST_DIR set as DEST_DIR.
> >>
> >>    It's not weird, it's wrong! There is no reasonable explanation how this can be
> >> correct. We are really installing stuff in that specific location, any paths
> >> should refer to that location and not a path beginning with /.
> >
> > Well from my understanding when using relocatable mode/meson install the
> > prefix is appended to the destdir similar to how it works for target/staging
> > directories.
>
>   As Thomas explained in the v4, it is not at all similar to target/staging.

Well meson AFAIU is designed to make things functional even when run
from the build tree which may have implications here, meson tends to do
stuff differently from other build systems in general I think.

>
>
>   Regards,
>   Arnout
>
> >>    If for some reason meson doesn't work when the prefix is not / or /usr or
> >> /usr/local, it's a bug in meson, really.
> >
> > I think the issue is in how prefix and destdir get combined.
> >
> >>
> >>    Regards,
> >>    Arnout
> >>
> >>>
> >>> I guess this is working thanks to --pkgconfig.relocatable a few lines
> >>> below?
> >>>
> >>> This must be explained in the commit log (and probably a little comment
> >>> above $(2)_CONFIGURE_CMDS for host packages.
> >>>
> >>>>               --libdir=lib \
> >>>> -            --sysconfdir=$$(HOST_DIR)/etc \
> >>>> -            --localstatedir=$$(HOST_DIR)/var \
> >>>> +            --pkgconfig.relocatable \
> >>>> +            --sysconfdir=etc \
> >>>> +            --localstatedir=var \
> >>
> >>    These two could be correct, however, since I think they're taken relative to
> >> prefix (the default values are absolute because the default prefix is /usr and
> >> sysconfdir is /etc, not /usr/etc - but in our case a relative path is fine).
> >>
> >>    Regards,
> >>    Arnout
> >>
> >>>
> >>> Ditto for etc and var?
> >>>
> >>> So, to make it easier to follow, I'd change the ordering:
> >>>
> >>>       --pkgconfig.relocatable \
> >>>       --prefix=/ \
> >>>       --sysconfdir=etc \
> >>>       --localstatedir=var \
> >
> > Reordered in v4.
> >
> >>>
> >>> Regards,
> >>> Yann E. MORIN.
> >>>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
