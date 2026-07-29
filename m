Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40E1C53219
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 18:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF54D4062D;
	Wed, 29 Jul 2026 18:35:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BfcTfQW8o-x0; Wed, 29 Jul 2026 18:35:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DC7F405D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785350116;
	bh=VxjpaqDnM7qrR+MxUK7qHopwHfKt80/v5/dcA+9pN3g=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CWfAA7+Vv1A/3pWka/DmxYZw/5dqsgemfKDVFLFcCaB1yI5RdPBoSILLsRRsau7XV
	 DXXoMnkJTJmTVXmfYPJUai7nlXF7Nvb+CXeQbG17AQ8gOC17BYOikwJwyOJJINN/YQ
	 nmreDhzRQvovjlsTVlr/2YPQw2vPzt0fKnnyyFeS3blDFjP4ipS2xPY8ysAyNnGsPI
	 c1w/ozOe8L2lzOYNzKiRESQPaBVV2m35r4oG0eKa5Bd136HdCQg0uoIBReaECmG69i
	 paKE0u+M3V9yq3BVDeKLKiGPemJhi9XBcazXE+1Z1VB8fizaTrXLfW7HgTgcuzB0BW
	 05C1BrMg7rFzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DC7F405D9;
	Wed, 29 Jul 2026 18:35:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D34D197
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 18:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CDB0405D9
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 18:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EkvLMEccgNsw for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 18:35:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 490A7405B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 490A7405B9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 490A7405B9
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 18:35:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bfcd.dip0.t-ipconnect.de [84.161.191.205])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1F0ACA4C43D6;
 Wed, 29 Jul 2026 20:35:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50852)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wp97U-000000006sk-30cW;
 Wed, 29 Jul 2026 18:35:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Wed, 29 Jul 2026 20:35:08 +0200
Message-ID: <20260729183508.133541-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1785350109;
 bh=HtIpi+7VlgltoUP+rg/FhEKBAUh5bM4OUBqnrKMJ6i0=;
 h=From:To:Cc:Subject:Date:From;
 b=Pqrg0tD2RK+xUoDpGd7ivUL8YHVVmdKTcE3HhDsVpg1E1Spewff+aAOavXIh2HCpx
 MKOpf88IYgfnRwHYcoefdgiAsNk1au/Be5B96jToxgOStG1uE0TwGEZsTJkShKrrgu
 DSHPj8AL2W7NnM57uPxAQKRXz+PeW7VrAv8PvGCW+29EPI1L/qhkWRYfb75SlOaR9D
 BcfyfD1nez9A9SS/+jS4OgtFjOs0orv1xhfaipJeJVaXRYEacXvwDalWlfyHH9GBG0
 EHixel9GD0vAmVbuMG1rw8xAFIi2m5/r5rZxVYMw3k5gj0RsVujL520HyS7aX5kKbl
 M2RGLdhBA/sGQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Pqrg0tD2
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 26.1.6
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

https://lists.freedesktop.org/archives/mesa-announce/2026-July/000862.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/77e9c6e53bd3def00b72e2cb44ad0923cbd4b639

 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index b36f834270..d887d45325 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.1.5
+MESA3D_HEADERS_VERSION = 26.1.6
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 73f900c907..42c9e0a59e 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-July/000858.html
-sha256  79e421c7ce18cd9e790b8375920325779f10798630bf30e0b22f1a21c8617122  mesa-26.1.5.tar.xz
-sha512  8b1714e0fe63d3077c0d761245680724537a94db65e17dedb7124c7c861f070a13493a060695e81b2ca9b6889007b52c7b5788dace8fe5d8e2e1ed67efdbbf07  mesa-26.1.5.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-July/000862.html
+sha256  5296b88a0f1e012e2cb9ada150a2bbadf728ca81e5a4fb2ab43c83a4d2158606  mesa-26.1.6.tar.xz
+sha512  6746b73f5b87e8ff3723eee586b4b5f033dbe6d13cd0309d743b7fa484c350268859ec8ff21aadcbca7a04070cdaa7828146dd28dde4b1935bb879891d687f0b  mesa-26.1.6.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 43899cd084..8e6f0bc125 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.1.5
+MESA3D_VERSION = 26.1.6
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
