Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2129CD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 20:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61B4C40FFE;
	Wed,  6 May 2026 20:53:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dkQF01uP25TZ; Wed,  6 May 2026 20:53:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDDF840FF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778100818;
	bh=PnGtFOtFdh4yalSoAzlSRlclbc5kaC5EviD4MhcdW14=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L4CgrL2VhmE9fvPbLlT5zBHbf73gTcCS5pwZzI/j7DSUXbyB+InPcFsG+jX1JyoEZ
	 OR7qp5bC86QJMvywWZGsKwX7+VYCuYhgolwSzK2PyNywuigvoTKaONoiETe/7c0OLI
	 v3ZKLKTAcXdTv4lnz61Sglnx6m2dCpjmF5nrCAJ/UaaUUU9DnimQZKN0BUkMxNGAGW
	 ofPZPskI5PG0gxSzg7PZnpfv1QrfG5KNMsIh88JEISEBPpSRRE3eTr0FkkbQEd6one
	 3yAi14j+Zq+LN19AUjp0DJZBL+qDiGFTHMrYe8WztNeTbqhv+K4vumMws3qu33Cphq
	 92nfXwPSXfvuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDDF840FF9;
	Wed,  6 May 2026 20:53:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C52F317
 for <buildroot@buildroot.org>; Wed,  6 May 2026 20:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11E17401B9
 for <buildroot@buildroot.org>; Wed,  6 May 2026 20:53:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qfK-7ndx4njl for <buildroot@buildroot.org>;
 Wed,  6 May 2026 20:53:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 855F5401B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 855F5401B0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 855F5401B0
 for <buildroot@buildroot.org>; Wed,  6 May 2026 20:53:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bec8.dip0.t-ipconnect.de [84.161.190.200])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CC472A4C1EA1;
 Wed,  6 May 2026 22:53:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37528)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wKjFK-000000001iT-0Xw4;
 Wed, 06 May 2026 20:53:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Wed,  6 May 2026 22:53:30 +0200
Message-ID: <20260506205330.1422799-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778100810;
 bh=7oBQ1DRQnP9/FBnQ7VINMlli763wQBRS4F9mFBoadf4=;
 h=From:To:Cc:Subject:Date:From;
 b=WpapwXw6VjSGjnFidMEExP+Y7i5LIz4QuYks+PkQfXYCLkLsRWqykFNNoIN3ZZlVD
 pQJSpYhOzuwE3R3fPQezkbXu6Ine7fpJ4GTp6PIoqI6jN3ygyKbTCfyn3effeRZb6A
 b3sjaZqX3siFSON6C/5DuLd0riZeoE0bJW45LyyKTlp9HrsTXgx05ahyTGSpGx4yqk
 TX4nhPm2ILaqV2YiINHNcPSiJ75c5zTMBQDd9ZxAnetdXeKYXS9CE8Vlg1ps7wj1rN
 eZtzwtGIdKGr7SPgK1U7Lz72gfF23dn+6oEEd5Cf3pXIuanH7WqK5vdPqr3jlQMhWI
 RyLga0u0ImamQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=WpapwXw6
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 26.1.0
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

https://lists.freedesktop.org/archives/mesa-announce/2026-May/000849.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 1098aee9c1..ea6c328134 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.0.6
+MESA3D_HEADERS_VERSION = 26.1.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index eed4265147..ae95f9cd3a 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-April/000848.html
-sha256  1d3c3b8a8363b8cc354175bb4a684ad8b035211cc1d6fa17aeb9b9623c513f89  mesa-26.0.6.tar.xz
-sha512  7f298234cb7b353ac40dc4d116866115160d1a52de6da8d4f1343af7ed47ca11e1a07b70aad8d24221906e0b520a4c140c12ffa7e7e706e3f25f301842a37e68  mesa-26.0.6.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-May/000849.html
+sha256  a5095e6dc2986c78f0cef4c5555dc803e93b6bfe5670e991f9e8bd49395bae19  mesa-26.1.0.tar.xz
+sha512  02972b1a2e6a2d10fa9c970ab579ddd6f0d3acfb782d82616b91cca7a28dd494b15fb14748fff333b1078898cf990a25666e9122d7fd41cb212a151caf933786  mesa-26.1.0.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index adac0e5c0e..900965dbbd 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.0.6
+MESA3D_VERSION = 26.1.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
