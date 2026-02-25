Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0503EFD23F
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 19:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 712D0810E5;
	Wed, 25 Feb 2026 19:11:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T7oQmnUpcc7r; Wed, 25 Feb 2026 19:11:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E62C80FB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772046718;
	bh=mwZ+QzfvE7qCVeyrj+iWUrg5rdC/lsnW4kKfYnNt40M=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ee3yGDSnjGm9sF27NJtelBuxSj78z02lk4BEt7HBMJFUlpQ57i8qoC0pzIEkHTJQh
	 sHMXlRA3QrPFW3L8M6ZxSf/hjHyoQrfaMTKy2mhEX7HOZHCo7uboFe+vU6V01N1li6
	 8qAEDKEhrJF6yrK1lHio54Ki2zYRqE5lJpg2K/FnwtzKgRhsNiGD3UYz1dU1VYUYSd
	 yp22OZzzAsm+E5pHvc0mCJ1DKxkzdRHItaSRZqKyI8doZmA+TPuyRZdd9IH/JjJfQF
	 yGKzXBWnZvqCagF8gqyjiats5YbaUy/JawyjzudE1ISVHZuVknq7gGUHXZOZTtJsc4
	 4h+jRYXIZZQGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E62C80FB2;
	Wed, 25 Feb 2026 19:11:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B22A23D
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 19:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3163460FDB
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 19:11:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WvFP1hw-B8wr for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 19:11:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 638AD60D8B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 638AD60D8B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 638AD60D8B
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 19:11:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 82B55A4C2700;
 Wed, 25 Feb 2026 20:11:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53240)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vvKIZ-000000000Uh-1k7D;
 Wed, 25 Feb 2026 19:11:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Wed, 25 Feb 2026 20:11:50 +0100
Message-ID: <20260225191150.487199-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772046711;
 bh=DI1ucpy732sNpnJtA3wlWNDZiWKMqdb38DD/HUa9L3E=;
 h=From:To:Cc:Subject:Date:From;
 b=S9S8kzpayWPttyEcIXe/somQvJstZddc8XFJWXTP+ci3NHzobvek3HZrJqd8lfcDI
 4D0Sh4gcaV2fHbyOSbCQrY1GbeB747fD7OTXiM/sJNGMmxYJiPO1GPGivV9C3TFoQa
 idXFiI2bo1w4+4jJ73imfq61PRIrKuQ62jFIKPcbrt0PXDSsIY9qWWj3yXi5Hz6NV9
 GqMs+JHYFjhEEXC1yiNc1C9ABnH9vNiMr36/+pTXvyxgQdufdN869JQKnBCGwoPII6
 BKKCZAev0mBJ9f1SVuG55Y0bWs5JDqQgqvu86T+xHv96IhNBkR9hDG7g220YB86ojS
 BabBKBKRCEPEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=S9S8kzpa
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: security bump version to 26.0.1
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

https://lists.freedesktop.org/archives/mesa-announce/2026-February/000840.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 10cfd8f719..b9acabe325 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.0.0
+MESA3D_HEADERS_VERSION = 26.0.1
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 958a99ec9f..898d1c6897 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-February/000838.html
-sha256  2a44e98e64d5c36cec64633de2d0ec7eff64703ee25b35364ba8fcaa84f33f72  mesa-26.0.0.tar.xz
-sha512  d39d190d0a17306f0aa69033e38dd8cf458dbf8da483b768841e2dc681dd670735999b212fbe0b29be839702a20750c87d6587bd925dca10693950830a17cd55  mesa-26.0.0.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-February/000840.html
+sha256  bb5104f9f9a46c9b5175c24e601e0ef1ab44ce2d0fdbe81548b59adc8b385dcc  mesa-26.0.1.tar.xz
+sha512  d47072257035acfa8a5594c0cda831b4e5178169dea8a06c6657268a441e32271f8798486e837cea23f35ce3f0b4b9520a4ea4ed26b0e1267b02da4c649bc9f9  mesa-26.0.1.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 42693ce928..325756d92e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.0.0
+MESA3D_VERSION = 26.0.1
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
