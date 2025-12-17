Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1731D66B9D
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 19:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7264580AE5;
	Wed, 17 Dec 2025 19:40:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rgf422I2Tmw9; Wed, 17 Dec 2025 19:40:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8D1280AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766000400;
	bh=YHpFi8TOz6RXeicJYixXGfNzWqtQHKPVvUpcoS9XdpM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FiCzV4zCEparLJStwi0XCrvrXh20xi+4zMW6nCB3J4FTlfbBssFIY9xFYIpETXUA+
	 SRwuvwEqq6Yq+cH0+YZYNHUVwyclUxz7wQLteJMC/ZcC50CtlMHNn1dhPCTV9aGPkw
	 mqFhofWux06BuF3ZcXwtt8S2IeotcOIfQcTSdeT1tMIdV1aWY6arwqhXixl6dcU1im
	 NQW7KsbDGrAxCC3sHfa0UT9mgrAGwm/rsAjqQm1qTnEU8lt5AsBQIcrk2TplBpdRpj
	 cvCHab33+qa4OzuF3BAtyCqFLOcjZmexlnPuG2Ccpuiy9jhEQoZzH+tPZvvXzW+kZn
	 KEszrcUUkWv5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8D1280AEA;
	Wed, 17 Dec 2025 19:40:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 03E58375
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 19:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEABD4044F
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 19:39:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PJWRq0etS5bC for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 19:39:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5AB23403D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AB23403D8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5AB23403D8
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 19:39:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 79C0FA4C3CE8;
 Wed, 17 Dec 2025 20:39:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45960)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVxNK-000000003fY-2h1i;
 Wed, 17 Dec 2025 19:39:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Mariusz Bialonczyk <manio@skyboo.net>
Date: Wed, 17 Dec 2025 20:39:53 +0100
Message-ID: <20251217193954.3771735-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766000395;
 bh=I4H8I4eCx647N5095tnAaFmGYDT9a5ket3/KmVesSJk=;
 h=From:To:Cc:Subject:Date:From;
 b=YrswU2k9mD896kaePNeQQ7EPM9TOhliX32yFTppbSh2FJ9oTn3Sd34AAj7oRELFwI
 wYTr3dRdaLsWmMvOwwP4mZ7s+1DmaV9knpyHzTqfNwYZpwcRbaPSpUHfx2mWjqm2Wy
 8/mcmN6Xo0/Oe9HTXaKaTgOFG8kWSiBQKl0fbgiSAh6EzLqnEUz9vwjh521XxoyGRq
 412CxG8bK0/29mubgf6iqWvslo3ic8L+i4z7OuU7pcK7VHZ8TEskp9pnoxZtHBwFvA
 ovfKxNAr9LRzJne1dYegIUp3F0qVy7o3ofc7HBHR6UhGS6qYNmw/kV7Ehc0J/5U4al
 CykeXFjWlSTSQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=YrswU2k9
Subject: [Buildroot] [PATCH v2 1/2] package/rust: bump version to 1.92.0
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

https://blog.rust-lang.org/2025/12/11/Rust-1.92.0/
https://blog.rust-lang.org/2025/11/10/Rust-1.91.1/
https://blog.rust-lang.org/2025/10/30/Rust-1.91.0/
https://blog.rust-lang.org/2025/09/18/Rust-1.90.0/
https://blog.rust-lang.org/2025/08/07/Rust-1.89.0/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: no changes

 package/rust-bin/rust-bin.hash | 128 ++++++++++++++++-----------------
 package/rust-bin/rust-bin.mk   |   2 +-
 package/rust/rust.hash         |   4 +-
 package/rust/rust.mk           |   2 +-
 4 files changed, 68 insertions(+), 68 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 7f9d2f6339..ea3bbab8b7 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,70 +1,70 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rust-1.88.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  d5decc46123eb888f809f2ee3b118d13586a37ffad38afaefe56aa7139481d34  rust-1.88.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.88.0-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  1f28a28b025ab2637f479f7f239c391a83319dcb89c53819c5a828fe4f92616a  rust-1.88.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.88.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  e685d4a1d4d616fbf2accf13f29f3dfa431e62b49125499677a7c0954afd216e  rust-1.88.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.88.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  a06706c8e76dcdd652b74d8737d4d99c20991068520bca86712d3e6d94d141e5  rust-1.88.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.88.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  4e429d0c390032e556cea9a5729b8abc035aa421a1ad3ac232b63308705c14bb  rust-1.88.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.88.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  3021ad1c6f5c5d177546f9890acaac105fbfc211bfd4b11fc06156f85112df09  rust-1.88.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.88.0-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  96f49ff456bd5649f19f2165864f5588d1bb1f533b9da8b4e3c7b65d61b28a7f  rust-1.88.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.88.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  7b5437c1d18a174faae253a18eac22c32288dccfc09ff78d5ee99b7467e21bca  rust-1.88.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  e9ac4ff3c87247a2195fcceddbf1bdeee5c4fd337f014d8f4c4e3ac99002021f  rust-std-1.88.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-aarch64-unknown-linux-musl.tar.xz.sha256
-sha256  b1562ce0836d5071abbbeaf52e3db9ce0d37fa432f5202b8f661aa4881b4c3e4  rust-std-1.88.0-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-arm-unknown-linux-gnueabi.tar.xz.sha256
-sha256  598e389223ebef13efe6ef8d4dc11da3427c3716f21fd089b9ec5afbec1bb900  rust-std-1.88.0-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  b5e1f168fa02ad57e1ace9ac3d379a9c95f816a26f12156216521a22e192f123  rust-std-1.88.0-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-arm-unknown-linux-musleabi.tar.xz.sha256
-sha256  89190b0de686052ff76418f67efa25ca83430f112737c2625d2911d0839cf9fc  rust-std-1.88.0-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-arm-unknown-linux-musleabihf.tar.xz.sha256
-sha256  5aa9d94539b8e5dc02454ca5605c420d7e96c74e62ec53889cc27d2744edef95  rust-std-1.88.0-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-sha256  37b77f0e226f291f42d02c4d3011d53a4bde67fc4b49ae205fde80cd50b55d8a  rust-std-1.88.0-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
-sha256  fe75a39a140e5ab430d17d6aed2b93b5c17735ece4c578629f5210d43512d6b6  rust-std-1.88.0-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
-sha256  60ee3766f67d6404f8c9e77090c57c21fef7eca540ec0ab2f2cd2b28a21dca37  rust-std-1.88.0-armv7-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  f9e13ca81872019186a67c44919c017b1bfa80c1e2784caee81ab1f65f548b5b  rust-std-1.88.0-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-armv7-unknown-linux-musleabi.tar.xz.sha256
-sha256  822c8dc77c50eaf4786c42b9004daf3aa05472b3247d11c02caf8bc1d408d67f  rust-std-1.88.0-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
-sha256  fd6684c2454c2859209e1f9791d4f7bd5be4e75f599276220ba8814f94f331cb  rust-std-1.88.0-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-i586-unknown-linux-gnu.tar.xz.sha256
-sha256  7c9016ce85e24dde9d76c0a34061fa0fd6f742ea495dd1784804b60061b39627  rust-std-1.88.0-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-i586-unknown-linux-musl.tar.xz.sha256
-sha256  ab409bb848d7109005857e14cd200f5a07479b3c6b8c7fdda9325af61672a273  rust-std-1.88.0-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  ced56f7ab86496f6eb42d356841f9d0b625159eba65afd1913f232bb66d4b7e0  rust-std-1.88.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-i686-unknown-linux-musl.tar.xz.sha256
-sha256  dcd1ef607728bcc73bcd70341094a6fcaa1dbbfb01cfc48505c0e93b62394eb8  rust-std-1.88.0-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  891fe38736ca637bcd776f6d2b1822d761bd92305188482e45d26ab0dd84344b  rust-std-1.88.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  89cf8b30e0fae601e0603e41d5eaf58881729208cac83636eff89b94724b7112  rust-std-1.88.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  1030e71f755692c3429bb16829cca776c1ac372abbce3001b04d4e46b1e4f32f  rust-std-1.88.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  d446fc0d8e4ce985c2d21aa2adb6ec9fce8f7ebde85655200abd71e142b9a981  rust-std-1.88.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  df3144f87a22d606abea4dcfe88369fcd499ef2fc748724b47941308ae259a5d  rust-std-1.88.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-sparc64-unknown-linux-gnu.tar.xz.sha256
-sha256  95be6d0dec8be07fa13313a10dd177e72df9737660c235a3e673bffcdd2e9068  rust-std-1.88.0-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  36d7eacf46bd5199cb433e49a9ed9c9b380d82f8a0ebc05e89b43b51c070c955  rust-std-1.88.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-x86_64-unknown-linux-musl.tar.xz.sha256
-sha256  0c42b63c18a6343851e0f27aeb5cff73146c86fc95bc4e2bf51b726c4311249e  rust-std-1.88.0-x86_64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.92.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  3e383f8b4fca710d0600d0c1de97b78281672be2cda6575ecbe1c183a12e3822  rust-1.92.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.92.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  bdccb6bf0eb08b256ec08115e6b7a7daeb5db097b2f75288f1935ee3177f2cf1  rust-1.92.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.92.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  f58ad2bc8903fc0ef77cd3e2feede4f4a68310cf56bbcb0a549d380d1c1d6a55  rust-1.92.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.92.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  5dc26b78305c03a87e12dde87ac3d5b667cadc854275e2c6347f18407c631888  rust-1.92.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.92.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  969d854af42dc47bf70359d6255782557dc2ca911d0078e1d3894585f5309639  rust-1.92.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.92.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  5492105083990bc0fd91008b1dc66b748b9687bbaf16719b5b37b1f09bf59458  rust-1.92.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.92.0-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  4e679268dbc82d3be86b94d358a9446ab1559e5a9cba997d02d13930eb4f5a2c  rust-1.92.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.92.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  d2ccef59dd9f7439f2c694948069f789a044dc1addcc0803613232af8f88ee0c  rust-1.92.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.92.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  ce2ab42c09d633b0a8b4b65a297c700ae0fad47aae890f75894782f95be7e36d  rust-std-1.92.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.92.0-aarch64-unknown-linux-musl.tar.xz.sha256
+sha256  94b9f84f21d29825c55a27fbb6b4b9fb9296a4a841aa54d85b95c42445623363  rust-std-1.92.0-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.92.0-arm-unknown-linux-gnueabi.tar.xz.sha256
+sha256  35478e20f8cc13912b31f2905b313a2820ddae564b363a66ab7a5da39d12787f  rust-std-1.92.0-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.92.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  836ada282b65c57d71f9b7e6fb490832410c954aac905c5437fb0bf851b53c83  rust-std-1.92.0-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.92.0-arm-unknown-linux-musleabi.tar.xz.sha256
+sha256  91d3c5fdbda9ba2e778bb638e3a5d060f3021bbc7a60edf22b0035be4e611b30  rust-std-1.92.0-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.92.0-arm-unknown-linux-musleabihf.tar.xz.sha256
+sha256  20411e3858308add0dadde9ce2059d82cdd6c5339881fa93ac995e733df0f832  rust-std-1.92.0-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.92.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+sha256  702be50f225ad4681af1bf9c40fd020b4623ee46aab5363ea96e4874dffb694d  rust-std-1.92.0-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.92.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
+sha256  c1c645c1b33625b9735a7c6f062a122fb172957093fac33f8ee3b80663deeb41  rust-std-1.92.0-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.92.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
+sha256  3d5e3fb14441ea8e6fc6307cbd89efd69be42143ff7f2b8dfb19818ddca993c0  rust-std-1.92.0-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.92.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  e3ac810db43067d8af9e17679d47534e871f1daad8cd0762e67da935681e9e19  rust-std-1.92.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.92.0-armv7-unknown-linux-musleabi.tar.xz.sha256
+sha256  89cbf7db934d543754b446a52398081ec40ee6b98ed5bca93ac1dbd5faf48c16  rust-std-1.92.0-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.92.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
+sha256  c7c08a389bd351226fd52266bfe2d2c444597e1bbb5d0307da44bdfa4df62c99  rust-std-1.92.0-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.92.0-i586-unknown-linux-gnu.tar.xz.sha256
+sha256  8b984b31ffca1f27d32ee77ec2cc4c2ab59e72beab67bfce13bbd926dbea8715  rust-std-1.92.0-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.92.0-i586-unknown-linux-musl.tar.xz.sha256
+sha256  059d919f147e6bd40e132ad00ee23de59d5464f5e3409f3139b3ac14faf45893  rust-std-1.92.0-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.92.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  abc840631a4462a4c8ec61341110ff653ab2ef86ef3b10f84489d00cc8a9310d  rust-std-1.92.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.92.0-i686-unknown-linux-musl.tar.xz.sha256
+sha256  c796874b1343721f575203fa179dc258e09ac45cd95dd6c35c4d5979a3870494  rust-std-1.92.0-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.92.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  c3e809a324b00eb53096c58df38645bb496c6560de334dfe04ed0b77c0605aaa  rust-std-1.92.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.92.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  2ce706afa4a46b6773340854de877fc63618a40e351298a4e3da8eb482619863  rust-std-1.92.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.92.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  eba59766c2d9805c0a1fc82fd723acbb36569e1bec1088c037bba84d965f70ba  rust-std-1.92.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.92.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  8ee20dcf3b1063fa6069b3ce85e1fcf42794dfa783263314865cb53fff42d9e4  rust-std-1.92.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.92.0-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  ebf944dc95015498d322504a54e4f9cdb28590f7790aa3a9eb86d6cf4b6c93ff  rust-std-1.92.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.92.0-sparc64-unknown-linux-gnu.tar.xz.sha256
+sha256  d85afb14120c3c7367338a565a920db653dccd4bc5062398791d7b62b89fd1fd  rust-std-1.92.0-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.92.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  5f106805ed86ebf8df287039e53a45cf974391ef4d088c2760776b05b8e48b5d  rust-std-1.92.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.92.0-x86_64-unknown-linux-musl.tar.xz.sha256
+sha256  11f0b7efccdb5e7972e3c0fc23693a487abc28b624675c08161d055a016d527e  rust-std-1.92.0-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  b71bd43a069ca0641a9ecfe585ca7b3c53b5cc1608f8b68321168698e28b5ea1  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 215bd84ad3..db7d4a1cae 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_BIN_VERSION = 1.88.0
+RUST_BIN_VERSION = 1.92.0
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 7b22bb8c94..b42e63f0d5 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,8 +1,8 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rustc-1.88.0-src.tar.xz.sha256
-sha256  0c1dcbb4f762513d021e1a282c0ac58c0a423642b3a6bf581cafb5414df4193e  rustc-1.88.0-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.92.0-src.tar.xz.sha256
+sha256  ebee170bfe4c4dfc59521a101de651e5534f4dae889756a5c97ca9ea40d0c307  rustc-1.92.0-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  b71bd43a069ca0641a9ecfe585ca7b3c53b5cc1608f8b68321168698e28b5ea1  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 9999475c35..f9889e3931 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_VERSION = 1.88.0
+RUST_VERSION = 1.92.0
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
