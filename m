Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495C1C71157
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 20:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03F9B60E49;
	Tue, 17 Jun 2025 20:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XzgisV1m0dWI; Tue, 17 Jun 2025 20:45:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3308E60DA5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3308E60DA5;
	Tue, 17 Jun 2025 20:45:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B0A0CD94
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 20:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9751983B20
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 20:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nvNMhybaNJmo for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 20:45:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8A43283486
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A43283486
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A43283486
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 20:45:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01bf.dip0.t-ipconnect.de [91.58.1.191])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 65972A4C0F43;
 Tue, 17 Jun 2025 22:45:33 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41570)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uRdBU-000000007fK-3UH1;
 Tue, 17 Jun 2025 20:45:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Simon Dawson <spdawson@gmail.com>
Date: Tue, 17 Jun 2025 22:45:33 +0200
Message-Id: <20250617204533.1089251-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750193133;
 bh=A4q9lDVj1i0a4celTV3jYBVeywSUFXJHuZ3w9u/cFWA=;
 h=From:To:Cc:Subject:Date:From;
 b=zIVmXvQDR10xgqsZpw1J/wsMhu/0h6ZnKR4pqF6Np8ysbbywgl8L1tkHjeMmfmreo
 XAJes5i1oINVAJsV4YfzNJn5E2caczvaBrak8hUCWCIDn/8oEkGbr50m0F6aCStBAd
 91oVigXePvdOLPaWMmbZs+NSr80H0p1R2cJ0SigEYL4m0UVwe1Kz5bwnQ/yA8xE523
 O5nl3xLsn086r/AJw7bwFdGDwzEYUkKayhp6pTwxjCJ5PfIpRjaHIiUuRW1ynfs19j
 O5HZjyMNpnd3d7ee5M9eKfk+lva9cMSk8o4aCZYJKhYLnepoA4ar/eIU618eaPIy5k
 3IFI4Xjl1S86A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=zIVmXvQD
Subject: [Buildroot] [PATCH 1/1] package/rapidjson: bump version
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

This bump includes compatibility with cmake 4.x:
https://github.com/Tencent/rapidjson/commit/ebd87cb468fb4cb060b37e579718c4a4125416c1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/rapidjson/rapidjson.hash | 2 +-
 package/rapidjson/rapidjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rapidjson/rapidjson.hash b/package/rapidjson/rapidjson.hash
index ca5befdefc..c0a9b78716 100644
--- a/package/rapidjson/rapidjson.hash
+++ b/package/rapidjson/rapidjson.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  39f96f17b40f7201042c9b45d6444cb7eae1b7adfb7455412a86f6140450d32d  rapidjson-ab1842a2dae061284c0a62dca1cc6d5e7e37e346.tar.gz
+sha256  2d2601a82d2d3b7e143a3c8d43ef616671391034bc46891a9816b79cf2d3e7a8  rapidjson-24b5e7a8b27f42fa16b96fc70aade9106cf7102f.tar.gz
 sha256  a140e5d46fe734a1c78f1a3c3ef207871dd75648be71fdda8e309b23ab8b1f32  license.txt
diff --git a/package/rapidjson/rapidjson.mk b/package/rapidjson/rapidjson.mk
index 3091edeab9..fcd6393b64 100644
--- a/package/rapidjson/rapidjson.mk
+++ b/package/rapidjson/rapidjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAPIDJSON_VERSION = ab1842a2dae061284c0a62dca1cc6d5e7e37e346
+RAPIDJSON_VERSION = 24b5e7a8b27f42fa16b96fc70aade9106cf7102f
 RAPIDJSON_SITE = $(call github,Tencent,rapidjson,$(RAPIDJSON_VERSION))
 RAPIDJSON_LICENSE = MIT
 RAPIDJSON_LICENSE_FILES = license.txt
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
