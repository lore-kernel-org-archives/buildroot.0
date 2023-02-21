Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75797C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 249E160A99;
	Tue, 21 Feb 2023 02:22:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 249E160A99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nnHeckDGbMve; Tue, 21 Feb 2023 02:22:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3643670386;
	Tue, 21 Feb 2023 02:22:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3643670386
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 81E531BF29A
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 01:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68911822FA
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 01:22:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68911822FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id anjHRrMwwTcQ for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 01:22:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 019F881363
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 019F881363
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 01:22:50 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id b16so1139074iln.3
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 17:22:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZbbkTAYENtOMe+Etb0phZDk2ZnZ1j80IqIe6cZoen4c=;
 b=oDpaxmipFMnGwCoeJha5tywqyn+JLnULaORcGWuS7+m1I4km6nySYe0JHyqxwwWWtX
 2tX1OAfL83WlM0LjQUaU+g4docXNK7/4ZuxQH33bt2tEJj2QGbvHWdB+2zKxP+1cYaKD
 zxecjv5LsEdQ1e2trZ0OESLyTwKueEZw2fTXEpByFXleJlT9bS3EJV0ggaXPtnzMKeat
 R2C4rxODIXCIDypk7y1UBV6YG3k5+/V63VvXP6Xm+AmAmx3TkZAn7lbjJjHg3pVmc96C
 OUEnQvmYFy0AkQKkjY0FnRFarZil0t6onwmrkjHjhCvPF9zePHl3IO8qraRoxfrSYVMX
 VDDA==
X-Gm-Message-State: AO0yUKW5lcymGdIXng22cFiixAfoDuVaTiDdDozqXC8sGSaNkJCKLNo+
 7ZBc6GwA4y2ciVM8ziVInr+q0jbnHNs=
X-Google-Smtp-Source: AK7set9uus8LD/QuxD130WGFU7Lvu/IikihIcIAcdHnOxDN4sM+pOsQplnWbGI7W+wc2fTO13CuPlA==
X-Received: by 2002:a92:c54e:0:b0:315:375c:dc5a with SMTP id
 a14-20020a92c54e000000b00315375cdc5amr3850724ilj.20.1676942569665; 
 Mon, 20 Feb 2023 17:22:49 -0800 (PST)
Received: from james-x399.localdomain (97-118-149-35.hlrn.qwest.net.
 [97.118.149.35]) by smtp.gmail.com with ESMTPSA id
 y14-20020a02bb0e000000b003a958f51423sm4523496jan.167.2023.02.20.17.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 17:22:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 18:22:38 -0700
Message-Id: <20230221012238.3809280-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZbbkTAYENtOMe+Etb0phZDk2ZnZ1j80IqIe6cZoen4c=;
 b=WYkQkFG+ip1QNCrmOn+scYOi1qdtyJ4luAfgiu8XQJRzycUrXfQ8JQsy9uaf4axDp/
 QbmzAuj3NupGghcTsM3gRzbabowly5dQLEa4ruMGeinKUHeWqSp7JnxpMJv9Hg4oBtAL
 WVIrX0kmVHBxeOiDgNTLY5hn4CozDPOP6PEhF+Bgud0xXpYUAoy4d3fh2RAlrRU8e+Fv
 K1uBAutsfNsKyMmeSXcjD0ycEBsp9SWDTGhcMhSGaLYmZ4H0EYpn/4KOAqGB3/fD2l4+
 NFgtS/3R0kIkH4Hv4YkszCztZ3qX0v253hoU9oOabNRFVU6adPKcXSGLVCboWfWfw4J/
 Xbaw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WYkQkFG+
Subject: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: bump to version 1.67.1
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

Link to Rust 1.67.1 announcement: https://blog.rust-lang.org/2023/02/09/Rust-1.67.1.html

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/rust-bin/rust-bin.hash                | 252 +++++++++---------
 package/rust-bin/rust-bin.mk                  |   2 +-
 ...-unsoundness-in-bootstrap-cache-code.patch |  43 ---
 package/rust/rust.hash                        |   6 +-
 package/rust/rust.mk                          |   2 +-
 5 files changed, 131 insertions(+), 174 deletions(-)
 delete mode 100644 package/rust/0001-fix-unsoundness-in-bootstrap-cache-code.patch

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index d00e6342e8..11cfae5e9b 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,129 +1,129 @@
-# From https://static.rust-lang.org/dist/rust-1.67.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.67.0-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256  5a108891cab3fd0567bf8c2b44f18c045c067c607bbec3ea62b02ad40809b151  rust-1.67.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.67.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.67.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256  2ba12fe020b17de3a6fe7633c59ab50ef44f9715caa858077aad3301408f583c  rust-1.67.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.67.0-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.67.0-mips-unknown-linux-gnu.tar.xz.asc
-sha256  f7fd19d9b4740b2acaee2ac3bf502feb2f16d1d0c203c1d7d2d2652652a9f997  rust-1.67.0-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.67.0-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.67.0-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256  23dc0289abd12ef396c2ac822a28245157f1be5b574b5a5f4059a9ba7b61184c  rust-1.67.0-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.67.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.67.0-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256  9998f93c29272d9ecabb69e908da23e728ec835520b430d0af12250d175b981d  rust-1.67.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.67.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.67.0-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256  c24de54f46022c9490fc403ccb1e7384a52181ecd28afea0a37f800793b229b4  rust-1.67.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.67.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.67.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256  271b4181072251276e3c97c3f772b6d9ee39aa8d9f05ed28f34bf5910c9964ad  rust-1.67.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.67.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.67.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
-sha256  f3a8517334a174826cf92954d525d039c941265066f46948ad89b61791398dd3  rust-1.67.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.67.0-s390x-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.67.0-s390x-unknown-linux-gnu.tar.xz.asc
-sha256  2b4c27e3a9475278838588fb64159f74a5a8e752f53249a299d2c5188f0bc2e1  rust-1.67.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.67.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.67.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  e6345aebeba55f39cb35fc06a3ac6c43c35f596309a6ed26023b1898346419bd  rust-1.67.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256  d78573b19cff475c5d3612570d79f53b220d6aaf3824c71bc94d74b5f778ef84  rust-std-1.67.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-aarch64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-aarch64-unknown-linux-musl.tar.xz.asc
-sha256  6ba01d65aa949128a125d85d750f3facff59c5b1448ccaf66fbdb7bbb3696107  rust-std-1.67.0-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-arm-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-arm-unknown-linux-gnueabi.tar.xz.asc
-sha256  04fb84e9de6c815a7031930afca5d66e6993b639a7f304052df6da750d5bbbe8  rust-std-1.67.0-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-arm-unknown-linux-gnueabihf.tar.xz.asc
-sha256  896aad9bcf8990ef213230755311609a5a05c99f3d265f47bc6844638f60d202  rust-std-1.67.0-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-arm-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-arm-unknown-linux-musleabihf.tar.xz.asc
-sha256  8fd54bfb494089fd26c76b8d9f537bf031aa9018aa29ffe5d7258c82eaa51223  rust-std-1.67.0-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-arm-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-arm-unknown-linux-musleabi.tar.xz.asc
-sha256  212def6f18494cd45c90a471f2b0aff67c4eaa03567c7ab03fe901c337d853d3  rust-std-1.67.0-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-armv5te-unknown-linux-gnueabi.tar.xz.asc
-sha256  adcab5bb095b4b9af706d3b2cc62341bced76470a7c573354b52f9c8cffb4b46  rust-std-1.67.0-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-armv5te-unknown-linux-musleabi.tar.xz.asc
-sha256  97c7922f3250d70e8b7a7f7420caf299274e253e1f46c3160f2dea33e159d5fe  rust-std-1.67.0-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
-sha256  8aec6e33b6c80365979519423a168729c4fff2ea57f66e5123e0602f2ef050a7  rust-std-1.67.0-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-armv7-unknown-linux-gnueabi.tar.xz.asc
-sha256  f98f2f4e76ef3056ba98be13ecfaacad07ab214f8ce940dfad56723056d42872  rust-std-1.67.0-armv7-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-armv7-unknown-linux-musleabihf.tar.xz.asc
-sha256  dc10cc70b1fd6f74d0c3a7d6cf25bc583edd5f61cd26dbcc6f6bfd22d3e4eb04  rust-std-1.67.0-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-armv7-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-armv7-unknown-linux-musleabi.tar.xz.asc
-sha256  1677ef03dfbaa5715609fe7b51e3b036f722fe8934a9186e8f24e26b94588b41  rust-std-1.67.0-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-i586-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-i586-unknown-linux-gnu.tar.xz.asc
-sha256  675f0e2e2930f784d03ad6de663fd4ed2b5737689944f0bc8b20653e611c3bb3  rust-std-1.67.0-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-i586-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-i586-unknown-linux-musl.tar.xz.asc
-sha256  da13b4d9cf2709b3de996d0923df05fb343f774ff89fcfb6a8548f562113c44a  rust-std-1.67.0-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256  080ce3fa7f5b84d900be5842a52053345a40d6dd77b20bcac016eb2083a9a59d  rust-std-1.67.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-i686-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-i686-unknown-linux-musl.tar.xz.asc
-sha256  b5d5a777ca669d8d6aa8bad85efe5ff9d5559a3f6f9dfb9a8d95337dd0cf1b21  rust-std-1.67.0-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-mips-unknown-linux-gnu.tar.xz.asc
-sha256  a2bf13ed3f38427ae65c9ee33a0f4c71fd70d8fae6d9af45045f5318834370e5  rust-std-1.67.0-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-mips-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-mips-unknown-linux-musl.tar.xz.asc
-sha256  d7d223ec4ddb4816e9c537a395a6575ad853e48e0c41415c1a54235c3eb2aa72  rust-std-1.67.0-mips-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
-sha256  3b02a3d60f952336e16d1d67a2276ae3197f3839c7b2a557f5ec8d2594325958  rust-std-1.67.0-mips64-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-mips64-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-mips64-unknown-linux-muslabi64.tar.xz.asc
-sha256  2ca3557e288fc1a312021b5ee2c08d1c2acd052b72b60472b494e79b42d2e713  rust-std-1.67.0-mips64-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
-sha256  585c73b1407938290aa5f72beea6d994c60323b6a48b26b618d2c2f9e53916b1  rust-std-1.67.0-mips64el-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-mips64el-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-mips64el-unknown-linux-muslabi64.tar.xz.asc
-sha256  23364fbf0dae146a0be76496ac3ac22fbae5603435020d930e28531395b8355d  rust-std-1.67.0-mips64el-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256  2b877cdc8af0546358df77a0e22104d5e59a3fc622b6986a3fcbffc9c96a3c8b  rust-std-1.67.0-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-mipsel-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-mipsel-unknown-linux-musl.tar.xz.asc
-sha256  6e2e15c188dc67428467e894a62679d6f4115d5e5e10916d0273c16152ab060e  rust-std-1.67.0-mipsel-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256  44b700068e9e40a01418e537b5c0f4ee279995b55ee6d6266409f057ead1c6de  rust-std-1.67.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256  db3960e0eac9d7c2485fe418bf9052d2fdd16557499d320919f385f9f3db5448  rust-std-1.67.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256  ec92fa64616c67785039bebabc213e6bae6ffc2744ef052b79c7960df60b257f  rust-std-1.67.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
-sha256  630e4b8b95c0b501676f2477b6009ca122019e1e0d637222443e26a0c5931f3c  rust-std-1.67.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-s390x-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-s390x-unknown-linux-gnu.tar.xz.asc
-sha256  f1988eb337c00dd30469f545b822b8fd3b0372e6aa88924b7906785ea1f69fba  rust-std-1.67.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-sparc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-sparc64-unknown-linux-gnu.tar.xz.asc
-sha256  d8cdbee292c86182b54ba152cd33ac3abe4c684186f29017bb4cf7e92ff3a2be  rust-std-1.67.0-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  8f03b271bba56b0245833f2cb08044865068ce8721d6a736d3ef7056aa109daa  rust-std-1.67.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.67.0-x86_64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.67.0-x86_64-unknown-linux-musl.tar.xz.asc
-sha256  33f320dc4ae075f720f541564868e494c17dea97ea853507225f89f8b0c57363  rust-std-1.67.0-x86_64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.67.1-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.67.1-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  b7b8e8b70cae457092661894efa5a4861ef4f0e20f2f617d05d6f17b1f780a68  rust-1.67.1-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.67.1-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.67.1-i686-unknown-linux-gnu.tar.xz.asc
+sha256  b686a2d0d1648e1b84def715dd65a85a3d2802b33ecf65808bdb2ed639aec7d3  rust-1.67.1-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.67.1-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.67.1-mips-unknown-linux-gnu.tar.xz.asc
+sha256  c9df968487707eb63207f63086daed4fe1484829fb6221bd9414de2700424995  rust-1.67.1-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.67.1-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.67.1-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256  4f56194a354b1413fb973d25f1c895aaa8e85211d316755508d6848e3a4fe18b  rust-1.67.1-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.67.1-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.67.1-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  852e5a714ea8d2737f2cd5b0d6a12ecfa712b75238c643ba8138b490fc39fc43  rust-1.67.1-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.67.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.67.1-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  0a5bc85383d5d9d077dccaad1fb213d9498b6137112aaaabced6eb079fe12c9e  rust-1.67.1-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.67.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.67.1-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  574851ff8503df9cb0dd04e6a1cd0ce5d709b5ea8b9c1265b314b9e182c818da  rust-1.67.1-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.67.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.67.1-riscv64gc-unknown-linux-gnu.tar.xz.asc
+sha256  50e98fefef58218bd2c09c826308d43abe11b05f528b08ecca3d2657d7996630  rust-1.67.1-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.67.1-s390x-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.67.1-s390x-unknown-linux-gnu.tar.xz.asc
+sha256  6e8629ace0c1b9cc0c2bc6225e6716df852370e5c7e907815ff8e6241e427699  rust-1.67.1-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.67.1-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.67.1-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  7dbb718bdb09adad7e36b9a413e571863913682495527f7f2d6507ea2c068542  rust-1.67.1-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  35027409400faaaa38ea2855b92dea6b553b2e656dff735da730f67ac02e57e6  rust-std-1.67.1-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-aarch64-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-aarch64-unknown-linux-musl.tar.xz.asc
+sha256  dcd3926c151cdd33d4de2860f021c86a18556809c4d06cbddebc1b377638710a  rust-std-1.67.1-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-arm-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-arm-unknown-linux-gnueabi.tar.xz.asc
+sha256  da42d5b07984dac9a41719511eeb47cbb6c5e70b32a6eacba96c9f860ced0307  rust-std-1.67.1-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-arm-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-arm-unknown-linux-gnueabihf.tar.xz.asc
+sha256  3b95c9595db3e10077c4eca8f63d80414bf3a50c1f0f6b2ac33f1992ee0940db  rust-std-1.67.1-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-arm-unknown-linux-musleabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-arm-unknown-linux-musleabihf.tar.xz.asc
+sha256  767761d99846174dfb7dfb579e2e2be63800478858a82f3f7050cc9555209a89  rust-std-1.67.1-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-arm-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-arm-unknown-linux-musleabi.tar.xz.asc
+sha256  1e53306124de9f282452bd6085e86918e5e9f6f1940fc79809a1b284272e2d2b  rust-std-1.67.1-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-armv5te-unknown-linux-gnueabi.tar.xz.asc
+sha256  3e8bb4265c8c6d8984b69eeefe015131ea140148a58179b3abec5653d93bea7d  rust-std-1.67.1-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-armv5te-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-armv5te-unknown-linux-musleabi.tar.xz.asc
+sha256  cbfce327b623e341c1243f0d29ef2f60e5fb205d406c79eb8be1433652c3c9a5  rust-std-1.67.1-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-armv7-unknown-linux-gnueabihf.tar.xz.asc
+sha256  b6d00c4e338744ce1bf5b314f1056472acf1eb416f65057a8b3ca0a992fb04df  rust-std-1.67.1-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-armv7-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-armv7-unknown-linux-gnueabi.tar.xz.asc
+sha256  8a7e46b15adb0718b4e4ee33cd46529117411e8d73c29043778b05e7412c2b46  rust-std-1.67.1-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-armv7-unknown-linux-musleabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-armv7-unknown-linux-musleabihf.tar.xz.asc
+sha256  6102f98617dd37874f3d755d0a325b45d47c6e1715c39d5e9bc037992e4d3cd6  rust-std-1.67.1-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-armv7-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-armv7-unknown-linux-musleabi.tar.xz.asc
+sha256  720958bc039c9ff00e7e399adf45f044484c5695a71bde0d07e0c895a819fe74  rust-std-1.67.1-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-i586-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-i586-unknown-linux-gnu.tar.xz.asc
+sha256  22cbbf0b22d9b0894cfbd6e1dd6b95b71c7ad02cee4e477d375dcf81af8d1337  rust-std-1.67.1-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-i586-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-i586-unknown-linux-musl.tar.xz.asc
+sha256  49beb678732f34a0bfc22f94900c3d4a17ec05effdb7377864042df73b2a2819  rust-std-1.67.1-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-i686-unknown-linux-gnu.tar.xz.asc
+sha256  aab2d7aa76793e78c9c8810e93ed8978f6422843b1277e9c60337b0f943a4409  rust-std-1.67.1-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-i686-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-i686-unknown-linux-musl.tar.xz.asc
+sha256  a2c6e55a8a2987d0c306d2c164347a70ab7a6a18f6562039a772b33e25934972  rust-std-1.67.1-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-mips-unknown-linux-gnu.tar.xz.asc
+sha256  048b3da190212b742f7a052618b57683dc96ee2b6c25fc7f5ae751143cb79bad  rust-std-1.67.1-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-mips-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-mips-unknown-linux-musl.tar.xz.asc
+sha256  b9ef413b764a92d42e07a2e588268ece09994d2cd1ab2a93858c27f85a250349  rust-std-1.67.1-mips-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-mips64-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-mips64-unknown-linux-gnuabi64.tar.xz.asc
+sha256  ef7fe3160de629f0d38788f2c270f87b0631480e5b0d848595b460528de719e4  rust-std-1.67.1-mips64-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-mips64-unknown-linux-muslabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-mips64-unknown-linux-muslabi64.tar.xz.asc
+sha256  15fdb3e8b39c8a122e9beee0c4c909ee8ec356e57aaaaae5f2b9e94f58d73c87  rust-std-1.67.1-mips64-unknown-linux-muslabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-mips64el-unknown-linux-gnuabi64.tar.xz.asc
+sha256  6ccfd98fd920cc2f1199bcf9a842430c27f6fcd2cc46c18421e487309ff7811e  rust-std-1.67.1-mips64el-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-mips64el-unknown-linux-muslabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-mips64el-unknown-linux-muslabi64.tar.xz.asc
+sha256  78477c45f5b848b156adaf0e0f6f2954ae73e2903321d1636c155020175eaaf5  rust-std-1.67.1-mips64el-unknown-linux-muslabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256  94410897626546dde806a114299c3c32abb6b4b294af5daea5c4d136751fe063  rust-std-1.67.1-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-mipsel-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-mipsel-unknown-linux-musl.tar.xz.asc
+sha256  b3f1a338e69428f1611f059c67b8afafa78ce5c7ed0799f8a90795390261d3a4  rust-std-1.67.1-mipsel-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  26efe78c09ed36da34964c0d023cf9aa404766ab790a94d9becd373b8879cb5a  rust-std-1.67.1-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  135f5e6ab6d8f077a14521d387d3f31831abdb840ca4e6a15b6f0d0d5b7dbc81  rust-std-1.67.1-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  364c47ed22e4268edf238d221c40007d7d8792a66ca325d3937596a9c911ea48  rust-std-1.67.1-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-riscv64gc-unknown-linux-gnu.tar.xz.asc
+sha256  63a7e6a6c889a3d01bb3c66a3def3e41963511ea52e13906669da5b29b2fd9da  rust-std-1.67.1-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-s390x-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-s390x-unknown-linux-gnu.tar.xz.asc
+sha256  04573298d9e815c1e8c47a2f9548ea55d4a2afc538eceaa6a704d44a5e1f7e3e  rust-std-1.67.1-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-sparc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-sparc64-unknown-linux-gnu.tar.xz.asc
+sha256  addf0b0beb1966787e599f32849f18c28d5cb65515272b7d9608d4a1dddee2e7  rust-std-1.67.1-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  f4dc8468dfc1dbd86f865b10f06e0e4b4e76f5a3a1cc27317a520ab1660844e9  rust-std-1.67.1-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.67.1-x86_64-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.67.1-x86_64-unknown-linux-musl.tar.xz.asc
+sha256  89741cd2ac00c3a3f565bcccdf442cc1f9ec58ea419f1f0d09e911be0ff86c87  rust-std-1.67.1-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index d62ce39cfc..bb66de5ec5 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_BIN_VERSION = 1.67.0
+RUST_BIN_VERSION = 1.67.1
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/0001-fix-unsoundness-in-bootstrap-cache-code.patch b/package/rust/0001-fix-unsoundness-in-bootstrap-cache-code.patch
deleted file mode 100644
index 3eae34642f..0000000000
--- a/package/rust/0001-fix-unsoundness-in-bootstrap-cache-code.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 6bf37780ed49846c78d6707355f1cf44790c4301 Mon Sep 17 00:00:00 2001
-From: Michael Goulet <michael@errs.io>
-Date: Mon, 12 Dec 2022 18:29:33 +0000
-Subject: [PATCH] =?UTF-8?q?=F0=9F=9A=A8=20fix=20unsoundness=20in=20bootstr?=
- =?UTF-8?q?ap=20cache=20code?=
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-(cherry picked from commit 3fe64ebbce21e79adb64099984e96dfb79bdd0f9)
-Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
----
- src/bootstrap/cache.rs | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/bootstrap/cache.rs b/src/bootstrap/cache.rs
-index be5c9bb0788..05f25af68ea 100644
---- a/src/bootstrap/cache.rs
-+++ b/src/bootstrap/cache.rs
-@@ -89,16 +89,16 @@ fn hash<H: Hasher>(&self, state: &mut H) {
- 
- impl<T: Internable + Deref> Deref for Interned<T> {
-     type Target = T::Target;
--    fn deref(&self) -> &'static Self::Target {
-+    fn deref(&self) -> &Self::Target {
-         let l = T::intern_cache().lock().unwrap();
--        unsafe { mem::transmute::<&Self::Target, &'static Self::Target>(l.get(*self)) }
-+        unsafe { mem::transmute::<&Self::Target, &Self::Target>(l.get(*self)) }
-     }
- }
- 
- impl<T: Internable + AsRef<U>, U: ?Sized> AsRef<U> for Interned<T> {
--    fn as_ref(&self) -> &'static U {
-+    fn as_ref(&self) -> &U {
-         let l = T::intern_cache().lock().unwrap();
--        unsafe { mem::transmute::<&U, &'static U>(l.get(*self).as_ref()) }
-+        unsafe { mem::transmute::<&U, &U>(l.get(*self).as_ref()) }
-     }
- }
- 
--- 
-2.25.1
-
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 2a260ca64f..1b4b08cecc 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,6 +1,6 @@
-# From https://static.rust-lang.org/dist/rustc-1.67.0-src.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rustc-1.67.0-src.tar.xz.asc
-sha256  9ef8cf88a1d35d319808daf2f193aadca9ed9bcae1d4d5db8946a448c9432c6d  rustc-1.67.0-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.67.1-src.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rustc-1.67.1-src.tar.xz.asc
+sha256  77e0615011f887d9533d5374bf9c15c590c3caf32bbb035b392d1c2ae502a682  rustc-1.67.1-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index d14ad3a3e7..814a3c1dd4 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_VERSION = 1.67.0
+RUST_VERSION = 1.67.1
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
