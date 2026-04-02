Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51559D6AAF7
	for <buildroot@archiver.kernel.org>; Thu,  2 Apr 2026 18:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2610840533;
	Thu,  2 Apr 2026 18:05:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oGPYxNRhb3iA; Thu,  2 Apr 2026 18:05:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FAD240478
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775153123;
	bh=2kMinEde3jj9HUNIVd1UKQcCvjUUYYVw+CFrCBAczcg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C9itQLRaxWKqTZTaSoTAySQrg/Bd88LvsFPukYA/+d2txzFCZLVccUmT8Le9ISHzY
	 tYJ/abcGGGexIog0llbVIc2MAl59TxLGcORrsstprZzQHAUSD0EjR8x+x1Lp0hEx+d
	 uKuKGkI4yBA6ddM0dpptmO4vmPKsrxwQoY/rMMqJn7L0nMVDqZrAgXFii/0UENmuOr
	 r+kt2iUqs0G7UlfXygoSQWLtlCrjITKhvaheEQvfrfE4xRTohvjeQbWgBCVB08g87a
	 7wbauCQu0S2DLCKD++QWCffGDz0udAbz9z6DjdDx4D1/YaW8vtkyFOmFBKOj8+zAje
	 VDUqUex3jdlaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FAD240478;
	Thu,  2 Apr 2026 18:05:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A4E12D3
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 18:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3007A606A3
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 18:05:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5KD8PlJf8rzf for <buildroot@buildroot.org>;
 Thu,  2 Apr 2026 18:05:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6CF8D6069F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CF8D6069F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6CF8D6069F
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 18:05:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a08f0.dip0.t-ipconnect.de [91.58.8.240])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7ED55A4C32CE;
 Thu,  2 Apr 2026 20:05:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54160)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w8MPt-000000000Iq-41jP;
 Thu, 02 Apr 2026 18:05:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Thu,  2 Apr 2026 20:05:18 +0200
Message-ID: <20260402180518.2780136-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775153118;
 bh=4HgCAphYQeTDGtBt4nyycBlz++Sy5iNtQfZI+QL4K4U=;
 h=From:To:Cc:Subject:Date:From;
 b=dNQxnOykW/QWnD6bCBvy07JCduadYP0LPaR1UKNgapY3P3VQ9A8d4rC+Kgc8dVNy1
 /A622cjBv3HtkTKFoH35JjNcGZxAILejYDlyXxNYXqB3+HTtkNONRlcZIa98YP886J
 xpEwd5IA9GYwtXtipLxgAMIoVzwjyWoBK/EjKkUv1sIm5h9v20TyaDQtNBt+1MYJ2O
 CUk1PFj24Re5oC77B4g7csNbM0Um6sUAgUaB5ojGUSy+L8snW6YnrgLTev0yZO6N03
 3P1VWrkTY0ou4t9oXyu/+Za1GzKe5mtwcTkqsW3uSblY20/yXk3wDgF7f9iI4wuVcw
 bPdODIq9FRL2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=dNQxnOyk
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 26.0.4
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

https://lists.freedesktop.org/archives/mesa-announce/2026-April/000843.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index cabdd479a1..3fe82e9ba5 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.0.3
+MESA3D_HEADERS_VERSION = 26.0.4
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index c938372b49..9a56e54406 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-March/000842.html
-sha256  ddb7443d328e89aa45b4b6b80f077bf937f099daeca8ba48cabe32aab769e134  mesa-26.0.3.tar.xz
-sha512  82a33d0fa0c2855a63f599e38753126a2195025a13e45f38e14fda7aa008cb05925bb74088e4a1e199c9237d9388f4d4408a2c95c1d7fe79d8e6e6f27c84187b  mesa-26.0.3.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-April/000843.html
+sha256  6d91541e086f29bb003602d2c81070f2be4c0693a90b181ca91e46fa3953fe78  mesa-26.0.4.tar.xz
+sha512  ddb59df633116a7ccd9d2d3a2e2009945909e3f774956efcbc032a2f963641cce50d0f319bebdc041df17700aa827aa2ccbc61c9e40b4020de9ff027eab27e23  mesa-26.0.4.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 794e6b5cc9..3c5a8e9163 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.0.3
+MESA3D_VERSION = 26.0.4
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
