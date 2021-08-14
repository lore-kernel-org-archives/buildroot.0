Return-Path: <SRS0=c1N3=NF=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8A2C4338F
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 19:51:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75DFF60F51
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 19:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 75DFF60F51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C8B640365;
	Sat, 14 Aug 2021 19:51:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gFczDKD2fEN9; Sat, 14 Aug 2021 19:51:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADA484036F;
	Sat, 14 Aug 2021 19:51:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 96EFC1BF31D
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 19:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F35C60631
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 19:51:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PezHzqjPrIst for <buildroot@lists.busybox.net>;
 Sat, 14 Aug 2021 19:51:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52CF16062C
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 19:51:48 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id i7so17879251iow.1
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 12:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IHtRnbQqr/X8WS84L/PFjwm75KX2SkUyeb6FAArBphw=;
 b=KvXOuFoaKZJsdOyssb0h6CAeYBBiRch4cbReohI35gStuQQzKfQIzZYNtqEEwoUCmj
 oa/Ar5zBoBIQzUIZtDrwmX06pSJtMSgwIIEhMdKSEX+D0668TBPr5U98lwb4065sBJGR
 PmylOyeKSKUIem72/nGTMlZe+KQIrd3lcqvrXNVA/CDUilhUxBb2IQ8FDPxY0FRtwCcI
 spEjKjk9YhWjkknUPBpGzTMZbVDTjsGcGwGDql02PIhLoGtBIaGo0posZEzeuTsHg5Vf
 O88IsPex1Ee9pdI+Ywgc5FrfOwrg9EA3N9ukEyQrBMfPIAtqzPnR/5dWD2dZbXFmcz2K
 JKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IHtRnbQqr/X8WS84L/PFjwm75KX2SkUyeb6FAArBphw=;
 b=PMx1QAqjcO6xe7FwJZTizXRTQd1RKgQxeS75wlY+773z42OTUZjwcSbva/pGNZ3P6t
 w7E6NLQcWPg7CKRrY5YHfDG59rnxTgqo7C8JL31v1C4SQN3hgfvMY2OuUTlUnjmgS1FE
 HI3seBqmuytV/uH+2ySQAjHZ7Fgt/nj5J85dS0pbTG21pZHO8Tu7qoGgmdrJjhbzXZjU
 5Kjjr0T4jDgfQFFyFzboK/bhAGgYg9UH6P9D0RJ/Cs76cy1mJOeYmf5oQa8HXPoSdwSy
 luGKjr23YZbhgKkEqgAxktZ5sJoTsdeDhlkDcbfWmDRPGAVoXGxTATcF8od6ZxfXDUyT
 K3TA==
X-Gm-Message-State: AOAM530e0xc+CyBIf0eoQ+lw1d16aod8lB/aFS4r37C46yH8QAtlcMDv
 nrg5qgsNBTNVtZ5pS/DZ0XkrUMfIIzY=
X-Google-Smtp-Source: ABdhPJz34XpQz+Sgl10yyLdpZJTnEHW/7hN3fcIl4GUv8ZQGtv3MQEhJNxMzVxfPbPeEIbSGexBc4g==
X-Received: by 2002:a5d:8941:: with SMTP id b1mr6558797iot.45.1628970707102;
 Sat, 14 Aug 2021 12:51:47 -0700 (PDT)
Received: from blueberry.lan (199-189-229-49.dhcp.imoncommunications.net.
 [199.189.229.49])
 by smtp.gmail.com with ESMTPSA id d18sm3021357ile.32.2021.08.14.12.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Aug 2021 12:51:46 -0700 (PDT)
From: sam.voss@gmail.com
To: buildroot@buildroot.org
Date: Sat, 14 Aug 2021 14:51:43 -0500
Message-Id: <20210814195143.92753-1-sam.voss@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/ripgrep: bump to version 13.0.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Sam Voss <sam.voss@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

From: Sam Voss <sam.voss@gmail.com>

Also adds patch to make the jemalloc feature optional on musl, due to
toolchains not being supported by upstream project.

Signed-off-by: Sam Voss <sam.voss@gmail.com>
---
 ...llocator-behind-a-cargo-feature-flag.patch | 131 ++++++++++++++++++
 package/ripgrep/ripgrep.hash                  |   4 +-
 package/ripgrep/ripgrep.mk                    |   2 +-
 3 files changed, 134 insertions(+), 3 deletions(-)
 create mode 100644 package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch

diff --git a/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch b/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
new file mode 100644
index 0000000000..e2ba68f389
--- /dev/null
+++ b/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
@@ -0,0 +1,131 @@
+From 68c2a4d7a5d9b46f65121958fdb12d5270bfd1b6 Mon Sep 17 00:00:00 2001
+From: Jonathan Stites <mail@jonstites.com>
+Date: Wed, 6 May 2020 12:55:35 +0000
+Subject: [PATCH] puts jemalloc allocator behind a cargo feature flag
+
+Retrieved from: https://github.com/BurntSushi/ripgrep/pull/1569
+
+Moves jemalloc behind a feature for musl builds, where it is not
+supported by the upstream project, so ripgrep will fail to build.
+
+Signed-off-by: Sam Voss <sam.voss@gmail.com>
+---
+ .github/workflows/ci.yml      | 6 ++++++
+ .github/workflows/release.yml | 8 +++++++-
+ Cargo.toml                    | 8 +++++++-
+ README.md                     | 9 +++++++++
+ crates/core/main.rs           | 8 ++++++--
+ 5 files changed, 35 insertions(+), 4 deletions(-)
+
+diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
+index ab154ec..aa567d9 100644
+--- a/.github/workflows/ci.yml
++++ b/.github/workflows/ci.yml
+@@ -149,6 +149,12 @@ jobs:
+       if: matrix.target != ''
+       run: ${{ env.CARGO }} test --verbose --workspace ${{ env.TARGET_FLAGS }}
+ 
++    - name: Run tests with jemalloc (Musl)
++      # We only use the jemalloc allocator when building with musl.
++      # The system allocator is good enough for other platforms.
++      if: matrix.os == 'nightly-musl'
++      run: ${{ env.CARGO }} test --verbose --all --features jemalloc ${{ env.TARGET_FLAGS }}
++
+     - name: Test for existence of build artifacts (Windows)
+       if: matrix.os == 'windows-2019'
+       shell: bash
+diff --git a/.github/workflows/release.yml b/.github/workflows/release.yml
+index 7cfb6a4..ad6b82d 100644
+--- a/.github/workflows/release.yml
++++ b/.github/workflows/release.yml
+@@ -133,7 +133,13 @@ jobs:
+         echo "target flag is: ${{ env.TARGET_FLAGS }}"
+         echo "target dir is: ${{ env.TARGET_DIR }}"
+ 
+-    - name: Build release binary
++    - name: Build release binary (linux)
++      if: matrix.build == 'linux'
++      # Use jemalloc allocator for much better performance over the musl default allocator
++      run: ${{ env.CARGO }} build --verbose --release --features "pcre2 jemalloc" ${{ env.TARGET_FLAGS }}
++
++    - name: Build release binary (non-linux)
++      if: matrix.build != 'linux'
+       run: ${{ env.CARGO }} build --verbose --release --features pcre2 ${{ env.TARGET_FLAGS }}
+ 
+     - name: Strip release binary (linux and macos)
+diff --git a/Cargo.toml b/Cargo.toml
+index fb78fcb..0d34b1e 100644
+--- a/Cargo.toml
++++ b/Cargo.toml
+@@ -56,8 +56,9 @@ version = "2.33.0"
+ default-features = false
+ features = ["suggestions"]
+ 
+-[target.'cfg(all(target_env = "musl", target_pointer_width = "64"))'.dependencies.jemallocator]
++[dependencies.jemallocator]
+ version = "0.3.0"
++optional = true
+ 
+ [build-dependencies]
+ lazy_static = "1.1.0"
+@@ -75,6 +76,11 @@ walkdir = "2"
+ [features]
+ simd-accel = ["grep/simd-accel"]
+ pcre2 = ["grep/pcre2"]
++# The jemalloc allocator is used for improved
++# performance on x86 musl builds.
++# Cargo does not yet support platform-specific features
++# https://github.com/rust-lang/cargo/issues/1197
++jemalloc = ["jemallocator"]
+ 
+ [profile.release]
+ debug = 1
+diff --git a/README.md b/README.md
+index 46938bc..9917b29 100644
+--- a/README.md
++++ b/README.md
+@@ -406,6 +406,15 @@ build a static executable with MUSL and with PCRE2, then you will need to have
+ `musl-gcc` installed, which might be in a separate package from the actual
+ MUSL library, depending on your Linux distribution.
+ 
++When building with the MUSL target on Linux, it is recommended to use the
++jemalloc allocator for performance:
++
++```
++$ rustup target add x86_64-unknown-linux-musl
++$ cargo build --release --target x86_64-unknown-linux-musl --features jemalloc
++```
++
++
+ 
+ ### Running tests
+ 
+diff --git a/crates/core/main.rs b/crates/core/main.rs
+index 47385de..c9dae5a 100644
+--- a/crates/core/main.rs
++++ b/crates/core/main.rs
+@@ -31,7 +31,7 @@ mod subject;
+ // have the fastest version of everything. Its goal is to be small and amenable
+ // to static compilation.) Even though ripgrep isn't particularly allocation
+ // heavy, musl's allocator appears to slow down ripgrep quite a bit. Therefore,
+-// when building with musl, we use jemalloc.
++// we expose a feature for using jemalloc when building with musl.
+ //
+ // We don't unconditionally use jemalloc because it can be nice to use the
+ // system's default allocator by default. Moreover, jemalloc seems to increase
+@@ -39,7 +39,11 @@ mod subject;
+ //
+ // Moreover, we only do this on 64-bit systems since jemalloc doesn't support
+ // i686.
+-#[cfg(all(target_env = "musl", target_pointer_width = "64"))]
++#[cfg(all(
++    target_env = "musl",
++    target_pointer_width = "64",
++    feature = "jemalloc"
++))]
+ #[global_allocator]
+ static ALLOC: jemallocator::Jemalloc = jemallocator::Jemalloc;
+ 
+-- 
+2.32.0
+
diff --git a/package/ripgrep/ripgrep.hash b/package/ripgrep/ripgrep.hash
index 0841c0185c..b2f03a95e6 100644
--- a/package/ripgrep/ripgrep.hash
+++ b/package/ripgrep/ripgrep.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 7035379fce0c1e32552e8ee528b92c3d01b8d3935ea31d26c51a73287be74bb3 ripgrep-0.8.1.tar.gz
-sha256 0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f LICENSE-MIT
+sha256 0fb17aaf285b3eee8ddab17b833af1e190d73de317ff9648751ab0660d763ed2  ripgrep-13.0.0.tar.gz
+sha256 0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f  LICENSE-MIT
diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
index 450bb020e3..2d9dd3ee2f 100644
--- a/package/ripgrep/ripgrep.mk
+++ b/package/ripgrep/ripgrep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RIPGREP_VERSION = 0.8.1
+RIPGREP_VERSION = 13.0.0
 RIPGREP_SITE = $(call github,burntsushi,ripgrep,$(RIPGREP_VERSION))
 RIPGREP_LICENSE = MIT
 RIPGREP_LICENSE_FILES = LICENSE-MIT
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
