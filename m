Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508BDE7718A
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 02:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE03C811C3;
	Fri, 20 Dec 2024 02:39:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eWK9_ag17GWW; Fri, 20 Dec 2024 02:39:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44F6A81FD7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44F6A81FD7;
	Fri, 20 Dec 2024 02:39:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 44ED6920
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 02:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 222C4408AB
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 02:39:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AK38tct3lQTT for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 02:39:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CD8764080B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD8764080B
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD8764080B
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 02:39:01 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3a77bd62fdeso10048965ab.2
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 18:39:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734662340; x=1735267140;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=096W0O1jJopRfbS3gAAx7QUFutWi2+tTs8OEdPkgyrs=;
 b=KNo4saIq5kHMpPGSA2VUrBPjuRmuVaMgBKOer61oQ4ZFe3Ae/fD+wGcnJhr27xCIvg
 nAiQKg/nt2edymkPQcnLjw/XUZiGAIqhToO6N+Bu4e8Axw3QqV4ciYHXoIrjzDQAGnDs
 f2XyfUb7rO83IXQL3Vh9HOVS5rQ2YmF/jt8BxjUjxYklqREKHzXm9m5O5124/gN5ytI+
 T4I+mskOwVcVGhgHsZOffcKb44CwaG2Xjus0v+QN4eBYAE4WvuTdA466NvP7FimW3kYe
 G+cAT3LtaEwe81PBpYT1jXCLubomiRKgVWnyq3/AQq7BKD5SRkTMaZ9qhMiWAoiyMkPx
 9jPg==
X-Gm-Message-State: AOJu0Yz02YbKYw+Z7lqjHvkaWZiUYOvDiGtqoAkZj6+oGlFXZ4Fax2Ec
 hVuiuC8iNRBoaT99xPyQ+DtPIwj4ZMmMSO56X1Yn7WBhed8YI+GCyAqUNB0BmGE=
X-Gm-Gg: ASbGnctbf90kywEuNpOEY41sfKY+OKm3Jmym0KPpTX1graZqjivaN+jBYnp8e0nbrcK
 gzywZ+r1PvbqQGd/eYlwpKLEQmIbr13VSjksEpmEW/NkF/pXlBtVjEGJ1u/g3dAUOHoxuRqD5yy
 UdqpRHLXGNO+VRD4kp+wMzfQGPsxMZPqrNOZIj19GT0aFxm0rZ1AtmK92dkco/VeRgu0if+gAsC
 RIieunNqxMxNKZlhWusoQOjBzUU3defFm9eOoRNiMKAR0W+zCnxW8qlrUIzg/6lFtFrd09D1fEm
 VsaWTJwlnWwCigGEU5z5dy4C542lXIFlJg==
X-Google-Smtp-Source: AGHT+IHWv1T1QrCKQ3rCGtTL2Fli7W7bj8lpwfmcixpmcyV7O/Lug847niQfmhZhW044oun0nGokPA==
X-Received: by 2002:a05:6e02:1b0e:b0:3a7:c60b:ad90 with SMTP id
 e9e14a558f8ab-3c2d1e7df4cmr15821595ab.3.1734662340334; 
 Thu, 19 Dec 2024 18:39:00 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3c0deccf405sm6498695ab.29.2024.12.19.18.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 18:38:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Dec 2024 19:38:56 -0700
Message-Id: <20241220023856.3164047-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734662340; x=1735267140; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=096W0O1jJopRfbS3gAAx7QUFutWi2+tTs8OEdPkgyrs=;
 b=aHB2yHGhLtpYQpjD/pp9RC37fBmckw2wHxXDN624EskPb5MPYvI9apHc3uD+q7Pe41
 eM4S2oeXK3VOdlS5ndrfIHsiPtnw2MkG4HMStxTGYNqOhJBdKnP3i8VyQW/Gjs5dLx5w
 yie3tQ83SAxb6Pqh3kYjsqivVt+TRFmOOb5uRCQsbCOT25WBZPAwTY7LuS8TR2xE8GAZ
 Ji2jx3ocONiacZ4v5m2UpFcSZFHZLNamgJx41B6prM9gRglWMxiBY/mZdR9i8JXMyf5g
 +jQdg/4jz26moKTQUif5J0A8DrwxehCwkGCYh20XWUWPY/k+NfhI0UAd+2+ykYagV+aa
 rqPw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aHB2yHGh
Subject: [Buildroot] [PATCH 1/1] package/rust: bump to version 1.83.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/rust-bin/rust-bin.hash | 128 ++++++++++++++++-----------------
 package/rust-bin/rust-bin.mk   |   2 +-
 package/rust/rust.hash         |   4 +-
 package/rust/rust.mk           |   2 +-
 4 files changed, 68 insertions(+), 68 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 070a0b9779..94464c687c 100644
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
+# From https://static.rust-lang.org/dist/rust-1.83.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  5f02e00bca65f6eebafe2ac6b1bbdecb5f160f260a9c2231a51ed8d382f0ada0  rust-1.83.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.83.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  e36915f3a68d8da7166b49ad67d23d26efc79f38cf6a3db102dc022eb2ed1b0a  rust-1.83.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.83.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  2c5a825cc10b2a4e17856f594d5183db5bba5f40cfddeeef4481a6bca46893ff  rust-1.83.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.83.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  0bc62191ca5fb655c0535b8935d94c28b5b601187eeb80bcf4928f6bae820594  rust-1.83.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.83.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  7f4c28eef31ea4b1f09e8eafe745234370d09cf42badcce5a15da3c738e5b92c  rust-1.83.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.83.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  ce9308beb0bb54560921821934625b9cdee01d8e6d269e252e9aaf630330b773  rust-1.83.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.83.0-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  9b6043c0cbda239f74e874522816f5ac240cf78ca05c32f274bb1b7887be0cd4  rust-1.83.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.83.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  b6467a0e8a6c5dca35269785c994e4d80d89754d6c600162cc9146f90c87ee08  rust-1.83.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.83.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  8804f673809c5c3db11ba354b5cf9724aed68884771fa32af4b3472127a76028  rust-std-1.83.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.83.0-aarch64-unknown-linux-musl.tar.xz.sha256
+sha256  2bac2fe2411f56788aa82587eace49b469bf1b03e5dbb0ee8e3e2a1ba667ca11  rust-std-1.83.0-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.83.0-arm-unknown-linux-gnueabi.tar.xz.sha256
+sha256  421ca05ad0f66c4172d29c650856c1510b77ca32a8056070460abb9f43859428  rust-std-1.83.0-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.83.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  1d71e107b7cd96ad90e45fa402475c96ea9420290740be90168205137f3163ab  rust-std-1.83.0-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.83.0-arm-unknown-linux-musleabi.tar.xz.sha256
+sha256  da5a2f92006e579fafba77661e6e9c4660286fc5596bd5bfa632a442a7981ef5  rust-std-1.83.0-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.83.0-arm-unknown-linux-musleabihf.tar.xz.sha256
+sha256  81c42154aab83c0bb2e91d4d237fa833293b750c3154b68f6bed6749a195aa32  rust-std-1.83.0-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.83.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+sha256  16d270f5323ad986bc1daabc3ded7921d72ab60639ba14106ff491a345e48528  rust-std-1.83.0-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.83.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
+sha256  a400a3441011f082baf00afe03f2ea4f11aaf935bbee599be1e8d2ef8b8b991c  rust-std-1.83.0-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.83.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
+sha256  26a1a081da300225e68e05823ad027e078a35dc70be9d52f7d4243d1fc8286b3  rust-std-1.83.0-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.83.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  78e4778d461532e13323a8bdb08e203153f7caf2fede6a2b8ecc6114b4e08ebb  rust-std-1.83.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.83.0-armv7-unknown-linux-musleabi.tar.xz.sha256
+sha256  99a2846802dd0a94678e3393f58fc0f6a5144599911a119537849bb59952c401  rust-std-1.83.0-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.83.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
+sha256  220be1d117e7ec39239fd2e582674a9923e13ade5c4d606da06cd3657af09cb0  rust-std-1.83.0-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.83.0-i586-unknown-linux-gnu.tar.xz.sha256
+sha256  7948ff50f7e83a20deba9d4f55170f7e3b0d805e80049f38b19f41580a9d7bb1  rust-std-1.83.0-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.83.0-i586-unknown-linux-musl.tar.xz.sha256
+sha256  186b8846bc429f0714da6c95dbd41e9940dc0a4f26ff8b94982c19a311a1de10  rust-std-1.83.0-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.83.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  d6763f3ff18fa6da4455058fcb84ef19c2586fca02badab466200d90fa4184d4  rust-std-1.83.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.83.0-i686-unknown-linux-musl.tar.xz.sha256
+sha256  f3b0b203caaa4954de510d571cfa60c68eae1ea1253ae056574353e33d322580  rust-std-1.83.0-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.83.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  17978a56a8efef883485201dc701ed2ff13530511578da240840f12bdc55cb27  rust-std-1.83.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.83.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  adcefafca7a7b7ddb220d18e31afdfd4c547f87b1515e45098513b2d468043e7  rust-std-1.83.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.83.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  d39fdf0954e57fa9dd0763d58e7897bbb93265ab217e5fef14a11fafe2f706a3  rust-std-1.83.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.83.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  6a5467d1f4b8040f19c94ca332063cad57581d6cfd1f15543da5a67d4d244f70  rust-std-1.83.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.83.0-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  d1e1af8622d59c3351046ded96af4eeecb3db2f4f7527249eaf1acc917e3f2e8  rust-std-1.83.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.83.0-sparc64-unknown-linux-gnu.tar.xz.sha256
+sha256  e8684ba5d337dbb0594cdc8e4e8ffa11d7ac8e48b2f294019e042e341fa9a869  rust-std-1.83.0-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.83.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  c88fe6cb22f9d2721f26430b6bdd291e562da759e8629e2b4c7eb2c7cad705f2  rust-std-1.83.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.83.0-x86_64-unknown-linux-musl.tar.xz.sha256
+sha256  9086ad74419cf5194b414dadd422b9ce1311cee51d133d15e90be0c797fb3cd0  rust-std-1.83.0-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index c14ca7f88e..9cf261631f 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_BIN_VERSION = 1.82.0
+RUST_BIN_VERSION = 1.83.0
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 19af66e2d6..b753492f28 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,8 +1,8 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rustc-1.82.0-src.tar.xz.sha256
-sha256  1276a0bb8fa12288ba6fa96597d28b40e74c44257c051d3bc02c2b049bb38210  rustc-1.82.0-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.83.0-src.tar.xz.sha256
+sha256  7b11d4242dab0921a7d54758ad3fe805153c979c144625fecde11735760f97df  rustc-1.83.0-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 29c03594d2..08dda64849 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_VERSION = 1.82.0
+RUST_VERSION = 1.83.0
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
