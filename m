Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07F9CCD185
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 18:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2571260E51;
	Mon, 13 Oct 2025 18:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vst5lBypNz_C; Mon, 13 Oct 2025 18:40:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB9AF60E09
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB9AF60E09;
	Mon, 13 Oct 2025 18:40:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D07451C9
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEDEC60E09
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:40:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id asUvqdLzeWSh for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 18:40:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C0C6F60DFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0C6F60DFE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C0C6F60DFE
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:40:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DFE28A4C6876
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 20:40:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57148)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v8NSs-000000004tL-1Df3
 for buildroot@buildroot.org; Mon, 13 Oct 2025 18:40:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 13 Oct 2025 20:40:10 +0200
Message-ID: <20251013184010.3540072-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760380810;
 bh=TbMyp2Zvas9rzRoCyAbSKFXAJ2uUwukZ1bTQhdQT1A0=;
 h=From:To:Subject:Date:From;
 b=rxLLJlyeMYrZ0ldtdBfWlL4IFTwpF/umW8j9a7sbo5eo6C8KHt1HR5QUyIzquTW8E
 jiy2zAyUqvVzn6VeuHen8626/z5ev9D3L6w6U7F+/pZDPYMtDw+ojgEiknLXXXN3gV
 wZbEzHjwzGZLWE0rz7ikE/YTcfkjOpXWa5hbXocxZMcUYT14nf8NA9SpXBVryI0ece
 +Gs6tACDFRYaEDaeA3Pg/0ajgLRXvPlR32D8vxXRvC+uo1RUu+G1wHdCKM1JbYLXLD
 z0Zd+uqogLVIKO/NdPTim8x2aY8d8AtkfSAHBTe9c6j8uMceMY/Y28gdqdGPxluHpi
 IuF2XH37ZGuGw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=rxLLJlye
Subject: [Buildroot] [PATCH 1/1] package/libunibreak: bump version to 6.1
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
https://github.com/adah1972/libunibreak/releases/tag/libunibreak_6_1
https://github.com/adah1972/libunibreak/releases/tag/libunibreak_6_0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libunibreak/libunibreak.hash | 2 +-
 package/libunibreak/libunibreak.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libunibreak/libunibreak.hash b/package/libunibreak/libunibreak.hash
index bb85f21cdc..8f1e7d292a 100644
--- a/package/libunibreak/libunibreak.hash
+++ b/package/libunibreak/libunibreak.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  dd1a92d4c5646aa0e457ff41d89812ec5243863be6c20bbcb5ee380f3dd78377  libunibreak-5.1.tar.gz
+sha256  cc4de0099cf7ff05005ceabff4afed4c582a736abc38033e70fdac86335ce93f  libunibreak-6.1.tar.gz
 sha256  0c57e2ec42ece17791a75d2f9b2f8e0663181be008667a507f765b3ef22522db  LICENCE
diff --git a/package/libunibreak/libunibreak.mk b/package/libunibreak/libunibreak.mk
index fa52116c1f..de3ea0fefc 100644
--- a/package/libunibreak/libunibreak.mk
+++ b/package/libunibreak/libunibreak.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUNIBREAK_VERSION = 5.1
+LIBUNIBREAK_VERSION = 6.1
 LIBUNIBREAK_SITE = https://github.com/adah1972/libunibreak/releases/download/libunibreak_$(subst .,_,$(LIBUNIBREAK_VERSION))
 LIBUNIBREAK_INSTALL_STAGING = YES
 LIBUNIBREAK_LICENSE = Zlib
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
