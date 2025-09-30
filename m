Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99460CCA470
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 20:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 606E580CC4;
	Tue, 30 Sep 2025 20:32:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id va6eun5y5MbY; Tue, 30 Sep 2025 20:32:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B7FC82513
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B7FC82513;
	Tue, 30 Sep 2025 20:32:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A18682A6
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 20:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9358F82542
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 20:32:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zlqqXHb1NmzD for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 20:32:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 94E8680CC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94E8680CC4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94E8680CC4
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 20:32:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c14e.dip0.t-ipconnect.de [79.214.193.78])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 05EF8A4C5932;
 Tue, 30 Sep 2025 22:32:37 +0200 (CEST)
Received: from [192.168.1.144] (port=59176 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v3h1Y-000000000i2-2eNL;
 Tue, 30 Sep 2025 20:32:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Tue, 30 Sep 2025 22:32:36 +0200
Message-ID: <20250930203236.1197627-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759264357;
 bh=XyApiZnWrBGoME8jghC5nvJfOTK4nYrySbJHvFj/e/U=;
 h=From:To:Cc:Subject:Date:From;
 b=BLyR5+iAf305jg4ikjUSevXN42ihZdzMsGm+ig4T1ydVWCR0UIb9FEgTaOUH3Gi8p
 lVSbOuoR9Js+AewSMXm5hDXUdl88k6RJvHN5zcd3jSHYg8GA1VVIMFR0rGf2scLyoe
 n84D/0SUk3S6ePPFUYdKRM5FW1B4MjAASg3oGFPfVdaTNmp5ccLMOcH2r6Uv7XErBb
 xN1PIen6nCLFQhcQMYHIXx3r3PvfiCpzHqRkBLwEVfdquX4jiUHhUwv3XMbF0EsE5/
 Y6fSJ0u7w3owr+b52iWnKtlsUoQczlEh32ZZVzdB9+/6lYpIDs9fsiJ0Y8hYcuExWZ
 bFqM0cSmW99sg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=BLyR5+iA
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 25.2.3
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
https://lists.freedesktop.org/archives/mesa-announce/2025-September/000821.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 5932d73f2c..ed089298a8 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 25.2.2
+MESA3D_HEADERS_VERSION = 25.2.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index d76b384e26..c4320461ba 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2025-September/000820.html
-sha256  43d7abcd4aa8049d8fd75538344a374104765e81e17b4a6314cee2c0160e4412  mesa-25.2.2.tar.xz
-sha512  69cd7ed33d0856e227a0219a9d09e5eb2fad28162276b5971bff4f7102cf58b0d914131ad6543562cba230ce6fb9b2076d3b156b1b8c375e74722a143aee5379  mesa-25.2.2.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2025-September/000821.html
+sha256  f2d6b28562f1d6cb9c17ee8e58eeade7aa5faf927ae71065eadb41e17f92b4f8  mesa-25.2.3.tar.xz
+sha512  e03c09de2a6482a87362c0bf4fab4f9b32ffa48935a8724eb83e75b246f1bfc59524d04ea7e8cbea34e5c6ad2a0793195a076fe2d27da8fb7e05f56c7662eac5  mesa-25.2.3.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 9ab0ffdfc3..27ce4f9163 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 25.2.2
+MESA3D_VERSION = 25.2.3
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
