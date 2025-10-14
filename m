Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88530CCD18E
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 21:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 425EF8355F;
	Tue, 14 Oct 2025 21:11:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q1bPJ2Qc683s; Tue, 14 Oct 2025 21:11:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B891E83829
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B891E83829;
	Tue, 14 Oct 2025 21:11:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EB721C9
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 21:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0051060A8D
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 21:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZI70xkTcMpto for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 21:11:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8DA57608E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DA57608E4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DA57608E4
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 21:11:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A6760A4C66BA;
 Tue, 14 Oct 2025 23:11:45 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58128)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v8mJ6-0000000032h-44E7;
 Tue, 14 Oct 2025 21:11:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 23:11:45 +0200
Message-ID: <20251014211145.120019-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760476305;
 bh=Vb2ZAtSkW6g6LayAo7hi3oqig9/1H4b4yToPpuBEmbU=;
 h=From:To:Cc:Subject:Date:From;
 b=frhBjU9qn84tBQ0NooXhRPvqZO2EoPPyc021RWxZIHuWzmw2PSkmtF4BOSrxG4IAr
 vHo7hryci9fJsstNAAXuMJB01MfB7wdwYH8WEkVblOC7fazUZlnk7rDbAZoR8ihAMu
 Q3V5rnoc8HqJkD4BpOAcPiximbH5uH6KP8vMwO+xES9kMaPyBB49DPhx9QOFCKJlE+
 j6HzBOFLTyue24EUDOfok6C+BNCdceLjwnb8WYde0SB8kmg302xEDqMQERwbuhSzfE
 kaL1M0FbofRC5TB2zW/q5FizliMaay/kUXDrP2dxw60ehHhvXXThpAdfPrftN9cM2j
 COJlqW7Sdd8Jg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=frhBjU9q
Subject: [Buildroot] [PATCH 1/1] package/libsodium: bump version to 1.0.20
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

Release notes:
https://github.com/jedisct1/libsodium/releases/tag/1.0.19-RELEASE
https://github.com/jedisct1/libsodium/releases/tag/1.0.20-RELEASE

Updated license hash due to copyright year bumps:
https://github.com/jedisct1/libsodium/commits/1.0.20-RELEASE/LICENSE
(1.0.18 was released in 2019.)

Needed to fix build error with python-pynacl 1.6.0, currently under
review: https://patchwork.ozlabs.org/project/buildroot/patch/20251013175513.86276-17-bernd@kuhls.net/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libsodium/libsodium.hash | 6 +++---
 package/libsodium/libsodium.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libsodium/libsodium.hash b/package/libsodium/libsodium.hash
index 37c1a620b6..ae4765a2ab 100644
--- a/package/libsodium/libsodium.hash
+++ b/package/libsodium/libsodium.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking Minisign signature
-# https://download.libsodium.org/libsodium/releases/libsodium-1.0.18.tar.gz.minisig
-sha256  6f504490b342a4f8a4c4a02fc9b866cbef8622d5df4e5452b46be121e46636c1  libsodium-1.0.18.tar.gz
-sha256  dea1855c9809f3faf22aa4a1fba20ec8af5a5587f23115012e5b98279cedc4af  LICENSE
+# https://download.libsodium.org/libsodium/releases/libsodium-1.0.20.tar.gz.minisig
+sha256  ebb65ef6ca439333c2bb41a0c1990587288da07f6c7fd07cb3a18cc18d30ce19  libsodium-1.0.20.tar.gz
+sha256  43964d976a6db3fb986af689d05f8ca0e9971878bccae709750dac8fdc4a99cf  LICENSE
diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
index a8e0f79149..7dd763e145 100644
--- a/package/libsodium/libsodium.mk
+++ b/package/libsodium/libsodium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSODIUM_VERSION = 1.0.18
+LIBSODIUM_VERSION = 1.0.20
 LIBSODIUM_SITE = https://download.libsodium.org/libsodium/releases
 LIBSODIUM_LICENSE = ISC
 LIBSODIUM_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
