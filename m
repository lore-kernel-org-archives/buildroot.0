Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DF9D216AE
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 16:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1302084252;
	Thu,  4 Dec 2025 16:36:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ny2OTgd6ZFxo; Thu,  4 Dec 2025 16:35:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1109284262
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764866159;
	bh=ZeYG702/jMSY628/BvfGA/or39x/FKvaf8SpGziGsQ4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PKp1WBxzT38bdd43ZiIXhl0DnivPnbeRBt4a9WGbdgOff1NZvPwGtekICB6UcQARM
	 ahJ2OP8S8cyDWEZXtaC6aIH6pCPM+7z4y5cMgof+tXFy+VQ5HaBRSfizH3S/t+3DMy
	 t7ADyMuWrYTu8jnyJYezH/dSrP/IcB4tcxSDxMXH8qX6vicNqxG7uWGL8em6a0oIVi
	 7eSn7r9F5ert4cYbzlwV1GYzp84qGa5CGTWfkKoN9mBqcJvxX2Oo2yp94hUBd0ZiUj
	 u4GuFCm/qEBcDev5YKjBUzAYrIL62YJmxNseHmnhUTKZYzf8ZBKyL7puIZ9U2yLeZn
	 5kGiXcq2rP5VA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1109284262;
	Thu,  4 Dec 2025 16:35:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 316E9D3
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 16:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1696284252
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 16:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iEWU1MDiXk43 for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 16:35:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0040584246
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0040584246
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0040584246
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 16:35:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 74570A4C1175;
 Thu,  4 Dec 2025 17:35:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49728)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vRCJ6-000000000RC-2xDF;
 Thu, 04 Dec 2025 16:35:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Thu,  4 Dec 2025 17:35:52 +0100
Message-ID: <20251204163553.1326116-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764866153;
 bh=OJrrKI67KbJEcuye4BE6ZiD0TSU+ZQ0GlA2IZbW9dr8=;
 h=From:To:Cc:Subject:Date:From;
 b=KRdFgMiMAN4IYhYAX79t94F6dHKMvg8ZQXhmXseV6iVhmyd/NRCjwYp/JHxIL0VM6
 Dxbw54T9GMlAo71Q0q5oiJpjRtY4QdTxFluddGoCSVBYOB7VYbuKg3mtobYPmhhYgY
 5NGBSVSWd2uqkRyyNRFa7ZCurxC0S3dmrmmXcrCX1Flrv5Sai2pl1hkBDLhY/jG6a/
 zS7omAqOm3qojq9aMXGME8ZQCucltShAUkmC/jDTotmMcsOtzKz7LDIwqGEBrjiB23
 APfYmMi5sfsfso7yXAuzDDUpUrnpI5bZV3DfUxQvZei0yOdhzzuTw7I7jGusjaXADg
 KeTvSMWs2MTfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=KRdFgMiM
Subject: [Buildroot] [PATCH/next 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 25.3.1
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
https://lists.freedesktop.org/archives/mesa-announce/2025-December/000829.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 662683f944..39564b6af3 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 25.3.0
+MESA3D_HEADERS_VERSION = 25.3.1
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index e642273d67..4bfc1d4584 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://gitlab.freedesktop.org/mesa/mesa/-/blob/25.3/docs/relnotes/25.3.0.rst?ref_type=heads
-sha256  0fd54fea7dbbddb154df05ac752b18621f26d97e27863db3be951417c6abe8ae  mesa-25.3.0.tar.xz
-sha512  46df9e5e27f9a36cf893a68ad4a465fcc6efe1bcb46ad8d4b015699ad1a11e582b8d41f4157326556af603fe454b2ff34ecc17a0c742b5fd9ce5f0097106fec5  mesa-25.3.0.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2025-December/000829.html
+sha256  059d0d985622f49588f01aa29152804f4da8ffe6add046e00a52923379c2d8da  mesa-25.3.1.tar.xz
+sha512  7e2f7295f1f4df129935b60d75c890f6ae585ecc511f69f55a61826df5f2434ffdb4109c632af9842a986bf9beed430a0404d377e8335b71fa36682bd10533ba  mesa-25.3.1.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 3d2f85240b..6fcbf96c80 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 25.3.0
+MESA3D_VERSION = 25.3.1
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
