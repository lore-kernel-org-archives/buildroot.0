Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB4FC5DF86
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 20:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FEE84083E;
	Thu, 20 Aug 2026 20:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DtDaNueEnwN0; Thu, 20 Aug 2026 20:42:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787258525;
	bh=50FJSAUYm8vd6hNbLeFLXyE5ZWn/Y7FU4NefuHCAVp4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WXJU2bbb5DuUvh2/0eq76q1dy2TJDlbRZfKxmPKQS28e2NTJL+5WVQbK/2uusrGpG
	 AVjHq1ItyCXdfjowydB8Rdp6XYzMSw0VzNfiFSVieSdiy/eZlHCnujc4+TIPLy5MeC
	 p6N6V/ft8UHhkjZtQ8cDYgeiUi9SWrlg1lTsX6O++IWJUUhgfC/TKuftaCrSdETNi3
	 FtRlTxkfnecrAs4eLvjcUv5jdDnpM/rhDKmfR1rx5UOgJRbt8Sc2x2MoRCql0yCx7y
	 8EzlT/e5k4R/hzvLSGLZqtEOO6Nyx0VgdNK3gZgbFm451HPNzq+pFfOEeVl8oYmOEE
	 wKeF2qWyun57w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54B8E40840;
	Thu, 20 Aug 2026 20:42:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CD107336
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 20:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF7D0400B1
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 20:42:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5qr0J9Pk0xil for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 20:42:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=TOg8Ju1Q
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A77694008B
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 20:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1787258520;
 bh=TCuxp1HPooviIotUc0DqE5CxBtyj31wQY/tyRWy2Pq0=;
 h=From:To:Cc:Subject:Date:From;
 b=TOg8Ju1QQAyhG7rCodQ98wKqbo32/p3QvMfOjkvx7Go5zVm9uqX4ewDpNN9gVacR9
 0Mk9E4aHjFckZJn06IFpmhG9pVmAfpNJjvmPsoIFR2GImWh1V5chR+JOQqK4TaF3Mc
 6zslDAQjO15CXYUHpnI5SSP24oWga3q6x6fK2WMvILCkSBPZ844rgPkL/fleZUL0Az
 pCO5d9kWc9LXEw0lJ27RABq0i4rSsPY71VI28fegZ796MTpRnxPW2np0ODUend/2tK
 O7d3Rvx+JefRtTsrhhdpyfB4orl0gxja71v+faZCJY6p+83mOe+AIuTZ5Fdt0Pk+7K
 lNuoQj7bAmbmQ==
Received: from fli4l.lan.fli4l (p4fd6cf91.dip0.t-ipconnect.de [79.214.207.145])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 73BAEA4C0D63;
 Thu, 20 Aug 2026 22:42:00 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40834)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wx9aK-0000000062r-0dHh;
 Thu, 20 Aug 2026 20:42:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Thu, 20 Aug 2026 22:42:00 +0200
Message-ID: <20260820204200.3729029-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 26.1.8
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

Release notes of this bugfix release:
https://lists.freedesktop.org/archives/mesa-announce/2026-August/000865.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/eead4cd18cd9993ae7956804ba935432de934d59

 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 0ce4b15dfc..fd715b5f84 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.1.7
+MESA3D_HEADERS_VERSION = 26.1.8
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 34ffd95e8f..dc7776488a 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-August/000864.html
-sha256  25e0a669e6638c3563e7be32a0a09f1888317e6eed0d047dc41d49dc8de26c7d  mesa-26.1.7.tar.xz
-sha512  9acc75c3d6386f90cf761dfa42e72b1c36d399a6905127d18aa3eb84d665502da7c3cebead82fdbca91ad510673ba7e296b5e148602d6db7e79172d6155f3ec5  mesa-26.1.7.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-August/000865.html
+sha256  b320f65874fd9653ac6c0bd1616605387344e1247411a50c797b5f3fb9dc0b55  mesa-26.1.8.tar.xz
+sha512  eb3d46ae9aaba70fdd908486cef24041fec9264ddf586eaebbba65ce55e716d306ef9e91be83e742dfaec4dfc94105a5cd3a36b29bf56614febcbcf6c1f8b516  mesa-26.1.8.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 99ef0f5edb..87c7f427e4 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.1.7
+MESA3D_VERSION = 26.1.8
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
