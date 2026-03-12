Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF638106ACCB
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 16:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB96741ED1;
	Thu, 12 Mar 2026 16:40:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9qf3hUBU_6WR; Thu, 12 Mar 2026 16:40:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8DD741ED2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773333602;
	bh=GXvzIRSOuqSQZt749hGzRkL0rIrwLgjmKm5sxibGWQM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ecYJKMlgEyEMjT6iJ9srPJmmJvvnygTr0to/uYnfv6niJjY2tyd7RvayRyY5vtkFW
	 NgvVpEA8WTOwNUVbuDLaavCYmulHq2o6vZG0R8WqiDbSUHMaYmVnZNSQSAocxBBrr4
	 8QCxnDKnj8CMjU7VGWuNdi8oX/mzDICS6w9pmE0xixBGwRaYa1U/0LkjmdqLDZGab7
	 9fN6IkHbGI/C8D5oqI544GdIOOEanmkmKtCyql8OUN5KeSvI/sPCeCiEOQKl4gUGZu
	 mPcqspZN8YR76obpucMWahe6SZeZo8jWb/E7o+Z25QONcdQeLTD+jcMBlEebkkWV+D
	 +sxe1sy28BJMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8DD741ED2;
	Thu, 12 Mar 2026 16:40:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 00851201
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA232403AD
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:40:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E85bEHqaIto9 for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 16:40:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C5F24400E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5F24400E4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5F24400E4
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:40:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0199.dip0.t-ipconnect.de [91.58.1.153])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E260AA4C066D;
 Thu, 12 Mar 2026 17:39:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56266)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w0j4o-000000003ON-3wyb;
 Thu, 12 Mar 2026 16:39:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Thu, 12 Mar 2026 17:39:58 +0100
Message-ID: <20260312163958.3178536-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773333598;
 bh=cLZJIhpiQEXZTCr4Z6cCNVOaVuDKilS5F9QoU5QAMWc=;
 h=From:To:Cc:Subject:Date:From;
 b=qKoSs3xy9/6n2AS8rN/gf4qzKQTFVAWYk8uaHF1+uEe3T92BHftL/rVUphUMXAp7e
 Dn+xyF2nPNw7FIKN3Q3k9aTEFbj7tA9jG5lV0NXXLUGLoLh7eoLQPEqifbQkqDJFWg
 TZz87bF41DMdd+ml186bUqVluDOWi1yqg2JOqeT0nru0+EMJhB2i9wl12Ty3dTstWz
 eaZkGKlEB2rI3dKbXipJHUMxt/clJdxX4i1CRUaeXVwtNrChPt5ua8OMh7XXxPqsTA
 dQXN/eZGWW38pTz/X7ENiNmb8Tt5w11wADRWbx/st0B8i7cFAAgjkFZAlFqfG1kruW
 X8ZebO1cyQH0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=qKoSs3xy
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 26.0.2
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

https://lists.freedesktop.org/archives/mesa-announce/2026-March/000841.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index b9acabe325..34555c05ea 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.0.1
+MESA3D_HEADERS_VERSION = 26.0.2
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 898d1c6897..7cdaee7e79 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-February/000840.html
-sha256  bb5104f9f9a46c9b5175c24e601e0ef1ab44ce2d0fdbe81548b59adc8b385dcc  mesa-26.0.1.tar.xz
-sha512  d47072257035acfa8a5594c0cda831b4e5178169dea8a06c6657268a441e32271f8798486e837cea23f35ce3f0b4b9520a4ea4ed26b0e1267b02da4c649bc9f9  mesa-26.0.1.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-March/000841.html
+sha256  973f535221be211c6363842b4cce9ef8e9b3e1d5ea86c5450ca86060163c7346  mesa-26.0.2.tar.xz
+sha512  0a7b9fc9b09e40345cc22d246dc1656900d74754c093882f6a39623af17fddc5f4a0c7938207c784ccf7306c5ed497be6a02c36f95c6548e01a2faa085e04c35  mesa-26.0.2.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 54e8ea4081..e9f5419e4f 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.0.1
+MESA3D_VERSION = 26.0.2
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
