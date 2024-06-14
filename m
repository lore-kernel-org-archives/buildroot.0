Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C96C27C6E
	for <buildroot@archiver.kernel.org>; Fri, 14 Jun 2024 16:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFCED41588;
	Fri, 14 Jun 2024 16:22:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rHO0v53okm0j; Fri, 14 Jun 2024 16:22:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52E9C40AF5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52E9C40AF5;
	Fri, 14 Jun 2024 16:22:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 670781BF326
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 16:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 530FF84469
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 16:22:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q678ip2E4tGY for <buildroot@lists.busybox.net>;
 Fri, 14 Jun 2024 16:22:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 47F6784468
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47F6784468
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47F6784468
 for <buildroot@buildroot.org>; Fri, 14 Jun 2024 16:22:02 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4218008c613so19128495e9.2
 for <buildroot@buildroot.org>; Fri, 14 Jun 2024 09:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718382120; x=1718986920;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=At9f9WsRyBJJ2hLIl8NStL8YgSI/+5XX6bYp5vWGc/E=;
 b=v6mZrVa6SrfQroRxbz3VhstQy1g+jaAPY4uGw+TqlfF0e+Ni5UxDP4UlUtem1iE0ac
 6J/FF/M2hUopfrSowsCz3ZCrlndI/wyFeJQK9jveT22bFzfFY0F5aoQ7Z1n6WwD+mWu7
 Cj+5THEMaJ6mwRP+MRpiESNKxG6Gul/Z+uNz1OFm0nWP4GTbsMjH7PXoJzXZuLJ1DCMK
 2XgFG+ClsxayjSoUZjCAiBXQUTHTHiWhc7S6yq9jFUV88abWrK9h/hbF+bJBWWje1Yx/
 TtB2IaETzdykj7zsNHspTKgvcm8WkWcgsGuxzeQKusO0rCxZ1EZ+ErE/SdJ1X8PxX9L9
 I7jw==
X-Gm-Message-State: AOJu0Yw8CCLAZj4OuLkRp1//MAWxGiFFBRReWACj2T6+n4ca6Ran2e9U
 TG49VFV2zvwqjw9c7XhyhJTx/e/3uNUuwB1sLuwHxzVrkSqPj9ohdRYh3A==
X-Google-Smtp-Source: AGHT+IHC/9tdxXxzLtmnq3kcswhXRDFbhLeEPBd8EdPDYxNxGEud8YdAlyUD6yqQP+OK+x3G9refvw==
X-Received: by 2002:a05:600c:4691:b0:422:1163:44a1 with SMTP id
 5b1f17b1804b1-4230482bce8mr27641885e9.19.1718382119819; 
 Fri, 14 Jun 2024 09:21:59 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f612800csm67133175e9.28.2024.06.14.09.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 09:21:59 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 14 Jun 2024 18:21:54 +0200
Message-ID: <185f954c798e7d8e7e1400a8b39abe1b273e849b.1718382114.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1718382114.git.yann.morin.1998@free.fr>
References: <cover.1718382114.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718382120; x=1718986920; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=At9f9WsRyBJJ2hLIl8NStL8YgSI/+5XX6bYp5vWGc/E=;
 b=G9bh8PXPv4y7byaaG/N1papQqPzBbfc/oi7PGfJA9lEDiVtxHy5hyLfjgWmF6axtWc
 rnYnT2fVEsoz8Q4nFyynAAf751/jatmm48oLrFb2iCAlLyLUcbexTKaQLx/X7pIFOqKv
 dPiRcUWuCqET+T2DhteG+CmGG8k665AZ8P/5z4DkAmdcEwmQVuB5nBlLNc6Xkkksmz+L
 DNaaYDOSZUAArBz2zLFtBHZxw6dxmtPuK3iCrZviFzhV9nBd0cMirzFip3Oq1hrcJimN
 bqZoQ2Tx6KY5MwHWEk5+xAvruThmCDrV+J0Y0SjO3WkLpIQ8Nbv2uR6Y11enJwa734Kd
 rfyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=G9bh8PXP
Subject: [Buildroot] [PATCH 2/6] utils/update-rust: add script to
 automatically update the rust version
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When we update the rust version, we need to update a large list of
hashes for rust-bin, and update the hash for rust (source). This is very
tedious and very error-prone.

Add a helper script that generates the hash files automatically, and
also iupdate the _VERSION in the .mk.

We decided not to carry the hint about the verification of the tarballs
against the upstream GPG signature for three reasons:

  - it requires that all the tarballs be downloaded, which can take
    quite some time;

  - the hash files are available for all the needed archives;

  - the hash files are downloaded over https, so if someone managed to
    get a hold of the rust server to provide backdoored archives, they
    can also change the hash files;

  - properly verifying the archives would require a chain of trust
    between the person running the upsate script, and the rust GPG key,
    which is not a given, and verifying sigantures using an unverified
    key is not providing much security, if at all.

Regenerate the hash files with that script.

Note (for the future, maybe): there are manifest files for each release,
https:/static.rust-lang.org/dist/channel-rust-VERSION.toml, that we
could use to generate the RUST_HOSTS and RUST_TARGETS list. However,
adding new hosts or new targets implies updating the corresponding
_ARCH_SUPPORTS and accompanying symbols, so better leave that to a
manual operation, at least for now.

Notes: Many thanks to James for providing an initial script with the
same purpose. Given the feedback from previous reviews, it was simpler
to rewrite it from scratch; it should now be much, much simpler.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>
---
 package/rust-bin/rust-bin.hash |  41 +--------
 package/rust/rust.hash         |   4 +-
 package/rustc/Config.in.host   |   4 +
 utils/update-rust              | 147 +++++++++++++++++++++++++++++++++
 4 files changed, 158 insertions(+), 38 deletions(-)
 create mode 100755 utils/update-rust

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index d44cb2cb67..9b82b4ca01 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,111 +1,78 @@
+# Generated with utils/update-rust
+# Do not edit manually
+
 # From https://static.rust-lang.org/dist/rust-1.74.1-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.74.1-aarch64-unknown-linux-gnu.tar.xz.asc
 sha256  88d0cd0407ca5bb73b5d72956d85e31e057657c7ec09a58ca634cf36bd5cf626  rust-1.74.1-aarch64-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-1.74.1-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.74.1-i686-unknown-linux-gnu.tar.xz.asc
 sha256  f58cdf15717e7f6506088e753ffef3ec655a4ccd932eae280d6cb68b0ee3feca  rust-1.74.1-i686-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-1.74.1-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.74.1-powerpc-unknown-linux-gnu.tar.xz.asc
 sha256  d272cec30f3461647861d120af53946142fa2f969f43040c2685425cb67c7d79  rust-1.74.1-powerpc-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-1.74.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.74.1-powerpc64-unknown-linux-gnu.tar.xz.asc
 sha256  17df1fa64083fa508576062a651577e0741d02f4ae5771518a72fd4ea483b00f  rust-1.74.1-powerpc64-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-1.74.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.74.1-powerpc64le-unknown-linux-gnu.tar.xz.asc
 sha256  054a98e8e85e94c187ff8bc16bac8011747839c9ad73584fdd87b904f137eb23  rust-1.74.1-powerpc64le-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-1.74.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.74.1-riscv64gc-unknown-linux-gnu.tar.xz.asc
 sha256  4abc1499e91cfadf7610a08271d1f5ff9284a54ba4a0ba60f105bb9b2413169e  rust-1.74.1-riscv64gc-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-1.74.1-s390x-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.74.1-s390x-unknown-linux-gnu.tar.xz.asc
 sha256  3196fd6e4453cd2191e5f8c4f63eaffd045cc1884cf4b64d94990aa81232f85f  rust-1.74.1-s390x-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-1.74.1-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.74.1-x86_64-unknown-linux-gnu.tar.xz.asc
 sha256  5483e32fe962e9123cf49c9cf169e60640d4c9d0aad1a054dd4bf232f0f012be  rust-1.74.1-x86_64-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.74.1-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-aarch64-unknown-linux-gnu.tar.xz.asc
 sha256  a776e7b41991ef7a50706d1f9b7752a8d963e67297bfc22471d6e68d544349cc  rust-std-1.74.1-aarch64-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.74.1-aarch64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-aarch64-unknown-linux-musl.tar.xz.asc
 sha256  d712e44d57f3732c294affb26c07d8fb79f25c716b16a4bde910390f34cc9959  rust-std-1.74.1-aarch64-unknown-linux-musl.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.74.1-arm-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-arm-unknown-linux-gnueabi.tar.xz.asc
 sha256  38ccd7eeb30e481a27533ec1450c1eb4f3c3fee284f702ee64676b3831bde425  rust-std-1.74.1-arm-unknown-linux-gnueabi.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.74.1-arm-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-arm-unknown-linux-gnueabihf.tar.xz.asc
 sha256  5f1b890faa083afd97ed53c67d859f4de89abe9a059b48c98217d8ee015bedeb  rust-std-1.74.1-arm-unknown-linux-gnueabihf.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.74.1-arm-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-arm-unknown-linux-musleabi.tar.xz.asc
 sha256  9b57973a9d23e713799169c3b39282655b742c9182e21270f53a3bb46af516f3  rust-std-1.74.1-arm-unknown-linux-musleabi.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.74.1-arm-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-arm-unknown-linux-musleabihf.tar.xz.asc
 sha256  26bad270c96de6ca0abbad4a2be63f994fede26b19cfab3362479668f3d1d5c5  rust-std-1.74.1-arm-unknown-linux-musleabihf.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.74.1-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-armv5te-unknown-linux-gnueabi.tar.xz.asc
 sha256  c567bf8e062daead8a256ee3097e724e1f70a4be5f69a74c3722719fb338af27  rust-std-1.74.1-armv5te-unknown-linux-gnueabi.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.74.1-armv5te-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-armv5te-unknown-linux-musleabi.tar.xz.asc
 sha256  96c81d327c4cd5cd35541dae3db4ed6eef6a943c78b0595396e88264a692b5e2  rust-std-1.74.1-armv5te-unknown-linux-musleabi.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.74.1-armv7-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-armv7-unknown-linux-gnueabi.tar.xz.asc
 sha256  339b4bf274ba569245a3e7bc1c9e238ce64c1942c5510fb19a4cacae37aa8aa9  rust-std-1.74.1-armv7-unknown-linux-gnueabi.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.74.1-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-armv7-unknown-linux-gnueabihf.tar.xz.asc
 sha256  915c3648772d1b00b491a204239362aac33b213e95ac7e818b2001a40aae800a  rust-std-1.74.1-armv7-unknown-linux-gnueabihf.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.74.1-armv7-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-armv7-unknown-linux-musleabi.tar.xz.asc
 sha256  e0a61bd2f33e5929a47654dccc5387c56aa847ab028ff2f1992b4dc82da677f0  rust-std-1.74.1-armv7-unknown-linux-musleabi.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.74.1-armv7-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-armv7-unknown-linux-musleabihf.tar.xz.asc
 sha256  7402c633f1a765053ca9bd4c03d65ece67651af9ce3698781a8d2a271e76cbaa  rust-std-1.74.1-armv7-unknown-linux-musleabihf.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.74.1-i586-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-i586-unknown-linux-gnu.tar.xz.asc
 sha256  7c01117e7db5b77880d2ed5f3874ae10cdf9a3d2d042fc06011a8f5f8346b66c  rust-std-1.74.1-i586-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.74.1-i586-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-i586-unknown-linux-musl.tar.xz.asc
 sha256  b2781008ab93083970d5bf18782f6611f80d5b2a0aa1eaf6e6a44e8b0c146d9b  rust-std-1.74.1-i586-unknown-linux-musl.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.74.1-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-i686-unknown-linux-gnu.tar.xz.asc
 sha256  de7bfa755339d81d0f375c04a6b5432fba8452fdc72154fbe5cd5e1147902b90  rust-std-1.74.1-i686-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.74.1-i686-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-i686-unknown-linux-musl.tar.xz.asc
 sha256  1d0a2aa7fc04896bb73d08ec6b7247d9f8e2db46532c31adff3d7944d66dfb4b  rust-std-1.74.1-i686-unknown-linux-musl.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.74.1-mips-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-mips-unknown-linux-musl.tar.xz.asc
 sha256  c1721bb1f47941b1e6acc2f91b326d9172bf401dd88e92abacbb8084ecbc568f  rust-std-1.74.1-mips-unknown-linux-musl.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.74.1-mips64-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-mips64-unknown-linux-muslabi64.tar.xz.asc
 sha256  d2680c31aabfa896301689a0a03206aad31a59111a3c041c357ba5508f56dcfc  rust-std-1.74.1-mips64-unknown-linux-muslabi64.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.74.1-mips64el-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-mips64el-unknown-linux-muslabi64.tar.xz.asc
 sha256  7a8b6f7cc454efb57f575ba50956f2530e192ab50c622acf38b29a42a5bb31e0  rust-std-1.74.1-mips64el-unknown-linux-muslabi64.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.74.1-mipsel-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-mipsel-unknown-linux-musl.tar.xz.asc
 sha256  733995dec75a90d4039bc3a6e11c44e256bfc4cb074e46a67e2aebfe1ec69a26  rust-std-1.74.1-mipsel-unknown-linux-musl.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.74.1-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-powerpc-unknown-linux-gnu.tar.xz.asc
 sha256  7fb458560bccae13f6558df43d5e17f177a084fdcb605d500eda63bc1ac3eb58  rust-std-1.74.1-powerpc-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.74.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-powerpc64-unknown-linux-gnu.tar.xz.asc
 sha256  931f975a4a4c8dc17552d965b276c7211e25f8c5deec1f41f5db5c181fa15320  rust-std-1.74.1-powerpc64-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.74.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-powerpc64le-unknown-linux-gnu.tar.xz.asc
 sha256  40781d07bb9a23d57c2440d70fee6385d8d40553b739d835c38fd0abe96d7ec5  rust-std-1.74.1-powerpc64le-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.74.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-riscv64gc-unknown-linux-gnu.tar.xz.asc
 sha256  2c4de6689f5008289b791ad15b8cdc2d69947985b81b77d4dbe5d31632532e1d  rust-std-1.74.1-riscv64gc-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.74.1-s390x-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-s390x-unknown-linux-gnu.tar.xz.asc
 sha256  781403a12fef605250869aeb843be6b7f98ed6c0a62f0349fda53ee4d9d8e296  rust-std-1.74.1-s390x-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.74.1-sparc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-sparc64-unknown-linux-gnu.tar.xz.asc
 sha256  e19c0d79b385454a8e8c9f27c3ca9779ffac778d8b7cd8de701ce413f492d9f1  rust-std-1.74.1-sparc64-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.74.1-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-x86_64-unknown-linux-gnu.tar.xz.asc
 sha256  df435e3254c03ccbfc9e733ae33b399f5f99bd488974bc07d8b1db91a12ee95b  rust-std-1.74.1-x86_64-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.74.1-x86_64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.74.1-x86_64-unknown-linux-musl.tar.xz.asc
 sha256  98f190039c7e7922838f9716443b7ddfec2aa3dc229f5b1813a26591c557997e  rust-std-1.74.1-x86_64-unknown-linux-musl.tar.xz
-# Locally  generated
+# Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 175fa71baf..34349eef8b 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,5 +1,7 @@
+# Generated with utils/update-rust
+# Do not edit manually
+
 # From https://static.rust-lang.org/dist/rustc-1.74.1-src.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rustc-1.74.1-src.tar.xz.asc
 sha256  b98c09d968529212fb29eec7d6d3e9bdaa869810679b7fb86a1ca69469d75f5e  rustc-1.74.1-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index baa68994e6..d15443e53f 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -1,4 +1,5 @@
 # All host rust packages should depend on this option
+# When adding new entries below, update RUST_HOSTS in utils/update-rust
 config BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	bool
 	default y if BR2_HOSTARCH = "aarch64"
@@ -18,6 +19,7 @@ config BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 
 # The below entries match Tier 1 platforms as described at
 # https://doc.rust-lang.org/nightly/rustc/platform-support.html.
+# When adding new entries below, update RUST_TARGETS in utils/update-rust
 config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER1_PLATFORMS
 	bool
 	# aarch64-unknown-linux-gnu
@@ -30,6 +32,7 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER1_PLATFORMS
 # The below entries match Tier 2 platforms with host tools as
 # described at
 # https://doc.rust-lang.org/nightly/rustc/platform-support.html.
+# When adding new entries below, update RUST_TARGETS in utils/update-rust
 config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS
 	bool
 	# aarch64-unknown-linux-musl
@@ -63,6 +66,7 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS
 # The below entries match Tier 2 platforms without host tools as
 # described at
 # https://doc.rust-lang.org/nightly/rustc/platform-support.html.
+# When adding new entries below, update RUST_TARGETS in utils/update-rust
 config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
 	bool
 	# arm-unknown-linux-musleabi
diff --git a/utils/update-rust b/utils/update-rust
new file mode 100755
index 0000000000..66d93b7300
--- /dev/null
+++ b/utils/update-rust
@@ -0,0 +1,147 @@
+#!/usr/bin/env python3
+
+import argparse
+import os
+import requests
+import sys
+
+# When updating this list, also update:
+# - package/rustc/Config.in.host:
+#       BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
+# - package/rustc/rustc.mk:
+#       RUSTC_HOST_NAME
+RUST_HOSTS = [
+    "aarch64-unknown-linux-gnu",
+    "i686-unknown-linux-gnu",
+    "powerpc-unknown-linux-gnu",
+    "powerpc64-unknown-linux-gnu",
+    "powerpc64le-unknown-linux-gnu",
+    "riscv64gc-unknown-linux-gnu",
+    "s390x-unknown-linux-gnu",
+    "x86_64-unknown-linux-gnu",
+]
+
+# When updating this list, also update one of:
+# - package/rustc/Config.in.host:
+#       BR2_PACKAGE_HOST_RUSTC_TARGET_TIER1_PLATFORMS
+#       BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS
+#       BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
+# - package/rustc/rustc.mk:
+#       RUSTC_TARGET_NAME
+# and check whether one of the follwoing needs updating:
+# - package/rustc/Config.in.host:
+#       BR2_PACKAGE_HOST_RUSTC_ARCH
+#       BR2_PACKAGE_HOST_RUSTC_ABI
+RUST_TARGETS = [
+    "aarch64-unknown-linux-gnu",
+    "aarch64-unknown-linux-musl",
+    "arm-unknown-linux-gnueabi",
+    "arm-unknown-linux-gnueabihf",
+    "arm-unknown-linux-musleabi",
+    "arm-unknown-linux-musleabihf",
+    "armv5te-unknown-linux-gnueabi",
+    "armv5te-unknown-linux-musleabi",
+    "armv7-unknown-linux-gnueabi",
+    "armv7-unknown-linux-gnueabihf",
+    "armv7-unknown-linux-musleabi",
+    "armv7-unknown-linux-musleabihf",
+    "i586-unknown-linux-gnu",
+    "i586-unknown-linux-musl",
+    "i686-unknown-linux-gnu",
+    "i686-unknown-linux-musl",
+    "mips-unknown-linux-musl",
+    "mips64-unknown-linux-muslabi64",
+    "mips64el-unknown-linux-muslabi64",
+    "mipsel-unknown-linux-musl",
+    "powerpc-unknown-linux-gnu",
+    "powerpc64-unknown-linux-gnu",
+    "powerpc64le-unknown-linux-gnu",
+    "riscv64gc-unknown-linux-gnu",
+    "s390x-unknown-linux-gnu",
+    "sparc64-unknown-linux-gnu",
+    "x86_64-unknown-linux-gnu",
+    "x86_64-unknown-linux-musl",
+]
+
+RUST_DIST_URL = "https://static.rust-lang.org/dist"
+
+LICENSES = {
+    "APACHE": "62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a",
+    "MIT": "23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3",
+}
+
+
+def update_mk_file(mk_file, new_version):
+    with open(mk_file, "r") as fd:
+        lines = fd.readlines()
+
+    version_var = os.path.basename(mk_file)[:-3].upper().replace("-", "_") + "_VERSION"
+    with open(mk_file, "w") as fd:
+        for line in lines:
+            words = line.split()
+            if len(words) == 3 and words[0] == version_var and words[1] == "=":
+                fd.write(f"{words[0]} = {new_version}\n")
+            else:
+                fd.write(line)
+
+
+def gen_hash_file_src(hash_file, new_version):
+    with open(hash_file, "w") as fd:
+        fd.write(f"# Generated with {sys.argv[0]}\n# Do not edit manually\n\n")
+        f_name = f"rustc-{new_version}-src.tar.xz"
+        print(f"\r\033[KUpdating {f_name}", end="")
+        h_url = f"{RUST_DIST_URL}/{f_name}.sha256"
+        r = requests.get(h_url)
+        if r.status_code != 200:
+            raise RuntimeError(f"No hash for {f_name}. Has source been removed?")
+        # rstrip() content, and explicitly add the \n, in case
+        # a hash file does not have a trailing \n.
+        fd.write(f"# From {h_url}\nsha256  {r.content.decode().rstrip()}\n")
+        fd.write("# Locally generated\n")
+        for license in LICENSES:
+            fd.write(f"sha256  {LICENSES[license]}  LICENSE-{license}\n")
+
+
+def gen_hash_file_bin(hash_file, new_version):
+    with open(hash_file, "w") as fd:
+        fd.write(f"# Generated with {sys.argv[0]}\n# Do not edit manually\n\n")
+        for host in RUST_HOSTS:
+            f_name = f"rust-{new_version}-{host}.tar.xz"
+            print(f"\r\033[KUpdating {f_name}", end="")
+            h_url = f"{RUST_DIST_URL}/{f_name}.sha256"
+            r = requests.get(h_url)
+            if r.status_code != 200:
+                raise RuntimeError(f"No hash for {f_name}. Has host {host} been removed?")
+            # rstrip() content, and explicitly add the \n, in case
+            # a hash file does not have a trailing \n.
+            fd.write(f"# From {h_url}\nsha256  {r.content.decode().rstrip()}\n")
+        for target in RUST_TARGETS:
+            f_name = f"rust-std-{new_version}-{target}.tar.xz"
+            print(f"\r\033[KUpdating {f_name}", end="")
+            h_url = f"{RUST_DIST_URL}/{f_name}.sha256"
+            r = requests.get(h_url)
+            if r.status_code != 200:
+                raise RuntimeError(f"No hash for {f_name}. Has target {target} been removed?")
+            # rstrip() content, and explicitly add the \n, in case
+            # a hash file does not have a trailing \n.
+            fd.write(f"# From {h_url}\nsha256  {r.content.decode().rstrip()}\n")
+        fd.write("# Locally generated\n")
+        for license in LICENSES:
+            fd.write(f"sha256  {LICENSES[license]}  LICENSE-{license}\n")
+
+
+def main():
+    parser = argparse.ArgumentParser(description="Update rust")
+    parser.add_argument("version", help="Rust version to update to", type=str)
+
+    args = parser.parse_args()
+    update_mk_file("package/rust/rust.mk", args.version)
+    update_mk_file("package/rust-bin/rust-bin.mk", args.version)
+    gen_hash_file_src("package/rust/rust.hash", args.version)
+    gen_hash_file_bin("package/rust-bin/rust-bin.hash", args.version)
+
+    print("\r\033[K", end="")
+
+
+if __name__ == "__main__":
+    main()
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
