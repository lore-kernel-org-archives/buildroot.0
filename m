Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBD5C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 07:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6A2A60C31;
	Tue, 22 Apr 2025 07:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t7lhxIEmwEBg; Tue, 22 Apr 2025 07:48:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12A3060C08
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12A3060C08;
	Tue, 22 Apr 2025 07:48:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B78341A0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 07:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96D854093A
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 07:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hf6e3yDR1Idd for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 07:48:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DC9C5403D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC9C5403D2
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC9C5403D2
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 07:48:07 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so3141022f8f.2
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 00:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745308085; x=1745912885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=agUdc/ofH+jRUE+SFTfLv3kXw4iChw0L0UU5o0FgYHM=;
 b=FNWxatO/5do5lpmKzc8DtKloiWJr+OZuL+0Laz0ljrV5Do2UpsoNcKK3nw834fj+ue
 xZ+tca9x1m0SlBj4/8M48YERQjY27BQzPn0pJzG0iEX7sh3yoL4gWA6D8kzbWuntjpol
 nP9eTH2dGGKirFvyDm6/aCqAqGthMAdcY7S/xA+tQsrWdqRd0eXtoPmaGtyXOisWTB64
 vFEnA2Zsnwg0ddQ/LovD72IWBPy9gdaRwFOzjW3i4NE4ueBDCY68IYWdqs87d99Ftd7f
 yPWwu2dLENMXyxNi/+OlKz8QvKkL53aiUDvjTZtq2w1THVrNG9KYQ/rn5bS4ZOyboItL
 64Qw==
X-Gm-Message-State: AOJu0Yz8lKFkejDQs1dXLi/drF/h435fVEGoSjMKlH8I61xD7mlnkJnN
 3hnvhNTQKRJnaBlhLiLJn8eO4iG5QCu2e/bJf6BDQUtYNrfaN4a8zJcuDBDNZBEvC6OKJsC/d0+
 7kGY=
X-Gm-Gg: ASbGncsWC9iIw7CWrNiUszbprE7tdgR320j+P54Q/AJtw3MztoRLw5xouLR2DY0JnGc
 wN3r78FFdXQ5FJqRRWiG2Gad/hTblq9wPfgzkKKDjd/cZvD21ZwKvNnWI0i422k3DmbRV9GBGoD
 xKscJYFR2970yajOaUC1Z+3OyMjgseZY1OSrxgYtXDv98nOAmJVgfr+zOBwPgRWGGTk5XE2nGbW
 HNgFU0LocaSuzKXCootXT4ieofyQNhWZMpqM1zeT5Nbmccws0n7Z1gCE9TK2BMWbQ6jfAtVtr9q
 TuRUfZ9dO6ojXxT8GECKO2UCc87HWE/1EuDbJBHWqe0myLtQYbmNXCNv36rAt+o3zTO0SHOGKhB
 jNUFGcAoTuC7q9yyXS4EvCg/3aRKZ3i8dkDY=
X-Google-Smtp-Source: AGHT+IFa71MmR6vScr8OsK7vZzV6lb8f0ab8vC3iAb/H/uF8UitEdWYpJuAWJJnSYqexaiTDCBbiFA==
X-Received: by 2002:a05:6000:458f:b0:399:7f43:b3a4 with SMTP id
 ffacd0b85a97d-39efba46366mr8733570f8f.24.1745308085311; 
 Tue, 22 Apr 2025 00:48:05 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5bbd8asm162913405e9.23.2025.04.22.00.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 00:48:05 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 22 Apr 2025 09:47:36 +0200
Message-ID: <20250422074738.821755-3-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422074738.821755-1-elmehdi.younes@smile.fr>
References: <20250422074738.821755-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1745308085; x=1745912885; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=agUdc/ofH+jRUE+SFTfLv3kXw4iChw0L0UU5o0FgYHM=;
 b=ny7UK7o5+rWxsWoA1t6UF/n8uSFwq36SDTEwChaT383CjwIYxVxQv2DG12b5Z6NJEW
 BYRs5wEg34G3UwsQnrsV2hup38pikMFLH7/S7EAG/zUUlElGai1W9xc4PQOdpP6u/t2f
 Bfsh6ajf/cJDEFUxgtrhXoSNST6wiaj8SfXKA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=ny7UK7o5
Subject: [Buildroot] [PATCH 2/4] package/rust: bump to version 1.86.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, David Pierret <david.pierret@smile.fr>,
 Danilo Bargen <mail@dbrgn.ch>, Graeme Smecher <gsmecher@threespeedlogic.com>,
 James Hilliard <james.hilliard1@gmail.com>, Sam Voss <sam.voss@gmail.com>,
 Torben Voltmer <mail@t-voltmer.net>, El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Saeed Kazemi <kazemi.ms@gmail.com>,
 Alex Michel <alex.michel@wiedemann-group.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bump rust from version 1.82.0 to 1.86.0
releases:
https://github.com/rust-lang/rust/releases

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 package/rust-bin/rust-bin.hash | 128 ++++++++++++++++-----------------
 package/rust-bin/rust-bin.mk   |   2 +-
 package/rust/rust.hash         |   4 +-
 package/rust/rust.mk           |   2 +-
 4 files changed, 68 insertions(+), 68 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 070a0b9779..d5a3c02071 100644
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
+# From https://static.rust-lang.org/dist/rust-1.86.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  2b97d1e09a1d7fdbed748332879318ee7f41c008837f87ccb44ec045df0a8a1b  rust-1.86.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.86.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  70eab6af09396f59f353a40adb5e89a830ec2f94f4374147f5132e79d031d433  rust-1.86.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.86.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  5ab6bf190015adfdc119d66dbd410af8e2e7421d6240c9005926d4b0004ae8c4  rust-1.86.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.86.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  b6a176174ea3090255113db93709a900cbc92541b533fa99a5a3cb1d24b5ba6c  rust-1.86.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.86.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  dffcf10fd9d24af8c6f40ba0cf6d013c92b833ce512e5555f2e91c914c32d44b  rust-1.86.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.86.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  bd968612d77de0d2bb4ec4d33f4aa105c5cdc44eca8deabfe2d8cae2a0ffbe18  rust-1.86.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.86.0-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  15a21fbfe91ade94f838b7dc58dbaf4c767c7513b4c990c5b183f4ea6a0b8578  rust-1.86.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.86.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  6b448b3669e0c74f7f4b87da7da4868a552fcbba1f955032d8925ad2fffb3798  rust-1.86.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.86.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  176129577a5d560bbd94bcd2d24c0228bb495b73219df02556b4e4b4f0815bf7  rust-std-1.86.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.86.0-aarch64-unknown-linux-musl.tar.xz.sha256
+sha256  4ce6d1e5ec3678311e08d3104e61266ac4a129bbef8d3083fe6cda7d92934e58  rust-std-1.86.0-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.86.0-arm-unknown-linux-gnueabi.tar.xz.sha256
+sha256  36302b48c1029eed9b7c787fdd90a98c96dfb40e52b5b6f9b644017ae87e83a8  rust-std-1.86.0-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.86.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  71a3fd8a5c028e34791740ca15b59cc946a052c4e41403f39e1743f298aaa508  rust-std-1.86.0-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.86.0-arm-unknown-linux-musleabi.tar.xz.sha256
+sha256  f85daf11938d4d61fa3a980e36246fd9e318d13007a7e3d461688445ebe3bd23  rust-std-1.86.0-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.86.0-arm-unknown-linux-musleabihf.tar.xz.sha256
+sha256  a8231a8fc8fea7ee96dc0552432530d680b5fc7393917a74c093609b375bee04  rust-std-1.86.0-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.86.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+sha256  f12e8fd2389fdc6a6acba8320cc15e0bf30a51bd66ba7303e6b724202d6c57b6  rust-std-1.86.0-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.86.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
+sha256  4838aaa8c5e338cd1ee15c62febdebdb4672c0b3b0d98ce81b379053d813af02  rust-std-1.86.0-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.86.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
+sha256  bf753cb00272a98ab25bda042e3bfcc157f76f45c2cd07161e362a158db41530  rust-std-1.86.0-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.86.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  5084c9fd40090dd19d9c77e7a892d48497ad748b9a77afc4643da2dae30bd968  rust-std-1.86.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.86.0-armv7-unknown-linux-musleabi.tar.xz.sha256
+sha256  27288495c6eb9a7b61af63d9ccdbee1a512623cf578336063df0eb6f101d5ee6  rust-std-1.86.0-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.86.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
+sha256  474195b8051708b0729d73402e8f9049a84e8a97c095f844a350451db9853a2e  rust-std-1.86.0-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.86.0-i586-unknown-linux-gnu.tar.xz.sha256
+sha256  f0bddc6dba7d719b8ba131bcd634a8379e00fc825a51c0f17abf424c9cb5c052  rust-std-1.86.0-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.86.0-i586-unknown-linux-musl.tar.xz.sha256
+sha256  fcba310580f7a94639a72dc238d9849ebf5de6be79217b0eb2c9649f456ee3b8  rust-std-1.86.0-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.86.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  ce9f0fa4b0760730e26bf315cebe099f0b883436e095c5fc4b94ba20bd9f121a  rust-std-1.86.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.86.0-i686-unknown-linux-musl.tar.xz.sha256
+sha256  ba8ab486cb183fd91d29b49db3cacc67198534587c4bf70d4e65e62e2edff001  rust-std-1.86.0-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.86.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  e5ed58a861619bcc89fc3f969174c84fd6ed8a26b5d4b196f06efb868653c1c1  rust-std-1.86.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.86.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  06538b41a9351c449d215498d4ec2f072f728bd18df8fac7ef8534a0d0f34e27  rust-std-1.86.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.86.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  fcf940c0553a04cb9bd85cce524729c2f54b000b554fee95c7aa218d608b7e3d  rust-std-1.86.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.86.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  b28b9c2f183521a204f2899610253c11c86ee4aa903fe66d8410dfaa22c926e6  rust-std-1.86.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.86.0-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  3919f6962d0aefdd2cd75d8dba749ed826936065b64c9a8d54d1d85c2685fd66  rust-std-1.86.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.86.0-sparc64-unknown-linux-gnu.tar.xz.sha256
+sha256  722238ae13e6e101d1b698d2b3a7915d59bb7f485b594e8d833cce8b9460383b  rust-std-1.86.0-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.86.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  67be7184ea388d8ce0feaf7fdea46f1775cfc2970930264343b3089898501d37  rust-std-1.86.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.86.0-x86_64-unknown-linux-musl.tar.xz.sha256
+sha256  8313c108da105181d27a5a0190ab46d1ac5b3e32bb5b2e7e0a41b7b5d353cba6  rust-std-1.86.0-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index c14ca7f88e..989fbdef32 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_BIN_VERSION = 1.82.0
+RUST_BIN_VERSION = 1.86.0
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 19af66e2d6..bfccc2502a 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,8 +1,8 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rustc-1.82.0-src.tar.xz.sha256
-sha256  1276a0bb8fa12288ba6fa96597d28b40e74c44257c051d3bc02c2b049bb38210  rustc-1.82.0-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.86.0-src.tar.xz.sha256
+sha256  d939eada065dc827a9d4dbb55bd48533ad14c16e7f0a42e70147029c82a7707b  rustc-1.86.0-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 6481e40561..7f6f2ebc17 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_VERSION = 1.82.0
+RUST_VERSION = 1.86.0
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
