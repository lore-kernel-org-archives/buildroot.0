Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704AEC79FA1
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 15:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEB7F60688;
	Mon,  7 Sep 2026 15:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T8GaqNdtcwjV; Mon,  7 Sep 2026 15:52:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4E80260662
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788796371;
	b=tI9DAoP9qIvvYZacS++thKfxQMkD9Xobo+j81w1fCq6eZVGB093+5XSf6P/yNriEKzUl
	 e4aZFQ278LW6S0abzMOOUFyZn+BKDrhQD9oZgiI7b7IosnNvqZfHLew+HYjP/YTDDBpvg
	 CyUkwqiF/cMQ08Lg2TMgpNI1M9m6vuoMAP265ii/DGbKrbc0wTb1FBUXWmnOrq55LVBbD
	 BboBKvzUtikfWbTTIjaJVpfLarhfuxRRAOdnQukfwkOpF9S8HeYwiMt2ipqTrux4HkBAo
	 ZBLUigpkDwt/AVwiRCC0JrMhkNs/2Xaatwp8mEgyyHgKcIoopGgjUs1iHwCGfaePnzw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788796371;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=A9N0DxEmPWYmYCIpVDOn85cratcwoeVsp4xW1We3OmA=;
	b=DHxdSqPsG5CuOhuzrWPlxpriUXOhqWfPi9Nnxu0YyvCAcikgEkDhCRHHSQtZSE0nrEFn
	 pdyupnv17D0fKo+rudPGwP/VNkGZ8W0kbwMjLoI0J7AXBMsbFwjQbkE4Gg18ijJcROToS
	 kjxyYv/a6oiJQoPmrYge0mFJUuE9MKrVkko7u0N/Z/S8t4i62Xa8jzU4woZNvCnC/QmLm
	 nvbgGM/yJkA+YD6CAAzM0omFeGCEjdb8P0LlZGQmwo7T5vHhGii8D8x6UkMkEgiMkEY1z
	 OHW0Tvzg21/jcPZCUkIXw2JTh2DrKdysgm5fXesVPSeqNbkDFM+7gs6rw8fGe5nd3AA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788796371;
	bh=A9N0DxEmPWYmYCIpVDOn85cratcwoeVsp4xW1We3OmA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MXRuuqb3u8z2fIa//fTilrmmWrYk3c6BG9UUKFedRIlyFVBnbeYGQrnkZr9EdO6in
	 igkO/8tH/zA7n/8S9ugYmanTDoilarHyYeOg0sjzxB+IPud8fvBZKSWGYuhG/kcFAz
	 GKjbJWo/YIkLPQ3hfFDU8E0FQcQN69+45S49hOtL1gb0sVxeYBRD5spiJh1v0eBTXX
	 q40Q7uZDmzxa1aYscUDcK2X48kvLbBKndqdx8k8lkFfF/enAyVwkXhSlC+LNFLkblL
	 VHb2dTUqhwDdTiDCl2f/mL7RJx5hXeuLntbfkbyBuKl8DFSzWIMHa3+rk4vGhYmlE4
	 0sRRVqLp1nVXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E80260662;
	Mon,  7 Sep 2026 15:52:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 68CEFA48
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 15:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E6A240547
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 15:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oMu5Tedr9mwS for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 15:52:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AE35F40545
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788796368;
 b=AIKL1P+GYXKR7rASC9QCqMab0aQ9FJ3RmaaMU8SsQhiMK1feeArIijo3jfVLZJZLCb9t
 PIIbvpRGFZQP0MysPvdCs3zolekL9/9R+qV33tDydAkj0sksZ9JE6v6u+ukv/CQF/Pv0P
 6zSSybwY4bOmDJ7zjX0OYZW4Qk1xrva7dblY+bfF/MXDxFoX4D7V9qCzZiRdPbMfWL0t5
 2S+kEtNZEPTZWwUa3GjD/pmSQ56+mRIChTXBsJX+vSCrUnVnds6HM6rKYEJA7H7dgMUD7
 aZW8JpQqO1p0C2TeNygqrSP1S/9lx4Ms53cTO7KraZMLRxEVR8S2wLzFXQL8sI/eexA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788796368;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=miB+y6J1v41cojXiw9yrBP6ShL9OPVrkeAfNbi9fAOg=;
 b=hznjgzNxhU3CDQPJJSZI1vcfTsjp1kNwR9omTZtKDK/pgRBLZ21s2mIbvI8x+HVaEA2o
 vaD7C4NP/WoIrkLGJ2nN9lEptIhM8rNafGA0GAjje5hrw5UCKUyI+VCyrqvAGLYKRSBEh
 JpvzuDpyE6DhZVbsuKNaPiWLU1eyaCJPdQwMMcayt9PK6yVXlGrFdvpOz+vU0lWnQaNVa
 O9Urdhm81JCBVaHXiZWx5umN3wK7AauhaHzsVthxzwIlGdDNOX+qWlfpH6lk/TtiCW7Vn
 vp2vjlMuBmarmUWKfvsSenTq3X8Rr9LSgE/QmN6BsjYQHrJd8oPiWBDMScEywSAMUoQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Q4N9g2Eg; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Q4N9g2Eg
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE35F40545
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 15:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788796361;
 bh=miB+y6J1v41cojXiw9yrBP6ShL9OPVrkeAfNbi9fAOg=;
 h=From:To:Cc:Subject:Date:From;
 b=Q4N9g2Egqragg16SLt/9g21imIP4u34CDYkvW3Tc2SNVrzdLD7Ml1I/BpjW8d4bMW
 mOPFn6MJ7ebVpGcklI+VvwvBPPti+PJygBBbe/mJ03ARNSSuvvLcmbQQV84u8+IHdp
 pHMXKomG3kaPdqHp9pf+wjba9v3o+IM7zgr0+qoxNGzfZJslfmrTDmpLJrpCyWYeV9
 ayg+X07tzz9bD6Hlv+Ik8nrJmifR8Ky2EqKG5PK7DahPIM+DjSj41qTi8ruMPB9afp
 LmELZfrWAqQ/5xgJD3FB7ZSaOgSpXGRn/aSpZbp/golTnGspjXh0BZKFmbwKDUZgzG
 keAZGkOdZX7Aw==
Received: from fli4l.lan.fli4l (p54a1bccf.dip0.t-ipconnect.de [84.161.188.207])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C4FBEA4C38E6;
 Mon,  7 Sep 2026 17:52:41 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36916)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x3beD-0000000014C-1lV2;
 Mon, 07 Sep 2026 15:52:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon,  7 Sep 2026 17:52:41 +0200
Message-ID: <20260907155241.3755621-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v2 1/1] package/{rust,
 rust-bin}: bump version to 1.98.1
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

https://blog.rust-lang.org/2026/09/03/Rust-1.98.1/
https://blog.rust-lang.org/2026/08/20/Rust-1.98.0/

Disable the new option compress-debuginfo, introduced in version 1.98.0
https://github.com/rust-lang/rust/commit/65f06572fb81da89a1a87373aa3e6128060210c1

to disable a build error reported by Julien:
https://lists.buildroot.org/pipermail/buildroot/2026-September/808960.html

rust-lld: error: --compress-debug-sections: LLVM was not built with
LLVM_ENABLE_ZLIB or did not find zlib at build time

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: fixed LLVM_ENABLE_ZLIB build error reported by Julien

 package/rust-bin/rust-bin.hash | 132 ++++++++++++++++-----------------
 package/rust-bin/rust-bin.mk   |   2 +-
 package/rust/rust.hash         |   4 +-
 package/rust/rust.mk           |   3 +-
 4 files changed, 71 insertions(+), 70 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 7a8ad8323e..58aca986e0 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,72 +1,72 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rust-1.97.1-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  9a7a2c336b4787f1b72f6bab7c35d5b7af2fd03cbd39b4fc721466a70d402a7d  rust-1.97.1-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.97.1-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  1687b56e6e7585dea809ab7b82d93f35417f3760a76c3d0d7f6dec252ff1751b  rust-1.97.1-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.97.1-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  20ab44739bfab46765ca81b34450e5330bf28b0ae57ac8936eb27f40ec9edb7a  rust-1.97.1-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.97.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  fd6351ec454acceaf240710db5ba79e5613621597cb204273cc8364ab61c65c9  rust-1.97.1-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.97.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  d27b74ae1e480f006847240816198854cac3f9d5c87162aa7f36743049ea90dd  rust-1.97.1-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.97.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  2982687edabf8582b21a5497fed8dd5287a24afdb836a64b206959cea81ab947  rust-1.97.1-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.97.1-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  681058956b17bec84f97636e28ebc740252bfa92e0856c9289efedf5d475ad84  rust-1.97.1-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.97.1-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  88f28fa9af20594179f85d6df67078dfd6fa93e2f6da5e1e9b0ac4997988ca4f  rust-1.97.1-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.1-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  46aed8e63186350004d8ec6afca798811e6530b514352e5a8a26f3dc4939b3be  rust-std-1.97.1-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.1-aarch64-unknown-linux-musl.tar.xz.sha256
-sha256  49ff0879d94e2e8e86d5e85eb15a9215943e8c78b51363d6553443598cab5d31  rust-std-1.97.1-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.1-arm-unknown-linux-gnueabi.tar.xz.sha256
-sha256  848e297b012f317024ec4fd29da09f19a5a5b218b0c82b1fd4d6e01d41887d7f  rust-std-1.97.1-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.1-arm-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  5b1a03e3f6b021b2bc288a98011e1174a527922dbf4ece64d299472cf87b9cac  rust-std-1.97.1-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.1-arm-unknown-linux-musleabi.tar.xz.sha256
-sha256  b34c41e16da76fedd643bbd85a97e0f98f09bc84da06c981822499e0fa47565b  rust-std-1.97.1-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.1-arm-unknown-linux-musleabihf.tar.xz.sha256
-sha256  5ed275942f32c7b0250e2a6949a2e57ac99ce2b8ca53f616792f52b7b9345663  rust-std-1.97.1-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.1-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-sha256  e97e1be61ce41ccba61cc9cfa7366772f5ef8ebefa3cc2e62ee4affcd1eaa7f8  rust-std-1.97.1-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.1-armv5te-unknown-linux-musleabi.tar.xz.sha256
-sha256  7b1691c9c29a04a97a287354cc077261b3cbc8a28e2f5d4e26cdbfc27bafbb67  rust-std-1.97.1-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.1-armv7-unknown-linux-gnueabi.tar.xz.sha256
-sha256  0913df53a3dcd90aa86c58bd9cbea91cce98c5d5db4c06e18ff1fdc55b957f12  rust-std-1.97.1-armv7-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.1-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  3823992fb0b7cb172b4a9eb8f03662013911ff00e1adb94e4c5fa00e4bd15686  rust-std-1.97.1-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.1-armv7-unknown-linux-musleabi.tar.xz.sha256
-sha256  ad50b2c455548ca7a7660251a6b8ea09156182583204053da9ea000b50723ab6  rust-std-1.97.1-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.1-armv7-unknown-linux-musleabihf.tar.xz.sha256
-sha256  7410ad19adb666624ffde8240353e3960b2c6cdbe2d3203f4615220db4b4ef1c  rust-std-1.97.1-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.1-i586-unknown-linux-gnu.tar.xz.sha256
-sha256  a3090f555a9c3fd91d3c8b73152eee007fa348d20a8d026ea577a467acf5e7c7  rust-std-1.97.1-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.1-i586-unknown-linux-musl.tar.xz.sha256
-sha256  31c8d12d96574b82d10254e45bae9eb8784c95b72820217465247aa100cb1029  rust-std-1.97.1-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.1-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  7f4be0697e96dd81f75f66f0e25a51d595223e7c58af6675810f066cab6ef584  rust-std-1.97.1-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.1-i686-unknown-linux-musl.tar.xz.sha256
-sha256  124b0afba7413ba39e3051e2d4d819a74a5ffe91f40371e09c8fb8ec05e9c6f8  rust-std-1.97.1-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.1-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  9c3286cc2aab1868f693cd458d5d7bf8c307aaf8809e9a2dddbfc31ece94629f  rust-std-1.97.1-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  58675598a59db1524e934a27f279b6669d65e91f53675d022fd5e32046c2742c  rust-std-1.97.1-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  ab2fb5c9dd7d3a0987c97c9f56732d013a11796fcd1510651570ae2fcc512bb2  rust-std-1.97.1-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  5cec88477a70fe83c10a12efd6bdad1b0f8dd4c1ebba1e427f00c69666c5b6f9  rust-std-1.97.1-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.1-riscv64gc-unknown-linux-musl.tar.xz.sha256
-sha256  3d4b7ca701a24e092f9256c9d68e117d9a7563dbb49013946763077f4f49d66b  rust-std-1.97.1-riscv64gc-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.1-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  6c6b2b285225f3551250bd4c5e05293a0839fc18d1625c545b81fbea9f82c31b  rust-std-1.97.1-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.1-sparc64-unknown-linux-gnu.tar.xz.sha256
-sha256  be689309aae0247e0a58a87b6ed69c28573ec5ec3f56766cb8b0b3066a3a0a70  rust-std-1.97.1-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.1-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  1c1e704ae80126b7de34f72ea2825f7fd01736dec20732faed47374b95282fba  rust-std-1.97.1-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.1-x86_64-unknown-linux-musl.tar.xz.sha256
-sha256  51d83178680556f73a5fa8ad865b76a1ff541867445c00fc65dc67246bc2de66  rust-std-1.97.1-x86_64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.98.1-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  0b514a8cc1cbcd939bff0f151661fe58b6ea5c7a7f645a5098c69e32e8c1e0a2  rust-1.98.1-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.98.1-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  51733c05e0f784825aab7391761199eb090456b2e95e45420c544eb25eaee3ba  rust-1.98.1-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.98.1-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  93f2a12d19de1ebcb3373fb6acafcf01218ea77e920014e3e7edfd5e0345ec2c  rust-1.98.1-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.98.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  2086a3b53bbb40670cbbcd436858279c800c0579ea2588a294d0219775de9ea3  rust-1.98.1-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.98.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  06871396a06f61f2d72f57b5ed31a0da69e8185af3989d2efb2665c6e982c062  rust-1.98.1-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.98.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  61a9cbf434ed16982cbd6269cd441f9640ac34ed73ced92f4867bc0ce507dab7  rust-1.98.1-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.98.1-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  78b8c29bf499cc9d339f470bf10bb9e70d4f8b97498e68ac87bdc9c90ca76270  rust-1.98.1-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.98.1-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  5326b36c53de11d148c8f8dab6553a3d1006c2cfd32123683073fad3c302605b  rust-1.98.1-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.98.1-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  9bf796a6ec5b004813ebd0b650775a7c6a4f3aae97ad362ae294798dca4f3b23  rust-std-1.98.1-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.98.1-aarch64-unknown-linux-musl.tar.xz.sha256
+sha256  7e0ad2e67817f224b7a6331e48d6397303fc050edaccf81784ed786ffddc884a  rust-std-1.98.1-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.98.1-arm-unknown-linux-gnueabi.tar.xz.sha256
+sha256  64c797743abbac368bed5b68150ed839501bf00e82340331b01d7689333687e9  rust-std-1.98.1-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.98.1-arm-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  27505e4a2be7e159da17afd162f3a976fd9652bd4e5faea291b63ad06f9d9475  rust-std-1.98.1-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.98.1-arm-unknown-linux-musleabi.tar.xz.sha256
+sha256  86caa709606dfb02d0878360d068bb7fb5b92d4d97789f19f67156e866ae86a5  rust-std-1.98.1-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.98.1-arm-unknown-linux-musleabihf.tar.xz.sha256
+sha256  0fd4c0cbf803a135b57a0b079c5149c5ee0e45106230f30d225e459cbd19fc6e  rust-std-1.98.1-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.98.1-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+sha256  0596abc69b2cb67984719b36fcb3cccd16d88db8c0584edd0e9a6d2f06c40c18  rust-std-1.98.1-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.98.1-armv5te-unknown-linux-musleabi.tar.xz.sha256
+sha256  c4c6deb687f91219cbbf6c280414a14aa826046b5d3ade60ff84620842a359a2  rust-std-1.98.1-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.98.1-armv7-unknown-linux-gnueabi.tar.xz.sha256
+sha256  95bc80c6257ae135bdc3606629807f21ee53f6cfa18911ceb1d486cd82b4a13a  rust-std-1.98.1-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.98.1-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  0685de03c96ae65212b519d98116ad581c7ef46ca24acad1364895b7907d71be  rust-std-1.98.1-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.98.1-armv7-unknown-linux-musleabi.tar.xz.sha256
+sha256  3c139a8912e5a8fcb69f1cd6ddeb4906da14eb26a443ffe0db33994dd4432fcc  rust-std-1.98.1-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.98.1-armv7-unknown-linux-musleabihf.tar.xz.sha256
+sha256  dd0efa4210a6da6350a6b05d8ffa43eae4baecf2397cc00a3b028bdf56cdb1ce  rust-std-1.98.1-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.98.1-i586-unknown-linux-gnu.tar.xz.sha256
+sha256  593943398099aa1b15ab0eb6b0bb138434915e81f7ece68ed8e0aec730125726  rust-std-1.98.1-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.98.1-i586-unknown-linux-musl.tar.xz.sha256
+sha256  3577040cb98e9484fd2854aa9a9978c1fb7dc15c0b4059412d86484c1bcad8b8  rust-std-1.98.1-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.98.1-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  69f2f0fbc3b71aebd4aef7ff00f31e00944e1528a49287cc4b256334bdc0ec3f  rust-std-1.98.1-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.98.1-i686-unknown-linux-musl.tar.xz.sha256
+sha256  c1b066d393bf15bcdf823388b4358b5d339fe064cc48c8a08e1b7ff6f41abcf3  rust-std-1.98.1-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.98.1-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  765135d825fcbd03974e033f58cd3f3a0da70a42d6aee600e83db88bc6e3bad6  rust-std-1.98.1-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.98.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  f23c066e7bba9d2216e41b6add0cb429c7cb7f90b449918c5370fbcb88b0dd88  rust-std-1.98.1-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.98.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  8353a10f4195abdcff6391ca5af8add6bf699f872efe0b289932613405fa62b6  rust-std-1.98.1-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.98.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  bcbd81e49d72e6907c92ce7d1ba5b25b02bbd85f94cb21567c931aad1d3e3ab7  rust-std-1.98.1-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.98.1-riscv64gc-unknown-linux-musl.tar.xz.sha256
+sha256  4144e47bb60bbc3172345095ad4e5e7ea7dc28c9b900eab888a4a5944f34d157  rust-std-1.98.1-riscv64gc-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.98.1-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  2b17f570083cc6dac5c3bdb762e64f75813f62e3668c5dfaefee546d10380d4b  rust-std-1.98.1-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.98.1-sparc64-unknown-linux-gnu.tar.xz.sha256
+sha256  91a541a9fd6d276f9782e8657f3163f5e71b76616536b6156d685b60298cd4ab  rust-std-1.98.1-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.98.1-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  fa3ff450172a16c026944030230c5069947af93c728d9179971d44e5e0cfb561  rust-std-1.98.1-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.98.1-x86_64-unknown-linux-musl.tar.xz.sha256
+sha256  bd9f35880de21dab0e387e84009c00001ae7836a4ba565cb16823f13f75f325f  rust-std-1.98.1-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  b71bd43a069ca0641a9ecfe585ca7b3c53b5cc1608f8b68321168698e28b5ea1  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 5a8279703d..c5215b6c4f 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_BIN_VERSION = 1.97.1
+RUST_BIN_VERSION = 1.98.1
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index d3cad8bfab..006d7566c3 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,8 +1,8 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rustc-1.97.1-src.tar.xz.sha256
-sha256  0ed06fdaffd4722a7702e0b4eebfafc897ab8f513e8e1b247cdd7e5c6df6ded2  rustc-1.97.1-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.98.1-src.tar.xz.sha256
+sha256  be1816e7f6c40abb90245ad6e024bed2a7e88d7dda4561e4d5470207df616b9f  rustc-1.98.1-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  b71bd43a069ca0641a9ecfe585ca7b3c53b5cc1608f8b68321168698e28b5ea1  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 890df4e2cf..f621cdec9e 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_VERSION = 1.97.1
+RUST_VERSION = 1.98.1
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
@@ -47,6 +47,7 @@ define HOST_RUST_CONFIGURE_CMDS
 		echo '[rust]'; \
 		echo 'channel = "stable"'; \
 		echo 'musl-root = "$(STAGING_DIR)"' ; \
+		echo 'compress-debuginfo = "off"'; \
 		echo '[target.$(RUSTC_TARGET_NAME)]'; \
 		echo 'cc = "$(TARGET_CROSS)gcc"'; \
 		echo '[llvm]'; \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
