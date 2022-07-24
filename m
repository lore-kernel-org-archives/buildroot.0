Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC185C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 21:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01AB4416B9;
	Sun, 24 Jul 2022 21:06:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01AB4416B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z9wDpkk4z0DV; Sun, 24 Jul 2022 21:06:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A41F7415E6;
	Sun, 24 Jul 2022 21:06:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A41F7415E6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0CCE11BF33C
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 21:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E876740C85
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 21:06:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E876740C85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jQAeKpmN6GBI for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 21:06:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA3534040D
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA3534040D
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 21:06:32 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-10d6e8990b9so12566865fac.7
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 14:06:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=++kI9QTcEuH9L4tLFhNfhUjkDSJR9d4xcqSPwfO9qio=;
 b=ANAj+4DSLjSat8wk+qJnoaQX3i3XBylaS9cxzo9U2PoGhHe8vUucGofk1wxC6EROPS
 gwoopQ5QiZzePq6pf4LWP7Y4YMgsuQiAXda8S4FDBZ7t2Y+YbxsGJoS7aa3sme8UZE+N
 Th2goWHtlY9LRhALbBMPMzAWAS9oSLGuHZ7I61DuZk6X2sQkd2utkuvpD/uWWg7l+Lku
 /WO3ZYKt1IOV0xxXD0r5hVz6x8FzceVclG8Nh1BBe7Iw7mzAL5/0hZf1pc9FyOWfC30W
 Dd1FlxAieTcTMFimzYYmUjyuUTk+pJhujcHpM/Os69QiSilILMhRcO2MjCY4HTioQBsZ
 3Pdg==
X-Gm-Message-State: AJIora8XyTlMtp7KD3b0bVSOJncfdBjKSg3rwd4fLzX10HexEFBWS41J
 9e/8v235Hu+z7fZkY1gzO427hyrU0Dmb5jzFbjL1qINf570BAA==
X-Google-Smtp-Source: AGRyM1up5Myu7kuV5ZcadgNxAZGEh/G25VbE6FmWM9JwEIrrVslVoJlU3bCgm8uB0N4048RKjUABcobtFhsTdKyffN4=
X-Received: by 2002:a05:6870:8314:b0:10c:cc1a:57fc with SMTP id
 p20-20020a056870831400b0010ccc1a57fcmr12825857oae.153.1658696791750; Sun, 24
 Jul 2022 14:06:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220724020144.1012252-1-james.hilliard1@gmail.com>
 <ebe61366-15fc-6e69-b187-f884312206e2@mind.be>
In-Reply-To: <ebe61366-15fc-6e69-b187-f884312206e2@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 24 Jul 2022 15:06:20 -0600
Message-ID: <CADvTj4rLQx5-t6iQEKTcc0U4n=T_-7LSWWBkV1wdKCaraT+_Fw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=++kI9QTcEuH9L4tLFhNfhUjkDSJR9d4xcqSPwfO9qio=;
 b=j1j9z7Vs/hPJNgcXmeihB/Q6HQaJuKe0G3ky5M56rBdQ8p4hfTzaROJ6wfniG38AAL
 dv3PfSBDcuMAVuRWGUXprlNMdmmgJHzeoyNza4kiANgd6y+AJUC7jsyB1c9ch1CPvM7R
 +syUD+Y5McyF05j+jHWTUY/PmZNMLjiReD0RNSYN7FQlIZpJzRYxtCPE4bpooFPaahl1
 ye9kgNPcxaMPrnuDVScZvN4BSyrirvOQxzg+NlQh+DZdKyUJf6sOVM4x+tYT3ufYDHoY
 Q7dF4VjcynmSFCOBKU1xKoRVRfURHTr7woCf4WF5BaZDpd68zcqUwz9bbqh/x6qz+mf5
 5xVQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=j1j9z7Vs
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

On Sun, Jul 24, 2022 at 2:59 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 24/07/2022 04:01, James Hilliard wrote:
> > Set HOST_LDFLAGS RUSTFLAGS via the host-config feature, see:
> > https://doc.rust-lang.org/nightly/cargo/reference/unstable.html#host-config
> >
> > We have to enable this nightly feature first using:
> > CARGO_UNSTABLE_HOST_CONFIG="true"
> >
> > Separately set target RUSTFLAGS for the target triple specific env
> > variable.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >   package/pkg-cargo.mk | 11 ++++++++---
> >   1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
> > index f7e3f39503..439d443b0d 100644
> > --- a/package/pkg-cargo.mk
> > +++ b/package/pkg-cargo.mk
> > @@ -32,7 +32,10 @@ PKG_COMMON_CARGO_ENV = \
> >   # using nighly features on stable releases, i.e features that are not
> >   # yet considered stable.
> >   #
> > -# CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" "enables the nightly
> > +# CARGO_UNSTABLE_HOST_CONFIG="true" enables the host specific
> > +# configuration feature
> > +#
> > +# CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" enables the nightly
> >   # configuration option target-applies-to-host value to be set
> >   #
> >   # CARGO_TARGET_APPLIES_TO_HOST="false" is actually setting the value
> > @@ -41,9 +44,11 @@ PKG_COMMON_CARGO_ENV = \
> >   PKG_CARGO_ENV = \
> >       $(PKG_COMMON_CARGO_ENV) \
> >       __CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS="nightly" \
> > +     CARGO_UNSTABLE_HOST_CONFIG="true" \
> >       CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" \
> >       CARGO_TARGET_APPLIES_TO_HOST="false" \
> >       CARGO_BUILD_TARGET="$(RUSTC_TARGET_NAME)" \
> > +     CARGO_HOST_RUSTFLAGS="$(addprefix -C link-args=,$(HOST_LDFLAGS))" \
> >       CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_LINKER=$(notdir $(TARGET_CROSS))gcc
> >
> >   #
> > @@ -51,7 +56,8 @@ PKG_CARGO_ENV = \
> >   # and should be removed when fixed upstream
> >   #
> >   ifeq ($(NORMALIZED_ARCH),arm)
> > -     PKG_CARGO_ENV += RUSTFLAGS="-Clink-arg=-Wl,--allow-multiple-definition"
> > +     PKG_CARGO_ENV += \
> > +             CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_RUSTFLAGS="-Clink-arg=-Wl,--allow-multiple-definition"
>
>   I don't understand why this is needed. We don't set RUSTFLAGS anywhere else,
> so it should be fine? Or is it because RUSTFLAGS is also used for native build
> even if CARGO_HOST_RUSTFLAGS is set?

So cargo target builds tend to actually build artifacts for both the
host and the
target architecture, since cargo build-scripts are themselves written
in rust, thus
passing plain RUSTFLAGS has inconsistent behavior it seems in regards to
which artifact builds the RUSTFLAGS get applied to(seems to have changed
across cargo versions as well). Splitting them explicitly should be
more correct.

>
>   (Anyway, this hunk can probably be removed, the bug that triggered it is fixed.)
>
> >   endif
> >
> >   HOST_PKG_CARGO_ENV = \
> > @@ -128,7 +134,6 @@ else # ifeq ($(4),target)
> >   define $(2)_BUILD_CMDS
> >       cd $$($$(PKG)_SRCDIR) && \
> >       $$(HOST_MAKE_ENV) \
> > -             RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \
>
>   Why can this be removed? You added CARGO_HOST_RUSTFLAGS to the target build,
> but we still want HOST_LDFLAGS in the host package build, no?

I think this works ok since it's not a cross build like the target
build. Target builds
generate both native/and target artifacts unlike host builds.

>
>   Regards,
>   Arnout
>
> >               $$(HOST_CONFIGURE_OPTS) \
> >               $$(HOST_PKG_CARGO_ENV) \
> >               $$($(2)_CARGO_ENV) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
