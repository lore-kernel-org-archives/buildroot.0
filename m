Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8EDE7C70D
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 09:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4016661129;
	Sun,  1 Feb 2026 09:34:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dKnddcW0qUci; Sun,  1 Feb 2026 09:34:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E22461113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769938448;
	bh=QRWL4XWM1Pvj5TGvzIDUf+dkA7r6wg3IMG/4tvs7aog=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KXGq71c0b0LoO9UlHzPcMRkvYfe7QM2EgXbfvTZewvhEx8AiBf/MHTgI8bjz303Jj
	 BfgRsN85SowsKoGFQ84q4CH6+92HWxHeKTzQvpVUuxiZ9ol9oe3DdnunXyuBifbrUs
	 IuoCVGaSHWZ0ToSU4IYbdhnz1+JBEym+Xi+mB8o8znNp3obA+PnfoYkuycrFucL35W
	 oq8ge+vohfB0etvij7VFKS/EOV9JWCeQhmgSsGpPOLzB/jNOgt/dvgbj0SXILZ9dyN
	 DB6BRgOXMMdhd4n5mm1S0p+tU8fAa4z5CxeiyBdSWfQ90QRUsk7GqWPQGUw7p1e7b5
	 rSdw1uHW4PrUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E22461113;
	Sun,  1 Feb 2026 09:34:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D89E423E
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 09:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9ABA61113
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 09:34:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VWFWHxSGwJOb for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 09:34:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C826A60F46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C826A60F46
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C826A60F46
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 09:34:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b95e.dip0.t-ipconnect.de [84.161.185.94])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0D65AA4C557D;
 Sun,  1 Feb 2026 10:33:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37718)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vmTqA-000000004V2-0g8k;
 Sun, 01 Feb 2026 09:33:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  1 Feb 2026 10:33:57 +0100
Message-ID: <20260201093357.981428-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1769938439;
 bh=liV2EDKUm9Pt91Z0S/2gDU4VSvI4/NeBgGiHERfHcjo=;
 h=From:To:Cc:Subject:Date:From;
 b=kG3H5W+1ZE1XiyW9sW9hsBvn9GI8DiqitXiC7iQZhQt/11+Y3JPyG33m2RcTI3Ngl
 MDCKZwmmaRzJsyI2PruWws+qK+LOdNoVuaqAl0cr7eTZsrlNB7uyPKC3Iil1dH7ciz
 P6kNcy5QcKBKLJh+qbWGE1fL4wGecjurhMbozmFF4KLUg7b/vj7kleK4Gluefzs/UP
 ravjAtT65FvPhRx7b0cGC/lpiFEt0Ou3LSEiOcPr+pi7pJp/nZveUNRIweBDbHe0rf
 NNWLC/9IVDY785onGxocmkGf57tiSoA9p18UiX4iv4fAMqRbPJ/dgRz92hmr1VT9kn
 V1pqkuN6/9jpQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=kG3H5W+1
Subject: [Buildroot] [PATCH 1/1] package/nodejs: security bump version to
 22.22.0
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

https://github.com/nodejs/node/blob/v22.22.0/doc/changelogs/CHANGELOG_V22.md

List of security fixes:

22.22.0:
(CVE-2025-59465) add TLSSocket default error handler
(CVE-2025-55132) disable futimes when permission model is enabled lib,
permission:
(CVE-2025-55130) require full read and write to symlink APIs src:
(CVE-2025-59466) rethrow stack overflow exceptions in async_hooks src,
lib:
(CVE-2025-55131) refactor unsafe buffer creation to remove zero-fill
toggle tls:
(CVE-2026-21637) route callback exceptions through error handlers

22.17.1:
(CVE-2025-27210) Windows Device Names (CON, PRN, AUX) Bypass Path
Traversal Protection in path.normalize()

Version 22.18.0 includes
https://github.com/nodejs/node/commit/a2d2d36bb1c8a5599cda5c5ed7b65ded2abee72d
which fixes build errors with python 3.14
"ImportError: cannot import name 'FancyURLopener' from 'urllib.request'"
introduced by buildroot commit a0a6abc8b193e5bdab5326324d7299c19d5d8c67.

Updated license hash due to upstream commits:
https://github.com/nodejs/node/commit/ec60473ab1e4980bf6388b0d5ab34fb86b3ec466
https://github.com/nodejs/node/commit/0b5613f9fe38fd0f500d0bd147fa7d442189c7e2
https://github.com/nodejs/node/commit/0edf17198fe118c6cc39746feb8707a91d739f94

Switched _SITE to https.

Fixes:
https://autobuild.buildroot.net/results/da8/da82dc03cf0d42463fff1b5d9bf7a3c18cbf44dd/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/nodejs/nodejs.hash | 14 +++++++-------
 package/nodejs/nodejs.mk   |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index e087d8a7f9..c3372f443c 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,8 +1,8 @@
-# From https://nodejs.org/dist/v22.15.1/SHASUMS256.txt.asc
-sha256  f4ae8ddf7487dfaf7da92fef463ee55cc29d8772d62891361dc3fc8b8e469205  node-v22.15.1-linux-arm64.tar.xz
-sha256  6947386b4c8373b625c6a49b5571bf2226dac7c7b560a9a561a1f81bf71a25ef  node-v22.15.1-linux-armv7l.tar.xz
-sha256  da07858c6404dbe7c627bd7baea33c7825640652ad24468a6feb23c770cf7ce4  node-v22.15.1-linux-ppc64le.tar.xz
-sha256  7dca2ab34ec817aa4781e2e99dfd34d349eff9be86e5d5fbaa7e96cae8ee3179  node-v22.15.1-linux-x64.tar.xz
-sha256  c19f0177d21c621746625e5f37590bd0d79a72043b77b53784cba5f145e7263e  node-v22.15.1.tar.xz
+# From https://nodejs.org/dist/v22.22.0/SHASUMS256.txt.asc
+sha256  1bf1eb9ee63ffc4e5d324c0b9b62cf4a289f44332dfef9607cea1a0d9596ba6f  node-v22.22.0-linux-arm64.tar.xz
+sha256  a8b4f15f6e1f371422f1f7abcca4c46bd7abc1c732c274bc5cb108b841c1f0ff  node-v22.22.0-linux-armv7l.tar.xz
+sha256  d83b9957431cc18e1fc143a4b99f89cde7b8a18f53ef392231b4336afd058865  node-v22.22.0-linux-ppc64le.tar.xz
+sha256  9aa8e9d2298ab68c600bd6fb86a6c13bce11a4eca1ba9b39d79fa021755d7c37  node-v22.22.0-linux-x64.tar.xz
+sha256  4c138012bb5352f49822a8f3e6d1db71e00639d0c36d5b6756f91e4c6f30b683  node-v22.22.0.tar.xz
 # Locally calculated
-sha256  1ae62e2015784ba438db7b04ebd33f3c4ff3efdb824c111c4ececd99945fd52d  LICENSE
+sha256  e991d81497a85bb24fc6bffae0a3637a6accd6c6bc5ce1f2c5698bd555cf9d49  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 310face2d2..9f01d60baa 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # _VERSION, _SOURCE and _SITE must be kept empty to avoid downloading anything
-NODEJS_COMMON_VERSION = 22.15.1
+NODEJS_COMMON_VERSION = 22.22.0
 NODEJS_COMMON_SOURCE = node-v$(NODEJS_COMMON_VERSION).tar.xz
-NODEJS_COMMON_SITE = http://nodejs.org/dist/v$(NODEJS_COMMON_VERSION)
+NODEJS_COMMON_SITE = https://nodejs.org/dist/v$(NODEJS_COMMON_VERSION)
 
 NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
 NODEJS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
