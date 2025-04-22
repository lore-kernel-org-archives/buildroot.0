Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B974C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 10:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 383E760D61;
	Tue, 22 Apr 2025 10:00:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rYECOYRCk_LL; Tue, 22 Apr 2025 10:00:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79941608DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79941608DD;
	Tue, 22 Apr 2025 10:00:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A9221A0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 10:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BE3C40636
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 10:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MyANELnLkdcq for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 10:00:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 00B3F4060B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00B3F4060B
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00B3F4060B
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 10:00:28 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so3240655f8f.2
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 03:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745316026; x=1745920826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/8AH2KlXpekAFYZSEq2BeFT2veMcJsqd6DmiAU7j8dk=;
 b=o0oVdcvOgPTscu3XknLjLnZO6hG0GVmL+zFvMZjbG5h3YCYobNyt7c6P0oWn2Amrkx
 43kqJsh1qCo2GBKGBWlgpExdHdc2iX68avq1qm8n4r9BCvFwHkL5gwxJnDBVtCGsib1S
 u3kazrMXMBu99TCaIiZ0MVMgk9DcyTwB6R35Bmq8jaZjLcIdmyw9GT9YfNVETke1Yp87
 8rGQzG+lvI8J0PWq1YG37aRgAKoRGUgcQIpIHhj8mSXSWUTeKQtu1fdgPPsZoCS8nCmu
 RhcxmsVyZ0Xch4qhQzNiTTgLRk2qm2BO2+zt3ab/giB3FFkIodwlEfucG58oQUI176Vv
 EhkQ==
X-Gm-Message-State: AOJu0YzwKsebjko3+4Sj8ypDRFIoYzufcijpfLH63hxeJohbDlZe8wsQ
 USL5AsnEJXlen17ZFBHsGDfFcBUQqYlt6+ilQE2JmfCbVKrSKa70wlySKzYv4vT7xFMysp0OBk+
 aO4s=
X-Gm-Gg: ASbGncsuZVPZwQoiB9jNfMv6g57ycgcxyWOhr/J52qCPYCCe9W8JbFBKI4UvyrS4S+G
 vQ6r3QrS1cCfxbSbvLkYvyFBT1csxqZPUBNmR3GH959toMQA9JOLwYcD8UYEoQHnUCo6mTmWrcP
 OjN0X2wUeqfn30VzoADO0trEJC8xG/pVouHYxXgsXMxZ0mor/kLsdoqTRXf8hhlBVoY8PBiGd9Y
 9AcRz4ZB+HMwZmqaAelA8hrfDyn9lWUpN2smIr6clVKKrc2wAvXMd2Zx+FGPGShr2QM+Cvb8gJa
 Tp9cEYgVcr/CQvxaNtXmrZaTVzeg/PsiCMRFqlpeeNxocKYFFzBfJAdWCQDClQnhhFhzf6mXsn7
 9UlYEQDl5mMhDbK2jvi/ZpJjWIRb/aeqT7wI=
X-Google-Smtp-Source: AGHT+IFtbKGpzOSUcNLNwLlWKJ97kzgUxdn3krkTH5sr4MNEM/rFTF68XhnPS/eFsbTJ+NowQjF37A==
X-Received: by 2002:a05:6000:4308:b0:390:f6aa:4e7c with SMTP id
 ffacd0b85a97d-39efba5e837mr11395492f8f.28.1745316026257; 
 Tue, 22 Apr 2025 03:00:26 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa493145sm14549768f8f.71.2025.04.22.03.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 03:00:26 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Sam Voss <sam.voss@gmail.com>,
	El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Tue, 22 Apr 2025 12:00:10 +0200
Message-ID: <20250422100011.962097-2-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422100011.962097-1-elmehdi.younes@smile.fr>
References: <20250422100011.962097-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1745316026; x=1745920826; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/8AH2KlXpekAFYZSEq2BeFT2veMcJsqd6DmiAU7j8dk=;
 b=f4NqT+pLg/P2TwDM3fLUcuYgGO5BlW4S4CKUTf62JoHJrX9TcYXhE87GNs++ejkr5E
 3z5UXBcjcYNEnpP2BTIPPddh/6+CHYKJKHsunerZYClwz28iinPYrp7c/GktsJZijhlo
 S6q7nAopg2fxl3C8z8bNgHMR0s6ogk+cDe5PQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=f4NqT+pL
Subject: [Buildroot] [PATCH 1/2] package/ripgrep: update jemalloc patch for
 14.1.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version updates the patch for compatibility with ripgrep 14.1.1.
No functional change was introduced, but line offsets and formatting
were adjusted due to minor changes upstream in Cargo.toml and related
files.

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 ...llocator-behind-a-cargo-feature-flag.patch | 29 ++++++++++---------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch b/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
index e665a6570e..8df1491e40 100644
--- a/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
+++ b/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
@@ -1,4 +1,4 @@
-From 77f850969433b14769ade4281899373f3ebabf86 Mon Sep 17 00:00:00 2001
+From 3199b83995a9e3a180664c03db6b301641d8f3ea Mon Sep 17 00:00:00 2001
 From: Jonathan Stites <mail@jonstites.com>
 Date: Wed, 6 May 2020 12:55:35 +0000
 Subject: [PATCH] puts jemalloc allocator behind a cargo feature flag
@@ -11,16 +11,18 @@ supported by the upstream project, so ripgrep will fail to build.
 Signed-off-by: Sam Voss <sam.voss@gmail.com>
 [Antoine: update for 14.1.0]
 Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
+[Mehdi: update for 14.1.1]
+Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
 ---
  .github/workflows/ci.yml      | 6 ++++++
  .github/workflows/release.yml | 8 +++++++-
  Cargo.toml                    | 8 +++++++-
- README.md                     | 9 +++++++++
+ README.md                     | 8 ++++++++
  crates/core/main.rs           | 8 ++++++--
- 5 files changed, 35 insertions(+), 4 deletions(-)
+ 5 files changed, 34 insertions(+), 4 deletions(-)
 
 diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
-index d21b85a..0c9ecb9 100644
+index 532e2e9..744e2bc 100644
 --- a/.github/workflows/ci.yml
 +++ b/.github/workflows/ci.yml
 @@ -172,6 +172,12 @@ jobs:
@@ -37,7 +39,7 @@ index d21b85a..0c9ecb9 100644
        # We could test this when using Cross, but we'd have to execute the
        # 'rg' binary (done in test-complete) with qemu, which is a pain and
 diff --git a/.github/workflows/release.yml b/.github/workflows/release.yml
-index f6ea3d9..ac18129 100644
+index f6ea3d9..b9ac802 100644
 --- a/.github/workflows/release.yml
 +++ b/.github/workflows/release.yml
 @@ -171,7 +171,13 @@ jobs:
@@ -45,8 +47,8 @@ index f6ea3d9..ac18129 100644
          echo "target dir is: ${{ env.TARGET_DIR }}"
  
 -    - name: Build release binary
-+    - name: Build release binary (linux)
-+      if: matrix.build == 'linux'
++    - name : Build release binary (linux)
++      if: matrix.build == 'linux
 +      # Use jemalloc allocator for much better performance over the musl default allocator
 +      run: ${{ env.CARGO }} build --verbose --release --features "pcre2 jemalloc" ${{ env.TARGET_FLAGS }}
 +
@@ -56,7 +58,7 @@ index f6ea3d9..ac18129 100644
        run: |
          ${{ env.CARGO }} build --verbose --release --features pcre2 ${{ env.TARGET_FLAGS }}
 diff --git a/Cargo.toml b/Cargo.toml
-index da350bc..1a0a48f 100644
+index 2ec69c9..2785c12 100644
 --- a/Cargo.toml
 +++ b/Cargo.toml
 @@ -59,8 +59,9 @@ serde_json = "1.0.23"
@@ -70,9 +72,9 @@ index da350bc..1a0a48f 100644
  
  [dev-dependencies]
  serde = "1.0.77"
-@@ -70,6 +71,11 @@ walkdir = "2"
+@@ -69,6 +70,11 @@ walkdir = "2"
+ 
  [features]
- simd-accel = ["grep/simd-accel"]
  pcre2 = ["grep/pcre2"]
 +# The jemalloc allocator is used for improved
 +# performance on x86 musl builds.
@@ -83,16 +85,15 @@ index da350bc..1a0a48f 100644
  [profile.release]
  debug = 1
 diff --git a/README.md b/README.md
-index 0821fab..fdb9fb5 100644
+index a429087..f017864 100644
 --- a/README.md
 +++ b/README.md
-@@ -478,6 +478,15 @@ build a static executable with MUSL and with PCRE2, then you will need to have
+@@ -486,6 +486,14 @@ build a static executable with MUSL and with PCRE2, then you will need to have
  `musl-gcc` installed, which might be in a separate package from the actual
  MUSL library, depending on your Linux distribution.
  
 +When building with the MUSL target on Linux, it is recommended to use the
 +jemalloc allocator for performance:
-+
 +```
 +$ rustup target add x86_64-unknown-linux-musl
 +$ cargo build --release --target x86_64-unknown-linux-musl --features jemalloc
@@ -129,5 +130,5 @@ index 64f35ce..9aa6663 100644
  static ALLOC: jemallocator::Jemalloc = jemallocator::Jemalloc;
  
 -- 
-2.25.1
+2.43.0
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
