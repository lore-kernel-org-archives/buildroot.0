Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C7AC433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 02:38:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C1D8610C8
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 02:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C1D8610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3A69605BF;
	Tue,  7 Sep 2021 02:38:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22a1rdbTUlyy; Tue,  7 Sep 2021 02:38:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D0896070F;
	Tue,  7 Sep 2021 02:38:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D90311BF25F
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 02:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA8DE6070F
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 02:38:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dC_UaLDchCID for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 02:38:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8E4D605BF
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 02:38:47 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 c19-20020a9d6153000000b0051829acbfc7so10973762otk.9
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 19:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b3UMkWhPTRJUoGve5h8NaGN+heRCchPSB1BRzZ6G9RU=;
 b=IYs8zCamT+sVoWhxxR/lGip9Qe8AWLNzCxzdBDa/NIW5TwGmr8KOAKocMeMQpqNdzL
 ImAVFg/YMyBaupX1yzuYdgG+xGPRvXeHrM8Blt8RuMctYjMImI8gOFpW8sjSNckasTzu
 k8P0gWqZ4q+fFNQHhK0b8RzvMvNF96Q1DhxBwJal12iW+U/Sx1ymFd1WozrDFI6oSEwi
 NB72wzvcgSBP2DPHhFUhEBAbrQNWvKyLWZJkCoRL0+hBUuD9ij66/6FUFxylOtIrJij0
 wgeQPxblJSRGTArd3Q+oXBnI3nUPSWaeiOUtX1pq9i/17uJVSxVNuzu986t0x+FAgS2m
 uLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b3UMkWhPTRJUoGve5h8NaGN+heRCchPSB1BRzZ6G9RU=;
 b=q+f6a9zfN2zfLF+maO3vsxYGqW19iz5fxdL7W+vTKyIQovoJu5AXfJvcCk8PNk+Ie5
 1xdR+F8AThjWTFZilYEGcRdi9fLKMIaipMmreAZKsMT0/Mo2NvCBBcSQehcw8lmU9hCI
 tfrHYdds6P5o2juzRa0Y2Ljz86miOWz9nP4u3ibZvD0+66dnc0EvO1sKJJZj/keYBCJY
 1V4bIr5pp/3bPdPicYWSl60Hjkdn+PHsvO6s/Fw1AZxKAaXqM1yd6QRhq9M0yBYoGO8p
 Lfawo24C9r0PhgTSPbkveKHElAO7CZRbyVMe8SbOwO64Zvep964cAN9QrszxSE2u1PGy
 M/UQ==
X-Gm-Message-State: AOAM530gwaPxfTkBYtseolfgg3WYEvb/De+mwLxFUVjD+xN8kqLMtaji
 TNuHvi9DaazDEIaZF/41UOups9FTpeQ3KCG49Vo=
X-Google-Smtp-Source: ABdhPJxF+0WFpy2lO0hssYWnFnwLtfZS6t2hgzKC3ySTMj/JRu2wt8MZI4jOiORB6jIKeQH5XZiLlbupr7smArXD3tY=
X-Received: by 2002:a05:6830:2b24:: with SMTP id
 l36mr13769856otv.25.1630982326767; 
 Mon, 06 Sep 2021 19:38:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210814195143.92753-1-sam.voss@gmail.com>
 <CADvTj4r0Af4s=oMMYR-6kh=pXFA_u=YfWgiXWn6DSNTE9g5hvw@mail.gmail.com>
In-Reply-To: <CADvTj4r0Af4s=oMMYR-6kh=pXFA_u=YfWgiXWn6DSNTE9g5hvw@mail.gmail.com>
From: Sam Voss <sam.voss@gmail.com>
Date: Mon, 6 Sep 2021 21:38:34 -0500
Message-ID: <CAK714xLCxo4=w-pE5XxJGFDFsdpBLdyb3K7QWLiBzSh_5pSR=A@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/ripgrep: bump to version 13.0.0
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============5181192925188665959=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============5181192925188665959==
Content-Type: multipart/alternative; boundary="00000000000038d26105cb5eaa7e"

--00000000000038d26105cb5eaa7e
Content-Type: text/plain; charset="UTF-8"

Hi James,

On Mon, Sep 6, 2021 at 7:21 PM James Hilliard <james.hilliard1@gmail.com>
wrote:
>
> On Sat, Aug 14, 2021 at 1:52 PM <sam.voss@gmail.com> wrote:
> >
> > From: Sam Voss <sam.voss@gmail.com>
> >
> > Also adds patch to make the jemalloc feature optional on musl, due to
> > toolchains not being supported by upstream project.
>
> Which toolchains are not supported here specifically?

I could have made this more clear in the original thread, although just
incase it came across confusing the "upstream project" that doesn't support
it is jemallocator, and not ripgrep.

The project specifically calls out their mapping of fully supported
toolchains:

https://github.com/gnzlbg/jemallocator

I discovered this when running the default set of test-pkg targets, and the
bootlin-x86-64-musl failed.

After digging into the issue a bit, it seems like this could be an issue
for more rust projects which use jemalloc on musl for improved allocation
performance, however I have not investigated any further.

>
> >
> > Signed-off-by: Sam Voss <sam.voss@gmail.com>
> > ---
> >  ...llocator-behind-a-cargo-feature-flag.patch | 131 ++++++++++++++++++
> >  package/ripgrep/ripgrep.hash                  |   4 +-
> >  package/ripgrep/ripgrep.mk                    |   2 +-
> >  3 files changed, 134 insertions(+), 3 deletions(-)
> >  create mode 100644
package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
> >
> > diff --git
a/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
b/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
> > new file mode 100644
> > index 0000000000..e2ba68f389
> > --- /dev/null
> > +++
b/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
> > @@ -0,0 +1,131 @@
> > +From 68c2a4d7a5d9b46f65121958fdb12d5270bfd1b6 Mon Sep 17 00:00:00 2001
> > +From: Jonathan Stites <mail@jonstites.com>
> > +Date: Wed, 6 May 2020 12:55:35 +0000
> > +Subject: [PATCH] puts jemalloc allocator behind a cargo feature flag
> > +
> > +Retrieved from: https://github.com/BurntSushi/ripgrep/pull/1569
> > +
> > +Moves jemalloc behind a feature for musl builds, where it is not
> > +supported by the upstream project, so ripgrep will fail to build.
> > +
> > +Signed-off-by: Sam Voss <sam.voss@gmail.com>
> > +---
> > + .github/workflows/ci.yml      | 6 ++++++
> > + .github/workflows/release.yml | 8 +++++++-
> > + Cargo.toml                    | 8 +++++++-
> > + README.md                     | 9 +++++++++
> > + crates/core/main.rs           | 8 ++++++--
> > + 5 files changed, 35 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
> > +index ab154ec..aa567d9 100644
> > +--- a/.github/workflows/ci.yml
> > ++++ b/.github/workflows/ci.yml
> > +@@ -149,6 +149,12 @@ jobs:
> > +       if: matrix.target != ''
> > +       run: ${{ env.CARGO }} test --verbose --workspace ${{
env.TARGET_FLAGS }}
> > +
> > ++    - name: Run tests with jemalloc (Musl)
> > ++      # We only use the jemalloc allocator when building with musl.
> > ++      # The system allocator is good enough for other platforms.
> > ++      if: matrix.os == 'nightly-musl'
> > ++      run: ${{ env.CARGO }} test --verbose --all --features jemalloc
${{ env.TARGET_FLAGS }}
> > ++
> > +     - name: Test for existence of build artifacts (Windows)
> > +       if: matrix.os == 'windows-2019'
> > +       shell: bash
> > +diff --git a/.github/workflows/release.yml
b/.github/workflows/release.yml
> > +index 7cfb6a4..ad6b82d 100644
> > +--- a/.github/workflows/release.yml
> > ++++ b/.github/workflows/release.yml
> > +@@ -133,7 +133,13 @@ jobs:
> > +         echo "target flag is: ${{ env.TARGET_FLAGS }}"
> > +         echo "target dir is: ${{ env.TARGET_DIR }}"
> > +
> > +-    - name: Build release binary
> > ++    - name: Build release binary (linux)
> > ++      if: matrix.build == 'linux'
> > ++      # Use jemalloc allocator for much better performance over the
musl default allocator
> > ++      run: ${{ env.CARGO }} build --verbose --release --features
"pcre2 jemalloc" ${{ env.TARGET_FLAGS }}
> > ++
> > ++    - name: Build release binary (non-linux)
> > ++      if: matrix.build != 'linux'
> > +       run: ${{ env.CARGO }} build --verbose --release --features
pcre2 ${{ env.TARGET_FLAGS }}
> > +
> > +     - name: Strip release binary (linux and macos)
> > +diff --git a/Cargo.toml b/Cargo.toml
> > +index fb78fcb..0d34b1e 100644
> > +--- a/Cargo.toml
> > ++++ b/Cargo.toml
> > +@@ -56,8 +56,9 @@ version = "2.33.0"
> > + default-features = false
> > + features = ["suggestions"]
> > +
> > +-[target.'cfg(all(target_env = "musl", target_pointer_width =
"64"))'.dependencies.jemallocator]
> > ++[dependencies.jemallocator]
> > + version = "0.3.0"
> > ++optional = true
> > +
> > + [build-dependencies]
> > + lazy_static = "1.1.0"
> > +@@ -75,6 +76,11 @@ walkdir = "2"
> > + [features]
> > + simd-accel = ["grep/simd-accel"]
> > + pcre2 = ["grep/pcre2"]
> > ++# The jemalloc allocator is used for improved
> > ++# performance on x86 musl builds.
> > ++# Cargo does not yet support platform-specific features
> > ++# https://github.com/rust-lang/cargo/issues/1197
> > ++jemalloc = ["jemallocator"]
> > +
> > + [profile.release]
> > + debug = 1
> > +diff --git a/README.md b/README.md
> > +index 46938bc..9917b29 100644
> > +--- a/README.md
> > ++++ b/README.md
> > +@@ -406,6 +406,15 @@ build a static executable with MUSL and with
PCRE2, then you will need to have
> > + `musl-gcc` installed, which might be in a separate package from the
actual
> > + MUSL library, depending on your Linux distribution.
> > +
> > ++When building with the MUSL target on Linux, it is recommended to use
the
> > ++jemalloc allocator for performance:
> > ++
> > ++```
> > ++$ rustup target add x86_64-unknown-linux-musl
> > ++$ cargo build --release --target x86_64-unknown-linux-musl --features
jemalloc
> > ++```
> > ++
> > ++
> > +
> > + ### Running tests
> > +
> > +diff --git a/crates/core/main.rs b/crates/core/main.rs
> > +index 47385de..c9dae5a 100644
> > +--- a/crates/core/main.rs
> > ++++ b/crates/core/main.rs
> > +@@ -31,7 +31,7 @@ mod subject;
> > + // have the fastest version of everything. Its goal is to be small
and amenable
> > + // to static compilation.) Even though ripgrep isn't particularly
allocation
> > + // heavy, musl's allocator appears to slow down ripgrep quite a bit.
Therefore,
> > +-// when building with musl, we use jemalloc.
> > ++// we expose a feature for using jemalloc when building with musl.
> > + //
> > + // We don't unconditionally use jemalloc because it can be nice to
use the
> > + // system's default allocator by default. Moreover, jemalloc seems to
increase
> > +@@ -39,7 +39,11 @@ mod subject;
> > + //
> > + // Moreover, we only do this on 64-bit systems since jemalloc doesn't
support
> > + // i686.
> > +-#[cfg(all(target_env = "musl", target_pointer_width = "64"))]
> > ++#[cfg(all(
> > ++    target_env = "musl",
> > ++    target_pointer_width = "64",
> > ++    feature = "jemalloc"
> > ++))]
>
> Might make more sense to explicitly specify known working architectures
using:
>
https://doc.rust-lang.org/reference/conditional-compilation.html#target_arch
>
> > + #[global_allocator]
> > + static ALLOC: jemallocator::Jemalloc = jemallocator::Jemalloc;
> > +
> > +--
> > +2.32.0
> > +
> > diff --git a/package/ripgrep/ripgrep.hash b/package/ripgrep/ripgrep.hash
> > index 0841c0185c..b2f03a95e6 100644
> > --- a/package/ripgrep/ripgrep.hash
> > +++ b/package/ripgrep/ripgrep.hash
> > @@ -1,3 +1,3 @@
> >  # Locally calculated
> > -sha256
7035379fce0c1e32552e8ee528b92c3d01b8d3935ea31d26c51a73287be74bb3
ripgrep-0.8.1.tar.gz
> > -sha256
0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f LICENSE-MIT
> > +sha256
0fb17aaf285b3eee8ddab17b833af1e190d73de317ff9648751ab0660d763ed2
ripgrep-13.0.0.tar.gz
> > +sha256
0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f
LICENSE-MIT
> > diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
> > index 450bb020e3..2d9dd3ee2f 100644
> > --- a/package/ripgrep/ripgrep.mk
> > +++ b/package/ripgrep/ripgrep.mk
> > @@ -4,7 +4,7 @@
> >  #
> >
################################################################################
> >
> > -RIPGREP_VERSION = 0.8.1
> > +RIPGREP_VERSION = 13.0.0
> >  RIPGREP_SITE = $(call github,burntsushi,ripgrep,$(RIPGREP_VERSION))
> >  RIPGREP_LICENSE = MIT
> >  RIPGREP_LICENSE_FILES = LICENSE-MIT
> > --
> > 2.32.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot

--00000000000038d26105cb5eaa7e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi James,<br>
<br>
On Mon, Sep 6, 2021 at 7:21 PM James Hilliard &lt;<a href=3D"mailto:james.h=
illiard1@gmail.com" target=3D"_blank" rel=3D"noreferrer">james.hilliard1@gm=
ail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Sat, Aug 14, 2021 at 1:52 PM &lt;<a href=3D"mailto:sam.voss@gmail.c=
om" target=3D"_blank" rel=3D"noreferrer">sam.voss@gmail.com</a>&gt; wrote:<=
br>
&gt; &gt;<br>
&gt; &gt; From: Sam Voss &lt;<a href=3D"mailto:sam.voss@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">sam.voss@gmail.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Also adds patch to make the jemalloc feature optional on musl, du=
e to<br>
&gt; &gt; toolchains not being supported by upstream project.<br>
&gt;<br>
&gt; Which toolchains are not supported here specifically?<br>
<br>
I could have made this more clear in the original thread, although just inc=
ase it came across confusing the &quot;upstream project&quot; that doesn&#3=
9;t support it is jemallocator, and not ripgrep.<div dir=3D"auto"><br></div=
><div dir=3D"auto">The project specifically calls out their mapping of full=
y supported toolchains:<br>
<br>
<a href=3D"https://github.com/gnzlbg/jemallocator" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">https://github.com/gnzlbg/jemallocator</a><br>
<br>
I discovered this when running the default set of test-pkg targets, and the=
 bootlin-x86-64-musl failed.<br>
<br>
After digging into the issue a bit, it seems like this could be an issue fo=
r more rust projects which use jemalloc on musl for improved allocation per=
formance, however I have not investigated any further.</div><div dir=3D"aut=
o"><br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Sam Voss &lt;<a href=3D"mailto:sam.voss@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">sam.voss@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 ...llocator-behind-a-cargo-feature-flag.patch | 131 +++++++=
+++++++++++<br>
&gt; &gt;=C2=A0 package/ripgrep/ripgrep.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt; &gt;=C2=A0 package/ripgrep/<a href=3D"http://ripgrep.mk" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">ripgrep.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt; &gt;=C2=A0 3 files changed, 134 insertions(+), 3 deletions(-)<br>
&gt; &gt;=C2=A0 create mode 100644 package/ripgrep/0001-puts-jemalloc-alloc=
ator-behind-a-cargo-feature-flag.patch<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/package/ripgrep/0001-puts-jemalloc-allocator-behind-=
a-cargo-feature-flag.patch b/package/ripgrep/0001-puts-jemalloc-allocator-b=
ehind-a-cargo-feature-flag.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..e2ba68f389<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo=
-feature-flag.patch<br>
&gt; &gt; @@ -0,0 +1,131 @@<br>
&gt; &gt; +From 68c2a4d7a5d9b46f65121958fdb12d5270bfd1b6 Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From: Jonathan Stites &lt;<a href=3D"mailto:mail@jonstites.com" =
target=3D"_blank" rel=3D"noreferrer">mail@jonstites.com</a>&gt;<br>
&gt; &gt; +Date: Wed, 6 May 2020 12:55:35 +0000<br>
&gt; &gt; +Subject: [PATCH] puts jemalloc allocator behind a cargo feature =
flag<br>
&gt; &gt; +<br>
&gt; &gt; +Retrieved from: <a href=3D"https://github.com/BurntSushi/ripgrep=
/pull/1569" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.=
com/BurntSushi/ripgrep/pull/1569</a><br>
&gt; &gt; +<br>
&gt; &gt; +Moves jemalloc behind a feature for musl builds, where it is not=
<br>
&gt; &gt; +supported by the upstream project, so ripgrep will fail to build=
.<br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: Sam Voss &lt;<a href=3D"mailto:sam.voss@gmail.com=
" target=3D"_blank" rel=3D"noreferrer">sam.voss@gmail.com</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + .github/workflows/ci.yml=C2=A0 =C2=A0 =C2=A0 | 6 ++++++<br>
&gt; &gt; + .github/workflows/release.yml | 8 +++++++-<br>
&gt; &gt; + Cargo.toml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 8 +++++++-<br>
&gt; &gt; + README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 9 +++++++++<br>
&gt; &gt; + crates/core/<a href=3D"http://main.rs" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">main.rs</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 8 ++++++--<br>
&gt; &gt; + 5 files changed, 35 insertions(+), 4 deletions(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml=
<br>
&gt; &gt; +index ab154ec..aa567d9 100644<br>
&gt; &gt; +--- a/.github/workflows/ci.yml<br>
&gt; &gt; ++++ b/.github/workflows/ci.yml<br>
&gt; &gt; +@@ -149,6 +149,12 @@ jobs:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if: matrix.target !=3D &#39;&#39;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0run: ${{ env.CARGO }} test --verbose =
--workspace ${{ env.TARGET_FLAGS }}<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 =C2=A0 - name: Run tests with jemalloc (Musl)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 # We only use the jemalloc allocator when =
building with musl.<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 # The system allocator is good enough for =
other platforms.<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 if: matrix.os =3D=3D &#39;nightly-musl&#39=
;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 run: ${{ env.CARGO }} test --verbose --all=
 --features jemalloc ${{ env.TARGET_FLAGS }}<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0- name: Test for existence of build artifact=
s (Windows)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if: matrix.os =3D=3D &#39;windows-201=
9&#39;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0shell: bash<br>
&gt; &gt; +diff --git a/.github/workflows/release.yml b/.github/workflows/r=
elease.yml<br>
&gt; &gt; +index 7cfb6a4..ad6b82d 100644<br>
&gt; &gt; +--- a/.github/workflows/release.yml<br>
&gt; &gt; ++++ b/.github/workflows/release.yml<br>
&gt; &gt; +@@ -133,7 +133,13 @@ jobs:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;target flag is: ${{=
 env.TARGET_FLAGS }}&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;target dir is: ${{ =
env.TARGET_DIR }}&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 =C2=A0 - name: Build release binary<br>
&gt; &gt; ++=C2=A0 =C2=A0 - name: Build release binary (linux)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 if: matrix.build =3D=3D &#39;linux&#39;<br=
>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 # Use jemalloc allocator for much better p=
erformance over the musl default allocator<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 run: ${{ env.CARGO }} build --verbose --re=
lease --features &quot;pcre2 jemalloc&quot; ${{ env.TARGET_FLAGS }}<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 - name: Build release binary (non-linux)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 if: matrix.build !=3D &#39;linux&#39;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0run: ${{ env.CARGO }} build --verbose=
 --release --features pcre2 ${{ env.TARGET_FLAGS }}<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0- name: Strip release binary (linux and maco=
s)<br>
&gt; &gt; +diff --git a/Cargo.toml b/Cargo.toml<br>
&gt; &gt; +index fb78fcb..0d34b1e 100644<br>
&gt; &gt; +--- a/Cargo.toml<br>
&gt; &gt; ++++ b/Cargo.toml<br>
&gt; &gt; +@@ -56,8 +56,9 @@ version =3D &quot;2.33.0&quot;<br>
&gt; &gt; + default-features =3D false<br>
&gt; &gt; + features =3D [&quot;suggestions&quot;]<br>
&gt; &gt; +<br>
&gt; &gt; +-[target.&#39;cfg(all(target_env =3D &quot;musl&quot;, target_po=
inter_width =3D &quot;64&quot;))&#39;.dependencies.jemallocator]<br>
&gt; &gt; ++[dependencies.jemallocator]<br>
&gt; &gt; + version =3D &quot;0.3.0&quot;<br>
&gt; &gt; ++optional =3D true<br>
&gt; &gt; +<br>
&gt; &gt; + [build-dependencies]<br>
&gt; &gt; + lazy_static =3D &quot;1.1.0&quot;<br>
&gt; &gt; +@@ -75,6 +76,11 @@ walkdir =3D &quot;2&quot;<br>
&gt; &gt; + [features]<br>
&gt; &gt; + simd-accel =3D [&quot;grep/simd-accel&quot;]<br>
&gt; &gt; + pcre2 =3D [&quot;grep/pcre2&quot;]<br>
&gt; &gt; ++# The jemalloc allocator is used for improved<br>
&gt; &gt; ++# performance on x86 musl builds.<br>
&gt; &gt; ++# Cargo does not yet support platform-specific features<br>
&gt; &gt; ++# <a href=3D"https://github.com/rust-lang/cargo/issues/1197" re=
l=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/rust-lang/=
cargo/issues/1197</a><br>
&gt; &gt; ++jemalloc =3D [&quot;jemallocator&quot;]<br>
&gt; &gt; +<br>
&gt; &gt; + [profile.release]<br>
&gt; &gt; + debug =3D 1<br>
&gt; &gt; +diff --git a/README.md b/README.md<br>
&gt; &gt; +index 46938bc..9917b29 100644<br>
&gt; &gt; +--- a/README.md<br>
&gt; &gt; ++++ b/README.md<br>
&gt; &gt; +@@ -406,6 +406,15 @@ build a static executable with MUSL and wit=
h PCRE2, then you will need to have<br>
&gt; &gt; + `musl-gcc` installed, which might be in a separate package from=
 the actual<br>
&gt; &gt; + MUSL library, depending on your Linux distribution.<br>
&gt; &gt; +<br>
&gt; &gt; ++When building with the MUSL target on Linux, it is recommended =
to use the<br>
&gt; &gt; ++jemalloc allocator for performance:<br>
&gt; &gt; ++<br>
&gt; &gt; ++```<br>
&gt; &gt; ++$ rustup target add x86_64-unknown-linux-musl<br>
&gt; &gt; ++$ cargo build --release --target x86_64-unknown-linux-musl --fe=
atures jemalloc<br>
&gt; &gt; ++```<br>
&gt; &gt; ++<br>
&gt; &gt; ++<br>
&gt; &gt; +<br>
&gt; &gt; + ### Running tests<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/crates/core/<a href=3D"http://main.rs" rel=3D"noref=
errer noreferrer" target=3D"_blank">main.rs</a> b/crates/core/<a href=3D"ht=
tp://main.rs" rel=3D"noreferrer noreferrer" target=3D"_blank">main.rs</a><b=
r>
&gt; &gt; +index 47385de..c9dae5a 100644<br>
&gt; &gt; +--- a/crates/core/<a href=3D"http://main.rs" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">main.rs</a><br>
&gt; &gt; ++++ b/crates/core/<a href=3D"http://main.rs" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">main.rs</a><br>
&gt; &gt; +@@ -31,7 +31,7 @@ mod subject;<br>
&gt; &gt; + // have the fastest version of everything. Its goal is to be sm=
all and amenable<br>
&gt; &gt; + // to static compilation.) Even though ripgrep isn&#39;t partic=
ularly allocation<br>
&gt; &gt; + // heavy, musl&#39;s allocator appears to slow down ripgrep qui=
te a bit. Therefore,<br>
&gt; &gt; +-// when building with musl, we use jemalloc.<br>
&gt; &gt; ++// we expose a feature for using jemalloc when building with mu=
sl.<br>
&gt; &gt; + //<br>
&gt; &gt; + // We don&#39;t unconditionally use jemalloc because it can be =
nice to use the<br>
&gt; &gt; + // system&#39;s default allocator by default. Moreover, jemallo=
c seems to increase<br>
&gt; &gt; +@@ -39,7 +39,11 @@ mod subject;<br>
&gt; &gt; + //<br>
&gt; &gt; + // Moreover, we only do this on 64-bit systems since jemalloc d=
oesn&#39;t support<br>
&gt; &gt; + // i686.<br>
&gt; &gt; +-#[cfg(all(target_env =3D &quot;musl&quot;, target_pointer_width=
 =3D &quot;64&quot;))]<br>
&gt; &gt; ++#[cfg(all(<br>
&gt; &gt; ++=C2=A0 =C2=A0 target_env =3D &quot;musl&quot;,<br>
&gt; &gt; ++=C2=A0 =C2=A0 target_pointer_width =3D &quot;64&quot;,<br>
&gt; &gt; ++=C2=A0 =C2=A0 feature =3D &quot;jemalloc&quot;<br>
&gt; &gt; ++))]<br>
&gt;<br>
&gt; Might make more sense to explicitly specify known working architecture=
s using:<br>
&gt; <a href=3D"https://doc.rust-lang.org/reference/conditional-compilation=
.html#target_arch" rel=3D"noreferrer noreferrer" target=3D"_blank">https://=
doc.rust-lang.org/reference/conditional-compilation.html#target_arch</a><br=
>
&gt;<br>
&gt; &gt; + #[global_allocator]<br>
&gt; &gt; + static ALLOC: jemallocator::Jemalloc =3D jemallocator::Jemalloc=
;<br>
&gt; &gt; +<br>
&gt; &gt; +--<br>
&gt; &gt; +2.32.0<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/package/ripgrep/ripgrep.hash b/package/ripgrep/ripgr=
ep.hash<br>
&gt; &gt; index 0841c0185c..b2f03a95e6 100644<br>
&gt; &gt; --- a/package/ripgrep/ripgrep.hash<br>
&gt; &gt; +++ b/package/ripgrep/ripgrep.hash<br>
&gt; &gt; @@ -1,3 +1,3 @@<br>
&gt; &gt;=C2=A0 # Locally calculated<br>
&gt; &gt; -sha256 7035379fce0c1e32552e8ee528b92c3d01b8d3935ea31d26c51a73287=
be74bb3 ripgrep-0.8.1.tar.gz<br>
&gt; &gt; -sha256 0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e074=
0af850f LICENSE-MIT<br>
&gt; &gt; +sha256 0fb17aaf285b3eee8ddab17b833af1e190d73de317ff9648751ab0660=
d763ed2=C2=A0 ripgrep-13.0.0.tar.gz<br>
&gt; &gt; +sha256 0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e074=
0af850f=C2=A0 LICENSE-MIT<br>
&gt; &gt; diff --git a/package/ripgrep/<a href=3D"http://ripgrep.mk" rel=3D=
"noreferrer noreferrer" target=3D"_blank">ripgrep.mk</a> b/package/ripgrep/=
<a href=3D"http://ripgrep.mk" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">ripgrep.mk</a><br>
&gt; &gt; index 450bb020e3..2d9dd3ee2f 100644<br>
&gt; &gt; --- a/package/ripgrep/<a href=3D"http://ripgrep.mk" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">ripgrep.mk</a><br>
&gt; &gt; +++ b/package/ripgrep/<a href=3D"http://ripgrep.mk" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">ripgrep.mk</a><br>
&gt; &gt; @@ -4,7 +4,7 @@<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;=C2=A0 ###########################################################=
#####################<br>
&gt; &gt;<br>
&gt; &gt; -RIPGREP_VERSION =3D 0.8.1<br>
&gt; &gt; +RIPGREP_VERSION =3D 13.0.0<br>
&gt; &gt;=C2=A0 RIPGREP_SITE =3D $(call github,burntsushi,ripgrep,$(RIPGREP=
_VERSION))<br>
&gt; &gt;=C2=A0 RIPGREP_LICENSE =3D MIT<br>
&gt; &gt;=C2=A0 RIPGREP_LICENSE_FILES =3D LICENSE-MIT<br>
&gt; &gt; --<br>
&gt; &gt; 2.32.0<br>
&gt; &gt;<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; buildroot mailing list<br>
&gt; &gt; <a href=3D"mailto:buildroot@busybox.net" target=3D"_blank" rel=3D=
"noreferrer">buildroot@busybox.net</a><br>
&gt; &gt; <a href=3D"http://lists.busybox.net/mailman/listinfo/buildroot" r=
el=3D"noreferrer noreferrer" target=3D"_blank">http://lists.busybox.net/mai=
lman/listinfo/buildroot</a><br></div></div>

--00000000000038d26105cb5eaa7e--

--===============5181192925188665959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5181192925188665959==--
