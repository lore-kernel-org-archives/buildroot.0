Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 246C0C79F80
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 17:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 908688110D;
	Fri,  4 Sep 2026 17:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gKjs18FVYvmd; Fri,  4 Sep 2026 17:15:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A97608110E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788542101;
	b=Si+hVZy2IBRZbGqi5uiFzOn4/2m7KMbQF2U4pMc2zqMB9+2uDs7BKILPbAObfN3s2D9g
	 PeO+npCQ+MXWnSm8Q9/XBSwTZDcd4GCJTc8yYwGNFQDYWkjX0fsZMRzdytGqXhAnlb1zr
	 Stdl5++DDSahtvRfFWRvnS7HEE0GDG2Qm8155PyaIONn3PHS4GL6OjU1jnyEsuvLmN/ys
	 PCYw6rCKy1Ci4u+g8gUCBPWI/nQaqlr+coUhNrLfhEvUnWFMWXL0l6woSH36NRLm1Wdxt
	 tbKU/tYqzj6FF2DBYrxBw4WdJJgElUAaZV293OrVJnrxpyYe02d9GB9B+Y0EWjr753Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788542101;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=zkr3bjt+GvBMVJg53qRSwfUyUhUQc1gp5mGS614PzZk=;
	b=XlfOCG0vLINcWt+/RgFdQ/TBknjt2RVU7mD7eA5MhuoD1F/5zJV+D8VJB4CvaP3jIwWN
	 xnI0ZHD0oZe4GBmjd8v9n+AxiWk1ZhWOM8mkjC2d5p8NKY0McYu2xPE41tUtzL+Wyhf47
	 yERohVlN1lKKaplTu19DfVKmI2r4etwGHlDHYoiZxlQ0xJzKRyLGYxV/Ez1U40LaN9GgB
	 xi2+BzixSPSsZqyWBHRerxn/ss5zEkmRy3pfbLn/ccJ70d4wlfb6guRXc4YjbN4XSYm89
	 TiS9AMc7j5YZO627MO07wirhnhI/I04yk47kS3tTm+r6yRLOg2tKGhBA6HKZwUzh9rA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=JdP2LGmm;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788542101;
	bh=zkr3bjt+GvBMVJg53qRSwfUyUhUQc1gp5mGS614PzZk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o98uJQ345F+Zi+O0maLc/ebqdy3bzO7hkZeqadYiUgTHVRl/dihJrqM9cUMnYS48s
	 b5W813umUfvqmQNiTMpQJa+W8nwMvpuHXlfl8KpBxA+QR9yoEuX8Ee/Xl+ghb4JSKs
	 mtfhqPvISItE3Ew4/usd0GLjm6xlEjy2+W0tJtmEPZyw87FTVZy6vf9t3IpLVLRm/4
	 01t2Xc7sG+4dmK/tvEsTEOR0NiM36PHIHGPImXbgwh7RwgrgZTez48EEbG2XnyjuPi
	 1zQ/jOXfnvhgPnkfD8ZkAReAvCyy9QwSV27zzDV4TudQ/+0iVU9otWDCe6QgeDV3Wv
	 7nC+xzG7ux1FQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A97608110E;
	Fri,  4 Sep 2026 17:15:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 697B13BF
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 17:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D3898110E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 17:15:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iHxwLZax0OgG for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 17:14:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 056628110D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788542098;
 b=a4k+JFwkynr149tcZqIaayzSS3BKduTkRtQPbDFV+ClKYzygZj/btHNY16mMKkMP7a7s
 Un4SZ2QlBkgFbfc37HxV4db5TBA31H4wRk9cqPQ2vZQvdAO4d3pTl8qMjRDNi4laPj4XW
 NR9QwdXmBJNNPTZVP7YGqAsx8LEbLGoaV6BRsbwAo4Uab0xBtWv39DLnHqlLSnqsT03OP
 1Z1gxl75fV+HO+tG3m3pbMQ9REoY6dBzhQ/lP/LSV5pCdD1kLR4zAbU//ELtd4Ig5TYhB
 b/v+wN4oNIv/IDTq6ecd3dBd3+lR+PSCWJsEYxjohDKmjkv07NRSWW5dbfCoA4/arCQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788542098;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=52V1d21Ks3bvUGQdFN16qSs6Uhy5wtKJI34L6iO0H/k=;
 b=iFfxIHxQBcmDgp9Iaab7PI3nu10H8FXcdgJpRgcCpAjGNHaImyqrl3M9UMwJTOGrRZ2Z
 utElCLXzOjhT/v2wL7ur1a9iDI/XOw86yUykj1MKDa3/Jdco9HYn1A5J+UZmqTItAINDz
 WP/1cx/JRYDjb9RFnNQXR4457d+2h0kSxtG1vbZqp3NmsW8wuAlAK1YknSZHVNJEfPEaF
 TjMjKdNXqapk2RVJajwaGW5WsSfO3jtMI5HMX38IGGipXK19FBCYg/gV/s5kvb6aZEx5q
 ltPVr7d1gK0YrwHf7GTTihQPvY795Bs0ydkoRErntfWEr26ztZp60z0fQSIFH4BNHtg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=JdP2LGmm; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=JdP2LGmm
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 056628110D
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 17:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788542095;
 bh=52V1d21Ks3bvUGQdFN16qSs6Uhy5wtKJI34L6iO0H/k=;
 h=From:To:Cc:Subject:Date:From;
 b=JdP2LGmmOvIJp8H4Of/Wu9w7whSS7Qm+hRt3taoTpgoQm5MMWgo4i22kVccXmUgpa
 rFToQILAkToAnQxoEm6n48DnSVnwu7vLuf4cTigjVaAedEQmx5FzSQ4Ps0jXQ+RK7x
 2gnXueNfSf0QzMt/wgSPHGqJYjqrtzacKIzAoS5lleeZ6QCVVCgLTUBK21i34uSEaJ
 hebPdRwCQiRWgws3Ox2YTPbapS7UjczzVH0yROBy+1IHw9sqC5eEPa9p/Ok07sfi9S
 TlMIa4W+IXgSLzPSrv1fiUX4Wto06rhlTZ67QVcGgx8RUvJQa2aWjiQ4QdX/9RF/ew
 Nm4LgtRnIeCig==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7A32AA4C205F;
 Fri,  4 Sep 2026 19:14:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58352)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2XV8-000000005jI-425u;
 Fri, 04 Sep 2026 17:14:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri,  4 Sep 2026 19:14:54 +0200
Message-ID: <20260904171454.195351-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/{rust,
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/pipelines/2821138019 (check-*)

https://gitlab.com/bkuhls/buildroot/-/pipelines/2821140645 (tests.*)
with the exception of tests.package.test_rust.TestRust.test_run due to
Gitlab error "No matching runner available".

 package/rust-bin/rust-bin.hash | 132 ++++++++++++++++-----------------
 package/rust-bin/rust-bin.mk   |   2 +-
 package/rust/rust.hash         |   4 +-
 package/rust/rust.mk           |   2 +-
 4 files changed, 70 insertions(+), 70 deletions(-)

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
index 80f912d43d..9655f5c618 100644
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
index 448ee47fd2..b447f4492d 100644
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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
