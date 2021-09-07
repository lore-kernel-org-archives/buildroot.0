Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 881C4C433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 00:21:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 036A26109D
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 00:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 036A26109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F5B682716;
	Tue,  7 Sep 2021 00:21:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9iKpmzhGKOrU; Tue,  7 Sep 2021 00:21:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC4D3826F5;
	Tue,  7 Sep 2021 00:21:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5606F1BF32B
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 00:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52795826F5
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 00:21:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 42Q--JqU14Dx for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 00:21:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39F40826DF
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 00:21:16 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 m11-20020a056820034b00b0028bb60b551fso2422203ooe.5
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 17:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kLuOrt7TbKBBOBSrLtRAqKnipyzib6U227HJB5bEzg8=;
 b=g3HpYTuwIm0Q+54R96J8RQdZBO5xq3DtfBBMzQh7o7L6HHivz+NpMBpHoXgdm1fosv
 Jb2whgOd7UqlkTo9AnN4JqWJ0ShBB39an57keqRg09bTwc9ALvgkKVNHdj0NtTPE2WO+
 co58cAbGJqxOvjJnxRUtPwTxA6mLc1I7EUFVPjzKdwKl9Rz/0Ef7Nncqv5jsxNABUOqW
 cxjNRADrcCpwLcXyLLI8fFCUKVUfg67/R9RLPeflBmUDAFAxaDv20FgLSQNqqB2OD57z
 0GIxVSpPRvLRW873iUqC9nUrteTKrKHPRhf+HO1lu02JTpnb1D+yST++lpS+fUZCLOiM
 dxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kLuOrt7TbKBBOBSrLtRAqKnipyzib6U227HJB5bEzg8=;
 b=MdgZ7cmGeRcGXEd9L9INFMFXIPLSfe6frLELCqg0aeW8KBtJQ7ApY/Vubrdg43WWAI
 S+bdjVHTX3yyY3GPJPC1ptdRLqJsfFbnwNVsCa4D6bkR8t/ckWCIWWoR/ZAfVclM8w68
 rcvSOx7HG8xy9MynfNdSnSSVw6AXofjIFGb5ob8fYGa1b/RYXLrwF74vfUQk0elDZ/c/
 nUQxslcrItFSn0Mmtlx3nPCHh1BDl6OYdHWe7HSkLyx+sDwaM46IvNVB3KGHijfbTlVn
 9oW/+VFYrmh55TFeG8mrS03b56NSey29ukRI7/GGBCg8rv1u6IwE82NbGxyqw1zLwGXy
 YSMg==
X-Gm-Message-State: AOAM532I6RwlmbO7v5n8R4U0TAKBdFviIexkPC0d6BoeyHB2H03rcK0E
 IxvP+u3VR4VgiVImEhLv3PwEFsDy8OCnfw4L/yE=
X-Google-Smtp-Source: ABdhPJz93I+wh9aCAQjf09o2cMZq7kjfmvLSwG6TMYfPazhWS0oYA2RMGmllfeOdagWsSpXQ9VoMgwQXvdPdshT7mCQ=
X-Received: by 2002:a4a:e1a4:: with SMTP id 4mr15681073ooy.14.1630974075019;
 Mon, 06 Sep 2021 17:21:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210814195143.92753-1-sam.voss@gmail.com>
In-Reply-To: <20210814195143.92753-1-sam.voss@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 6 Sep 2021 18:21:04 -0600
Message-ID: <CADvTj4r0Af4s=oMMYR-6kh=pXFA_u=YfWgiXWn6DSNTE9g5hvw@mail.gmail.com>
To: Sam Voss <sam.voss@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

On Sat, Aug 14, 2021 at 1:52 PM <sam.voss@gmail.com> wrote:
>
> From: Sam Voss <sam.voss@gmail.com>
>
> Also adds patch to make the jemalloc feature optional on musl, due to
> toolchains not being supported by upstream project.

Which toolchains are not supported here specifically?

>
> Signed-off-by: Sam Voss <sam.voss@gmail.com>
> ---
>  ...llocator-behind-a-cargo-feature-flag.patch | 131 ++++++++++++++++++
>  package/ripgrep/ripgrep.hash                  |   4 +-
>  package/ripgrep/ripgrep.mk                    |   2 +-
>  3 files changed, 134 insertions(+), 3 deletions(-)
>  create mode 100644 package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
>
> diff --git a/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch b/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
> new file mode 100644
> index 0000000000..e2ba68f389
> --- /dev/null
> +++ b/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
> @@ -0,0 +1,131 @@
> +From 68c2a4d7a5d9b46f65121958fdb12d5270bfd1b6 Mon Sep 17 00:00:00 2001
> +From: Jonathan Stites <mail@jonstites.com>
> +Date: Wed, 6 May 2020 12:55:35 +0000
> +Subject: [PATCH] puts jemalloc allocator behind a cargo feature flag
> +
> +Retrieved from: https://github.com/BurntSushi/ripgrep/pull/1569
> +
> +Moves jemalloc behind a feature for musl builds, where it is not
> +supported by the upstream project, so ripgrep will fail to build.
> +
> +Signed-off-by: Sam Voss <sam.voss@gmail.com>
> +---
> + .github/workflows/ci.yml      | 6 ++++++
> + .github/workflows/release.yml | 8 +++++++-
> + Cargo.toml                    | 8 +++++++-
> + README.md                     | 9 +++++++++
> + crates/core/main.rs           | 8 ++++++--
> + 5 files changed, 35 insertions(+), 4 deletions(-)
> +
> +diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
> +index ab154ec..aa567d9 100644
> +--- a/.github/workflows/ci.yml
> ++++ b/.github/workflows/ci.yml
> +@@ -149,6 +149,12 @@ jobs:
> +       if: matrix.target != ''
> +       run: ${{ env.CARGO }} test --verbose --workspace ${{ env.TARGET_FLAGS }}
> +
> ++    - name: Run tests with jemalloc (Musl)
> ++      # We only use the jemalloc allocator when building with musl.
> ++      # The system allocator is good enough for other platforms.
> ++      if: matrix.os == 'nightly-musl'
> ++      run: ${{ env.CARGO }} test --verbose --all --features jemalloc ${{ env.TARGET_FLAGS }}
> ++
> +     - name: Test for existence of build artifacts (Windows)
> +       if: matrix.os == 'windows-2019'
> +       shell: bash
> +diff --git a/.github/workflows/release.yml b/.github/workflows/release.yml
> +index 7cfb6a4..ad6b82d 100644
> +--- a/.github/workflows/release.yml
> ++++ b/.github/workflows/release.yml
> +@@ -133,7 +133,13 @@ jobs:
> +         echo "target flag is: ${{ env.TARGET_FLAGS }}"
> +         echo "target dir is: ${{ env.TARGET_DIR }}"
> +
> +-    - name: Build release binary
> ++    - name: Build release binary (linux)
> ++      if: matrix.build == 'linux'
> ++      # Use jemalloc allocator for much better performance over the musl default allocator
> ++      run: ${{ env.CARGO }} build --verbose --release --features "pcre2 jemalloc" ${{ env.TARGET_FLAGS }}
> ++
> ++    - name: Build release binary (non-linux)
> ++      if: matrix.build != 'linux'
> +       run: ${{ env.CARGO }} build --verbose --release --features pcre2 ${{ env.TARGET_FLAGS }}
> +
> +     - name: Strip release binary (linux and macos)
> +diff --git a/Cargo.toml b/Cargo.toml
> +index fb78fcb..0d34b1e 100644
> +--- a/Cargo.toml
> ++++ b/Cargo.toml
> +@@ -56,8 +56,9 @@ version = "2.33.0"
> + default-features = false
> + features = ["suggestions"]
> +
> +-[target.'cfg(all(target_env = "musl", target_pointer_width = "64"))'.dependencies.jemallocator]
> ++[dependencies.jemallocator]
> + version = "0.3.0"
> ++optional = true
> +
> + [build-dependencies]
> + lazy_static = "1.1.0"
> +@@ -75,6 +76,11 @@ walkdir = "2"
> + [features]
> + simd-accel = ["grep/simd-accel"]
> + pcre2 = ["grep/pcre2"]
> ++# The jemalloc allocator is used for improved
> ++# performance on x86 musl builds.
> ++# Cargo does not yet support platform-specific features
> ++# https://github.com/rust-lang/cargo/issues/1197
> ++jemalloc = ["jemallocator"]
> +
> + [profile.release]
> + debug = 1
> +diff --git a/README.md b/README.md
> +index 46938bc..9917b29 100644
> +--- a/README.md
> ++++ b/README.md
> +@@ -406,6 +406,15 @@ build a static executable with MUSL and with PCRE2, then you will need to have
> + `musl-gcc` installed, which might be in a separate package from the actual
> + MUSL library, depending on your Linux distribution.
> +
> ++When building with the MUSL target on Linux, it is recommended to use the
> ++jemalloc allocator for performance:
> ++
> ++```
> ++$ rustup target add x86_64-unknown-linux-musl
> ++$ cargo build --release --target x86_64-unknown-linux-musl --features jemalloc
> ++```
> ++
> ++
> +
> + ### Running tests
> +
> +diff --git a/crates/core/main.rs b/crates/core/main.rs
> +index 47385de..c9dae5a 100644
> +--- a/crates/core/main.rs
> ++++ b/crates/core/main.rs
> +@@ -31,7 +31,7 @@ mod subject;
> + // have the fastest version of everything. Its goal is to be small and amenable
> + // to static compilation.) Even though ripgrep isn't particularly allocation
> + // heavy, musl's allocator appears to slow down ripgrep quite a bit. Therefore,
> +-// when building with musl, we use jemalloc.
> ++// we expose a feature for using jemalloc when building with musl.
> + //
> + // We don't unconditionally use jemalloc because it can be nice to use the
> + // system's default allocator by default. Moreover, jemalloc seems to increase
> +@@ -39,7 +39,11 @@ mod subject;
> + //
> + // Moreover, we only do this on 64-bit systems since jemalloc doesn't support
> + // i686.
> +-#[cfg(all(target_env = "musl", target_pointer_width = "64"))]
> ++#[cfg(all(
> ++    target_env = "musl",
> ++    target_pointer_width = "64",
> ++    feature = "jemalloc"
> ++))]

Might make more sense to explicitly specify known working architectures using:
https://doc.rust-lang.org/reference/conditional-compilation.html#target_arch

> + #[global_allocator]
> + static ALLOC: jemallocator::Jemalloc = jemallocator::Jemalloc;
> +
> +--
> +2.32.0
> +
> diff --git a/package/ripgrep/ripgrep.hash b/package/ripgrep/ripgrep.hash
> index 0841c0185c..b2f03a95e6 100644
> --- a/package/ripgrep/ripgrep.hash
> +++ b/package/ripgrep/ripgrep.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256 7035379fce0c1e32552e8ee528b92c3d01b8d3935ea31d26c51a73287be74bb3 ripgrep-0.8.1.tar.gz
> -sha256 0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f LICENSE-MIT
> +sha256 0fb17aaf285b3eee8ddab17b833af1e190d73de317ff9648751ab0660d763ed2  ripgrep-13.0.0.tar.gz
> +sha256 0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f  LICENSE-MIT
> diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
> index 450bb020e3..2d9dd3ee2f 100644
> --- a/package/ripgrep/ripgrep.mk
> +++ b/package/ripgrep/ripgrep.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -RIPGREP_VERSION = 0.8.1
> +RIPGREP_VERSION = 13.0.0
>  RIPGREP_SITE = $(call github,burntsushi,ripgrep,$(RIPGREP_VERSION))
>  RIPGREP_LICENSE = MIT
>  RIPGREP_LICENSE_FILES = LICENSE-MIT
> --
> 2.32.0
>
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
