Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6778C433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Apr 2022 12:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77C4440990;
	Thu,  7 Apr 2022 12:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lBqwRIKYfjHQ; Thu,  7 Apr 2022 12:00:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 279A440347;
	Thu,  7 Apr 2022 12:00:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A28BA1BF577
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 12:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9238E81337
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 12:00:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e9IqHPn6cH_b for <buildroot@lists.busybox.net>;
 Thu,  7 Apr 2022 12:00:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BF5A8137F
 for <buildroot@buildroot.org>; Thu,  7 Apr 2022 12:00:02 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id u3so7524121wrg.3
 for <buildroot@buildroot.org>; Thu, 07 Apr 2022 05:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P44efHDlkrgCYg4PgXLokLW8rI0T6CA1bxcChC3SViw=;
 b=L6bkESwEOzehQxy5Nh7qxyRZrs2vZqhL87uDzgiXBVVXg2e5JaUX9CmksDXbFozw89
 7/5S+iMZ9JCKZ++L6nWwShaEmYl/SovGl1rwHiXidLthgsmgt5/ZpokcBoWDa++BdNA9
 uGYjUp648Cz6TXNcihwyuo7zP00WMDwibvajzsDlJyhclsTYoZYO5AkeuDPAMiMkwhDd
 78xyT9ve/NjV8O7QG21SO1euSpe4bitwDCW2Nn7VpDfswR+5miba7jZZxB8hXqh1XBbk
 WBtQE/rNAQXPYPuYuh/ECy1m6MD+ZNNhI5n+NNY/q4CjGRQ3jsRC+mNc2WnfYWH0Zf5s
 gezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P44efHDlkrgCYg4PgXLokLW8rI0T6CA1bxcChC3SViw=;
 b=WpLZ21kiQgVNrKARAUT+8lIVrUXE7x7q4gtSCWwYt2jNpWCddfasud+t5zVrntK0sM
 BpO/XP0zYuzi8vGkv+rRoSO0GmZoPlZGm+hP+hbnjpAKxrRiN/nzJeInwMTdMc5S9gm7
 MZdUwV7AGZHsf+RMDF+HwIT+Vk6MEWPyWs0xkbYKCq+03ET9ebJupIWW7LIxM/jP4vBk
 VtkwxZ/w/l73Im9C1Y9h17Rpc8ms9X1kOqYvAtyi2YhHGQ/C2LEsUa436uR6OSKYF+OD
 IvGBzjacKcx8IFtAec5xhQvU+LyUulUpl1ismKzyT6uzdrUDfukdCPdscdnuuhUbd7ZK
 L5fA==
X-Gm-Message-State: AOAM531ZRU1Fis9LPQt0wUKpUvOPJ5pnNk2ZWjP/Xsx1GP6wlpOv/0RQ
 bjAvhWES2JxPtE5b2jBEAb63msxOVWCOkA==
X-Google-Smtp-Source: ABdhPJyxewQAyX5YG4rxQWupL77mQZQkK6KL2ZmsDKV0vvT5nz2xs7isO3KbOHDkLosrwxWbegwfIw==
X-Received: by 2002:a05:6000:1e05:b0:204:12a3:ff6d with SMTP id
 bj5-20020a0560001e0500b0020412a3ff6dmr10837479wrb.321.1649332799653; 
 Thu, 07 Apr 2022 04:59:59 -0700 (PDT)
Received: from nitra.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 d20-20020a05600c34d400b0038caf684679sm9625334wmq.0.2022.04.07.04.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 04:59:59 -0700 (PDT)
From: Nicolas Tran <nicolas.tran@smile.fr>
To: buildroot@buildroot.org
Date: Thu,  7 Apr 2022 13:59:52 +0200
Message-Id: <20220407115952.56219-2-nicolas.tran@smile.fr>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220407115952.56219-1-nicolas.tran@smile.fr>
References: <20220407115952.56219-1-nicolas.tran@smile.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: bump to version 1.59.0
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
 Nicolas Tran <nicolas.tran@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Link to Rust version 1.59.0: https://blog.rust-lang.org/2022/02/24/Rust-1.59.0.html

Signed-off-by: Nicolas Tran <nicolas.tran@smile.fr>
---
 package/rust-bin/rust-bin.hash | 198 ++++++++++++++++-----------------
 package/rust-bin/rust-bin.mk   |   2 +-
 package/rust/rust.hash         |   6 +-
 package/rust/rust.mk           |   2 +-
 4 files changed, 104 insertions(+), 104 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 9f8788a295..1aa166c45e 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,102 +1,102 @@
-# From https://static.rust-lang.org/dist/rust-1.58.1-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.58.1-i686-unknown-linux-gnu.tar.xz.asc
-sha256  110ca4967351d8535f3d39e24f40e2941c20346c5765d3530270e134ae50568e  rust-1.58.1-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.58.1-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.58.1-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  f71b077caf0becbd0af9fd22bc1fa31c4fdf7a21fe046da8a15a7bde1286da25  rust-1.58.1-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.58.1-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256  c7a016ac63aeb5481d661ee3e680b57d35d5ccb902c605c32937a047a02cff49  rust-std-1.58.1-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.58.1-aarch64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-aarch64-unknown-linux-musl.tar.xz.asc
-sha256  4c8d9774fb1f6cfa616f2c43395f438e887a38f0cd901a3886056cc1c1b84c30  rust-std-1.58.1-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-gnueabi.tar.xz.asc
-sha256  eb58c2b72e9bbe50c80e9f2981e14d737198f7e17a4cad524d00baefdfa3bc1d  rust-std-1.58.1-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-gnueabihf.tar.xz.asc
-sha256  58e3f4905c3e7028811971219a3222640f947062fb93dbe51c1674551e9b06a6  rust-std-1.58.1-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-musleabihf.tar.xz.asc
-sha256  b354f0ad28d8cc7d5996d46c3a310c80aa6486ac7b89abcd1eeef7f13435e0ff  rust-std-1.58.1-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-musleabi.tar.xz.asc
-sha256  705fba2a50835354112ab86d1ee8889c39f3c7265d7ca26f1dffebaa463600a6  rust-std-1.58.1-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.58.1-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-armv5te-unknown-linux-gnueabi.tar.xz.asc
-sha256  0505759fa8b26c902a701f266db4bfbfe496de71c5c6548a55c562fe9d386485  rust-std-1.58.1-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.58.1-armv5te-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-armv5te-unknown-linux-musleabi.tar.xz.asc
-sha256  9ca8adb43b4e75556a99b6c7a9bc1d9aab894bbe109736c34582169ec81aee14  rust-std-1.58.1-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-gnueabihf.tar.xz.asc
-sha256  9f38bc3220d659ff482db9a0ace9dcb7051991d471149fad7bbb62fce8314e04  rust-std-1.58.1-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-gnueabi.tar.xz.asc
-sha256  1511c675d17033737ab2bd1e87b525aaf59e0455f5a717ab0a91fd849949164f  rust-std-1.58.1-armv7-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-musleabihf.tar.xz.asc
-sha256  2cf8a8cc2441a1bb4b45b690c87fff4df975fac077240706c08594e26f901bdc  rust-std-1.58.1-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-musleabi.tar.xz.asc
-sha256  db86e823484f210884d7d815ffcd7dae355bba86e18151b0838ec06544bb8126  rust-std-1.58.1-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.58.1-i586-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-i586-unknown-linux-gnu.tar.xz.asc
-sha256  02bce02f929114cc60126410fceeab6c0bcc8b96c394de9516d8f449880cb585  rust-std-1.58.1-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.58.1-i586-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-i586-unknown-linux-musl.tar.xz.asc
-sha256  e80d5769f042a00388546dbd26cb40c045d5dddc84e5da3f98d174027ed9eaaa  rust-std-1.58.1-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.58.1-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-i686-unknown-linux-gnu.tar.xz.asc
-sha256  d7f2bc431db551ea9019a6d50d4e3f11e14fabbea3abec1478ac72a281309152  rust-std-1.58.1-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.58.1-i686-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-i686-unknown-linux-musl.tar.xz.asc
-sha256  c70fbb13aedfb88cfec8098355a155a4edce3d52f9b099bc033b7c7ac45aab00  rust-std-1.58.1-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.58.1-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-mips-unknown-linux-gnu.tar.xz.asc
-sha256  b678ac0282cbb1965f9a7485a1f56b01d0229f91ddff5a18a9628f86970f5902  rust-std-1.58.1-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.58.1-mips-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-mips-unknown-linux-musl.tar.xz.asc
-sha256  2f571f4c9b4e86e278539e811f495fb84f44898d4333b983a3d95ef5d2c0fdd8  rust-std-1.58.1-mips-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.58.1-mips64-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-mips64-unknown-linux-gnuabi64.tar.xz.asc
-sha256  7f2f613606f039eec83239753a83c227b1d3c39b6474647234e7788a1541e850  rust-std-1.58.1-mips64-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.58.1-mips64-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-mips64-unknown-linux-muslabi64.tar.xz.asc
-sha256  7283539843df5c8abd06b0ce3830efeab0d673447b45d3b6636d2eb296d28681  rust-std-1.58.1-mips64-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.58.1-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-mips64el-unknown-linux-gnuabi64.tar.xz.asc
-sha256  3d2935e0979a7150cc271481f5f06569005ee27f0a7ef7ed1a5393c3e34b1974  rust-std-1.58.1-mips64el-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.58.1-mips64el-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-mips64el-unknown-linux-muslabi64.tar.xz.asc
-sha256  33078d23ea70ca405b5938e5a2a74fbf4ec7dc41b729e4991e3e01d4c8370028  rust-std-1.58.1-mips64el-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.58.1-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256  fdade0d00dac3524348041ec915a5a96208c9c1929ce746ab6352d0d2897a3a7  rust-std-1.58.1-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.58.1-mipsel-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-mipsel-unknown-linux-musl.tar.xz.asc
-sha256  c747a00ac9a6ee70793002e6db2fbce3b2cd60eda277729468d18369736c6c8e  rust-std-1.58.1-mipsel-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.58.1-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256  7813f825e5d10aac0ded4b3f785970c69c25464b4edcf9c2b83eff0e55ee95f3  rust-std-1.58.1-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.58.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256  c68d93de3a46ec709788fee2c38a298a261d4254d299299195ab3474b316a59b  rust-std-1.58.1-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.58.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256  a85f5f42918e8b140d7093ba49fc46a21625863538c95d2db03f831cc445f025  rust-std-1.58.1-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz.asc
-sha256  2d7276fe261478c377913177dcec3e0aeed84f2c567db0ae8e415efee7bb9ce0  rust-std-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.58.1-sparc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-sparc64-unknown-linux-gnu.tar.xz.asc
-sha256  7a7cd002c63179f3f47d64b1140c180986322a7cc0d31de61d7c4728cedacba0  rust-std-1.58.1-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.58.1-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  e72367c15906f021f46801652181c917cd3328be022b93bb30506724f7b56256  rust-std-1.58.1-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.58.1-x86_64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-x86_64-unknown-linux-musl.tar.xz.asc
-sha256  b0d3e03c9b1eff6e241383913b02653ba80776626ca7c4a93f36c2ad829ba989  rust-std-1.58.1-x86_64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.59.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.59.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256  b4144c89f9482f3e76ccad09d0a3072c935b7c0abdb9a52edbd641f2e27bb4f0  rust-1.59.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.59.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.59.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  a10c4abcba4891c463612c161246706cd0e8d3ddb1ae75f514d3f02bed235af6  rust-1.59.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.59.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.59.0-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  68e50dee4f6dddeab7330906e46022f57f2c004c847eae3f5b1bc82c59e43fc0  rust-std-1.59.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.59.0-aarch64-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.59.0-aarch64-unknown-linux-musl.tar.xz.asc
+sha256  6b8424e9b99da7df3b842b47476fbff4c371414186ae50ca0aff050a532c1d52  rust-std-1.59.0-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.59.0-arm-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.59.0-arm-unknown-linux-gnueabi.tar.xz.asc
+sha256  b65ffcf5a4b4e4df3893b6da7182e2f91cd174e59fd26a69110809015635708a  rust-std-1.59.0-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.59.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.59.0-arm-unknown-linux-gnueabihf.tar.xz.asc
+sha256  382051a04047463430bfb4d16fe2998fcd00f0945cb99b622e94a7564796846a  rust-std-1.59.0-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.59.0-arm-unknown-linux-musleabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.59.0-arm-unknown-linux-musleabihf.tar.xz.asc
+sha256  f072103ccbd967ccf06c3e4366a56af1f53af89834f02d0151afc144318d9040  rust-std-1.59.0-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.59.0-arm-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.59.0-arm-unknown-linux-musleabi.tar.xz.asc
+sha256  e2f4944fb135c508b0c8dff46caf04eca065e5ee5f5de32494b084c667fd20eb  rust-std-1.59.0-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.59.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.59.0-armv5te-unknown-linux-gnueabi.tar.xz.asc
+sha256  2b9042ae8d24f5d8ada3d1903e24c2cdcc464e74a506cb72054a680b1e0433bb  rust-std-1.59.0-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.59.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.59.0-armv5te-unknown-linux-musleabi.tar.xz.asc
+sha256  1f0726d6b06b7b35de32af45b9f8ac597c89cc5e7236ac6a6dcb91f0412b0e1a  rust-std-1.59.0-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.59.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.59.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
+sha256  310ce12c01fa15f46b8f9eee4a086c818118dbd56cd8400aee04432ba96061df  rust-std-1.59.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.59.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.59.0-armv7-unknown-linux-gnueabi.tar.xz.asc
+sha256  3695a3bee47cfe0624f7822243000a4ee552bf920b403b16cc633513e95498bd  rust-std-1.59.0-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.59.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.59.0-armv7-unknown-linux-musleabihf.tar.xz.asc
+sha256  6c00582c159524a87b8934a5e4cb513d6032474f9a017bf91697e72885bf70fb  rust-std-1.59.0-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.59.0-armv7-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.59.0-armv7-unknown-linux-musleabi.tar.xz.asc
+sha256  dcf0f1ddc6dc5e32a07789408d0a2637d639e00cf214c349921d06d3f73c7b2c  rust-std-1.59.0-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.59.0-i586-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.59.0-i586-unknown-linux-gnu.tar.xz.asc
+sha256  415a93bc55da0879335a18e55552a111a23bd9d5e70598080071f6346a9b4a0d  rust-std-1.59.0-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.59.0-i586-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.59.0-i586-unknown-linux-musl.tar.xz.asc
+sha256  a0a644cb14eec96760b870b585b08a3bf2965844754f8b965b39aded5635ab77  rust-std-1.59.0-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.59.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.59.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256  26e91818a36184998039aeaabbf0972a8610d0d250e4bc03de6f27a7843971b5  rust-std-1.59.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.59.0-i686-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.59.0-i686-unknown-linux-musl.tar.xz.asc
+sha256  5821c1655adc81bc2a347329eab08b651f3312f2eeb972b0a30d93a5c49502f5  rust-std-1.59.0-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.59.0-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.59.0-mips-unknown-linux-gnu.tar.xz.asc
+sha256  05bf10c11ff845f006331ddfdd109e12b1377c156e37eb1bb3bc0402e4219d31  rust-std-1.59.0-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.59.0-mips-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.59.0-mips-unknown-linux-musl.tar.xz.asc
+sha256  af5ee07f5d98296435867ef5859ec207c57413bb61b0d656c39b1f451aaeeb38  rust-std-1.59.0-mips-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.59.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.59.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
+sha256  88c6b0dbadfc7bcc2a2eba0f3328ad1ff1714a5a13f07bffe007aecae59fc9b8  rust-std-1.59.0-mips64-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.59.0-mips64-unknown-linux-muslabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.59.0-mips64-unknown-linux-muslabi64.tar.xz.asc
+sha256  a0533694ed62c9c3f497d94ee51bc9ba08e5f3fb24588e02cf1f1c2efbdb9b43  rust-std-1.59.0-mips64-unknown-linux-muslabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.59.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.59.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
+sha256  6a3462a10da953546412912d04228a63c5d4086a4768163f1bd5ccf81950090d  rust-std-1.59.0-mips64el-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.59.0-mips64el-unknown-linux-muslabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.59.0-mips64el-unknown-linux-muslabi64.tar.xz.asc
+sha256  606d037a01cc7666594b7973c6a727c69426d85adaf94128dc9914e893ef8ed9  rust-std-1.59.0-mips64el-unknown-linux-muslabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.59.0-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.59.0-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256  fd747f4ef4cee6fe88692dd6e3c7b986870ce8a24eab8920adacc7ab73fb482d  rust-std-1.59.0-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.59.0-mipsel-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.59.0-mipsel-unknown-linux-musl.tar.xz.asc
+sha256  4622aa633ad2d0decca59aa65b24195431e40162804352f5bdd9bafd92ee7b9d  rust-std-1.59.0-mipsel-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.59.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.59.0-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  5ead471b53d290960d49a7cec0ba01a082f5e6cfa18825366990d46797dc7161  rust-std-1.59.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.59.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.59.0-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  1217290e951ae84998d2d04a88d154b1da205e2638a3449c02c8e9256bff589c  rust-std-1.59.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.59.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.59.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  15dee7705967e3351aff11c64ada30c4957b54066c7ee49b87be4b8155bd0a7d  rust-std-1.59.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.59.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.59.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
+sha256  74c1f9c94ff4993948c05df2c9c58f76708e6adbacb9b2caca368558dde9590a  rust-std-1.59.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.59.0-sparc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.59.0-sparc64-unknown-linux-gnu.tar.xz.asc
+sha256  6bc109f7ff1f501153cc18eebed9a0cc468eebbfed2cc728047d59456e356f9a  rust-std-1.59.0-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.59.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.59.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  c854a9ee3dd8e5be9522c1581f75838c1cbae6dece3934b0004f138c4a5024a3  rust-std-1.59.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.59.0-x86_64-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.59.0-x86_64-unknown-linux-musl.tar.xz.asc
+sha256  473b6ddf598418db49efc21c3d2702cdaf9c78ee4ae00611c7d9e384a2d4dad7  rust-std-1.59.0-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index d4cb8f50ea..b50465f7a6 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_BIN_VERSION = 1.58.1
+RUST_BIN_VERSION = 1.59.0
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 7eb8f59603..63a5644176 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,6 +1,6 @@
-# From https://static.rust-lang.org/dist/rustc-1.58.1-src.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rustc-1.58.1-src.tar.xz.asc
-sha256  2b3643a48e7087053b0268971ec4154350342508922a8acb0707aaf94deb4469  rustc-1.58.1-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.59.0-src.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rustc-1.59.0-src.tar.xz.asc
+sha256  375996ead731cab2203ec10a66a3c4568ab6997d7e5d3ae597658164fe27be3d  rustc-1.59.0-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index cd8c87b68d..fd02686082 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_VERSION = 1.58.1
+RUST_VERSION = 1.59.0
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
