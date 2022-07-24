Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9144CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 21:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 411F8611EA;
	Sun, 24 Jul 2022 21:31:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 411F8611EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id chS_F-y4WUR1; Sun, 24 Jul 2022 21:31:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38D12611E1;
	Sun, 24 Jul 2022 21:31:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38D12611E1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 81C3E1BF33C
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 21:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B27A83E73
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 21:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B27A83E73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E8-B259S1BZ8 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 21:31:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D54183E70
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D54183E70
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 21:31:27 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-10dc1b16c12so7430242fac.6
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 14:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LjQ2QUBY1cEumGvcJnm8+2iqBumdbPeyYwuWEVSOwb8=;
 b=iCpxgKwUIsoQSvlaLCgXVmVjV3nqKJc+B9dajucttUqC27QBCGA6PS40VhAZLSpVqz
 Woq0+Yo4P6OE6OAho/Tu8VNylo5tDTJdB1BJ6m/mbTtmbZjE+2VM2vk/VdPs/uuitObe
 DUl1ds+5fTjS1N4TTuhAONOIbLEX+wqoLSg+G8QmB1XDfCDdkx3xUvwPZjbG49/d+iqr
 G5lNLtxMRE3VnAiuld7WpBo0xNw351K0HQijTIbGbU7xiM2TzBbrv+JcCiQBhhYYbMny
 TGWBrd3+IrNdhp+81fqm+3uVcuyx2AyIM2c9zM/sqS6J4Hrwm7Y831XGepSi12upjitX
 Ctxw==
X-Gm-Message-State: AJIora8SDb4eLA9Eh0zVyTPGkmCuGm8c3dqbSvDMc9yWn+0lwyEsDd+C
 wcPp3Q3Kir+xzGwBYMuKfcrWvizBcoHYEmbRyhVhXssQ+zpTNA==
X-Google-Smtp-Source: AGRyM1vLmsiSmC9jvp0Sv9JVHuF4+Z/ai0nN9cSVmQDD84Xf4HyMcWuEGf+sS2+3nNaZteRjXECRBY2NIrsUOGfou2s=
X-Received: by 2002:a05:6870:3282:b0:10d:7164:c66e with SMTP id
 q2-20020a056870328200b0010d7164c66emr4755953oac.147.1658698286305; Sun, 24
 Jul 2022 14:31:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220724020144.1012252-1-james.hilliard1@gmail.com>
 <ebe61366-15fc-6e69-b187-f884312206e2@mind.be>
 <CADvTj4rLQx5-t6iQEKTcc0U4n=T_-7LSWWBkV1wdKCaraT+_Fw@mail.gmail.com>
 <ba2294c2-bfc6-fcab-d03d-4709e4758a3d@mind.be>
In-Reply-To: <ba2294c2-bfc6-fcab-d03d-4709e4758a3d@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 24 Jul 2022 15:31:15 -0600
Message-ID: <CADvTj4rsi1hny=yhNWxxjtq3z6xsNyUsNSRSinmrQ8p7-NFgew@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=LjQ2QUBY1cEumGvcJnm8+2iqBumdbPeyYwuWEVSOwb8=;
 b=hmXerPpnBg9+CJtgFdUOy1MK0VFHt7vRot4G+M4t1QNjJptQ0OM6aI1lux6dSX2l7D
 XRL1q5gyG1YrwJG9118b6QqFjMuO+E51bkpOQR16SRLS9UHQjIqcpX9dVbaXzll25W5+
 v1czpcVE4wfV41Q0wxcUiWUFlavM7cX7tyNbsM92h+p1E2Gxt3Axgvpg62goH/ucFoAE
 NTyJlDC4+jPlWVTBmvfGkZduYHI9dvw9NH5YNfi+YQPGLGsghE4N+VyEp1hac96QM6ta
 gXrkvPpbHB69IwpYX58c8mnvXRcYAnUh+GbnBrbURn/Ed1UFy5pcbiQ79snmO/X9flFJ
 3k9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hmXerPpn
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-cargo: ensure host/target
 rustflags are properly split
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Jul 24, 2022 at 3:23 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 24/07/2022 23:06, James Hilliard wrote:
> > On Sun, Jul 24, 2022 at 2:59 PM Arnout Vandecappelle <arnout@mind.be> wrote:
> >>
> >>
> >>
> >> On 24/07/2022 04:01, James Hilliard wrote:
> >>> Set HOST_LDFLAGS RUSTFLAGS via the host-config feature, see:
> >>> https://doc.rust-lang.org/nightly/cargo/reference/unstable.html#host-config
> >>>
> >>> We have to enable this nightly feature first using:
> >>> CARGO_UNSTABLE_HOST_CONFIG="true"
> >>>
> >>> Separately set target RUSTFLAGS for the target triple specific env
> >>> variable.
> >>>
> >>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >>> ---
> >>>    package/pkg-cargo.mk | 11 ++++++++---
> >>>    1 file changed, 8 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
> >>> index f7e3f39503..439d443b0d 100644
> >>> --- a/package/pkg-cargo.mk
> >>> +++ b/package/pkg-cargo.mk
> >>> @@ -32,7 +32,10 @@ PKG_COMMON_CARGO_ENV = \
> >>>    # using nighly features on stable releases, i.e features that are not
> >>>    # yet considered stable.
> >>>    #
> >>> -# CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" "enables the nightly
> >>> +# CARGO_UNSTABLE_HOST_CONFIG="true" enables the host specific
> >>> +# configuration feature
> >>> +#
> >>> +# CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" enables the nightly
> >>>    # configuration option target-applies-to-host value to be set
> >>>    #
> >>>    # CARGO_TARGET_APPLIES_TO_HOST="false" is actually setting the value
> >>> @@ -41,9 +44,11 @@ PKG_COMMON_CARGO_ENV = \
> >>>    PKG_CARGO_ENV = \
> >>>        $(PKG_COMMON_CARGO_ENV) \
> >>>        __CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS="nightly" \
> >>> +     CARGO_UNSTABLE_HOST_CONFIG="true" \
> >>>        CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" \
> >>>        CARGO_TARGET_APPLIES_TO_HOST="false" \
> >>>        CARGO_BUILD_TARGET="$(RUSTC_TARGET_NAME)" \
> >>> +     CARGO_HOST_RUSTFLAGS="$(addprefix -C link-args=,$(HOST_LDFLAGS))" \
> >>>        CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_LINKER=$(notdir $(TARGET_CROSS))gcc
> >>>
> >>>    #
> >>> @@ -51,7 +56,8 @@ PKG_CARGO_ENV = \
> >>>    # and should be removed when fixed upstream
> >>>    #
> >>>    ifeq ($(NORMALIZED_ARCH),arm)
> >>> -     PKG_CARGO_ENV += RUSTFLAGS="-Clink-arg=-Wl,--allow-multiple-definition"
> >>> +     PKG_CARGO_ENV += \
> >>> +             CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_RUSTFLAGS="-Clink-arg=-Wl,--allow-multiple-definition"
> >>
> >>    I don't understand why this is needed. We don't set RUSTFLAGS anywhere else,
> >> so it should be fine? Or is it because RUSTFLAGS is also used for native build
> >> even if CARGO_HOST_RUSTFLAGS is set?
> >
> > So cargo target builds tend to actually build artifacts for both the
> > host and the
> > target architecture, since cargo build-scripts are themselves written
> > in rust, thus
> > passing plain RUSTFLAGS has inconsistent behavior it seems in regards to
> > which artifact builds the RUSTFLAGS get applied to(seems to have changed
> > across cargo versions as well). Splitting them explicitly should be
> > more correct.
>
>   Ah, yes, that makes sense. However, this splitting wouldn't work at all if
> host target name == target target name (e.g. x86_64-unknown-linux-gnu) - in
> particular, we DO NOT want to pass HOST_LDFLAGS for linking stuff for the
> target. HOST_LDFLAGS contains the rpath pointing into HOST_DIR/lib.

Using CARGO_HOST_RUSTFLAGS should not pass the flags to the target build
even when host target name == target target name.

We also are setting CARGO_TARGET_APPLIES_TO_HOST="false" which should
split the flags even for cases where host target name == target target name.

>
> >
> >>
> >>    (Anyway, this hunk can probably be removed, the bug that triggered it is fixed.)
> >>
> >>>    endif
> >>>
> >>>    HOST_PKG_CARGO_ENV = \
> >>> @@ -128,7 +134,6 @@ else # ifeq ($(4),target)
> >>>    define $(2)_BUILD_CMDS
> >>>        cd $$($$(PKG)_SRCDIR) && \
> >>>        $$(HOST_MAKE_ENV) \
> >>> -             RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \
> >>
> >>    Why can this be removed? You added CARGO_HOST_RUSTFLAGS to the target build,
> >> but we still want HOST_LDFLAGS in the host package build, no?
> >
> > I think this works ok since it's not a cross build like the target
> > build. Target builds
> > generate both native/and target artifacts unlike host builds.
>
>   I don't think it will work (when linking against C code), because I don't see
> where else the rpath into HOST_DIR will be passed. At the moment we have only
> one package in that situation I think: host-sentry-cli.

Oh, I was moving this somewhere else but must have accidentally
dropped it instead,
will respin.

>
>
>   Regards,
>   Arnout
>
>
> >
> >>
> >>    Regards,
> >>    Arnout
> >>
> >>>                $$(HOST_CONFIGURE_OPTS) \
> >>>                $$(HOST_PKG_CARGO_ENV) \
> >>>                $$($(2)_CARGO_ENV) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
