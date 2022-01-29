Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BCEC433F5
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 20:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33FC8400E4;
	Sat, 29 Jan 2022 20:34:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w_eQkDOXoZ4r; Sat, 29 Jan 2022 20:34:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36D9C400F3;
	Sat, 29 Jan 2022 20:34:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F7EC1BF5E6
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 20:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DEF160B4D
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 20:34:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8SFTeBHWQYS9 for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 20:34:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4382460B4B
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 20:34:42 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id 9so12017617iou.2
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 12:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O+/QdGV7F90A+o+qCIwxKrtGN9V3J3tFklpR6zeIe84=;
 b=lYGANfmXEO/yrOAvbgWo9F+Ab3/guXHbehg9NomkW9chjoY3fGL70pHZFONnm6tOMe
 yOX/byge/eEpGSYqgPBDMeo9votoW8lZNPj6rutShDn8mAdhikRzeo0ntStCDoY1gGa9
 3nNHa9e8T1trojF+uNB6onaLOTpL56opOb+DxNWCXNqSu2D09rrnhjRgDzYuyqqX4IXb
 Wh3bnhACCagNkoAmoMI3OdLzCKjk3ywYF5Q+xV3Ibqu8ZFvvN2V9YR5zffFvxR6GO4ZH
 pi5I+khvse0KDFSKmw0gLo+hnsj4RjYt2SdzjEtJsjvWQFAp3A4tPD3TGAnvClshDBab
 V8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O+/QdGV7F90A+o+qCIwxKrtGN9V3J3tFklpR6zeIe84=;
 b=3oiGPiD0PfkO63WDJOrl/iPHL/pMN4A7kggkZh4BDOeq9L03MXIqngyyGcZxfxiNTA
 IUTCpmOilBTIzzLaaMmznJojZjlcqjC7C8sh8EjtmN0KrMpOCKiMFfbjieuQpKhDAXgz
 aO4KFjvXYGgd/Su0aNXE7Et9eqiZ6mm3p5XnsUw8HAQ17oYdQY3LqlY8UuR7Nu4D2DkZ
 UQUpHD05o9QyXOwjJzaYYBMqr4iWD6lwECgqo1IDPoxHXD3y53C5bDrztNJOvr8gtyyu
 i6sjfszYaOT3R7XJoxMhuElOY3JdMnIty/wJAc2eFQWDrnXdG5raRybbge92jtpENINd
 kPsA==
X-Gm-Message-State: AOAM533MXcCWPccczIcsKW2gWacHX7iq+X36AI0/VmPLWJIDVtVjqX2A
 JG1hjTIyku5HTRy7+cn5Uyq2wIFhYqE=
X-Google-Smtp-Source: ABdhPJy4s5EZ9cSS22b4xgXaCfI14A0JU8pUmKCtyRMSjKrALI2Uqj/iGK69DG6U1juiegLbnkWVQA==
X-Received: by 2002:a5d:9d1a:: with SMTP id j26mr8234877ioj.20.1643488481011; 
 Sat, 29 Jan 2022 12:34:41 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id r64sm12249056iod.25.2022.01.29.12.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 12:34:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Jan 2022 13:34:38 -0700
Message-Id: <20220129203438.3855797-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: bump to version 1.58.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/rust-bin/rust-bin.hash | 198 ++++++++++++++++-----------------
 package/rust-bin/rust-bin.mk   |   2 +-
 package/rust/rust.hash         |   6 +-
 package/rust/rust.mk           |   2 +-
 4 files changed, 104 insertions(+), 104 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index bdb1f07fcc..9f8788a295 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,102 +1,102 @@
-# From https://static.rust-lang.org/dist/rust-1.54.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.54.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256  9c3baf8ec849978b0206262fc402ac9d24fdb2a8ae7b5d785b09022dbdbc20e8  rust-1.54.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.54.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.54.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  9fb4a22b74120b81a4d896326b02d121d5f996b3288580c346ea55a52d8946a9  rust-1.54.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.54.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256  a1a77737d218087eb7d3613adcde2c9e383d758cdf128646a0ee63396145270b  rust-std-1.54.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.54.0-aarch64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-aarch64-unknown-linux-musl.tar.xz.asc
-sha256  9a7ff8e4cd160f6a58c3b5c7e679b7acdc427c2440ecc70a31a5dc71bbecd0c8  rust-std-1.54.0-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.54.0-arm-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-arm-unknown-linux-gnueabi.tar.xz.asc
-sha256  c87dc1681756c9c275eba690c6a05bcdd2ac3bd04a70ae039869dc85fff18b69  rust-std-1.54.0-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.54.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-arm-unknown-linux-gnueabihf.tar.xz.asc
-sha256  74c9f120ad8a443798ebec74302b5166a0880b13b1d8c43dde0c8ba70d9e4b2d  rust-std-1.54.0-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.54.0-arm-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-arm-unknown-linux-musleabihf.tar.xz.asc
-sha256  2a19d96cf9e863448b21ff989550da54080312ce99272128cc0eb3b1fe5c73cc  rust-std-1.54.0-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.54.0-arm-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-arm-unknown-linux-musleabi.tar.xz.asc
-sha256  481192a6906c44501f910a35fc49ed9b1b271925c4569a52f45d9efbc2058ae2  rust-std-1.54.0-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.54.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-armv5te-unknown-linux-gnueabi.tar.xz.asc
-sha256  2716f587d0da1dd26fc64251303f5705230f5b86e47e9af35e11622d01ceb963  rust-std-1.54.0-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.54.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-armv5te-unknown-linux-musleabi.tar.xz.asc
-sha256  b1f25af230f3b6fd930452024bd0cc9f4599bfb15f09f802cdb756effa516bbf  rust-std-1.54.0-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
-sha256  86549aca1b65188cedf3f1c8fce5af3d7f817450418367049d4bbe8c69ba1da0  rust-std-1.54.0-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-gnueabi.tar.xz.asc
-sha256  7823b95fc3fcd7cc47ba767e2e917c9efbafed2d5ad0b74e7c087600bd72e54f  rust-std-1.54.0-armv7-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-musleabihf.tar.xz.asc
-sha256  f9a650a3970dbc321e8979dd87ed02fd8f9d03901c3fb1a87724f3c214eb6e57  rust-std-1.54.0-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-musleabi.tar.xz.asc
-sha256  19a80cfaf18c15eaa1c112312c0cb0ccfd14179407118b35735cdcfc1cc4c60f  rust-std-1.54.0-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.54.0-i586-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-i586-unknown-linux-gnu.tar.xz.asc
-sha256  7c747dea305f5d4b1c6a23d064fbb41e24bb56f2917867020bb57cb064878dc4  rust-std-1.54.0-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.54.0-i586-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-i586-unknown-linux-musl.tar.xz.asc
-sha256  b52dd3d4ae465037ed2987e23457d30e1a75fd16c2c421613ec52c250947a5f8  rust-std-1.54.0-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.54.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256  e88269a37ebfbff52fcd07746c53fc0bfa2570531f10f226800d5783ce735e3f  rust-std-1.54.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.54.0-i686-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-i686-unknown-linux-musl.tar.xz.asc
-sha256  947054afa4d6e37c64e484c704b5f09043783b83aafbf7a00e6959442b1fc14f  rust-std-1.54.0-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.54.0-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-mips-unknown-linux-gnu.tar.xz.asc
-sha256  59c0bd07976f9e18e05e328e2f0acd9e99b736ea0330a03b313842e5c5816e13  rust-std-1.54.0-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.54.0-mips-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-mips-unknown-linux-musl.tar.xz.asc
-sha256  02611ec7a6d510572803b4bd9948f0790e9f0ae8e3047ff7fa465300346e3b74  rust-std-1.54.0-mips-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.54.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
-sha256  dba582de46b7f97ba85b2d75662482df67214e71e0b9cea3c9c153c9d371a00f  rust-std-1.54.0-mips64-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.54.0-mips64-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-mips64-unknown-linux-muslabi64.tar.xz.asc
-sha256  2e94aedf59369d81524dfe8027e6e4fb0fe338d2ee7869bd96e5cef24974cf0e  rust-std-1.54.0-mips64-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.54.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
-sha256  d1d32bc202b026470ec2c37826fef92bd91f46b08ed1e2620a50eadba03d7095  rust-std-1.54.0-mips64el-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.54.0-mips64el-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-mips64el-unknown-linux-muslabi64.tar.xz.asc
-sha256  25d0c06fb445e16d7aac3b5370b43e72600a2aee41fa06605f64a3b8a8ed0e4b  rust-std-1.54.0-mips64el-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.54.0-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256  626b4255d31c35fa77669471c15ec63b0e88726115538e598a6ef6e814d83bae  rust-std-1.54.0-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.54.0-mipsel-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-mipsel-unknown-linux-musl.tar.xz.asc
-sha256  0f4aaec3ef60ad3c017a39925a1627cc79cd5be00cc8ea7759a470c24b0b66e7  rust-std-1.54.0-mipsel-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.54.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256  116b2cd682cc5902f91a1ffbe2eb649262d871cd3c47e539afeb723513ae15eb  rust-std-1.54.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.54.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256  f0329a9d6c96eeb1db5cb7969dbadbab58768b8bff48a1ffc89103031945126e  rust-std-1.54.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.54.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256  c08b7df82a30acacb3afcdad34b3384e77a9f35ce6bef10d43f29f129fab35e1  rust-std-1.54.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.54.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
-sha256  8b9ac3e1947036d6f2a3939edd279631fc1b0a260507343a8b3e9ecd448fe738  rust-std-1.54.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.54.0-sparc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-sparc64-unknown-linux-gnu.tar.xz.asc
-sha256  6ce101e3c5b1bae6006c61a18dcb5685fe0ff57ea8c00a36e6bf95f748abe5f6  rust-std-1.54.0-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.54.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  a22e19859b3c5032daac1633637546a986c51bdfa3ad0db6e394e6cc461f466b  rust-std-1.54.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.54.0-x86_64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-x86_64-unknown-linux-musl.tar.xz.asc
-sha256  c2de24eb3e524c0fdd1e8116f578c103035da1ece1e4c06efab67999180eefe8  rust-std-1.54.0-x86_64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.58.1-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.58.1-i686-unknown-linux-gnu.tar.xz.asc
+sha256  110ca4967351d8535f3d39e24f40e2941c20346c5765d3530270e134ae50568e  rust-1.58.1-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.58.1-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.58.1-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  f71b077caf0becbd0af9fd22bc1fa31c4fdf7a21fe046da8a15a7bde1286da25  rust-1.58.1-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  c7a016ac63aeb5481d661ee3e680b57d35d5ccb902c605c32937a047a02cff49  rust-std-1.58.1-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-aarch64-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-aarch64-unknown-linux-musl.tar.xz.asc
+sha256  4c8d9774fb1f6cfa616f2c43395f438e887a38f0cd901a3886056cc1c1b84c30  rust-std-1.58.1-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-gnueabi.tar.xz.asc
+sha256  eb58c2b72e9bbe50c80e9f2981e14d737198f7e17a4cad524d00baefdfa3bc1d  rust-std-1.58.1-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-gnueabihf.tar.xz.asc
+sha256  58e3f4905c3e7028811971219a3222640f947062fb93dbe51c1674551e9b06a6  rust-std-1.58.1-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-musleabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-musleabihf.tar.xz.asc
+sha256  b354f0ad28d8cc7d5996d46c3a310c80aa6486ac7b89abcd1eeef7f13435e0ff  rust-std-1.58.1-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-musleabi.tar.xz.asc
+sha256  705fba2a50835354112ab86d1ee8889c39f3c7265d7ca26f1dffebaa463600a6  rust-std-1.58.1-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-armv5te-unknown-linux-gnueabi.tar.xz.asc
+sha256  0505759fa8b26c902a701f266db4bfbfe496de71c5c6548a55c562fe9d386485  rust-std-1.58.1-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-armv5te-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-armv5te-unknown-linux-musleabi.tar.xz.asc
+sha256  9ca8adb43b4e75556a99b6c7a9bc1d9aab894bbe109736c34582169ec81aee14  rust-std-1.58.1-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-gnueabihf.tar.xz.asc
+sha256  9f38bc3220d659ff482db9a0ace9dcb7051991d471149fad7bbb62fce8314e04  rust-std-1.58.1-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-gnueabi.tar.xz.asc
+sha256  1511c675d17033737ab2bd1e87b525aaf59e0455f5a717ab0a91fd849949164f  rust-std-1.58.1-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-musleabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-musleabihf.tar.xz.asc
+sha256  2cf8a8cc2441a1bb4b45b690c87fff4df975fac077240706c08594e26f901bdc  rust-std-1.58.1-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-musleabi.tar.xz.asc
+sha256  db86e823484f210884d7d815ffcd7dae355bba86e18151b0838ec06544bb8126  rust-std-1.58.1-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-i586-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-i586-unknown-linux-gnu.tar.xz.asc
+sha256  02bce02f929114cc60126410fceeab6c0bcc8b96c394de9516d8f449880cb585  rust-std-1.58.1-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-i586-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-i586-unknown-linux-musl.tar.xz.asc
+sha256  e80d5769f042a00388546dbd26cb40c045d5dddc84e5da3f98d174027ed9eaaa  rust-std-1.58.1-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-i686-unknown-linux-gnu.tar.xz.asc
+sha256  d7f2bc431db551ea9019a6d50d4e3f11e14fabbea3abec1478ac72a281309152  rust-std-1.58.1-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-i686-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-i686-unknown-linux-musl.tar.xz.asc
+sha256  c70fbb13aedfb88cfec8098355a155a4edce3d52f9b099bc033b7c7ac45aab00  rust-std-1.58.1-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-mips-unknown-linux-gnu.tar.xz.asc
+sha256  b678ac0282cbb1965f9a7485a1f56b01d0229f91ddff5a18a9628f86970f5902  rust-std-1.58.1-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-mips-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-mips-unknown-linux-musl.tar.xz.asc
+sha256  2f571f4c9b4e86e278539e811f495fb84f44898d4333b983a3d95ef5d2c0fdd8  rust-std-1.58.1-mips-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-mips64-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-mips64-unknown-linux-gnuabi64.tar.xz.asc
+sha256  7f2f613606f039eec83239753a83c227b1d3c39b6474647234e7788a1541e850  rust-std-1.58.1-mips64-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-mips64-unknown-linux-muslabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-mips64-unknown-linux-muslabi64.tar.xz.asc
+sha256  7283539843df5c8abd06b0ce3830efeab0d673447b45d3b6636d2eb296d28681  rust-std-1.58.1-mips64-unknown-linux-muslabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-mips64el-unknown-linux-gnuabi64.tar.xz.asc
+sha256  3d2935e0979a7150cc271481f5f06569005ee27f0a7ef7ed1a5393c3e34b1974  rust-std-1.58.1-mips64el-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-mips64el-unknown-linux-muslabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-mips64el-unknown-linux-muslabi64.tar.xz.asc
+sha256  33078d23ea70ca405b5938e5a2a74fbf4ec7dc41b729e4991e3e01d4c8370028  rust-std-1.58.1-mips64el-unknown-linux-muslabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256  fdade0d00dac3524348041ec915a5a96208c9c1929ce746ab6352d0d2897a3a7  rust-std-1.58.1-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-mipsel-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-mipsel-unknown-linux-musl.tar.xz.asc
+sha256  c747a00ac9a6ee70793002e6db2fbce3b2cd60eda277729468d18369736c6c8e  rust-std-1.58.1-mipsel-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  7813f825e5d10aac0ded4b3f785970c69c25464b4edcf9c2b83eff0e55ee95f3  rust-std-1.58.1-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  c68d93de3a46ec709788fee2c38a298a261d4254d299299195ab3474b316a59b  rust-std-1.58.1-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  a85f5f42918e8b140d7093ba49fc46a21625863538c95d2db03f831cc445f025  rust-std-1.58.1-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz.asc
+sha256  2d7276fe261478c377913177dcec3e0aeed84f2c567db0ae8e415efee7bb9ce0  rust-std-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-sparc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-sparc64-unknown-linux-gnu.tar.xz.asc
+sha256  7a7cd002c63179f3f47d64b1140c180986322a7cc0d31de61d7c4728cedacba0  rust-std-1.58.1-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  e72367c15906f021f46801652181c917cd3328be022b93bb30506724f7b56256  rust-std-1.58.1-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.58.1-x86_64-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-x86_64-unknown-linux-musl.tar.xz.asc
+sha256  b0d3e03c9b1eff6e241383913b02653ba80776626ca7c4a93f36c2ad829ba989  rust-std-1.58.1-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index bc8a485ac5..d4cb8f50ea 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_BIN_VERSION = 1.54.0
+RUST_BIN_VERSION = 1.58.1
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 30a348e982..7eb8f59603 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,6 +1,6 @@
-# From https://static.rust-lang.org/dist/rustc-1.54.0-src.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rustc-1.54.0-src.tar.xz.asc
-sha256  a2934f85f76a35a3796c0fefd31e91f5b6dd8377cd8c3769c1c10e7ce7a495f4  rustc-1.54.0-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.58.1-src.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rustc-1.58.1-src.tar.xz.asc
+sha256  2b3643a48e7087053b0268971ec4154350342508922a8acb0707aaf94deb4469  rustc-1.58.1-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 26ee2a9362..5fad7d404c 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_VERSION = 1.54.0
+RUST_VERSION = 1.58.1
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
