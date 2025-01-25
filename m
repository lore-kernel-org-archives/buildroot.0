Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24549C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 21:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C80F560803;
	Sat, 25 Jan 2025 21:34:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S0z6eSAQ0tKe; Sat, 25 Jan 2025 21:34:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6155660661
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6155660661;
	Sat, 25 Jan 2025 21:34:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 31C0CA6A
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 21:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 122B181836
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 21:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xbaMckbc1gPo for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 21:34:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4614380E87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4614380E87
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4614380E87
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 21:34:39 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3cfdf301fa4so284885ab.0
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 13:34:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737840878; x=1738445678;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GS6zE4jQaXpTntazu78vYdmTYRK/wIGJL+ZiBKPh9fE=;
 b=gMRt/OqTMmqxEnw+8ndU/DCAhvF95EfmMch6GhZinisWr88eXOaQJ0wc7uEs93/K24
 k2dGwVOm0kK9GVRFHo0QF/hsjxm2qf0dWPMqGvKMv/kgQk7ddFwpdbAuO8aIOvzVY+Gm
 xw/KW2Gl2VjNMrrun05NuMN+lvykepaCy57SxbhScpNtxxU+M6+BQ94mrHqznew8qi+q
 R8iMn5qY15QALHNyZaD5FQdXZggkaXh+I99EvhRPniR2MY8gZzIGaOYheD/59PO21z5O
 btLkr7XcwyCFo4nALb1wztTFnmwhsv4JlMXW/k3le+zwvO/whn3sFfDlU8ECIKZhpXY+
 bwBg==
X-Gm-Message-State: AOJu0YyErY/jwl4C7dEnm0oi9MeRt3sIJltmmwiPuDq45UEDyZAtoS6H
 HeNyT7i+KwICEuRrFNFapxJfNqmyd5ZOoXfNJydAzzLiiyHp08mX9yZVgP/6
X-Gm-Gg: ASbGncvIe33nQQUdUx5oIYSIvOrqbEg6JSqpJ3DL56fIvHg7A9vW+4ysPSH7+Rys2VF
 a+BHWj9gykMAasj8qEvY94UsOne6co5J0Kl/ZljMdprnGpAhJncOpg6m76lP1SQ4FDuA9Z2DNRd
 e3im9OhGlJlUCr491LRA1S9mXBpdF3ecskoojGc8X5hC0E4jK8DnmVQA3/5+EAqRHP2ZQ+sbdWz
 ENfpEw5ETp8/u8v5NTaD4g6dFjPvaG6pBWd0JMhJSBLCBTd/acqBvtUhgJ4YhscRSR2BmkkZaCw
 v/fcJ65LcS8e3JhwPECWL9w1sVp4zlgjZTnyaEheO1NoBOG1WTRIuvg=
X-Google-Smtp-Source: AGHT+IGeXFMEAVRQQlfv+mMBRGaEc+bt497z44ptjKAn43hVZfRSGKs0yoCYfTkAnzXgnIysZXqxDQ==
X-Received: by 2002:a92:c245:0:b0:3cf:bc71:94ee with SMTP id
 e9e14a558f8ab-3cfbc719535mr89591665ab.14.1737840877734; 
 Sat, 25 Jan 2025 13:34:37 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ec1db97d15sm1549430173.129.2025.01.25.13.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jan 2025 13:34:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 25 Jan 2025 14:34:32 -0700
Message-Id: <20250125213432.4188106-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737840878; x=1738445678; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GS6zE4jQaXpTntazu78vYdmTYRK/wIGJL+ZiBKPh9fE=;
 b=lDB7QheDdif6xULGxmDWKZGyyeSHLTJJEUdxoF22N8IF0OOBhZgcNkseIZpLJpQlZP
 sDaqN33MH6Z+ZGdlAeMKxuH9NiXNGjf9fJURpyY0jicYe5HC9YrQJbX1GLCB1+UPlpni
 0yEszPlKYqwxX5+BFqd8j6NNjLTsGDTSyck/8lzyoce4Bwe3RtPvqgCJ/EqNnoDXJftD
 3FgIP/IT3tRg8h8/yGWAbFrPSlIHHcGGHKvOgv7YrwSOEG3oRXGpnTFobmfgjY28dp/h
 8SwP+VokT3h81oeJ3B++pdylMKSuEmojFwbiPoFcX8kvLsMSz7I8zEYYqI0o3gi+8NOp
 z6Lw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lDB7QheD
Subject: [Buildroot] [PATCH 1/1] package/rust: bump to version 1.84.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set profile to dist since we are building from a dist archive.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/rust-bin/rust-bin.hash | 128 ++++++++++++++++-----------------
 package/rust-bin/rust-bin.mk   |   2 +-
 package/rust/rust.hash         |   4 +-
 package/rust/rust.mk           |   3 +-
 4 files changed, 69 insertions(+), 68 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 070a0b9779..178c06c658 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,70 +1,70 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rust-1.82.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  99acf175be33bd96ac82d644125d0e2acc6962d61ee64851edc7d8ba3bd23ca4  rust-1.82.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.82.0-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  34669e600d6ee7744e59f5d4542e2a539a9b13f099a4533f19a46e32a0868053  rust-1.82.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.82.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  a32342217fb82167fffcaf0c7e44ac6e32ce5fa63dc3beb42439ab05f561a882  rust-1.82.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.82.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  0608a560ce266e8aafecc2b9908e3094f5ef1e135460b1f88aa614e5bf65aae4  rust-1.82.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.82.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  048f637a547522ba0081c5772fd3196dfcc2d0d24f442424f168b5d55f961537  rust-1.82.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.82.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  532190c3cdbdee9249bcde648b1c61b092bdd8885266ba9edd6df6824a454958  rust-1.82.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.82.0-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  71428fab3cf18cfe4b4486a11d292ec157fe8b0c904fb4fae34db6539144c286  rust-1.82.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.82.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  8a6bf24ca1fee2bd861590431c7954674191a0c0dfa0af4169731bc1459cf58a  rust-1.82.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  1359ac1f3a123ae5da0ee9e47b98bb9e799578eefd9f347ff9bafd57a1d74a7f  rust-std-1.82.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-aarch64-unknown-linux-musl.tar.xz.sha256
-sha256  a364a4b506865fbd56aac67e2b540a824cd9abda621bb38a8b678166d33b8ec2  rust-std-1.82.0-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-arm-unknown-linux-gnueabi.tar.xz.sha256
-sha256  bec0b04e6e1e183fc21521e9cc2dc89be41c3ccacff3fb5ca48419b47af94fe1  rust-std-1.82.0-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  fa379cc69b23782cbaddf66025889bf5ca9c32ddb60766fe158b43cfe49a2b2b  rust-std-1.82.0-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-arm-unknown-linux-musleabi.tar.xz.sha256
-sha256  cd5e1577c1772ba309d003c49a2df2f06ccbc1cd1bf3ee9c1cfada210979f26e  rust-std-1.82.0-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-arm-unknown-linux-musleabihf.tar.xz.sha256
-sha256  86f2242347c1cbae354cd0ff66c9bfe735f1b371c189aaf0157a3b55004590cb  rust-std-1.82.0-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-sha256  e3c74773cf6f09a3cda1b64c3058f5a88abea0a98f172de895c0ecf7b7b760b2  rust-std-1.82.0-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
-sha256  df0a3be0e71ca8aa8be4915f7142661af32411949a75c1729a314e6ab5c78b0b  rust-std-1.82.0-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
-sha256  4d692c1696ad49285a45bc5f636ce9c13ccb32b99ed14be428eaaf1e0cae6b33  rust-std-1.82.0-armv7-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  34d258a07c9051803786405731c05fb19f7980e13308acf4b16e8c836bd73ac8  rust-std-1.82.0-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-armv7-unknown-linux-musleabi.tar.xz.sha256
-sha256  1e318fcff01379cf4459f02526309b1f086530004be4fb5e00988ce7b1d821f5  rust-std-1.82.0-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
-sha256  bf93c79abc56bfcc3d48f2defcb0ca720405d01a50ba08d6d24830ae034bbc2d  rust-std-1.82.0-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-i586-unknown-linux-gnu.tar.xz.sha256
-sha256  f56585c55664898c7484f4b7bd139770c99d7b4da6e56e4016f71cb053b1aee2  rust-std-1.82.0-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-i586-unknown-linux-musl.tar.xz.sha256
-sha256  711c03ffb5bb53fcc97278b015d1ea9f503ce826ba390855f576c0e3b77c4bdb  rust-std-1.82.0-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  c7ebb02b6ca349999b3b7dce768efaca5e0d9060f55397523e11a64cd10a9405  rust-std-1.82.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-i686-unknown-linux-musl.tar.xz.sha256
-sha256  3c5ee32afc4b83313832c7a78175c05a5e568e6053fde7e65e2a9b19ce104c10  rust-std-1.82.0-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  827989a42526206199025f764d08d7cd319fee58bf2e08dcaf75df9ead6f094e  rust-std-1.82.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  cdfadb39f1325319de8152504413f34671ac09fa7ecb97f967c25ece3645bc5e  rust-std-1.82.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  4954a44305622b8f68ca088138b9a69432e350336da1a415a282ce148beb340d  rust-std-1.82.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  5649f9b4e107d6c5f72fb7f82cfe15370b80b8d983670602e02e0b615bc6dc88  rust-std-1.82.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  454b83668b57bdef28fc49aca8fd4c38e395b49011e653afdf3f9bb2dae8aa63  rust-std-1.82.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-sparc64-unknown-linux-gnu.tar.xz.sha256
-sha256  87db52d782131a8817b76f65eefcae2c24a49b2a6f19ed9bd4699167305c22aa  rust-std-1.82.0-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  2eca3d36f7928f877c334909f35fe202fbcecce109ccf3b439284c2cb7849594  rust-std-1.82.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-x86_64-unknown-linux-musl.tar.xz.sha256
-sha256  1c99a4c81f51b687ba55746c7d3f19b5b860fe4eff604d3c7d803e08c9cc89bb  rust-std-1.82.0-x86_64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.84.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  c535d4eb461a361fcaaad98ce578b5846e1a0bd3ff6939874a3e9cbe72cfae17  rust-1.84.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.84.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  12b46802eb72268bd55d1bd69a2eaa13871f89b0c38c73418d8eeea6fae869d7  rust-1.84.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.84.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  85845028b4587d829165fdfed31d3e39b227f158c5238a369919e6130cf4a3f9  rust-1.84.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.84.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  b7752678a17e3b398d8c609effcc7ae602925f280896feb20b7668a190afda7b  rust-1.84.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.84.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  7cdb3b2a4a374c868cb156a6e10591d0d3e40c987d3ec363bf18349a0143843b  rust-1.84.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.84.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  74e0a75cb6d48975c75cf49b5434c921d6bed16937e1f6091eaffb524761c6e1  rust-1.84.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.84.0-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  410e5422036b6195bd79e6aad328335e99b4ef7a82b72248cbac71dfd61d6b18  rust-1.84.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.84.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  73aca7e08720b7bf28beee8f2370c6aef961aa87e9674989f5ce62ec2f95dcfd  rust-1.84.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  023f0b6153b23ac0e9686c2ab95bc393ee3e295b166bb36de3b4dfb53e3913e0  rust-std-1.84.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-aarch64-unknown-linux-musl.tar.xz.sha256
+sha256  2fcc03bf72c6759d6a1778b6592062a2e69349239f7ba9f21a62a7529e4fdf8b  rust-std-1.84.0-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-arm-unknown-linux-gnueabi.tar.xz.sha256
+sha256  5ad4a321ca84fa18811923765031d31d037bbe2e86debda7922d820313ae3926  rust-std-1.84.0-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  b2a92aa3b5116e2f48cd1a854da5dc308cffad989bb68b9d12e983ed72dcc7a7  rust-std-1.84.0-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-arm-unknown-linux-musleabi.tar.xz.sha256
+sha256  469fec94070e8efd38663e1ae6b51a2639e2885e6cc4a7b3c48c2907ccd083fa  rust-std-1.84.0-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-arm-unknown-linux-musleabihf.tar.xz.sha256
+sha256  0fadfac3379bc1acfb44ba6d52ea6269449560b883802b2567005fd351606360  rust-std-1.84.0-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+sha256  e9c6e1b5f91ee78f052cb1d6017c33a33d0f3fa9481e1906d9ef2d674f957be7  rust-std-1.84.0-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
+sha256  7ae93ecec3da72d7053bb3fa8e6c7cd89f9869efd2934be5e29a4381db4cc682  rust-std-1.84.0-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
+sha256  dd80b1d9982d8339ae72d2f985e81d7d528ecf60f7a2eeecd9b6dfdd5431d480  rust-std-1.84.0-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  5b1bc0298dae734ca1d3a66b457cb1ef5c3265dcd0cfd586790c4d45d9826d5f  rust-std-1.84.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-armv7-unknown-linux-musleabi.tar.xz.sha256
+sha256  00fc66cc41c2352f6ea3c36ae97d4c96b92f9a038a101176c3b709f409ce9f2f  rust-std-1.84.0-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
+sha256  e5caef0eae65f66e15fc16c26a86efa6d177a56ed28ef2285de0e4bbb9d4c904  rust-std-1.84.0-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-i586-unknown-linux-gnu.tar.xz.sha256
+sha256  a877622fbbfa58304c34372d369e95db106cc35758ca59053144bf7d86fbf3fc  rust-std-1.84.0-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-i586-unknown-linux-musl.tar.xz.sha256
+sha256  f0f911935c3915ca53f3e2eb51007bbafa1863cda69cb35077bfed38871b83be  rust-std-1.84.0-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  e710100be26e742733d445722a37227381f1ec2010664ece85489bc598d70456  rust-std-1.84.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-i686-unknown-linux-musl.tar.xz.sha256
+sha256  1c8f12e789b64fade8a449ec12039656aa9f5cbc2bc60b720562f1286fbea4fa  rust-std-1.84.0-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  fdbb75060e59ad59273a8ef11fc2ad61837539686df0e8dfe46107e1b15ab90a  rust-std-1.84.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  f2819f8ce1ae41c2c2bcf40fc90d6b1a5d340d3e9558267d464730a797122bf5  rust-std-1.84.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  db731e894cce9973ab2b41109c9097d0fc6a49c0d45a0d333bd1547d2c7485a1  rust-std-1.84.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  451580f9cdc47eef4efb0986b1960a8f9c4fb0959f81b77eb6292e6bcff9fc64  rust-std-1.84.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  5208f45cec5f3600f2cbc11d1796bc217f09e9c922689c8e4f0cc3f2b83ebb74  rust-std-1.84.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-sparc64-unknown-linux-gnu.tar.xz.sha256
+sha256  ecd1662d6cbbb62984ab31ae787442f1ab32caf6bc17260d407b3a94b434ad32  rust-std-1.84.0-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  770237080b9310d126350c3bd70820bd91064c2e96c29ab5f2e002b31b5bd067  rust-std-1.84.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.84.0-x86_64-unknown-linux-musl.tar.xz.sha256
+sha256  5f976818603468384bd78fde6c4e12f2b0a996d55f4985a33a68b5af54974ac0  rust-std-1.84.0-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index c14ca7f88e..588fcda525 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_BIN_VERSION = 1.82.0
+RUST_BIN_VERSION = 1.84.0
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 19af66e2d6..e0f9133a6d 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,8 +1,8 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rustc-1.82.0-src.tar.xz.sha256
-sha256  1276a0bb8fa12288ba6fa96597d28b40e74c44257c051d3bc02c2b049bb38210  rustc-1.82.0-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.84.0-src.tar.xz.sha256
+sha256  bc2c1639f26814c7b17a323992f1e08c3b01fe88cdff9a27d951987d886e00b3  rustc-1.84.0-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 29c03594d2..d4a95241e8 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_VERSION = 1.82.0
+RUST_VERSION = 1.84.0
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
@@ -27,6 +27,7 @@ HOST_RUST_VERBOSITY = $(if $(VERBOSE),2,0)
 
 define HOST_RUST_CONFIGURE_CMDS
 	( \
+		echo 'profile = "dist"'; \
 		echo '[build]'; \
 		echo 'target = ["$(RUSTC_TARGET_NAME)"]'; \
 		echo 'cargo = "$(HOST_RUST_BIN_DIR)/cargo/bin/cargo"'; \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
