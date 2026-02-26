Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7777FC5906
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 07:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59DBF41E97;
	Thu, 26 Feb 2026 07:39:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nj03NrL_dFIz; Thu, 26 Feb 2026 07:39:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAA5941EE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772091589;
	bh=Jli1jovVcfmvQBJ5lx3RjBcUMlr7oICqW98ZQuOauN4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=UoR0tiHydznfdrWEd6R/HGRKf7b2lQzhU8vfmf3klNqfeLHWnZ3rcrSwz1Mn+jqwe
	 Bs5xM9c3adOHDPXjiCP9hh3axd9KiZuGHpE44nVS2rnZy81BUyMPlmoxfGYGZstl7f
	 usQH0CUoplDRstv/82XN8/4SgJH1jdICSDpm0Yvma7gW9tTKVPzpHX6qviWMMUuX9u
	 A1WtUzfMHArplG5K2UEcQQQRSA1BZMQJR4CAQvY5zDKJmpah+4ekihYPXWojXv32F9
	 aM2YPosukKYujZ6S0r19/MKnG56dxG48wajzx/DiBTKdEmJ//FGtUWfudzVhLSK5Jv
	 w+zqAAfuIOPsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAA5941EE9;
	Thu, 26 Feb 2026 07:39:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E50724E
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 07:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1052741EE9
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 07:39:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R5K5_9L0z0YM for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 07:39:46 +0000 (UTC)
X-Greylist: delayed 483 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 26 Feb 2026 07:39:46 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3DC6D41E97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DC6D41E97
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:4f8:c2c:d4c8::1;
 helo=mail.sinic.eu; envelope-from=simon@sinic.eu; receiver=<UNKNOWN> 
Received: from mail.sinic.eu (mail.sinic.eu [IPv6:2a01:4f8:c2c:d4c8::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3DC6D41E97
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 07:39:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C647E44E17; Thu, 26 Feb 2026 08:31:37 +0100 (CET)
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 26 Feb 2026 08:31:33 +0100
Message-ID: <20260226073135.64960-1-simon@sinic.eu>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sinic.eu; s=dkim; 
 t=1772091098; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=Twoz/rFcADUTCwtCFMpYKXsjU9J6w62SVRIZrvW3g20=;
 b=QJb1IY1+BkRND32/jYSuFlqHAOOfgUA1jmh1od/YPQ6tYfzi3l0PfEhuEuIff/2tYQquFk
 qNLjlSCRwTFyj0sdTVr0LSVe492n1OPDeIVmjLy2Hs91BuzNwhvM64LjJguPxqRQIsTRmQ
 XXts3pGEHKSnblAKSBdWwzi8HFZAcppHkCXuMhJuSkR/Rt12NE0LEXm8AiixN0st11PWm5
 G4uWmUisQzQKlQXOf4C9phy2oU681EQI+4kQ0V8GsVuyF30C8Ii9I1hIwx8LhAaMHOLtlg
 STWCw53hxOHem31WddUD334mRFvB9ZCd4a+WXlpQ7c1n3N30owqGZwunXeuJtw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=sinic.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sinic.eu header.i=@sinic.eu header.a=rsa-sha256
 header.s=dkim header.b=QJb1IY1+
Subject: [Buildroot] [PATCH] package/rust: bump to version 1.93.1
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
From: Simon Richter via buildroot <buildroot@buildroot.org>
Reply-To: Simon Richter <simon@sinic.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://doc.rust-lang.org/stable/releases.html

Signed-off-by: Simon Richter <simon@sinic.eu>
---
 package/rust-bin/rust-bin.hash | 128 ++++++++++++++++-----------------
 package/rust-bin/rust-bin.mk   |   2 +-
 package/rust/rust.hash         |   4 +-
 package/rust/rust.mk           |   2 +-
 4 files changed, 68 insertions(+), 68 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 7f9d2f6339..2db014ad46 100644
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
+# From https://static.rust-lang.org/dist/rust-1.93.1-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  701d55b62286bed013ceb2393ff7687d0953205605afaa15c62e2cd18024c32c  rust-1.93.1-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.93.1-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  7ed2f462bf353060233899722393d78845068f89b15711db03aeba7f2290362f  rust-1.93.1-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.93.1-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  519cf805facbe77cd2a6828f142fbf69438f2180efb8a4a3e56ea1a3b3ff95f5  rust-1.93.1-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.93.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  f65a0c4b6122c75639b1a3a832fdabcb34cf45b4953a2858f84c7d1501738f91  rust-1.93.1-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.93.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  e18f33f26c7222569dac0eb1c8a216aefa8a0a3e1472094e6d11375b95cd40c2  rust-1.93.1-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.93.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  388da45034fbf65328feb0be364e1fddc06dd6c240e9bd1214ebc64554eb3a90  rust-1.93.1-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.93.1-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  8a431036d5b96ba8cf05fe088601dc9861f47d62e70e65f5e106e74fcda694d8  rust-1.93.1-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.93.1-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  518872275a3648f735471d7add854d39171c5a6b17f423c4d7f931f52120c2af  rust-1.93.1-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.93.1-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  56f2cd66ad7167dd6924ff095063ffddfe731812a1909b9200bb0ee21982fc47  rust-std-1.93.1-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.93.1-aarch64-unknown-linux-musl.tar.xz.sha256
+sha256  d4db571644ffd89f02c3ae33cc9dbfbfadf97f9be60e12d23e08550d5563e475  rust-std-1.93.1-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.93.1-arm-unknown-linux-gnueabi.tar.xz.sha256
+sha256  59e81221c2a707eee11ee216d84afc49166724c2a5aabe76b449a244e3ffcb30  rust-std-1.93.1-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.93.1-arm-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  a4c5cca1da64dd357d7b1578388cf4538a638c62ddd0c71ae7274efb1daf9cdc  rust-std-1.93.1-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.93.1-arm-unknown-linux-musleabi.tar.xz.sha256
+sha256  6132f253f6803d2b10e8f7f2ae0bcd218ad615ad21d9afdbcdd58f0672781961  rust-std-1.93.1-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.93.1-arm-unknown-linux-musleabihf.tar.xz.sha256
+sha256  f98a163fd0e0bc16c559ec3b103e9944cc029bf517a70e3131c8eea039bdde14  rust-std-1.93.1-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.93.1-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+sha256  3e1a8cf7099df57a3e261f81a2f312a098fe4a0727c10805d544c9306726de16  rust-std-1.93.1-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.93.1-armv5te-unknown-linux-musleabi.tar.xz.sha256
+sha256  4496c2641d2d4aba5b570805d68bbe585e31d621bb3a41bce1d81da5dbeeb196  rust-std-1.93.1-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.93.1-armv7-unknown-linux-gnueabi.tar.xz.sha256
+sha256  14760fd17fa4d3faffbfe6d606fc0bcf9a812ce0b5e41f8eb9eecf570e906362  rust-std-1.93.1-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.93.1-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  c9d8c5789b0de42de6b68ed749ecb603847b1525df3aef1cbeacadb9521ff4f6  rust-std-1.93.1-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.93.1-armv7-unknown-linux-musleabi.tar.xz.sha256
+sha256  506b0383434d85ea72596fecd125677eb73a4e20db79cdd4832ba68af1160876  rust-std-1.93.1-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.93.1-armv7-unknown-linux-musleabihf.tar.xz.sha256
+sha256  24df782e0af99bb92b622ab3532cbed9ef2422991da412eadfe334173ba3a20c  rust-std-1.93.1-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.93.1-i586-unknown-linux-gnu.tar.xz.sha256
+sha256  62e2b4173049fa547bd168b1f864765f3bfecd3ff52b0f3ff0b4fa01867dfed1  rust-std-1.93.1-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.93.1-i586-unknown-linux-musl.tar.xz.sha256
+sha256  63f632d563036bc1bd06eaebcc83bc7a821251c26aea37dddf87419f4ae670ee  rust-std-1.93.1-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.93.1-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  5da891898d3ddbbb6c3306a9b3b2c63b1b36b1b6bf54936a77eac0840206c12e  rust-std-1.93.1-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.93.1-i686-unknown-linux-musl.tar.xz.sha256
+sha256  f78542d69669448b6937642f9326b6ae38d14c23d5395ccb33e05aef03b165cf  rust-std-1.93.1-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.93.1-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  9ba38e42c81b77c4e626b9ca3903829e939ad590b84dbcd60d0fc9b1ce78b583  rust-std-1.93.1-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.93.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  d684482a1aa77e793b1adf1dfce4a21ee372b065557c0aeb4ed1d3d4ec2bf30c  rust-std-1.93.1-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.93.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  bf40e395e76521c32877b47f52bc066a69cc0da4ed3cbda976fe00eb77f51e29  rust-std-1.93.1-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.93.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  c8d3c3c3f9f4b8dbf9da4db211ec68bcb0d7e0ed11baccbb7cf5558289c34782  rust-std-1.93.1-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.93.1-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  735f3a737e7fd36053b9b41ced9276c33a9802b2a097d83fba8f1580a6869aa1  rust-std-1.93.1-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.93.1-sparc64-unknown-linux-gnu.tar.xz.sha256
+sha256  199ce3d961c70c1c8c0029b325cc1b507df624d8c5e5168ab75de85c01048cbb  rust-std-1.93.1-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.93.1-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  82c4e41268f1741e4eb68796aeb6ca5042406ae858dd56144155c4ef8d87d8b6  rust-std-1.93.1-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.93.1-x86_64-unknown-linux-musl.tar.xz.sha256
+sha256  24a9592c81c3def623f9e33e90f8f5bacefbffdd59d87f52da542fd6f4b252df  rust-std-1.93.1-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  b71bd43a069ca0641a9ecfe585ca7b3c53b5cc1608f8b68321168698e28b5ea1  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 215bd84ad3..dcb63902a9 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_BIN_VERSION = 1.88.0
+RUST_BIN_VERSION = 1.93.1
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 7b22bb8c94..583e83ef02 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,8 +1,8 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rustc-1.88.0-src.tar.xz.sha256
-sha256  0c1dcbb4f762513d021e1a282c0ac58c0a423642b3a6bf581cafb5414df4193e  rustc-1.88.0-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.93.1-src.tar.xz.sha256
+sha256  848c9171212c998c069e6979a205a1a44fa3235a463696d62e24701c83596ce0  rustc-1.93.1-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  b71bd43a069ca0641a9ecfe585ca7b3c53b5cc1608f8b68321168698e28b5ea1  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 9999475c35..e458a15f9f 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_VERSION = 1.88.0
+RUST_VERSION = 1.93.1
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
