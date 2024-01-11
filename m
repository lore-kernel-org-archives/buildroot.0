Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9544C4725D
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 10:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77A3181771;
	Thu, 11 Jan 2024 10:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77A3181771
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i-ctfSz8yRlw; Thu, 11 Jan 2024 10:39:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E83981CDB;
	Thu, 11 Jan 2024 10:39:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E83981CDB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9038E1BF2F5
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 10:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68C9481405
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 10:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68C9481405
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zHvEixluC1Bh for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 10:38:37 +0000 (UTC)
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A698813A6
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 10:38:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A698813A6
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-40e60e13703so3475285e9.0
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 02:38:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704969515; x=1705574315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fUZuVSZNa/22awfqATZak2mK7ZCgfwYwHMzfrdJ727E=;
 b=oaAMJWhu/Pj30JQS9WlM4P1hXRS08Mh1jA7OgL8c0qtAHPoTyTqpbLAqUK4w1xwyMU
 if5yCvkwS0LbkEPMSjEStvKXEPEHOxSrbE5jQ5cmYIJAc/rodI2+lPwYCFvbZdWDoyCE
 toGceDMhAGOhhctNXcshfNqsAq5GTLFSXkEIKFQAqLvFwXQU+NM3inM1RvD6Fm1R1TpY
 l1SPYvsXhOWLLXMQSaC5QhNd6CgBzH/uSC9TemknRPw474nU0P43lEBFyBXLYJB1Ducm
 FGMRxgx/hKb2/wnDWKQ79kI2EO+hLhYHizEDVaS/ezz9+mzEqPwYmuRl71Z2yvwC20sM
 JMpQ==
X-Gm-Message-State: AOJu0YyKR+5elgUi3cRd4SP3msimqSRQvQoWCTUUlMcfgefOW089o17a
 vjTK4v7UtXPH7fubb6iE40AGGvRY3tnx/s4k34PSig2brwA+wSrt
X-Google-Smtp-Source: AGHT+IGrrUwav+frowNXD/YEp6fC+Pqif7nqhJxBgXfTss/u9nLH9imOihbIoAJw271JQpb3oFtCVA==
X-Received: by 2002:a05:600c:4f96:b0:40d:59fd:1e93 with SMTP id
 n22-20020a05600c4f9600b0040d59fd1e93mr261378wmq.141.1704969514882; 
 Thu, 11 Jan 2024 02:38:34 -0800 (PST)
Received: from localhost.localdomain ([80.215.186.92])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a5d6e55000000b0033672cfca96sm869810wrz.89.2024.01.11.02.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 02:38:34 -0800 (PST)
From: Antoine Coutant <antoine.coutant@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 11:38:19 +0100
Message-Id: <20240111103819.3984913-3-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240111103819.3984913-1-antoine.coutant@smile.fr>
References: <20240111103819.3984913-1-antoine.coutant@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1704969515; x=1705574315;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fUZuVSZNa/22awfqATZak2mK7ZCgfwYwHMzfrdJ727E=;
 b=XdwX5qb4Zxm+xjNXcj9RBb9niiM3+HA2bVkLWGFFQMcuG8U1g9idTgkIB1JYrBUaMA
 gS2o+ve+jQ1+MrV0g49gxow5Za/9vJyAzjw7qDzyEG6jtw5fLcqwiec8a5EZQ/uHyCy/
 Gs/ZuHyBY34t1o8CQz9OXeqP4HTTS8ED7M6Y0t1DY+qj6RqXB++L3GgudhNMNnuIav0o
 fDd4N/so/udULw4lONaeVUlz/xquuKXJ6XORRDIuuFao1XkAC19v/RqxQ1JZfcvuYXpg
 7tTaI0MQhSX0K3JXYYOA8EaSLWOGCpQST5oiHNMRDj0J6W0UflFXEPikypMg5gRGcPrc
 J/Rg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=XdwX5qb4
Subject: [Buildroot] [PATCH v4 3/3] package/ripgrep: bump to version 14.1.0
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
Cc: Antoine Coutant <antoine.coutant@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/BurntSushi/ripgrep/blob/master/CHANGELOG.md

The patch has been rebased to ripgrep 14.1.0.

Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---

Changes v2 -> v3:
	- bump version to 14.1.0 instead of 14.0.3

Tested using qemu_aarch64_virt_defconfig and Arm AArch64 13.2.rel1
toolchain.
---
 ...llocator-behind-a-cargo-feature-flag.patch | 52 ++++++++++---------
 package/ripgrep/ripgrep.hash                  |  2 +-
 package/ripgrep/ripgrep.mk                    |  6 +--
 3 files changed, 29 insertions(+), 31 deletions(-)

diff --git a/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch b/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
index e2ba68f389..e665a6570e 100644
--- a/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
+++ b/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
@@ -1,4 +1,4 @@
-From 68c2a4d7a5d9b46f65121958fdb12d5270bfd1b6 Mon Sep 17 00:00:00 2001
+From 77f850969433b14769ade4281899373f3ebabf86 Mon Sep 17 00:00:00 2001
 From: Jonathan Stites <mail@jonstites.com>
 Date: Wed, 6 May 2020 12:55:35 +0000
 Subject: [PATCH] puts jemalloc allocator behind a cargo feature flag
@@ -9,6 +9,8 @@ Moves jemalloc behind a feature for musl builds, where it is not
 supported by the upstream project, so ripgrep will fail to build.
 
 Signed-off-by: Sam Voss <sam.voss@gmail.com>
+[Antoine: update for 14.1.0]
+Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
 ---
  .github/workflows/ci.yml      | 6 ++++++
  .github/workflows/release.yml | 8 +++++++-
@@ -18,10 +20,10 @@ Signed-off-by: Sam Voss <sam.voss@gmail.com>
  5 files changed, 35 insertions(+), 4 deletions(-)
 
 diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
-index ab154ec..aa567d9 100644
+index d21b85a..0c9ecb9 100644
 --- a/.github/workflows/ci.yml
 +++ b/.github/workflows/ci.yml
-@@ -149,6 +149,12 @@ jobs:
+@@ -172,6 +172,12 @@ jobs:
        if: matrix.target != ''
        run: ${{ env.CARGO }} test --verbose --workspace ${{ env.TARGET_FLAGS }}
  
@@ -31,14 +33,14 @@ index ab154ec..aa567d9 100644
 +      if: matrix.os == 'nightly-musl'
 +      run: ${{ env.CARGO }} test --verbose --all --features jemalloc ${{ env.TARGET_FLAGS }}
 +
-     - name: Test for existence of build artifacts (Windows)
-       if: matrix.os == 'windows-2019'
-       shell: bash
+     - name: Test zsh shell completions (Unix, sans cross)
+       # We could test this when using Cross, but we'd have to execute the
+       # 'rg' binary (done in test-complete) with qemu, which is a pain and
 diff --git a/.github/workflows/release.yml b/.github/workflows/release.yml
-index 7cfb6a4..ad6b82d 100644
+index f6ea3d9..ac18129 100644
 --- a/.github/workflows/release.yml
 +++ b/.github/workflows/release.yml
-@@ -133,7 +133,13 @@ jobs:
+@@ -171,7 +171,13 @@ jobs:
          echo "target flag is: ${{ env.TARGET_FLAGS }}"
          echo "target dir is: ${{ env.TARGET_DIR }}"
  
@@ -50,25 +52,25 @@ index 7cfb6a4..ad6b82d 100644
 +
 +    - name: Build release binary (non-linux)
 +      if: matrix.build != 'linux'
-       run: ${{ env.CARGO }} build --verbose --release --features pcre2 ${{ env.TARGET_FLAGS }}
- 
-     - name: Strip release binary (linux and macos)
+       shell: bash
+       run: |
+         ${{ env.CARGO }} build --verbose --release --features pcre2 ${{ env.TARGET_FLAGS }}
 diff --git a/Cargo.toml b/Cargo.toml
-index fb78fcb..0d34b1e 100644
+index da350bc..1a0a48f 100644
 --- a/Cargo.toml
 +++ b/Cargo.toml
-@@ -56,8 +56,9 @@ version = "2.33.0"
- default-features = false
- features = ["suggestions"]
+@@ -59,8 +59,9 @@ serde_json = "1.0.23"
+ termcolor = "1.1.0"
+ textwrap = { version = "0.16.0", default-features = false }
  
 -[target.'cfg(all(target_env = "musl", target_pointer_width = "64"))'.dependencies.jemallocator]
 +[dependencies.jemallocator]
- version = "0.3.0"
+ version = "0.5.0"
 +optional = true
  
- [build-dependencies]
- lazy_static = "1.1.0"
-@@ -75,6 +76,11 @@ walkdir = "2"
+ [dev-dependencies]
+ serde = "1.0.77"
+@@ -70,6 +71,11 @@ walkdir = "2"
  [features]
  simd-accel = ["grep/simd-accel"]
  pcre2 = ["grep/pcre2"]
@@ -81,10 +83,10 @@ index fb78fcb..0d34b1e 100644
  [profile.release]
  debug = 1
 diff --git a/README.md b/README.md
-index 46938bc..9917b29 100644
+index 0821fab..fdb9fb5 100644
 --- a/README.md
 +++ b/README.md
-@@ -406,6 +406,15 @@ build a static executable with MUSL and with PCRE2, then you will need to have
+@@ -478,6 +478,15 @@ build a static executable with MUSL and with PCRE2, then you will need to have
  `musl-gcc` installed, which might be in a separate package from the actual
  MUSL library, depending on your Linux distribution.
  
@@ -101,10 +103,10 @@ index 46938bc..9917b29 100644
  ### Running tests
  
 diff --git a/crates/core/main.rs b/crates/core/main.rs
-index 47385de..c9dae5a 100644
+index 64f35ce..9aa6663 100644
 --- a/crates/core/main.rs
 +++ b/crates/core/main.rs
-@@ -31,7 +31,7 @@ mod subject;
+@@ -27,7 +27,7 @@ mod search;
  // have the fastest version of everything. Its goal is to be small and amenable
  // to static compilation.) Even though ripgrep isn't particularly allocation
  // heavy, musl's allocator appears to slow down ripgrep quite a bit. Therefore,
@@ -113,7 +115,7 @@ index 47385de..c9dae5a 100644
  //
  // We don't unconditionally use jemalloc because it can be nice to use the
  // system's default allocator by default. Moreover, jemalloc seems to increase
-@@ -39,7 +39,11 @@ mod subject;
+@@ -35,7 +35,11 @@ mod search;
  //
  // Moreover, we only do this on 64-bit systems since jemalloc doesn't support
  // i686.
@@ -127,5 +129,5 @@ index 47385de..c9dae5a 100644
  static ALLOC: jemallocator::Jemalloc = jemallocator::Jemalloc;
  
 -- 
-2.32.0
+2.25.1
 
diff --git a/package/ripgrep/ripgrep.hash b/package/ripgrep/ripgrep.hash
index 71e74e1bcf..9d5b869a9c 100644
--- a/package/ripgrep/ripgrep.hash
+++ b/package/ripgrep/ripgrep.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6f1d4a8b653ce48d59ad777288b1257cbda607db29db19d031b7e622c60526f8  ripgrep-af6b6c543b224d348a8876f0c06245d9ea7929c5.tar.gz
+sha256  6dfa5e8346b041749b9d7467efb794fcd15cf5b7d3ccec530940dcb1aa4ab590  ripgrep-14.1.0.tar.gz
 sha256  0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f  LICENSE-MIT
diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
index d587441cfa..05b8d5c48e 100644
--- a/package/ripgrep/ripgrep.mk
+++ b/package/ripgrep/ripgrep.mk
@@ -4,11 +4,7 @@
 #
 ################################################################################
 
-# Same as 13.0.0, we use a Git commit hash because the hash of this
-# tarball changed when moving to the cargo-package infrastructure, and
-# we can't change the hash of existing tarball. Please switch back to
-# a Git tag at the next version bump.
-RIPGREP_VERSION = af6b6c543b224d348a8876f0c06245d9ea7929c5
+RIPGREP_VERSION = 14.1.0
 RIPGREP_SITE = $(call github,burntsushi,ripgrep,$(RIPGREP_VERSION))
 RIPGREP_LICENSE = MIT
 RIPGREP_LICENSE_FILES = LICENSE-MIT
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
