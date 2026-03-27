Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784E310F2865
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 18:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCBBF83E16;
	Fri, 27 Mar 2026 18:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NRyDyBzV80_t; Fri, 27 Mar 2026 18:02:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC09283E0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774634544;
	bh=uLVa9A5DfjgsjDgDsSK9z/Ds0APdavigoWYjYmTzZiQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kbRcb50tDnfL5nOEMaMe1+JGwT1D02bgdW6Xub5vD91lC+9CVWYkApwdUNEN4SnWc
	 rTmiwbOo7fZb++cKKenzyxD7frcDJsdenRnOYKNAVaZSAhFxX8dKhWpGFW7QKiALnG
	 B8GKWfAihmqk56ASJRnKRkFiI36MVdTIjZHSPd9u44LKNxT40BLBQwh7AZ5sr5Tq5J
	 +HWXC4PicqC1cgyvxqoOnyymD9jI8y0eRzMNKanBh0DRN6wcw5Gzcpdi+2SLA7t1JX
	 06f4stlPBUs5q32nnhJnKvBYE2s/+HFSW58Tw2UITmJAqBkbOVLesycyA0QPnywFwP
	 FoKk3zYk9HTgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC09283E0A;
	Fri, 27 Mar 2026 18:02:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DCB11D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 18:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03FE54116D
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 18:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SAVxT7qc9Ho6 for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 18:02:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BFE3B4116C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFE3B4116C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFE3B4116C
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 18:02:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ba3.dip0.t-ipconnect.de [91.58.11.163])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7FB53A4C1A60;
 Fri, 27 Mar 2026 19:02:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34888)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w6BVj-000000002KF-0h2T;
 Fri, 27 Mar 2026 18:02:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Murat Demirten <mdemirten@yh.com.tr>
Date: Fri, 27 Mar 2026 19:02:19 +0100
Message-ID: <20260327180219.1985026-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1774634539;
 bh=X1s0awMa5gFVsVFmMj4xCVziwTdcpT1kyiY9AdddQrA=;
 h=From:To:Cc:Subject:Date:From;
 b=WK/kvw/sEmABTZISpy+pBral+30FwOp+v0tWSXLiQJMp3oswmxJRiRP4Pe2HX5MlA
 TNHeEHR5+z7OGDdPBXoua2lO+d6TD+pkAU8xe+ZrQomnGc1SYeUr3yZn+hGScyOJlJ
 yw7i1PTWWUgUYnVHVpiGsb39EVA38/XizKCPyb8wM8vf/lBV7MCN+74DI9LoFNfH+W
 GkxmflfYSxSfKQCoJjygTwSwX2/wHdY/2b7L3/eAWhanrJbDp/+QLD9XkOH4tdhAtd
 wefTyfsXl/KdHcr7GugGi1czh4t4Y530Bfgzwt9BSGrGei3cIeaCLe+LEBSIv4SeZl
 zF01TUp896Nzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=WK/kvw/s
Subject: [Buildroot] [PATCH 1/1] package/jpeg-turbo: bump version to 3.1.4
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

https://github.com/libjpeg-turbo/libjpeg-turbo/blob/3.1.4/ChangeLog.md

Updated license hash due to copyright year bump:
https://github.com/libjpeg-turbo/libjpeg-turbo/commit/e9b497016cde1ab96498a9ee1822d83c06ce5bee
https://github.com/libjpeg-turbo/libjpeg-turbo/commit/e82016c6bf5a14b68f4c9f0f3747af8cf1af917b

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/jpeg-turbo/jpeg-turbo.hash | 6 +++---
 package/jpeg-turbo/jpeg-turbo.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index cb5dd5b71d..f2795bebc1 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,5 +1,5 @@
-# From https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/3.1.3
-sha256  075920b826834ac4ddf97661cc73491047855859affd671d52079c6867c1c6c0  libjpeg-turbo-3.1.3.tar.gz
+# From https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/3.1.4
+sha256  e23d3ebb2c6ee4d0e2a5823dbb55b614845df5ea3435c956fed5cf04041a87ad  libjpeg-turbo-3.1.4.tar.gz
 # Locally computed
-sha256  2189dc45a8fe96204069f8124caa53a148dfdc193f50f584c6ca7849a6072872  LICENSE.md
+sha256  e10114e6e40f3d0311c401ca25245ac5ef459a43c20f976fd63f03e816f5741f  LICENSE.md
 sha256  75815e3bf6484201a3c3d17a1bbf10f2e8e3237f84df10a2357ea896db2a81d6  README.ijg
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index eb981793f5..56eebdc765 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 3.1.3
+JPEG_TURBO_VERSION = 3.1.4
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = https://github.com/libjpeg-turbo/libjpeg-turbo/releases/download/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = IJG (libjpeg), BSD-3-Clause (TurboJPEG), Zlib (SIMD)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
