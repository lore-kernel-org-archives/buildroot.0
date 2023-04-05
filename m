Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFF2C77B6C
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 22:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24DD84052F;
	Wed,  5 Apr 2023 22:27:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24DD84052F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0hK3TX0btBe9; Wed,  5 Apr 2023 22:27:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BD7D405EB;
	Wed,  5 Apr 2023 22:27:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BD7D405EB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 148531C2BE5
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 22:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E91606143F
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 22:26:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E91606143F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FNaYlpzdW4Te for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 22:26:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A643161438
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A643161438
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 22:26:56 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id e13so16587015ioc.0
 for <buildroot@buildroot.org>; Wed, 05 Apr 2023 15:26:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680733615; x=1683325615;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rcXTCcwKKRB9K7Q9PQtMsqVMl9ueaZ5Tnky/iltJnwY=;
 b=3E/U7Tt6OSUGbabTMI9rH7FqNst97nuK0SWkWm8vLYo4nBo3FQeIP2V75XhL64JUOr
 p2JZ4k8aExZK1WZMEkNHkj8N0zRbO6blcJH8LFfxOT1iOLcA9bIZSxppu7twCMhvFA82
 xBydSP1exM+8Oe/IKq+k+ocHUCIfrIOoH8n6oMOIkRC+AwtKCFmstQpcqPZsBiXwkSjs
 oPAe94ii1z9xqMDym+ckdZ+O5KRNeIUHmeobl13od9PQ/unm5PP0nvP0Rf993bCdtQp4
 /6ppNJpMYl5Hd7EWSU+HQ1eVeD5EkXG8WR+BnKXcD5lGjVqwFtnrTHP4U5Pfla2hEYLX
 xmTA==
X-Gm-Message-State: AAQBX9efTUktupYUzdhDFpqITCB+p6938Vg1hWdy2bzwZW+9BEtm9zlE
 Qi9GVis6uuGh/1siOH1pGT8OZlQGBwpkhw==
X-Google-Smtp-Source: AKy350ZoczwJZaY2ymB0bJnonzQZ8rTmF2mG5kQbMBu+OaEOIdHuGhNWHrupI3oQLKFvFmiJlGKl6g==
X-Received: by 2002:a6b:7e45:0:b0:759:310c:2684 with SMTP id
 k5-20020a6b7e45000000b00759310c2684mr6211932ioq.0.1680733615035; 
 Wed, 05 Apr 2023 15:26:55 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-106.hlrn.qwest.net.
 [71.33.131.106]) by smtp.gmail.com with ESMTPSA id
 f18-20020a6be812000000b0075970bbe68bsm4158327ioh.45.2023.04.05.15.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 15:26:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  5 Apr 2023 16:26:53 -0600
Message-Id: <20230405222653.24268-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680733615; x=1683325615;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rcXTCcwKKRB9K7Q9PQtMsqVMl9ueaZ5Tnky/iltJnwY=;
 b=pg4U9gOshnoifFp/4GhB65WJj/niR0z5ZhDPkWE88Ty2W1m0w63YI66PxiWlN0MjF0
 7hRSX1MRkG/TRI44zESXPBxkq+4PudV2r1ihMeQztrz/+CEwtCxDFF5lD+0VHt5yZgk1
 d58hwckBMS9/A6Anb+AkJlPv5xMhdnTzE/wn1cP/JRppNGzjGYS1gf8fxGsogjrIYOuC
 az2cadK7Yk2GfBvaBPDwmeQECK4m74QUQfIgED4JEDA+F/DC5y/YVZjWqTsY3LP6v00O
 D3pw6kmVBrYhz90ECd8IBekBZE8BY+ZtC8fLjiEXsYJLuxLPIivnU5ivVKWCnzKTSFB2
 kBew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pg4U9gOs
Subject: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: bump to version 1.68.2
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

Link to Rust 1.68.2 announcement: https://blog.rust-lang.org/2023/03/28/Rust-1.68.2.html

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/rust-bin/rust-bin.hash | 252 ++++++++++++++++-----------------
 package/rust-bin/rust-bin.mk   |   2 +-
 package/rust/rust.hash         |   6 +-
 package/rust/rust.mk           |   2 +-
 4 files changed, 131 insertions(+), 131 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 1b7d153833..4cb1f0c1cd 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,129 +1,129 @@
-# From https://static.rust-lang.org/dist/rust-1.68.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.68.0-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256  79cb5c840e44d0e3623335e59c2849dd73e0048fc6f97f2d351e88b0bd85040a  rust-1.68.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.68.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.68.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256  650b7cd7a13e4739de39e7e89c534600cfb33afdc6d7774b87ed64e5b7cd17a3  rust-1.68.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.68.0-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.68.0-mips-unknown-linux-gnu.tar.xz.asc
-sha256  7d0aab2e137295af67b77146c2a95f90fe98ee7bd4966ad0c22d2e02681bdf99  rust-1.68.0-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.68.0-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.68.0-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256  aa56fd4432f100a9af4b4376adc112555d2b29d4673602374ae04d961ba778be  rust-1.68.0-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.68.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.68.0-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256  ca4f14022c67caef7813e9a02875c49ab431d2b6657f83966011c6f6577a34e2  rust-1.68.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.68.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.68.0-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256  6730365b822d588f7132d6416a94edd61767f49d31c8777448a734f03bff9375  rust-1.68.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.68.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.68.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256  46e28305a69af20b7b6e8888a2b98656428d28e0906e71b4be1d0089f0f9032b  rust-1.68.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.68.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.68.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
-sha256  f66202760b26b66169f8b923dbc72bdc7eb78dabe687d78397ce73de44165edd  rust-1.68.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.68.0-s390x-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.68.0-s390x-unknown-linux-gnu.tar.xz.asc
-sha256  bdf82d1046f16188b11afc19088057f2ad096101d995ac7edbbbd632af199b84  rust-1.68.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.68.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.68.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  183d53f7488095550788fe38eff80542d68e6bd92ee48442d2ce0bd60a7eceaf  rust-1.68.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256  caf2385d507d6ce3f3550bd41e5c2be95053564b76851fc5920b9770a1e6046f  rust-std-1.68.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-aarch64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-aarch64-unknown-linux-musl.tar.xz.asc
-sha256  90e19eb15fd5b1f206f33e6f50a00ab5785aa5600ae7ccf5787ca64aec63f85f  rust-std-1.68.0-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-arm-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-arm-unknown-linux-gnueabi.tar.xz.asc
-sha256  40714404769bfa989c2da9f24e28cdfb8395ec8993bbec1544e2bba6030d0d3f  rust-std-1.68.0-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-arm-unknown-linux-gnueabihf.tar.xz.asc
-sha256  f455a4c19db7a548571405a591c76b3087995f58f529010b2e6c3e4bcd6ce49b  rust-std-1.68.0-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-arm-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-arm-unknown-linux-musleabihf.tar.xz.asc
-sha256  9eab35245a3193b8242b5ed08b896c8deeb3197c013134783d7062fa992213d0  rust-std-1.68.0-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-arm-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-arm-unknown-linux-musleabi.tar.xz.asc
-sha256  c0e2c4f1ff860f6073870901cde9aee61eb39932cc59d7a320760874505da4f0  rust-std-1.68.0-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-armv5te-unknown-linux-gnueabi.tar.xz.asc
-sha256  d7f562e6f3071972fc54ab1c8e35bf9c464376c43b1039d6bcfc602a3a997302  rust-std-1.68.0-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-armv5te-unknown-linux-musleabi.tar.xz.asc
-sha256  41a6db7397757390dd53e2806c244159d3b8755957fb5c464df31fa83e982e66  rust-std-1.68.0-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
-sha256  07a41cdf9bf8e0a42018f550c0c535afd0b0bbe967f5de13adab965170903aca  rust-std-1.68.0-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-armv7-unknown-linux-gnueabi.tar.xz.asc
-sha256  a6baaf8a3409b2601134d0a7035b5f764472954b29a978543aba97e5413920c1  rust-std-1.68.0-armv7-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-armv7-unknown-linux-musleabihf.tar.xz.asc
-sha256  f18851de6f979076b94d399a4e2d5553a9251444a7cb3d4dad59d568f177e084  rust-std-1.68.0-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-armv7-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-armv7-unknown-linux-musleabi.tar.xz.asc
-sha256  50897d7bcfbd3f30d4552fd87bed46e3886beab9963bbae90aca8cc7ef9fe2d4  rust-std-1.68.0-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-i586-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-i586-unknown-linux-gnu.tar.xz.asc
-sha256  6cf446799b6cb659da932dd7c2ffcbd028b86f28db89771d7f4485e939ec9bc2  rust-std-1.68.0-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-i586-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-i586-unknown-linux-musl.tar.xz.asc
-sha256  7458325c76d82cffcde5cbecdacafe0d8f62d650ba711c0153bcca0d0d83bd0e  rust-std-1.68.0-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256  a6ea604be18d30e5c41e53bb41486d3bddc0c7289056895127d93ad6fb30691c  rust-std-1.68.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-i686-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-i686-unknown-linux-musl.tar.xz.asc
-sha256  ceb9f340ec4b57e3d12885f7a35a9bbf510d3aa70311d5a656db1893650e2187  rust-std-1.68.0-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-mips-unknown-linux-gnu.tar.xz.asc
-sha256  1fdf0323e24442c990c8f59142225c3b0e1ab8c666d7aac34158dc26c6905004  rust-std-1.68.0-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-mips-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-mips-unknown-linux-musl.tar.xz.asc
-sha256  03b1cb375241aab01b36261193f47737ffc05038a5dfb34de879c8300c9c722b  rust-std-1.68.0-mips-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
-sha256  1e3e1382aad0582e57bef856d35c79a69a0c9141dfa26a2642f053add57aaf0b  rust-std-1.68.0-mips64-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-mips64-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-mips64-unknown-linux-muslabi64.tar.xz.asc
-sha256  d69d196cc73ed629bc9bf7b76556463f3aca8318729b380fd4a23f1dbea2a0f5  rust-std-1.68.0-mips64-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
-sha256  14aa5d7813239667fc111fb378243a888b3a2b0a1960a40ab7901476bb5a7abe  rust-std-1.68.0-mips64el-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-mips64el-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-mips64el-unknown-linux-muslabi64.tar.xz.asc
-sha256  95bf115ca743f1379b1fbf052202c1dfc8ea1eb6dbf82e0ee8eafe77a9f60cca  rust-std-1.68.0-mips64el-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256  c31ce8298655750e493c7065512e858cdd60457c3db855e154dc9f9d3140fe48  rust-std-1.68.0-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-mipsel-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-mipsel-unknown-linux-musl.tar.xz.asc
-sha256  3e0bd2a95b94848c887930d27821e9de4c1963b5d4d0b2fea28e06e80cdc422e  rust-std-1.68.0-mipsel-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256  1047a97e42079562ec685e19af6fd817e860eaf847cd4b3f1486a949af810a7a  rust-std-1.68.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256  a446a6445fdb536e1ca1bfe4233b7bf0f808cee00c043cc1ae6e06f3e59d3f2a  rust-std-1.68.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256  d9561344d71ea49491f6e9ea9913c93824fbac6b51319d1559ab2a432ca01ba3  rust-std-1.68.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
-sha256  aaf5f145be482ad21ab3af0552a5ad3e2968430e08dbf62011228532bc45237d  rust-std-1.68.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-s390x-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-s390x-unknown-linux-gnu.tar.xz.asc
-sha256  89398529b7cbeed722fcb263c45b94a46a37ce9a446036f5e5af6101acb520cf  rust-std-1.68.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-sparc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-sparc64-unknown-linux-gnu.tar.xz.asc
-sha256  244f488ffbac717768cc800b25d6142409160e2ec9e899748b696d9f1845bc2d  rust-std-1.68.0-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  566f4e83e96e8e141d3444a09a014a3a69c786b3eef122389747eaaf4c1525b5  rust-std-1.68.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.68.0-x86_64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-x86_64-unknown-linux-musl.tar.xz.asc
-sha256  5109c26489ad6f316b8f5b953805b83c21f21f3a72b443704029f11ebe539b8e  rust-std-1.68.0-x86_64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.68.2-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.68.2-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  1731add9b04d0fcbd096b610a67e1b1ae5740ce1171dd904d944ff504a84bcc7  rust-1.68.2-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.68.2-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.68.2-i686-unknown-linux-gnu.tar.xz.asc
+sha256  cade060a15c5064763cd67ebba418989cdbdfb1dc4b6fe8dd4310f187540f66a  rust-1.68.2-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.68.2-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.68.2-mips-unknown-linux-gnu.tar.xz.asc
+sha256  a453eca326c676d6b6deda8c444dfc30288d2ccf66bcbad3fafbbad2d4dc9506  rust-1.68.2-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.68.2-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.68.2-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256  80694caccab8903456de2b09fce15458e2aaa6dac97e706051a7aaa2df069dd0  rust-1.68.2-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.68.2-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.68.2-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  1cda60a097c983a5da0564aac365b6edb59452ac8474dbb48575c34ddaa1f8d4  rust-1.68.2-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.68.2-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.68.2-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  8a0062a66a6deedddb47778e3092dddc32a934c3127999a1abde6ff2a39ae7f1  rust-1.68.2-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.68.2-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.68.2-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  5e305ddc26861daa1516e1eba53ac3372506351950dbf5ada492a7f2fc65cfe5  rust-1.68.2-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.68.2-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.68.2-riscv64gc-unknown-linux-gnu.tar.xz.asc
+sha256  198054527500cb57cc8cad5b24c56e8ab1df6b48ae85b7c41a6ddbf2e008eb00  rust-1.68.2-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.68.2-s390x-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.68.2-s390x-unknown-linux-gnu.tar.xz.asc
+sha256  5039fde5d70691cecd21449b543967db6590ddfd2d4b3c2064924bb154866e72  rust-1.68.2-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.68.2-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.68.2-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  7f0f19d50f32a353ca78bc5d6d7c483efeced684e2c37ff847e4fd9699c7e063  rust-1.68.2-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  cbe60945af743804be6822704f986c812dd1fe1d167602aec5350a8f519f9861  rust-std-1.68.2-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-aarch64-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-aarch64-unknown-linux-musl.tar.xz.asc
+sha256  718c073d24f3627750049bb74420f90d1ac29843ca16933e11aa301a806a0b10  rust-std-1.68.2-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-arm-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-arm-unknown-linux-gnueabi.tar.xz.asc
+sha256  59da96890b0a2881799b21a3f49e51f730d67b8dc09b87602dd599e8f980e247  rust-std-1.68.2-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-arm-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-arm-unknown-linux-gnueabihf.tar.xz.asc
+sha256  565730a2ba02357251f9805b5efe0423adf5411892e0d01cf441456234f81e70  rust-std-1.68.2-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-arm-unknown-linux-musleabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-arm-unknown-linux-musleabihf.tar.xz.asc
+sha256  4ea9588934eec3d83bee2789f3a15b48aaea05fc8ec1bc175951ec1d0eb6ed22  rust-std-1.68.2-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-arm-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-arm-unknown-linux-musleabi.tar.xz.asc
+sha256  fd065db4269b5131c2f52638b8f30d0159109850c74c87bdf4c623dc0b32d5c2  rust-std-1.68.2-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-armv5te-unknown-linux-gnueabi.tar.xz.asc
+sha256  a7e19b68c44efe52df159f89f8b37790ca613adaa3f77937eb460747552d1e59  rust-std-1.68.2-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-armv5te-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-armv5te-unknown-linux-musleabi.tar.xz.asc
+sha256  74188e1a1f4f7418d946636b4280c03dc80933f6eedda75ece82b7034f32c6db  rust-std-1.68.2-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-armv7-unknown-linux-gnueabihf.tar.xz.asc
+sha256  2b9b98eaf7d18049e4c8625a4cf3c2d610d905c9478a377c6cc3d48f8b31db32  rust-std-1.68.2-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-armv7-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-armv7-unknown-linux-gnueabi.tar.xz.asc
+sha256  39009be69f01e30714c657a5f55475ce9f9c6a591cae85b5d7386944a8e87a80  rust-std-1.68.2-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-armv7-unknown-linux-musleabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-armv7-unknown-linux-musleabihf.tar.xz.asc
+sha256  05bef3f9e66537d9f1271dd6b6bf2261ba1db52672223712a8eb9178d036ae53  rust-std-1.68.2-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-armv7-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-armv7-unknown-linux-musleabi.tar.xz.asc
+sha256  b9992ee3b16c7b3b2fcf15339ade26084936d6088f578f8b2fab9b0c5c5b085c  rust-std-1.68.2-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-i586-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-i586-unknown-linux-gnu.tar.xz.asc
+sha256  07fc71adf63691ae5e103c57c295e665b6dfc096fe4bedfeb5e1d33c133bb9f4  rust-std-1.68.2-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-i586-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-i586-unknown-linux-musl.tar.xz.asc
+sha256  884c3b6cbe8d38bb15943917df8bc87470566014ec50200ed70094c12abbb6bd  rust-std-1.68.2-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-i686-unknown-linux-gnu.tar.xz.asc
+sha256  695d4469c131b9993c939db0ce73a3866ab8e69dd657ec3137f3d594857f7812  rust-std-1.68.2-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-i686-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-i686-unknown-linux-musl.tar.xz.asc
+sha256  216a647fb15ffce5271b82c2c016f01b3d69095ab4635d6a895f9b76b6c1c528  rust-std-1.68.2-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-mips-unknown-linux-gnu.tar.xz.asc
+sha256  4ab007f223cf723f8f7adf26a6014f4f5aa444f88c19daccc5ac81ea30275c66  rust-std-1.68.2-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-mips-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-mips-unknown-linux-musl.tar.xz.asc
+sha256  0c77f06f410091371b7f6f4952d759fcc0365025213f925afe80e04ab4b53540  rust-std-1.68.2-mips-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-mips64-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-mips64-unknown-linux-gnuabi64.tar.xz.asc
+sha256  b1b44819454c920980e66473112003212920136e4904113258566d130686de09  rust-std-1.68.2-mips64-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-mips64-unknown-linux-muslabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-mips64-unknown-linux-muslabi64.tar.xz.asc
+sha256  af586b37cac123774addc78d8c4568f22d94cec622ca9de80631f33da2700a6e  rust-std-1.68.2-mips64-unknown-linux-muslabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-mips64el-unknown-linux-gnuabi64.tar.xz.asc
+sha256  24028147dd7733637cbfe58b7f7acc8e8131ebbb39969a6c3c61ce56203b4af3  rust-std-1.68.2-mips64el-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-mips64el-unknown-linux-muslabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-mips64el-unknown-linux-muslabi64.tar.xz.asc
+sha256  a6ae7b9b1710100f52d96dab59c6e7c46a4b057b8ea3d25b8ea2f792aee2f006  rust-std-1.68.2-mips64el-unknown-linux-muslabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256  c299d65b3594c309d092f6a0fe15c205ab489ffa50910fb8126e944a2727cbe5  rust-std-1.68.2-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-mipsel-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-mipsel-unknown-linux-musl.tar.xz.asc
+sha256  a6bbd8949dc8514161de4e367c5255e8b83a3cf78c8426ffacbb6e8077d0e5e0  rust-std-1.68.2-mipsel-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  e75bdc8a6e3f00285a37606240862cdad69a986c3e3d47d6af1376613281233a  rust-std-1.68.2-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  354322352cd8b661b84f5e97729d5d7adb7df9cb9bfd43cac378271c40214d7f  rust-std-1.68.2-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  e69c8c1b7b0df839b271a2c12985b1c56565a34f9b357631ed99fa9263f3d326  rust-std-1.68.2-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-riscv64gc-unknown-linux-gnu.tar.xz.asc
+sha256  8388ac7a5f924d5d6aa441ae97c33c1abf11fd9516f2b9853f7edc0c5d6c453b  rust-std-1.68.2-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-s390x-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-s390x-unknown-linux-gnu.tar.xz.asc
+sha256  7f909658496692a05dd241c15f79a02f80658d353013dace127fdc69dc5026b4  rust-std-1.68.2-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-sparc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-sparc64-unknown-linux-gnu.tar.xz.asc
+sha256  787f5cbbcec4e75b9beba3804ea05e36b7cb9b164c291cf7ce8f775d05634d61  rust-std-1.68.2-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  c8a3eaf26b83f1926d86b4db99ca16cbbff8e746e4c63f25f4d75a02a34a3b16  rust-std-1.68.2-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.2-x86_64-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.2-x86_64-unknown-linux-musl.tar.xz.asc
+sha256  6c2a91e60f4be6538fdb0e4ff0344038f282c23808ca018f526ec586f4ba43ab  rust-std-1.68.2-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 9efca1dcbd..c5fdd9a862 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_BIN_VERSION = 1.68.0
+RUST_BIN_VERSION = 1.68.2
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index d717ccbfef..40ab7dedc6 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,6 +1,6 @@
-# From https://static.rust-lang.org/dist/rustc-1.68.0-src.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rustc-1.68.0-src.tar.xz.asc
-sha256  8651245e8708f11d0f65ba9fdb394c4b9300d603d318045664b371729da9eac4  rustc-1.68.0-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.68.2-src.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rustc-1.68.2-src.tar.xz.asc
+sha256  ce1a115f6aafa912b4622906a92b626354973afa9288e2c7750df4dcf3390fc0  rustc-1.68.2-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 51574c3574..27eb11f095 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_VERSION = 1.68.0
+RUST_VERSION = 1.68.2
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
