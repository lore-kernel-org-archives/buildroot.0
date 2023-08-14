Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 606FBEB64DD
	for <buildroot@archiver.kernel.org>; Mon, 14 Aug 2023 10:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D467416C4;
	Mon, 14 Aug 2023 10:25:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D467416C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D0JeaBgpEbmp; Mon, 14 Aug 2023 10:25:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D173416C6;
	Mon, 14 Aug 2023 10:25:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D173416C6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8569D1BF3BA
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 10:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DA1240A75
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 10:25:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DA1240A75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YQaLXQZ7SXKR for <buildroot@lists.busybox.net>;
 Mon, 14 Aug 2023 10:24:58 +0000 (UTC)
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E473340151
 for <buildroot@buildroot.org>; Mon, 14 Aug 2023 10:24:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E473340151
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-790930d78e8so132496939f.1
 for <buildroot@buildroot.org>; Mon, 14 Aug 2023 03:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692008696; x=1692613496;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2BWW0Bp/FYkarxAhnXrNjOpSj3nhtIvqpd+f1N52gWg=;
 b=BdVQdj9T/ywI94ZJtUmm7Sn8q0TF1qNqpMDYkIEnHn/uYjEcVIiF2OGDEjo191tF86
 t3LQEF6/x5nObt0PNVdAgKo2lbwHOske239xM/6tW8eVypNOnmGz2gkaNts6UcU+QPex
 Fo1tZ2h3vLTVhKzl/AOp2RvqwNN7PzOuJowzfDJeDW3jjIepYJ1EPoT5Rv4obP1UcEP7
 Y+EixqoDXQNzxHwPgsoM2igBCTmXfFcscl9v0VCC+uUODMLpHwgRQGJ7txa8z1Pp7plD
 4YqRYAip/vKWOQZKGuZThiQAu1zs+sQkzUAzxgt5LcfBJa8Ep/OY74SMVkZrPB6yt1rc
 m89Q==
X-Gm-Message-State: AOJu0YzdUy/FbSszwIAD/9Lk4Fynr1YyzfULuuYsy1oFs4FJf68fbBEs
 GRbGJptTT5/4QBsI/LklP57HPXQ5N3s=
X-Google-Smtp-Source: AGHT+IEvfC/lPAFa1kxohGWeC+XfgnyOnOj9Bqi0xEVOzbH3jGlcCLYcuADa6JTf88lGtjibcK9oxg==
X-Received: by 2002:a6b:f917:0:b0:783:4e11:76d7 with SMTP id
 j23-20020a6bf917000000b007834e1176d7mr11821036iog.21.1692008696122; 
 Mon, 14 Aug 2023 03:24:56 -0700 (PDT)
Received: from james-x399.localdomain (71-218-110-92.hlrn.qwest.net.
 [71.218.110.92]) by smtp.gmail.com with ESMTPSA id
 c24-20020a05660221d800b00783737db8ebsm3014912ioc.38.2023.08.14.03.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 03:24:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 14 Aug 2023 04:24:53 -0600
Message-Id: <20230814102453.102735-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692008696; x=1692613496;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2BWW0Bp/FYkarxAhnXrNjOpSj3nhtIvqpd+f1N52gWg=;
 b=eZHC6aJ+6wDXB9go9VJZ9SKvsjb8PCC7tVyBbfCtb9wE1D2GE+qCY6FdG1s3SpMljq
 c2HSzy73hKzZ28AEiz29NpSFExPEIMc3qRtSuab8Oia0zJY7g/4DavPdVWM1mcq8PYmy
 90faPn/co6OxiMBXadOiOl1DQDD2QKhtSsWbjVyYt7Sid8nH6p5uokVXQO8lcm2PfYf/
 +PPnCh/wLe0hjsROE4ShS9iyBdy7ywW/TlG0DvO6AIrtuJ2pMYlv8FL/9oKGZbsWvznh
 zhJYhqE6h7luFGkBqq36Fkeic/3J8WfsxOSVyV9odh0aX/Lwj3VLbwMJNfFbdhhiIgZo
 cKvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=eZHC6aJ+
Subject: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: bump to version 1.71.1
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

Link to Rust 1.71.1 announcement: https://blog.rust-lang.org/2023/08/03/Rust-1.71.1.html

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/rust-bin/rust-bin.hash | 252 ++++++++++++++++-----------------
 package/rust-bin/rust-bin.mk   |   2 +-
 package/rust/rust.hash         |   6 +-
 package/rust/rust.mk           |   2 +-
 4 files changed, 131 insertions(+), 131 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 211ac424ed..a11a964a90 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,129 +1,129 @@
-# From https://static.rust-lang.org/dist/rust-1.71.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.71.0-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256  9712efaa9c7977b6f03aeb3ef086d0050273f498790bf242e96b9a8117de901f  rust-1.71.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.71.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.71.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256  afd7148aaacdd38acb2f02ded9dd31c833d6f20d99f3f4b5617282295d2092d7  rust-1.71.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.71.0-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.71.0-mips-unknown-linux-gnu.tar.xz.asc
-sha256  bd0bcdb5fc5c4a9561de7b10361267a25e623de02c65734e76ee904b816f6a56  rust-1.71.0-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.71.0-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.71.0-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256  f76bc0fdd382d5064d69e5888bcf81312e5ee2b0a700a7a54f240e7c5090bf5f  rust-1.71.0-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.71.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.71.0-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256  c0a31776d8d1ea351cf40c02e1cfa0ed05f3bcdcdd8b203a87447b31fd2bae30  rust-1.71.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.71.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.71.0-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256  90a4483ba3aa1e3eea4660fbdddad31b3b43fe89458c1d9805b22dac6136abe7  rust-1.71.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.71.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.71.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256  1cdfccb28bed3ad6b0204e3773e3aa43a8687d1740dcb3dd21b4b37ae5308ac1  rust-1.71.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.71.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.71.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
-sha256  afa670835f244adf06486fa5966e106366b39817d7bbae18504cb6767208ebe9  rust-1.71.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.71.0-s390x-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.71.0-s390x-unknown-linux-gnu.tar.xz.asc
-sha256  a632cfda657b105c0355ebd575d54ef2e931827befb3e098098b7c3fba085f47  rust-1.71.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.71.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.71.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  7ae6cf3686f7638c8263d6d7aba68e275edee4e4d832723c603ddab96e330fa4  rust-1.71.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256  58542a0ab1162ce05a45eb751793782dc24c5bf8eb9a7467317f254260305ea6  rust-std-1.71.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-aarch64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-aarch64-unknown-linux-musl.tar.xz.asc
-sha256  759567c0e070a686a593e163c72aeda9e17eb85e783d00d0d5f5642471c65ccc  rust-std-1.71.0-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-arm-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-arm-unknown-linux-gnueabi.tar.xz.asc
-sha256  fdf359b745d750aeb292a59676ed31acd5ddcc74fb6e987b9bb51dfbf466f3b6  rust-std-1.71.0-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-arm-unknown-linux-gnueabihf.tar.xz.asc
-sha256  452fda324514d5c2431a6c66f376a1369b7199cfa0464f8e669af3b196dabccc  rust-std-1.71.0-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-arm-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-arm-unknown-linux-musleabihf.tar.xz.asc
-sha256  43a64dc0a6711802bd9de917a17b17e12099d4d7ed9478c5d86b9170ff104ed3  rust-std-1.71.0-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-arm-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-arm-unknown-linux-musleabi.tar.xz.asc
-sha256  774b5f95730179ed561cb4937b6e7813d0424a6ada69ebba45f240fed61c3165  rust-std-1.71.0-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-armv5te-unknown-linux-gnueabi.tar.xz.asc
-sha256  9a3aeefbf7dc6eea4e7f437878f0e1af161963ed45b7979581014a0d8bd6602e  rust-std-1.71.0-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-armv5te-unknown-linux-musleabi.tar.xz.asc
-sha256  33533c29f7435837bc3c274e11eb5f538a9c56eae3bac0ae6c682aeab56bb53b  rust-std-1.71.0-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
-sha256  7f03a6caa03353da24851da5cd7ed8d07394d7134de680174ee7877302aa6f79  rust-std-1.71.0-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-armv7-unknown-linux-gnueabi.tar.xz.asc
-sha256  fda8b435939f48364b879981d913df16b10c2951d143da4bbc60e49e013c7ddc  rust-std-1.71.0-armv7-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-armv7-unknown-linux-musleabihf.tar.xz.asc
-sha256  f4ce3c4436ab691e979e012bab626062c3f14b3fc798dc26b5dcbd1344a85e2e  rust-std-1.71.0-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-armv7-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-armv7-unknown-linux-musleabi.tar.xz.asc
-sha256  1db88e655caa1e4af31c7104de50339d9e8a53fb92f23cd302263cea934d6f79  rust-std-1.71.0-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-i586-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-i586-unknown-linux-gnu.tar.xz.asc
-sha256  5878f641f4e5a12ced79d2f0d5d9a9d5b0b97b56967684cf09357162c3e6a7b7  rust-std-1.71.0-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-i586-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-i586-unknown-linux-musl.tar.xz.asc
-sha256  2f62eb58d29a24a8a0d1c8f8b314e676b419cd6d324c02ed63af14954c57467d  rust-std-1.71.0-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256  46976bf8297efc65556ccddfec395d5327fbe303f9dabffd104628a37cb1de6d  rust-std-1.71.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-i686-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-i686-unknown-linux-musl.tar.xz.asc
-sha256  fa84fb37715f10075060cb4c9acf39dcc568b58b155ae1cbc913334b93423dac  rust-std-1.71.0-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-mips-unknown-linux-gnu.tar.xz.asc
-sha256  a259bddfc3ee36279b016ebd2682fc5b4d1b93c63bed6e4f57b5a2963d661dc9  rust-std-1.71.0-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-mips-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-mips-unknown-linux-musl.tar.xz.asc
-sha256  25f020e04a18e67bf98751c9f80ac07abfd298264d45d1228d66d2fc21c6c681  rust-std-1.71.0-mips-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
-sha256  1af97099a18357a0c36d6c4e6ace4973cd60186d76ff115ea14f6b031f86d7da  rust-std-1.71.0-mips64-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-mips64-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-mips64-unknown-linux-muslabi64.tar.xz.asc
-sha256  5d469176aae820868d4f86889621a371670d7ca2c860708f625da36b612ae4ab  rust-std-1.71.0-mips64-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
-sha256  d95d52c63989d80c9284d33c6db438763426c18fc814357de3e2c0ffc0f202dd  rust-std-1.71.0-mips64el-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-mips64el-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-mips64el-unknown-linux-muslabi64.tar.xz.asc
-sha256  103e5ac47a362f6db324eb08673f2b54ab041428585d5f3b9e991846f709b840  rust-std-1.71.0-mips64el-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256  ad91d662c93e5092367048c8e717f64a5096b876623e5fbc3c791b2d1f868dfb  rust-std-1.71.0-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-mipsel-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-mipsel-unknown-linux-musl.tar.xz.asc
-sha256  9dc87b5807730e6a69c2bfc167d93599c6dd481fe5189ce1e395787c432d4353  rust-std-1.71.0-mipsel-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256  fac6cc57d8a922423db2f0239b8484df3b029d0b58a63676868de682680bbf87  rust-std-1.71.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256  628957fbe1f8665578167c6814486941f7b04417dce8a499cababa3284a2260a  rust-std-1.71.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256  3ce73e032232522cd7c37e64b1e8895f16ddcef02b1646d078f67bb36b6c1494  rust-std-1.71.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
-sha256  bf692cee46d6c04c3993795633fdc5d4c1dffa7e4d4924227fa3e044872440a4  rust-std-1.71.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-s390x-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-s390x-unknown-linux-gnu.tar.xz.asc
-sha256  4ceab97a7c15e1235aa099306798e1eb8620aad5477b7123dc9e343bb9a6fcfe  rust-std-1.71.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-sparc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-sparc64-unknown-linux-gnu.tar.xz.asc
-sha256  679ef3ee4a3876f071e08539734de2fabfcc3410977e8c20ba685bc9f40a693b  rust-std-1.71.0-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  98ae6530c3a41167e9d93d11ea078be98a02f6d809a06d0d51af3ce0f73150d7  rust-std-1.71.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.71.0-x86_64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-x86_64-unknown-linux-musl.tar.xz.asc
-sha256  c91408683fe0918732525ec1e70263d3fc871ec8d15ae98768a1c6d7b9e3bff1  rust-std-1.71.0-x86_64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.71.1-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.71.1-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  911f2370b67b066cefd2ee772c5219015817e2c2dc327351f8b00c5ca7a1098f  rust-1.71.1-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.71.1-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.71.1-i686-unknown-linux-gnu.tar.xz.asc
+sha256  c8ec5dcb8f59276d46360ed832fb428d212985fd5b2b0591e6f70a279d10274f  rust-1.71.1-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.71.1-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.71.1-mips-unknown-linux-gnu.tar.xz.asc
+sha256  64f3189a2c55a8c7323e344c891d07637448454a10fed6dad5f7744f25abea94  rust-1.71.1-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.71.1-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.71.1-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256  8f35174620db211a99743660c7eddff1b41ad2d4c80787d4e6c808d548bdf3b7  rust-1.71.1-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.71.1-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.71.1-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  ec14ef19f8929029435f5c0f9ee1c92534454e03369767968c0353fcd7b41791  rust-1.71.1-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.71.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.71.1-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  a03ad9d193960a2303269d98cd99f9f27990eb3874e76396282a49347c048085  rust-1.71.1-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.71.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.71.1-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  be14d5e2978f72e2607d7d6611f7e4066e772a46e0effa97862a60ee51f9afa8  rust-1.71.1-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.71.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.71.1-riscv64gc-unknown-linux-gnu.tar.xz.asc
+sha256  b2a0562d547a48ed6279a1594ca2a489ee34c08dc4181b1117b900bc2f4ccfc9  rust-1.71.1-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.71.1-s390x-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.71.1-s390x-unknown-linux-gnu.tar.xz.asc
+sha256  ba282d429013028c45ea14ea4d909c3a1bb5ef2f57bca1dda7b436216554977d  rust-1.71.1-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.71.1-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.71.1-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  ee205c9ee095ee5a9382332422b0be2bd2737451c6dd6e24cb2a28cec16b97ac  rust-1.71.1-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  232afbb1b8673694742eba6444ee7c70294ca6da285cdeef9d43acd3f4c58ddc  rust-std-1.71.1-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-aarch64-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-aarch64-unknown-linux-musl.tar.xz.asc
+sha256  347af135014822d0f191241457ee1fba28ee85285bc26881c5137989fcb0fa53  rust-std-1.71.1-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-arm-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-arm-unknown-linux-gnueabi.tar.xz.asc
+sha256  68c51ede38dc74e6adac606ddba7d688b4f5f9df058e922916af73cd59b17379  rust-std-1.71.1-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-arm-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-arm-unknown-linux-gnueabihf.tar.xz.asc
+sha256  4720dee4efe1cbcf7c21ba3a5806dbfb6f7f04e67dec1a79c3fd61d5fd2deea3  rust-std-1.71.1-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-arm-unknown-linux-musleabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-arm-unknown-linux-musleabihf.tar.xz.asc
+sha256  d1746b00db5d0ad09749e5a93740830a2850bcbd726b2e96d44fff06a2c72f6c  rust-std-1.71.1-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-arm-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-arm-unknown-linux-musleabi.tar.xz.asc
+sha256  21533a39478f7484e22d733154405dca2842e2ad0f38cb1f53d6edbe85bb6e2d  rust-std-1.71.1-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-armv5te-unknown-linux-gnueabi.tar.xz.asc
+sha256  9a5b0aa20ab0f1951af9ba79df9e28d2cd57612f1d309e8210d2c24334d8332f  rust-std-1.71.1-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-armv5te-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-armv5te-unknown-linux-musleabi.tar.xz.asc
+sha256  aa8dbaf140b357c392ea2364b2d22a735900ca2d0d6e609c85b94666725c4999  rust-std-1.71.1-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-armv7-unknown-linux-gnueabihf.tar.xz.asc
+sha256  7f3816824948a017135d5c58aeb97df962f2e60575a18f18967eb473e68c7cdc  rust-std-1.71.1-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-armv7-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-armv7-unknown-linux-gnueabi.tar.xz.asc
+sha256  030a8ad8e5b794c5ca265a8837c46da442acae7c1ad2c4dfb61e9f751ddcfa1e  rust-std-1.71.1-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-armv7-unknown-linux-musleabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-armv7-unknown-linux-musleabihf.tar.xz.asc
+sha256  66a7c87d9a78fa4799eea5c73d885c4e6da17608d1f8e13823b298d82310ccca  rust-std-1.71.1-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-armv7-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-armv7-unknown-linux-musleabi.tar.xz.asc
+sha256  afb5e6f523ec8b0ffc033942af53c4f60e564122f85af4e405b4c4ef7643f182  rust-std-1.71.1-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-i586-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-i586-unknown-linux-gnu.tar.xz.asc
+sha256  a8bead93f5260c81f7a6795a29e8365ac30b966e7808c4957a4bd37843ab4e80  rust-std-1.71.1-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-i586-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-i586-unknown-linux-musl.tar.xz.asc
+sha256  7314624674c9817de083c0e88ea8650d839273a55f03de2e6f037ba64309d477  rust-std-1.71.1-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-i686-unknown-linux-gnu.tar.xz.asc
+sha256  672811c88fd5ffc5185d40eeecc7d257aeff47c9b48e0ced70ccea1e2559b273  rust-std-1.71.1-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-i686-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-i686-unknown-linux-musl.tar.xz.asc
+sha256  5d214864c9c62ea65e460e75ea65e2313b5b68a9db11f1c30edf271c8b041097  rust-std-1.71.1-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-mips-unknown-linux-gnu.tar.xz.asc
+sha256  e4348549904d9fff3f4d5608464d463815b8f47a3361927cf87458b4daf6b093  rust-std-1.71.1-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-mips-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-mips-unknown-linux-musl.tar.xz.asc
+sha256  e9d3caf95d111029f6a882ed2ca322a7d2c182e4c094a1f383725ae1aa980707  rust-std-1.71.1-mips-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-mips64-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-mips64-unknown-linux-gnuabi64.tar.xz.asc
+sha256  c3185d57e96832d1a6c5e48e83e75698a46a49675432a367ecd0701c481d1280  rust-std-1.71.1-mips64-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-mips64-unknown-linux-muslabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-mips64-unknown-linux-muslabi64.tar.xz.asc
+sha256  6f5549ff40278b8baa84c203730d348fff94aef20372c28fd373bc55acf99a3e  rust-std-1.71.1-mips64-unknown-linux-muslabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-mips64el-unknown-linux-gnuabi64.tar.xz.asc
+sha256  c6cf211aa291e09115fb08a96070deb1c9b292ef21e4263ee80e168eb66c675f  rust-std-1.71.1-mips64el-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-mips64el-unknown-linux-muslabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-mips64el-unknown-linux-muslabi64.tar.xz.asc
+sha256  9cd1a7b2364d6af230e96700bd6b631b7f8dcfc3bad0feffefdf9ca6ce1df79c  rust-std-1.71.1-mips64el-unknown-linux-muslabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256  05eb744705ac17a1b21693891219051ffbec05f2bc2be84f1eb4c5d1573f1b15  rust-std-1.71.1-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-mipsel-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-mipsel-unknown-linux-musl.tar.xz.asc
+sha256  4fb95536ff01b04f57cd14eebb57043e7d420aabce4b0b5beb3133f3a9844fa4  rust-std-1.71.1-mipsel-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  8a5e93d9a106c90d658b88c8ded15b8d2446d3d6316f5d477b3b259b62119d7c  rust-std-1.71.1-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  73d80d654f0b04a7b05168d08322ea9e4cc3bceeb8546cad5f398f8bbdeeddf5  rust-std-1.71.1-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  949c3d340674aac746a0278bb90707b179b95afe37200a61f05c56e8bdfc9060  rust-std-1.71.1-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-riscv64gc-unknown-linux-gnu.tar.xz.asc
+sha256  dd8399582595bc449aee5c7c7fb5d8061338be36583404a82e2d9e5b20743dae  rust-std-1.71.1-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-s390x-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-s390x-unknown-linux-gnu.tar.xz.asc
+sha256  60275c7d1a36abec87bf6e151d908a04e5cd28d22215fe0098caa4342f1c30d0  rust-std-1.71.1-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-sparc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-sparc64-unknown-linux-gnu.tar.xz.asc
+sha256  92e46ba59c0f402691a810a6b57136ebccbcfab4beefb0ccfca55e3fb288180d  rust-std-1.71.1-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  31f392df564850d78be80adc625b06a3964a49ef5c519075b930f2042a422264  rust-std-1.71.1-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.1-x86_64-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.1-x86_64-unknown-linux-musl.tar.xz.asc
+sha256  20667738a9005dda0386c8b6e59d55ce3044be11f78002f6640ca874d6911483  rust-std-1.71.1-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 2336887ae6..db31e26a70 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_BIN_VERSION = 1.71.0
+RUST_BIN_VERSION = 1.71.1
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 7940ce09a5..59270e1957 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,6 +1,6 @@
-# From https://static.rust-lang.org/dist/rustc-1.71.0-src.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rustc-1.71.0-src.tar.xz.asc
-sha256  5814699031aafdcc2e2f71fc9b389678cd7042350d1583da061463d8e88681c7  rustc-1.71.0-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.71.1-src.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rustc-1.71.1-src.tar.xz.asc
+sha256  371af0fbe04051e20a74dbea6d4e4e548f10f15309c49cae2688afb882b6c7f1  rustc-1.71.1-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index d2625318fd..a55bc447f4 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_VERSION = 1.71.0
+RUST_VERSION = 1.71.1
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
