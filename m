Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DD4C74A5B
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 10:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EA9540002;
	Fri, 17 Mar 2023 10:10:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EA9540002
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D9A0KT7cjI6M; Fri, 17 Mar 2023 10:10:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CDB740136;
	Fri, 17 Mar 2023 10:10:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CDB740136
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 04DE91BF2B0
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 10:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D21C640136
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 10:10:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D21C640136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VLPG4XMzTq3D for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 10:10:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B6A240002
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B6A240002
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 10:10:35 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id t129so2038796iof.12
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 03:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679047834;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S6eM65kTdXK28X9jALo2HlhOqaeEMxuEtgwrB1Ezjxo=;
 b=u/zYJmV7LwUkMKNpT/QuJ8WKjHE7wQy/XzEKv1bMFS+jAboNYU5RF1RmD5C0ijIn6j
 JZ3LLh4LICEpJuCQpXNFKHZWC5wOaFy/GQBQ5fgjR2vdobrty/f+y8UFxxyP+Q5v8106
 LKm+Fq2X/80hFhg+fuB3OcvMf8f3hbljpDGIiQB8Bodxb3NMlV+7ixmu3mbP3k5VkMfl
 mJYVNY6dTdt9tvH84z+9noDW5s4h1RazKsembs9C+0/fqR7zvYi9iKnlZSNDiKeMpFmu
 4AUE53e0K0oYqqwFFAh6hBa/MUOT4J1FSGtpzSM5EfSBrUzJkH7S7w8d+jDPAPRTygK+
 FNZQ==
X-Gm-Message-State: AO0yUKWdZcD+BQlWx2hHmvGMaxtjwnDBtKt4iMgWY6gCoV4QdEnd/wXc
 gkVaSNeIU3u6mQUILs5ulbxu6dedHC+Pjw==
X-Google-Smtp-Source: AK7set8xaKAiX9cYiIFZwWIqOaBjGScVV+7vsrHARlj9AWTTkCb/EngAiUlf4+qM2eqtfc+nX1tZFw==
X-Received: by 2002:a6b:db03:0:b0:704:d003:56be with SMTP id
 t3-20020a6bdb03000000b00704d00356bemr1430097ioc.7.1679047834149; 
 Fri, 17 Mar 2023 03:10:34 -0700 (PDT)
Received: from james-x399.localdomain (97-118-149-35.hlrn.qwest.net.
 [97.118.149.35]) by smtp.gmail.com with ESMTPSA id
 g9-20020a025b09000000b00374fa5b600csm590837jab.0.2023.03.17.03.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 03:10:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 Mar 2023 04:10:31 -0600
Message-Id: <20230317101031.2357806-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679047834;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S6eM65kTdXK28X9jALo2HlhOqaeEMxuEtgwrB1Ezjxo=;
 b=LUaL7/QWy3FsqhdFZSsJX94OIOcjrT6Dx6PxfYZlrqLqQ6JKr8uiLeOVt9xCnIw1+M
 iWAC0Z/CRhYF2ZSxWyGwgQA5N2gIs00LWfjRSECd6CJYsKgGHhzuOGmaS6cmMwwNdxRP
 suE1qYLEwSoTpr5cFdE5kZv3Vzje1hjRyHANJ1GaznvEtbA0paSDeDw/hYqHWAFXwwdf
 YVOA6OQMKiDB7TEHL/450Mu6vSMZKizvSfvXdufAHyWKIGiu0BOEOf31bFmMfVSaM/Hu
 5cfxnqGU1ySHsEh9pBpIEn2+HmHvK7ypgplTzAPN/ZC8170oVPnF8KAtbXbOeg1CAJwD
 6x6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LUaL7/QW
Subject: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: bump to version 1.68.0
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

Link to Rust 1.68.0 announcement: https://blog.rust-lang.org/2023/03/09/Rust-1.68.0.html

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/rust-bin/rust-bin.hash | 252 ++++++++++++++++-----------------
 package/rust-bin/rust-bin.mk   |   2 +-
 package/rust/rust.hash         |   6 +-
 package/rust/rust.mk           |   2 +-
 4 files changed, 131 insertions(+), 131 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 11cfae5e9b..1b7d153833 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,129 +1,129 @@
-# From https://static.rust-lang.org/dist/rust-1.67.1-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.67.1-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256  b7b8e8b70cae457092661894efa5a4861ef4f0e20f2f617d05d6f17b1f780a68  rust-1.67.1-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.67.1-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.67.1-i686-unknown-linux-gnu.tar.xz.asc
-sha256  b686a2d0d1648e1b84def715dd65a85a3d2802b33ecf65808bdb2ed639aec7d3  rust-1.67.1-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.67.1-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.67.1-mips-unknown-linux-gnu.tar.xz.asc
-sha256  c9df968487707eb63207f63086daed4fe1484829fb6221bd9414de2700424995  rust-1.67.1-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.67.1-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.67.1-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256  4f56194a354b1413fb973d25f1c895aaa8e85211d316755508d6848e3a4fe18b  rust-1.67.1-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.67.1-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.67.1-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256  852e5a714ea8d2737f2cd5b0d6a12ecfa712b75238c643ba8138b490fc39fc43  rust-1.67.1-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.67.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.67.1-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256  0a5bc85383d5d9d077dccaad1fb213d9498b6137112aaaabced6eb079fe12c9e  rust-1.67.1-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.67.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.67.1-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256  574851ff8503df9cb0dd04e6a1cd0ce5d709b5ea8b9c1265b314b9e182c818da  rust-1.67.1-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.67.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.67.1-riscv64gc-unknown-linux-gnu.tar.xz.asc
-sha256  50e98fefef58218bd2c09c826308d43abe11b05f528b08ecca3d2657d7996630  rust-1.67.1-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.67.1-s390x-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.67.1-s390x-unknown-linux-gnu.tar.xz.asc
-sha256  6e8629ace0c1b9cc0c2bc6225e6716df852370e5c7e907815ff8e6241e427699  rust-1.67.1-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.67.1-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.67.1-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  7dbb718bdb09adad7e36b9a413e571863913682495527f7f2d6507ea2c068542  rust-1.67.1-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256  35027409400faaaa38ea2855b92dea6b553b2e656dff735da730f67ac02e57e6  rust-std-1.67.1-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-aarch64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-aarch64-unknown-linux-musl.tar.xz.asc
-sha256  dcd3926c151cdd33d4de2860f021c86a18556809c4d06cbddebc1b377638710a  rust-std-1.67.1-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-arm-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-arm-unknown-linux-gnueabi.tar.xz.asc
-sha256  da42d5b07984dac9a41719511eeb47cbb6c5e70b32a6eacba96c9f860ced0307  rust-std-1.67.1-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-arm-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-arm-unknown-linux-gnueabihf.tar.xz.asc
-sha256  3b95c9595db3e10077c4eca8f63d80414bf3a50c1f0f6b2ac33f1992ee0940db  rust-std-1.67.1-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-arm-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-arm-unknown-linux-musleabihf.tar.xz.asc
-sha256  767761d99846174dfb7dfb579e2e2be63800478858a82f3f7050cc9555209a89  rust-std-1.67.1-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-arm-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-arm-unknown-linux-musleabi.tar.xz.asc
-sha256  1e53306124de9f282452bd6085e86918e5e9f6f1940fc79809a1b284272e2d2b  rust-std-1.67.1-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-armv5te-unknown-linux-gnueabi.tar.xz.asc
-sha256  3e8bb4265c8c6d8984b69eeefe015131ea140148a58179b3abec5653d93bea7d  rust-std-1.67.1-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-armv5te-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-armv5te-unknown-linux-musleabi.tar.xz.asc
-sha256  cbfce327b623e341c1243f0d29ef2f60e5fb205d406c79eb8be1433652c3c9a5  rust-std-1.67.1-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-armv7-unknown-linux-gnueabihf.tar.xz.asc
-sha256  b6d00c4e338744ce1bf5b314f1056472acf1eb416f65057a8b3ca0a992fb04df  rust-std-1.67.1-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-armv7-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-armv7-unknown-linux-gnueabi.tar.xz.asc
-sha256  8a7e46b15adb0718b4e4ee33cd46529117411e8d73c29043778b05e7412c2b46  rust-std-1.67.1-armv7-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-armv7-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-armv7-unknown-linux-musleabihf.tar.xz.asc
-sha256  6102f98617dd37874f3d755d0a325b45d47c6e1715c39d5e9bc037992e4d3cd6  rust-std-1.67.1-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-armv7-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-armv7-unknown-linux-musleabi.tar.xz.asc
-sha256  720958bc039c9ff00e7e399adf45f044484c5695a71bde0d07e0c895a819fe74  rust-std-1.67.1-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-i586-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-i586-unknown-linux-gnu.tar.xz.asc
-sha256  22cbbf0b22d9b0894cfbd6e1dd6b95b71c7ad02cee4e477d375dcf81af8d1337  rust-std-1.67.1-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-i586-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-i586-unknown-linux-musl.tar.xz.asc
-sha256  49beb678732f34a0bfc22f94900c3d4a17ec05effdb7377864042df73b2a2819  rust-std-1.67.1-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-i686-unknown-linux-gnu.tar.xz.asc
-sha256  aab2d7aa76793e78c9c8810e93ed8978f6422843b1277e9c60337b0f943a4409  rust-std-1.67.1-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-i686-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-i686-unknown-linux-musl.tar.xz.asc
-sha256  a2c6e55a8a2987d0c306d2c164347a70ab7a6a18f6562039a772b33e25934972  rust-std-1.67.1-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-mips-unknown-linux-gnu.tar.xz.asc
-sha256  048b3da190212b742f7a052618b57683dc96ee2b6c25fc7f5ae751143cb79bad  rust-std-1.67.1-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-mips-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-mips-unknown-linux-musl.tar.xz.asc
-sha256  b9ef413b764a92d42e07a2e588268ece09994d2cd1ab2a93858c27f85a250349  rust-std-1.67.1-mips-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-mips64-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-mips64-unknown-linux-gnuabi64.tar.xz.asc
-sha256  ef7fe3160de629f0d38788f2c270f87b0631480e5b0d848595b460528de719e4  rust-std-1.67.1-mips64-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-mips64-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-mips64-unknown-linux-muslabi64.tar.xz.asc
-sha256  15fdb3e8b39c8a122e9beee0c4c909ee8ec356e57aaaaae5f2b9e94f58d73c87  rust-std-1.67.1-mips64-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-mips64el-unknown-linux-gnuabi64.tar.xz.asc
-sha256  6ccfd98fd920cc2f1199bcf9a842430c27f6fcd2cc46c18421e487309ff7811e  rust-std-1.67.1-mips64el-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-mips64el-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-mips64el-unknown-linux-muslabi64.tar.xz.asc
-sha256  78477c45f5b848b156adaf0e0f6f2954ae73e2903321d1636c155020175eaaf5  rust-std-1.67.1-mips64el-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256  94410897626546dde806a114299c3c32abb6b4b294af5daea5c4d136751fe063  rust-std-1.67.1-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-mipsel-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-mipsel-unknown-linux-musl.tar.xz.asc
-sha256  b3f1a338e69428f1611f059c67b8afafa78ce5c7ed0799f8a90795390261d3a4  rust-std-1.67.1-mipsel-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256  26efe78c09ed36da34964c0d023cf9aa404766ab790a94d9becd373b8879cb5a  rust-std-1.67.1-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256  135f5e6ab6d8f077a14521d387d3f31831abdb840ca4e6a15b6f0d0d5b7dbc81  rust-std-1.67.1-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256  364c47ed22e4268edf238d221c40007d7d8792a66ca325d3937596a9c911ea48  rust-std-1.67.1-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-riscv64gc-unknown-linux-gnu.tar.xz.asc
-sha256  63a7e6a6c889a3d01bb3c66a3def3e41963511ea52e13906669da5b29b2fd9da  rust-std-1.67.1-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-s390x-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-s390x-unknown-linux-gnu.tar.xz.asc
-sha256  04573298d9e815c1e8c47a2f9548ea55d4a2afc538eceaa6a704d44a5e1f7e3e  rust-std-1.67.1-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-sparc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-sparc64-unknown-linux-gnu.tar.xz.asc
-sha256  addf0b0beb1966787e599f32849f18c28d5cb65515272b7d9608d4a1dddee2e7  rust-std-1.67.1-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  f4dc8468dfc1dbd86f865b10f06e0e4b4e76f5a3a1cc27317a520ab1660844e9  rust-std-1.67.1-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.1-x86_64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-x86_64-unknown-linux-musl.tar.xz.asc
-sha256  89741cd2ac00c3a3f565bcccdf442cc1f9ec58ea419f1f0d09e911be0ff86c87  rust-std-1.67.1-x86_64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.68.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.68.0-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  79cb5c840e44d0e3623335e59c2849dd73e0048fc6f97f2d351e88b0bd85040a  rust-1.68.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.68.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.68.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256  650b7cd7a13e4739de39e7e89c534600cfb33afdc6d7774b87ed64e5b7cd17a3  rust-1.68.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.68.0-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.68.0-mips-unknown-linux-gnu.tar.xz.asc
+sha256  7d0aab2e137295af67b77146c2a95f90fe98ee7bd4966ad0c22d2e02681bdf99  rust-1.68.0-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.68.0-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.68.0-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256  aa56fd4432f100a9af4b4376adc112555d2b29d4673602374ae04d961ba778be  rust-1.68.0-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.68.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.68.0-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  ca4f14022c67caef7813e9a02875c49ab431d2b6657f83966011c6f6577a34e2  rust-1.68.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.68.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.68.0-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  6730365b822d588f7132d6416a94edd61767f49d31c8777448a734f03bff9375  rust-1.68.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.68.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.68.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  46e28305a69af20b7b6e8888a2b98656428d28e0906e71b4be1d0089f0f9032b  rust-1.68.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.68.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.68.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
+sha256  f66202760b26b66169f8b923dbc72bdc7eb78dabe687d78397ce73de44165edd  rust-1.68.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.68.0-s390x-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.68.0-s390x-unknown-linux-gnu.tar.xz.asc
+sha256  bdf82d1046f16188b11afc19088057f2ad096101d995ac7edbbbd632af199b84  rust-1.68.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.68.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.68.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  183d53f7488095550788fe38eff80542d68e6bd92ee48442d2ce0bd60a7eceaf  rust-1.68.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  caf2385d507d6ce3f3550bd41e5c2be95053564b76851fc5920b9770a1e6046f  rust-std-1.68.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-aarch64-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-aarch64-unknown-linux-musl.tar.xz.asc
+sha256  90e19eb15fd5b1f206f33e6f50a00ab5785aa5600ae7ccf5787ca64aec63f85f  rust-std-1.68.0-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-arm-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-arm-unknown-linux-gnueabi.tar.xz.asc
+sha256  40714404769bfa989c2da9f24e28cdfb8395ec8993bbec1544e2bba6030d0d3f  rust-std-1.68.0-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-arm-unknown-linux-gnueabihf.tar.xz.asc
+sha256  f455a4c19db7a548571405a591c76b3087995f58f529010b2e6c3e4bcd6ce49b  rust-std-1.68.0-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-arm-unknown-linux-musleabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-arm-unknown-linux-musleabihf.tar.xz.asc
+sha256  9eab35245a3193b8242b5ed08b896c8deeb3197c013134783d7062fa992213d0  rust-std-1.68.0-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-arm-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-arm-unknown-linux-musleabi.tar.xz.asc
+sha256  c0e2c4f1ff860f6073870901cde9aee61eb39932cc59d7a320760874505da4f0  rust-std-1.68.0-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-armv5te-unknown-linux-gnueabi.tar.xz.asc
+sha256  d7f562e6f3071972fc54ab1c8e35bf9c464376c43b1039d6bcfc602a3a997302  rust-std-1.68.0-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-armv5te-unknown-linux-musleabi.tar.xz.asc
+sha256  41a6db7397757390dd53e2806c244159d3b8755957fb5c464df31fa83e982e66  rust-std-1.68.0-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
+sha256  07a41cdf9bf8e0a42018f550c0c535afd0b0bbe967f5de13adab965170903aca  rust-std-1.68.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-armv7-unknown-linux-gnueabi.tar.xz.asc
+sha256  a6baaf8a3409b2601134d0a7035b5f764472954b29a978543aba97e5413920c1  rust-std-1.68.0-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-armv7-unknown-linux-musleabihf.tar.xz.asc
+sha256  f18851de6f979076b94d399a4e2d5553a9251444a7cb3d4dad59d568f177e084  rust-std-1.68.0-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-armv7-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-armv7-unknown-linux-musleabi.tar.xz.asc
+sha256  50897d7bcfbd3f30d4552fd87bed46e3886beab9963bbae90aca8cc7ef9fe2d4  rust-std-1.68.0-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-i586-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-i586-unknown-linux-gnu.tar.xz.asc
+sha256  6cf446799b6cb659da932dd7c2ffcbd028b86f28db89771d7f4485e939ec9bc2  rust-std-1.68.0-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-i586-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-i586-unknown-linux-musl.tar.xz.asc
+sha256  7458325c76d82cffcde5cbecdacafe0d8f62d650ba711c0153bcca0d0d83bd0e  rust-std-1.68.0-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256  a6ea604be18d30e5c41e53bb41486d3bddc0c7289056895127d93ad6fb30691c  rust-std-1.68.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-i686-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-i686-unknown-linux-musl.tar.xz.asc
+sha256  ceb9f340ec4b57e3d12885f7a35a9bbf510d3aa70311d5a656db1893650e2187  rust-std-1.68.0-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-mips-unknown-linux-gnu.tar.xz.asc
+sha256  1fdf0323e24442c990c8f59142225c3b0e1ab8c666d7aac34158dc26c6905004  rust-std-1.68.0-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-mips-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-mips-unknown-linux-musl.tar.xz.asc
+sha256  03b1cb375241aab01b36261193f47737ffc05038a5dfb34de879c8300c9c722b  rust-std-1.68.0-mips-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
+sha256  1e3e1382aad0582e57bef856d35c79a69a0c9141dfa26a2642f053add57aaf0b  rust-std-1.68.0-mips64-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-mips64-unknown-linux-muslabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-mips64-unknown-linux-muslabi64.tar.xz.asc
+sha256  d69d196cc73ed629bc9bf7b76556463f3aca8318729b380fd4a23f1dbea2a0f5  rust-std-1.68.0-mips64-unknown-linux-muslabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
+sha256  14aa5d7813239667fc111fb378243a888b3a2b0a1960a40ab7901476bb5a7abe  rust-std-1.68.0-mips64el-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-mips64el-unknown-linux-muslabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-mips64el-unknown-linux-muslabi64.tar.xz.asc
+sha256  95bf115ca743f1379b1fbf052202c1dfc8ea1eb6dbf82e0ee8eafe77a9f60cca  rust-std-1.68.0-mips64el-unknown-linux-muslabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256  c31ce8298655750e493c7065512e858cdd60457c3db855e154dc9f9d3140fe48  rust-std-1.68.0-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-mipsel-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-mipsel-unknown-linux-musl.tar.xz.asc
+sha256  3e0bd2a95b94848c887930d27821e9de4c1963b5d4d0b2fea28e06e80cdc422e  rust-std-1.68.0-mipsel-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  1047a97e42079562ec685e19af6fd817e860eaf847cd4b3f1486a949af810a7a  rust-std-1.68.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  a446a6445fdb536e1ca1bfe4233b7bf0f808cee00c043cc1ae6e06f3e59d3f2a  rust-std-1.68.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  d9561344d71ea49491f6e9ea9913c93824fbac6b51319d1559ab2a432ca01ba3  rust-std-1.68.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
+sha256  aaf5f145be482ad21ab3af0552a5ad3e2968430e08dbf62011228532bc45237d  rust-std-1.68.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-s390x-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-s390x-unknown-linux-gnu.tar.xz.asc
+sha256  89398529b7cbeed722fcb263c45b94a46a37ce9a446036f5e5af6101acb520cf  rust-std-1.68.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-sparc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-sparc64-unknown-linux-gnu.tar.xz.asc
+sha256  244f488ffbac717768cc800b25d6142409160e2ec9e899748b696d9f1845bc2d  rust-std-1.68.0-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  566f4e83e96e8e141d3444a09a014a3a69c786b3eef122389747eaaf4c1525b5  rust-std-1.68.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.68.0-x86_64-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.68.0-x86_64-unknown-linux-musl.tar.xz.asc
+sha256  5109c26489ad6f316b8f5b953805b83c21f21f3a72b443704029f11ebe539b8e  rust-std-1.68.0-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index bb66de5ec5..9efca1dcbd 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_BIN_VERSION = 1.67.1
+RUST_BIN_VERSION = 1.68.0
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 1b4b08cecc..d717ccbfef 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,6 +1,6 @@
-# From https://static.rust-lang.org/dist/rustc-1.67.1-src.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rustc-1.67.1-src.tar.xz.asc
-sha256  77e0615011f887d9533d5374bf9c15c590c3caf32bbb035b392d1c2ae502a682  rustc-1.67.1-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.68.0-src.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rustc-1.68.0-src.tar.xz.asc
+sha256  8651245e8708f11d0f65ba9fdb394c4b9300d603d318045664b371729da9eac4  rustc-1.68.0-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 814a3c1dd4..51574c3574 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_VERSION = 1.67.1
+RUST_VERSION = 1.68.0
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
